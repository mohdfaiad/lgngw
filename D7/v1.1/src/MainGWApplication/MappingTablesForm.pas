unit MappingTablesForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  DBClient, cxButtonEdit, StdCtrls,DBTables,ZLib, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxCheckBox, cxMemo;

type
  TformMappingTables = class(TForm)
    Panel1: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cdsTables: TClientDataSet;
    dsTables: TDataSource;
    cdsTablesid: TIntegerField;
    cdsTablestable_src_name: TStringField;
    cdsTablestable_target_name: TStringField;
    cdsTablesactivate: TStringField;
    cxGrid1DBTableView1table_src_name: TcxGridDBColumn;
    cxGrid1DBTableView1table_target_name: TcxGridDBColumn;
    cxGrid1DBTableView1activate: TcxGridDBColumn;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cdsTablesmapping_fields: TBlobField;
    btnOK: TButton;
    btnCancel: TButton;
    cdsTablessrcCondition: TMemoField;
    cdsTablestargetCondition: TMemoField;
    cxGrid1DBTableView1srcCondition: TcxGridDBColumn;
    cxGrid1DBTableView1targetCondition: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBTableView1Column1GetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: string);
    procedure cxGrid1DBTableView1Column2PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1srcConditionPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGrid1DBTableView1targetConditionPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGrid1DBTableView1activateHeaderClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMappingTables: TformMappingTables;

const
  _datafilename ='gwdata.data';

implementation

uses MappingFieldsForm, HOSxP_gwLIB, SQLPopUpForm, Math;

{$R *.dfm}






procedure TformMappingTables.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TformMappingTables.btnOKClick(Sender: TObject);
begin
  cdsTables.SaveToFile(ExtractFilePath(Application.ExeName)+_datafilename);
  Close;
end;

procedure TformMappingTables.cxGrid1DBTableView1Column1GetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: string);
begin
  AText := IntToStr(ARecordIndex+1);
end;

procedure TformMappingTables.cxGrid1DBTableView1Column2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var frmMappFields : TformMappingFields;
    FStream : TStream;
begin

  if cdsTables.State in [dsInsert,dsEdit] then cdsTables.Post;

    frmMappFields := TformMappingFields.Create(Application);
    frmMappFields.srcTableName := cdsTablestable_src_name.AsString;
    frmMappFields.targetTablename:= cdsTablestable_target_name.AsString;
    frmMappFields.fieldSteam := TMemoryStream.Create;
    frmMappFields.fieldSteam := cdsTables.CreateBlobStream(cdsTablesmapping_fields as TBlobField, bmRead);

    frmMappFields.ShowModal;




 {howmessage(IntToStr(SizeOf(frmMappFields.fieldSteam)));}
  if SizeOf(frmMappFields.fieldSteam)>0 then
  begin
    if not ( cdsTables.State in [dsInsert,dsEdit]) then cdsTables.Edit;
    (cdsTables.FieldByName('mapping_fields') as TBlobField).LoadFromStream(frmMappFields.fieldSteam);
    cdsTables.Post;
  end;
end;

procedure TformMappingTables.FormCreate(Sender: TObject);
begin
//  HorzScrollBar.Range := 10000; // set the range to an higher number
//  VertScrollBar.Range := 10000; // set the range to an higher number
//  ShowScrollBar(Handle, SB_BOTH, True);
end;

procedure TformMappingTables.FormShow(Sender: TObject);
begin
  if FileExists(ExtractFilePath(Application.ExeName)+_datafilename) then
    cdsTables.LoadFromFile(ExtractFilePath(Application.ExeName)+_datafilename);
end;

procedure TformMappingTables.cxGrid1DBTableView1srcConditionPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var frmSQL : TFormSQLPopUp;
begin
  frmSQL := TFormSQLPopUp.Create(Application);
  frmSQL.SQLText :=TStringList.Create;
  frmSQL.SQLText.Text:= cdsTablessrcCondition.AsString;
  frmSQL.ShowModal;
  if  not (cdsTables.State in [dsInsert,dsEdit]) then cdsTables.Edit;
  cdsTablessrcCondition.AsString := frmSQL.SQLText.Text;
  cdsTables.Post;
  frmSQL.Free;

end;

procedure TformMappingTables.cxGrid1DBTableView1targetConditionPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var frmSQL : TFormSQLPopUp;
begin
  frmSQL := TFormSQLPopUp.Create(Application);
  frmSQL.SQLText :=TStringList.Create;
  frmSQL.SQLText.Text:= cdsTablestargetCondition.AsString;
  frmSQL.ShowModal;
  if  not (cdsTables.State in [dsInsert,dsEdit]) then cdsTables.Edit;
  cdsTablestargetCondition.AsString := frmSQL.SQLText.Text;
  cdsTables.Post;
  frmSQL.Free;

end;

procedure TformMappingTables.cxGrid1DBTableView1activateHeaderClick(
  Sender: TObject);
var
  icount:integer;
begin
  if cdsTables.Active then
  begin
    for icount:=0 to cdsTables.RecordCount-1 do
    begin
      if not ( cdsTables.State in [dsInsert,dsEdit]) then cdsTables.Edit;

      if cdsTablesactivate.AsString='Y' then
        cdsTablesactivate.AsString:='N'
      else
        cdsTablesactivate.AsString:='Y';

      cdsTables.Post;

      if not cdsTables.Eof then cdsTables.Next;
    end;
  end;
end;

end.
