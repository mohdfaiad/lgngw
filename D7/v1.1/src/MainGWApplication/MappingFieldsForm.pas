unit MappingFieldsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxButtonEdit, ExtCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxDBLookupComboBox, StdCtrls, cxCheckBox,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue;

type
  TformMappingFields = class(TForm)
    cdsSource: TClientDataSet;
    dsSource: TDataSource;
    cdsTarget: TClientDataSet;
    dsTarget: TDataSource;
    cdsMappingFields: TClientDataSet;
    dsMappingFields: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    cdsMappingFieldsid: TIntegerField;
    cdsMappingFieldssrcFieldName: TStringField;
    cdsMappingFieldstargetFieldName: TStringField;
    cdsMappingFieldssrcTableName: TStringField;
    cdsMappingFieldstargetTableName: TStringField;
    cxGrid1DBTableView1srcFieldName: TcxGridDBColumn;
    cxGrid1DBTableView1targetFieldName: TcxGridDBColumn;
    cdsSourceFieldName: TStringField;
    cdsTargetFieldName: TStringField;
    btnCancel: TButton;
    btnOK: TButton;
    cdsMappingFieldsAsync: TStringField;
    cxGrid1DBTableView1Async: TcxGridDBColumn;
    cdsMappingFieldsckSrcValueSQL: TStringField;
    cdsMappingFieldsckTargetValueSQL: TStringField;
    cdsMappingFieldsTargetValueSQLSTR: TMemoField;
    cdsMappingFieldsSrcValueSQLSTR: TMemoField;
    btnSettingSyncData: TButton;
    cxGrid1DBTableView1TargetValueSQLSTR: TcxGridDBColumn;
    cxGrid1DBTableView1SrcValueSQLSTR: TcxGridDBColumn;
    cdsMappingFieldsAcheck: TStringField;
    cxGrid1DBTableView1Acheck: TcxGridDBColumn;
    btnGen: TButton;
    btnClearNoneLinkField: TButton;
    procedure cxGrid1DBTableView1Column1GetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: string);
    procedure btnSettingSyncDataClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnGenClick(Sender: TObject);
    procedure btnClearNoneLinkFieldClick(Sender: TObject);
  private
    FtargetTablename: string;
    FsrcTableName: string;
    FfieldSteam: TStream;
    procedure SetsrcTableName(const Value: string);
    procedure SettargetTablename(const Value: string);

    procedure TestConnection();
    procedure SetfieldSteam(const Value: TStream);
    { Private declarations }
  public
    { Public declarations }
    property srcTableName : string read FsrcTableName write SetsrcTableName;
    property targetTablename : string read FtargetTablename write SettargetTablename;
    property fieldSteam : TStream read FfieldSteam write SetfieldSteam;

  end;

var
  formMappingFields: TformMappingFields;

implementation

uses HOSxP_gwLIB, SettingSyncSQLForm, Math;

{$R *.dfm}

{ TformMappingFields }

procedure TformMappingFields.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TformMappingFields.btnOKClick(Sender: TObject);
begin
  if cdsMappingFields.State in [dsInsert,dsEdit] then cdsMappingFields.Post;
  FfieldSteam := TMemoryStream.Create;

  cdsMappingFields.SaveToStream(FfieldSteam);
  Close;
end;

procedure TformMappingFields.btnSettingSyncDataClick(Sender: TObject);
var frmSettingSyncSQL:TformSettingSyncSQL;
    strList : TStringList;
begin
  frmSettingSyncSQL:=TformSettingSyncSQL.Create(Application);

  strList := TStringList.Create;
  strList.Text := cdsMappingFieldsSrcValueSQLSTR.AsString;
  frmSettingSyncSQL.SqlSource :=  strList;
  strList := TStringList.Create;
  strList.Text := cdsMappingFieldsTargetValueSQLSTR.AsString;
  frmSettingSyncSQL.SqlTarget := strList;

  frmSettingSyncSQL.ShowModal;

  with cdsMappingFields do
  begin
    if not (State in [dsInsert,dsEdit]) then edit;
    cdsMappingFieldsSrcValueSQLSTR.AsString := frmSettingSyncSQL.SqlSource.Text;
    cdsMappingFieldsTargetValueSQLSTR.AsString := frmSettingSyncSQL.SqlTarget.Text;
    post;
  end;


end;

procedure TformMappingFields.cxGrid1DBTableView1Column1GetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: string);
begin
  AText := IntToStr(ARecordIndex+1);
end;

procedure TformMappingFields.SetfieldSteam(const Value: TStream);
begin
  FfieldSteam := Value;

  if sizeof(FfieldSteam)<>0 then
    cdsMappingFields.LoadFromStream(FfieldSteam);
end;

procedure TformMappingFields.SetsrcTableName(const Value: string);
begin
  FsrcTableName := Value;
end;

procedure TformMappingFields.SettargetTablename(const Value: string);
begin
  FtargetTablename := Value;
  TestConnection;
end;

procedure TformMappingFields.TestConnection;
var cdsTemp : TClientDataSet;
    irec : integer;
begin
  try
    // { get only field list }
    cdsTemp :=TClientDataSet.Create(nil);

    cdsTemp.Data:=HOSxP_gwGetDataSet('select * from '+FsrcTableName);
    if cdsTemp.Active then
    for irec:= 0 to cdsTemp.FieldCount-1 do
    begin
      cdsSource.Append;
      cdsSourceFieldName.AsString:=cdsTemp.Fields[irec].FieldName;

      cdsSource.Post;
    end;


    cdsTemp.Data:=HOSxP_extGetDataSet('select * from '+FtargetTablename);
    if cdsTemp.Active then
    for irec:= 0 to cdsTemp.FieldCount-1 do
    begin
      cdsTarget.Append;
      cdsTargetFieldName.AsString:=cdsTemp.Fields[irec].FieldName;
      cdsTarget.Post;
    end;

  except
    on ee:Exception do
    raise exception.Create(ee.Message);
  end;
end;

procedure TformMappingFields.btnGenClick(Sender: TObject);
var
  cdsTempSrc, cdsTempDest : TClientDataSet;
  isrcF,dsrcf :integer;
begin
  cdsTempSrc := TClientDataSet.Create(Application);
  cdsTempDest :=  TClientDataSet.Create(Application);

  cdsTempSrc.Data :=   HOSxP_gwGetDataSet('select * from '+FsrcTableName);
  cdsTempDest.Data :=   HOSxP_extGetDataSet('select * from '+FsrcTableName);
  with cdsMappingFields do
  begin
    EmptyDataSet;
    for isrcF := 0 to cdsTempSrc.FieldCount-1 do
    begin

      Append;
      cdsMappingFieldssrcFieldName.AsString:=cdsTempSrc.FieldList[isrcF].FieldName;
      cdsMappingFieldsAsync.AsString:='N';

      if ( pfInKey in cdsTempSrc.FieldByName(cdsTempSrc.FieldList[isrcF].FieldName).ProviderFlags ) then
       cdsMappingFieldsAcheck.AsString:='Y'
      else
        cdsMappingFieldsAcheck.AsString:='N';

      for dsrcf := 0  to cdsTempDest.FieldCount-1 do
      begin
        if   cdsTempSrc.FieldList[isrcF].FieldName=cdsTempSrc.FieldList[dsrcf].FieldName then
          cdsMappingFieldstargetFieldName.AsString:=cdsTempSrc.FieldList[dsrcf].FieldName;
      end;
      
      Post;
    end;

  end;
end;

procedure TformMappingFields.btnClearNoneLinkFieldClick(Sender: TObject);
var icount : integer;
begin
  with cdsMappingFields do
  begin
    first;
    for icount := 0 to cdsMappingFields.RecordCount-1  do
    begin

      if trim(cdsMappingFieldstargetFieldName.AsString)='' then cdsMappingFields.Delete;

    if not cdsMappingFields.Eof then Next;
    end;

  end;
end;

end.
