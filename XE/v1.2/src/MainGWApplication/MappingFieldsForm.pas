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
  dxSkinXmas2008Blue, ComCtrls, RzPanel, cxDropDownEdit;

type
  TformMappingFields = class(TForm)
    cdsSource: TClientDataSet;
    dsSource: TDataSource;
    cdsTarget: TClientDataSet;
    dsTarget: TDataSource;
    cdsMappingFields: TClientDataSet;
    dsMappingFields: TDataSource;
    Panel1: TPanel;
    cdsMappingFieldsid: TIntegerField;
    cdsMappingFieldssrcFieldName: TStringField;
    cdsMappingFieldstargetFieldName: TStringField;
    cdsMappingFieldssrcTableName: TStringField;
    cdsMappingFieldstargetTableName: TStringField;
    cdsSourceFieldName: TStringField;
    cdsTargetFieldName: TStringField;
    btnCancel: TButton;
    btnOK: TButton;
    cdsMappingFieldsAsync: TStringField;
    cdsMappingFieldsckSrcValueSQL: TStringField;
    cdsMappingFieldsckTargetValueSQL: TStringField;
    cdsMappingFieldsTargetValueSQLSTR: TMemoField;
    cdsMappingFieldsSrcValueSQLSTR: TMemoField;
    btnSettingSyncData: TButton;
    cdsMappingFieldsAcheck: TStringField;
    btnGen: TButton;
    btnClearNoneLinkField: TButton;
    cdsMappingFieldsTransferType: TStringField;
    cdsMappingFieldsTransferIsFixValue: TStringField;
    cdsMappingFieldsTransferFixSTRValue: TStringField;
    cdsMappingFieldsTransferTrackData: TBlobField;
    cdsMappingFieldsAsyncType: TStringField;
    cdsMappingFieldsAsyncIsFixValue: TStringField;
    cdsMappingFieldsAsyncFixSTRValue: TStringField;
    cdsMappingFieldsAsyncTrackData: TBlobField;
    cdsMappingFieldsTransferSQLData: TMemoField;
    cdsMappingFieldsAsyncSQLData: TMemoField;
    pnAllClients: TRzPanel;
    pnButtom: TRzPanel;
    pnTop: TRzPanel;
    Splitter1: TSplitter;
    grdFields: TcxGrid;
    grdFieldsDBTableView1: TcxGridDBTableView;
    grdFieldsDBTableView1Column1: TcxGridDBColumn;
    grdFieldsDBTableView1srcFieldName: TcxGridDBColumn;
    grdFieldsDBTableView1targetFieldName: TcxGridDBColumn;
    grdFieldsDBTableView1Async: TcxGridDBColumn;
    grdFieldsDBTableView1Acheck: TcxGridDBColumn;
    grdFieldsDBTableView1TargetValueSQLSTR: TcxGridDBColumn;
    grdFieldsDBTableView1SrcValueSQLSTR: TcxGridDBColumn;
    grdFieldsDBTableView1TransferType: TcxGridDBColumn;
    grdFieldsDBTableView1TransferIsFixValue: TcxGridDBColumn;
    grdFieldsDBTableView1TransferFixSTRValue: TcxGridDBColumn;
    grdFieldsDBTableView1TransferSQLData: TcxGridDBColumn;
    grdFieldsDBTableView1AsyncType: TcxGridDBColumn;
    grdFieldsDBTableView1AsyncIsFixValue: TcxGridDBColumn;
    grdFieldsDBTableView1AsyncFixSTRValue: TcxGridDBColumn;
    grdFieldsDBTableView1AsyncSQLData: TcxGridDBColumn;
    grdFieldsLevel1: TcxGridLevel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    grdTrackTranfers: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cdsTrackTranferData: TClientDataSet;
    dsTrackTranferData: TDataSource;
    cdsTrackAsyncData: TClientDataSet;
    dsTrackAsyncData: TDataSource;
    cdsTrackTranferDataTrackType: TStringField;
    cdsTrackTranferDataTrack: TStringField;
    cdsTrackTranferDataTrackEnable: TStringField;
    cdsTrackTranferDataTrackValue: TMemoField;
    cxGridDBTableView1Track: TcxGridDBColumn;
    cxGridDBTableView1TrackType: TcxGridDBColumn;
    cxGridDBTableView1TrackEnable: TcxGridDBColumn;
    cxGridDBTableView1TrackValue: TcxGridDBColumn;
    cdsTrackAsyncDataTrack: TStringField;
    cdsTrackAsyncDataTrackType: TStringField;
    cdsTrackAsyncDataTrackEnable: TStringField;
    cdsTrackAsyncDataTrackValue: TMemoField;
    cxGridDBTableView2Track: TcxGridDBColumn;
    cxGridDBTableView2TrackType: TcxGridDBColumn;
    cxGridDBTableView2TrackEnable: TcxGridDBColumn;
    cxGridDBTableView2TrackValue: TcxGridDBColumn;
    procedure grdFieldsDBTableView1Column1GetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: string);
    procedure btnSettingSyncDataClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnGenClick(Sender: TObject);
    procedure btnClearNoneLinkFieldClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsMappingFieldsAfterScroll(DataSet: TDataSet);
    procedure cdsTrackTranferDataAfterPost(DataSet: TDataSet);
    procedure cdsTrackAsyncDataAfterPost(DataSet: TDataSet);
    procedure cdsTrackTranferDataBeforePost(DataSet: TDataSet);
    procedure cdsTrackAsyncDataBeforePost(DataSet: TDataSet);
  private
    FtargetTablename: string;
    FsrcTableName: string;
    FfieldSteam: TStream;
    procedure SetsrcTableName(const Value: string);
    procedure SettargetTablename(const Value: string);

    procedure TestConnection();
    procedure SetfieldSteam(const Value: TStream);
    procedure initTrack();
    { Private declarations }
  public
    { Public declarations }
    property srcTableName : string read FsrcTableName write SetsrcTableName;
    property targetTablename : string read FtargetTablename write SettargetTablename;
    property fieldSteam : TStream read FfieldSteam write SetfieldSteam;

  end;

var
  formMappingFields: TformMappingFields;

const
  hosxp_lab_lis_track ='lab_lis_track';

  gw_transfer_type : array[0..3] of string =('Data','FixValue','SQLData','Track');
  track_type : array[0..1] of string =('FixValue','Command');
  hosxp_lab_lis_track_type:array[0..4] of   String=('ORDER-ENTRY','ORDER-ACCEPT','ORDER-NONEACCEPT','ORDER-REPORT','ORDER-CANCEL');
  hosxp_lab_lis_track_gwtype:array[0..6] of String=('ORDER-ACCEPT','ORDER-NONEACCEPT','ORDER-REPORT','ORDER-CANCEL','ORDER-IMAGE','INIT','REQUEST-ACCEPT-NUMBER');


implementation

uses HOSxP_gwLIB, SettingSyncSQLForm, Math, HOSxP_LabTrack;

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

procedure TformMappingFields.grdFieldsDBTableView1Column1GetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: string);
begin
  AText := IntToStr(ARecordIndex+1);
end;

procedure TformMappingFields.SetfieldSteam(const Value: TStream);
begin
  FfieldSteam := Value;

  try
  if sizeof(FfieldSteam)<>0 then
    cdsMappingFields.LoadFromStream(FfieldSteam);
  except
    if not cdsMappingFields.Active then cdsMappingFields.CreateDataSet;

  end;
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

  if not cdsMappingFields.Active then cdsMappingFields.CreateDataSet;


//  frxReport1.LoadFromFile( sRep ) ;
//   DM_Main.Cds_Fcode.DisableControls;
//    try
//      frxReport1.PrepareReport(true);
//    if frmMain.ReportDesignMode then
//      frxReport1.DesignReport
//    else
//      frxReport1.ShowPreparedReport;
//    finally
//      DM_Main.Cds_Fcode.EnableControls;
//    end;



  with cdsMappingFields do
  begin
    EmptyDataSet;
    cdsMappingFields.DisableControls;
    Screen.Cursor:=crHourGlass;
    for isrcF := 0 to cdsTempSrc.FieldCount-1 do
    begin

      Append;
      cdsMappingFieldssrcFieldName.AsString:=cdsTempSrc.FieldList[isrcF].FieldName;
      cdsMappingFieldsAsync.AsString:='N';
      cdsMappingFieldsTransferIsFixValue.AsString:='N';
      cdsMappingFieldsAsyncFixSTRValue.AsString:='N';
      cdsMappingFieldsTransferType.AsString:='Data';
      cdsMappingFieldsAsyncType.AsString:='Data';

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
    cdsMappingFields.EnableControls;
    Screen.Cursor:=crDefault;

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

procedure TformMappingFields.FormShow(Sender: TObject);
var icount : integer;
begin

  // init Transfer Type
  TcxCustomComboBoxProperties(grdFieldsDBTableView1TransferType.Properties).Items.Clear;

  for icount := 0 to length(gw_transfer_type)-1 do
  begin
    TcxCustomComboBoxProperties(grdFieldsDBTableView1TransferType.Properties).Items.Add(gw_transfer_type[icount]);
  end;

  // init Transfer Back Type
  TcxCustomComboBoxProperties(grdFieldsDBTableView1AsyncType.Properties).Items.Clear;
  for icount := 0 to length(gw_transfer_type)-1 do
  begin
    TcxCustomComboBoxProperties(grdFieldsDBTableView1AsyncType.Properties).Items.Add(gw_transfer_type[icount]);
  end;

  initTrack;

end;

procedure TformMappingFields.cdsMappingFieldsAfterScroll(
  DataSet: TDataSet);

var
    FTrasferTrackStream ,FAsyncTrackStream: TStream;
begin

  if not cdsTrackTranferData.Active then cdsTrackTranferData.CreateDataSet;
  if not cdsTrackAsyncData.Active then cdsTrackAsyncData.CreateDataSet;

  cdsTrackTranferData.EmptyDataSet;
  cdsTrackAsyncData.EmptyDataSet;

  FTrasferTrackStream := TMemoryStream.Create;
  FTrasferTrackStream:= cdsMappingFields.CreateBlobStream(cdsMappingFieldsTransferTrackData as TBlobField, bmRead);
  if sizeof(FTrasferTrackStream)>0 then
   cdsTrackTranferData.LoadFromStream(FTrasferTrackStream)
  else
  cdsTrackTranferData.EmptyDataSet;

  FAsyncTrackStream := TMemoryStream.Create;
  FAsyncTrackStream:= cdsMappingFields.CreateBlobStream(cdsMappingFieldsAsyncTrackData as TBlobField, bmRead);
  if sizeof(FAsyncTrackStream)>0 then
   cdsTrackAsyncData.LoadFromStream(FAsyncTrackStream)
  else
    cdsTrackAsyncData.EmptyDataSet;

  

end;

procedure TformMappingFields.cdsTrackTranferDataAfterPost(
  DataSet: TDataSet);
var
    FTrasferTrackStream : TStream;
begin
  if not (cdsMappingFields.State in [dsinsert,dsedit]) then cdsMappingFields.Edit;
  FTrasferTrackStream := TMemoryStream.Create;
  cdsTrackTranferData.SaveToStream(FTrasferTrackStream);
  (cdsMappingFieldsTransferTrackData as TBlobField).LoadFromStream(FTrasferTrackStream);

  cdsMappingFields.Post;
end;

procedure TformMappingFields.cdsTrackAsyncDataAfterPost(DataSet: TDataSet);
var
    FAsyncTrackStream: TStream;
begin
  if not (cdsMappingFields.State in [dsinsert,dsedit]) then cdsMappingFields.Edit;
  FAsyncTrackStream := TMemoryStream.Create;
  cdsTrackAsyncData.SaveToStream(FAsyncTrackStream);
  (cdsMappingFieldsAsyncTrackData as TBlobField).LoadFromStream(FAsyncTrackStream);

  cdsMappingFields.Post;
end;
procedure TformMappingFields.initTrack;
var icount  : integer;
begin
  // init Track
  TcxCustomComboBoxProperties(cxGridDBTableView1Track.Properties).Items.Clear;
  for icount := 0 to length(hosxp_lab_lis_track_type)-1 do
  begin
    TcxCustomComboBoxProperties(cxGridDBTableView1Track.Properties).Items.Add(hosxp_lab_lis_track_type[icount]);
  end;

  TcxCustomComboBoxProperties(cxGridDBTableView2Track.Properties).Items.Clear;
  for icount := 0 to length(hosxp_lab_lis_track_gwtype)-1 do
  begin
    TcxCustomComboBoxProperties(cxGridDBTableView2Track.Properties).Items.Add(hosxp_lab_lis_track_gwtype[icount]);
  end;



  // init Track  Type
  TcxCustomComboBoxProperties(cxGridDBTableView1TrackType.Properties).Items.Clear;
  for icount := 0 to length(track_type)-1 do
  begin
    TcxCustomComboBoxProperties(cxGridDBTableView1TrackType.Properties).Items.Add(track_type[icount]);
  end;

  TcxCustomComboBoxProperties(cxGridDBTableView2TrackType.Properties).Items.Clear;
  for icount := 0 to length(track_type)-1 do
  begin
    TcxCustomComboBoxProperties(cxGridDBTableView2TrackType.Properties).Items.Add(track_type[icount]);
  end;







end;




procedure TformMappingFields.cdsTrackTranferDataBeforePost(
  DataSet: TDataSet);
begin
  if DataSet.FieldByName('TrackEnable').IsNull then DataSet.FieldByName('TrackEnable').AsString:='N'; 
end;

procedure TformMappingFields.cdsTrackAsyncDataBeforePost(
  DataSet: TDataSet);
begin
  if DataSet.FieldByName('TrackEnable').IsNull then DataSet.FieldByName('TrackEnable').AsString:='N';
end;

end.
