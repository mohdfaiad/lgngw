unit MainApplicationForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, MyAccess, DBClient, Provider, MemDS, StdCtrls,
  ExtCtrls, ComCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxGroupBox, cxLabel, Gauges,ActiveX, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Grids, DBGrids, dxSkinscxPCPainter,
  cxPCdxBarPopupMenu, cxPC, cxTextEdit,  cxMaskEdit,
  cxSpinEdit,LISEncryptionUtil, JvExControls, JvNavigationPane,
  DASQLMonitor, MyDacMonitor, MySQLMonitor;


type
  TProcessThread = class(TThread)
  private
    FURL: string;
    FLocal: string;
    FList: TStringList;
    FlbItemProgress : TcxLabel;
    FListItem: TListItem;
    pbRect: TRect;
    FProgressBar: TProgressBar;
    FMemoProcessLog : TMemo;
    FErrorProcessLog :TMemo;
    FProgressbarIndex: integer;
    FProgressbarIndexName: string;
    FAutoStart: boolean;
    procedure SetAutoStart(const Value: boolean);

  protected
    procedure Execute; override;
    procedure RunThread(const srcTableName, targetTableName: string; FProgressbarIndex: integer);

    procedure TransferData();
    procedure TransferBack();

   // procedure updateDoctor(_doctorCode:string);

    function updateTables(TableName:string;LocateFields,LocateValue:array of Variant):boolean;
    function copyCdsA(cdsSource:TClientDataSet;cdsTarget:TClientDataSet):boolean;

    function updateDoctor(doctorcode:string):boolean;
    function updateLabItem(LabItemsCode:integer):boolean;
    function copyCds(cdsSource:TClientDataSet;cdsTarget,cdsMappFields,mappFieldsTemp:TClientDataSet;WithTrack:boolean;TrackType:string):boolean;
    function ASyncCds(cdsSource:TClientDataSet;cdsTarget,cdsMappFields,mappFieldsTemp:TClientDataSet;WithTrack:boolean;TrackType:string;tableName:string):boolean;
    procedure ProcessHosLabTrack(trackid:integer);
    function getHosLabDataset:OleVariant;
    procedure updateHosLabDataset(cds:Tclientdataset);
    function getGwLabDataset:OleVariant;
    procedure updateGwLabDataset(cds:Tclientdataset);
    procedure clearMemoLog();
    procedure checkLabLink(lab_order_number:integer;lab_items:integer;result:string);




  public
    constructor Create(const srcTableName, targetTableName: string; FileList: TStringList); reintroduce; overload;
    destructor Destroy; override;
    property AutoStart : boolean read FAutoStart write SetAutoStart;
  end;



type
  TFormMainApplication = class(TForm)
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Splitter1: TSplitter;
    pnTop: TPanel;
    Button1: TButton;
    Button2: TButton;
    pnRight: TPanel;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    btnMapping: TButton;
    btnStartProcess: TButton;
    btnConfiguration: TButton;
    cxGroupBox5: TcxGroupBox;
    pnClients: TPanel;
    Splitter2: TSplitter;
    ClientDataSet1: TClientDataSet;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Splitter3: TSplitter;
    cxGroupBox6: TcxGroupBox;
    cxGroupBox7: TcxGroupBox;
    Button3: TButton;
    btnStartDrillDownProcess: TButton;
    Button5: TButton;
    cxGroupBox8: TcxGroupBox;
    cxPageControl2: TcxPageControl;
    cxTabSheet3: TcxTabSheet;
    cxLabel3: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxTextEdit2: TcxTextEdit;
    cxTabSheet4: TcxTabSheet;
    cxLabel7: TcxLabel;
    cxTextEdit3: TcxTextEdit;
    cxLabel8: TcxLabel;
    cxTextEdit4: TcxTextEdit;
    StatusBar2: TStatusBar;
    btnStopProcess: TButton;
    spSec: TcxSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    TimerFlatProcess: TTimer;
    ProgressBar: TProgressBar;
    pnRecordInfo: TPanel;
    StatusBar1: TStatusBar;
    grpWork: TGroupBox;
    memoProcessLog: TMemo;
    grpError: TGroupBox;
    MemoError: TMemo;
    btnClearLog: TButton;
    pnTablesInfo: TPanel;
    ckMarkTrack: TCheckBox;
    JvNavPanelHeader1: TJvNavPanelHeader;
    TimerAutoStart: TTimer;
    TimerTestConnection: TTimer;
    cxLabel1: TcxLabel;
    edHosDBServer: TcxTextEdit;
    edHosDBName: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel5: TcxLabel;
    edGwDBServer: TcxTextEdit;
    edGwDBName: TcxTextEdit;
    cxLabel6: TcxLabel;
    lbHosConnStatus: TcxLabel;
    lbGwConnStatus: TcxLabel;
    MyQuery: TMyQuery;
    MyConnection: TMyConnection;
    dsp: TDataSetProvider;
    procedure btnMappingClick(Sender: TObject);
    procedure btnStartProcessClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnConfigurationClick(Sender: TObject);
    procedure btnStopProcessClick(Sender: TObject);
    procedure TimerFlatProcessTimer(Sender: TObject);
    procedure btnClearLogClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TimerAutoStartTimer(Sender: TObject);
    procedure TimerTestConnectionTimer(Sender: TObject);
  private
    FStopProcess: boolean;
    FCanStartProcess: boolean;
    FWorkProcessCount: integer;
    FAutoStart: boolean;
    FAutoStartCount:integer;
    { Private declarations }
    procedure ShowConfiguration();
    procedure SetStopProcess(const Value: boolean);
    procedure SetCanStartProcess(const Value: boolean);
    procedure SetWorkProcessCount(const Value: integer);
    procedure SetAutoStart(const Value: boolean);
    function tryConnected : boolean;


  public
    { Public declarations }
    FConnectionReady : boolean;

    function getCurrStrDateTIme():string;
    property StopProcess:boolean read FStopProcess write SetStopProcess;
    property CanStartProcess : boolean read FCanStartProcess write SetCanStartProcess;

    property WorkProcessCount:integer read FWorkProcessCount write SetWorkProcessCount;
    property AutoStart : boolean read FAutoStart write SetAutoStart;

  end;

  PNodeData = ^TNodeData;
  TNodeData = record
    Name : string;
    DataType : string;
    NotNull : Boolean;
    PKey : Boolean;
  end;


var
  FormMainApplication: TFormMainApplication;
  ProcessThread: TProcessThread;

const
  _sample_db='dba0';

implementation

uses HOSxP_gwLIB, MappingTablesForm, ConfigurationForm, uCiaXml,
   HOSxP_Logging;

{$R *.dfm}

function ReplaceStr(const S, Srch, Replace: string): string;
var
  I: Integer;
  Source: string;
begin
  Source := S;
  Result := '';
  repeat
    I := Pos(Srch, Source);
    if I > 0 then
    begin
      Result := Result + Copy(Source, 1, I - 1) + Replace;
      Source := Copy(Source, I + Length(Srch), MaxInt);
    end
    else
      Result := Result + Source;
  until I <= 0;
end;


procedure TFormMainApplication.btnStartProcessClick(Sender: TObject);
begin
 FCanStartProcess := true;
 TimerFlatProcess.Interval := spSec.Value*1000;
 TimerFlatProcess.Enabled:=true;
 btnStartProcess.Enabled:=false;

{
  FStopProcess := false;
  ProcessThread.RunThread('','',0);
  FCanStartProcess := false;

  btnStartProcess.Enabled:=false;
  btnStopProcess.Enabled:=true;

}

end;

procedure TFormMainApplication.FormShow(Sender: TObject);
begin
  ShowConfiguration;
  memoProcessLog.Lines.Text:='';
  MemoError.Lines.Text :='';
  ProgressBar.Position:=0;
  FWorkProcessCount:=0;
  FAutoStartCount:=0;
  FConnectionReady:=false;

end;

procedure TFormMainApplication.btnMappingClick(Sender: TObject);
var frmMappingTables : TformMappingTables;
begin
  frmMappingTables := TformMappingTables.Create(Application);
  frmMappingTables.ShowModal;
end;

{ TProcessThread }

function TProcessThread.ASyncCds(cdsSource, cdsTarget, cdsMappFields,
  mappFieldsTemp: TClientDataSet;WithTrack:boolean;TrackType:string;tableName:string): boolean;
var i,k,ff,allRec,numRec,InsertCount,UpdateCount,intValue,checkCount,icount:integer;
    str,LocateFieds,LocateFiedsValue,strValue:string;
    LocateArray,LocateFiedsList: array of Variant;
    singleValueType : TFieldType;
    skipRow:boolean;

    cdsTrackData : TClientDataSet;
    FTrackStream : TStream;
begin
try
    allRec := cdsTarget.RecordCount;
    numRec :=0;
    checkCount:=0;
    InsertCount :=0; UpdateCount :=0;
    Result := False;
    cdsTarget.First();

    while (not cdsTarget.Eof) do
    begin

      //************ Generate Locate Field list and Values  *********************
      mappFieldsTemp.first;
      if mappFieldsTemp.Active then
      begin
        LocateFieds:='';
        LocateFiedsValue:='';
        mappFieldsTemp.First;
        checkCount:=0;
        for i:=0 to mappFieldsTemp.RecordCount-1 do
        begin
          if  trim(mappFieldsTemp.FieldByName('Acheck').AsString)='Y' then
          begin
            inc(checkcount);
            LocateFieds:=LocateFieds+trim(mappFieldsTemp.FieldByName('srcFieldName').AsString)+';';

            setLength(LocateFiedsList,checkCount);
            LocateFiedsList[checkCount-1] := trim(mappFieldsTemp.FieldByName('targetFieldName').AsString);

            setLength(LocateArray,checkcount);
            singleValueType :=cdsTarget.FieldByName(trim(mappFieldsTemp.FieldByName('targetFieldName').AsString)).DataType;
            if cdsTarget.FieldByName(trim(mappFieldsTemp.FieldByName('targetFieldName').AsString)).DataType in [ftSmallint, ftInteger,ftFloat, ftCurrency]
            then
              begin
                if checkCount=1 then intValue := cdsTarget.FieldByName(trim(mappFieldsTemp.FieldByName('targetFieldName').AsString)).AsInteger;
                LocateArray[checkCount-1] := cdsTarget.FieldByName(trim(mappFieldsTemp.FieldByName('targetFieldName').AsString)).AsInteger; //VarArrayCreate([0,1],varInteger);
              end
            else
              begin
                if checkCount=1 then strValue := cdsTarget.FieldByName(trim(mappFieldsTemp.FieldByName('targetFieldName').AsString)).AsString;
                LocateArray[checkCount-1] := cdsTarget.FieldByName(trim(mappFieldsTemp.FieldByName('targetFieldName').AsString)).AsString;
              end;
          end;

          if not mappFieldsTemp.Eof then mappFieldsTemp.Next;

          if FormMainApplication.StopProcess then
          begin
            Exit;
            //Self.Terminate;
          end;

        end;
      end;

      if numRec=62 then
      begin
        skipRow :=false;   //debug zone
      end;


      //************* Check Locate Field is not empty  ************************
      skipRow :=false;

      for icount:=0 to High(LocateFiedsList) do
        if trim(cdsTarget.FieldByName(trim(LocateFiedsList[icount])).AsString)='' then
       // if cdsTarget.FieldByName(string(LocateFiedsList[icount])).AsString='' then
        begin
          //FormMainApplication.MemoError.Lines.Add(IntToStr(numRec)+'>>'+LocateFiedsList[icount]);
          skipRow :=true;
        end;




      if skipRow=false then
      begin



        //************ Assing Update Mode Insert or Update  *********************
        if Trim(LocateFieds)='' then
        begin
          Inc(InsertCount);
          cdsSource.Append();
        end
        else
        if High(LocateArray)>0 then  // 0,1
        begin
          // multiple locate value
          if not ( cdsSource.Locate(LocateFieds,VarArrayOf(LocateArray),[])) then
          begin
           // Inc(InsertCount);
           // cdsSource.Append();
          end
          else
          begin
            inc(UpdateCount);
            cdsSource.Edit;
          end;
        end else
          // single locate value
          if singleValueType in [ftSmallint, ftInteger,ftFloat, ftCurrency] then
          begin
            if not ( cdsSource.Locate(LocateFieds,intValue,[])) then
            begin
              //Inc(InsertCount);
              //cdsSource.Append();
            end
            else
            begin
              inc(UpdateCount);
              cdsSource.Edit;
            end;
          end else
          begin
              if not ( cdsSource.Locate(LocateFieds,strValue,[])) then
              begin
                //Inc(InsertCount);
                //cdsSource.Append();
              end
              else
              begin
                inc(UpdateCount);
                cdsSource.Edit;
              end;
          end;


        //************ start copy data ********************************
        if cdsSource.State in [dsEdit] then
        begin
          if cdsMappFields.RecordCount>0 then
          begin
            cdsMappFields.First;
            for ff := 0 to cdsMappFields.RecordCount-1 do
              //if  trim(cdsSource.FieldByName(trim(cdsMappFields.FieldByName('srcFieldName').AsString)).AsString)<>'' then
               if  trim(cdsMappFields.FieldByName('srcFieldName').AsString)<>'' then
              begin
                if trim(cdsMappFields.FieldByName('Async').AsString)='Y'  then
                cdsSource.FieldByName(trim(cdsMappFields.FieldByName('srcFieldName').AsString)).Value
                  := cdsTarget.FieldByName(trim(cdsMappFields.FieldByName('targetFieldName').AsString)).Value;


                 //FormMainApplication.MemoError.Lines.add(cdsMappFields.FieldByName('targetFieldName').AsString+' >> '+trim(cdsTarget.FieldByName(trim(cdsMappFields.FieldByName('targetFieldName').AsString)).AsString));
                 //*************** process Transfer Type ****************
                 if WithTrack then
                 begin
                   // fixZone
                   if UpperCase(tableName)='LAB_ORDER' then
                    checkLabLink(StrToInt(cdsSource.FieldByName('lab_order_number').AsString),StrToInt(cdsSource.FieldByName('lab_items_code').AsString),cdsSource.FieldByName('lab_order_result').AsString);

                   if UpperCase(cdsMappFields.FieldByName('TransferType').AsString)='TRACK' then
                   begin

                     FTrackStream := TMemoryStream.Create;
                     FTrackStream := cdsMappFields.CreateBlobStream(cdsMappFields.FieldByName('AsyncTrackData') as TBlobField, bmRead);
                     cdsTrackData := TClientDataSet.Create(Application);

                     if sizeof(FTrackStream)>0 then
                     begin
                       cdsTrackData.LoadFromStream(FTrackStream);
                       if cdsTrackData.Active then
                        if cdsTrackData.RecordCount>0 then
                        begin
                          while not cdsTrackData.Eof do
                          begin
                            if cdsTrackData.FieldByName('Track').AsString=TrackType then
                            begin
                              if uppercase(trim(cdsTrackData.FieldByName('TrackEnable').AsString))='Y' then
                                if uppercase(trim(cdsTrackData.FieldByName('TrackType').AsString))='FIXVALUE' then
                                  begin


                                    if cdsSource.FieldByName(trim(cdsMappFields.FieldByName('targetFieldName').AsString)).DataType in [ftSmallint, ftInteger,ftFloat, ftCurrency]
                                    then
                                    if (trim(cdsTrackData.FieldByName('TrackValue').AsString)='') or (cdsTrackData.FieldByName('TrackValue').IsNull) then
                                          cdsSource.FieldByName(trim(cdsMappFields.FieldByName('targetFieldName').AsString)).AsInteger:=0
                                        else
                                        cdsSource.FieldByName(trim(cdsMappFields.FieldByName('targetFieldName').AsString)).AsString := cdsTrackData.FieldByName('TrackValue').AsString

                                    else if cdsSource.FieldByName(trim(cdsMappFields.FieldByName('targetFieldName').AsString)).DataType in [ftDate, ftTime, ftDateTime] then
                                    begin
                                        // fix null date time value   ftDate, ftTime, ftDateTime
                                       if (trim(cdsTrackData.FieldByName('TrackValue').AsString)='') or (cdsTrackData.FieldByName('TrackValue').IsNull) then
                                        cdsSource.FieldByName(trim(cdsMappFields.FieldByName('targetFieldName').AsString)).Clear
                                       else
                                        cdsSource.FieldByName(trim(cdsMappFields.FieldByName('targetFieldName').AsString)).AsString := cdsTrackData.FieldByName('TrackValue').AsString;

                                    end else
                                        cdsSource.FieldByName(trim(cdsMappFields.FieldByName('targetFieldName').AsString)).AsString := cdsTrackData.FieldByName('TrackValue').AsString;


                                  end;
                            end;

                            cdsTrackData.Next;
                          end;
                        end;
                     end;
                   end;
                 end;

                if not cdsMappFields.Eof then cdsMappFields.Next;
              end;

          end;
          try
          cdsSource.Post();
          //Sleep(50);
          except
            on ee : Exception do
            begin
                FErrorProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme+' Error ('+IntToStr(numRec)+') : '+ee.Message);
              if not checkGwConnection then FormMainApplication.FConnectionReady:=false;
              if not checkHosConnection then FormMainApplication.FConnectionReady:=false;

            end;
          end;
        end;

      end;
            
      cdsTarget.Next();

      //************ show information ********************************
      FProgressBar.Position := FProgressBar.Position+1;
      inc(numRec);
      FormMainApplication.pnRecordInfo.Caption := '  '+FormatCurr('#,##0',numRec)+' / '+FormatCurr('#,##0',allRec) +' records';

    end;
      FMemoProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme+' Insert '+FormatCurr('#,##0',InsertCount)+' records');
      FMemoProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme+' Update '+FormatCurr('#,##0',UpdateCount)+' records');
    finally
    result := True;
  end;
end;




procedure TProcessThread.checkLabLink(lab_order_number: integer; lab_items: integer;
  result: string);
var
  labHead,
  labCDS,OPDSCreenCDS:TClientDataSet;
syslabitems:integer;
field:string;
begin
try
  labCDS:=TClientDataSet.Create(Application);
  OPDSCreenCDS:= TClientDataSet.Create(Application);
  labHead := TClientDataSet.Create(Application);
  labHead.Data:= HOSxP_gwGetDataSet('select vn from lab_head where lab_order_number='+IntToStr(lab_order_number));
  if labHead.Active then
    if labHead.RecordCount>0 then
    begin
     labCDS.Data := HOSxP_gwGetDataSet('select * from sys_lab_link where lab_items_code='+inttostr(lab_items));
       if labCDS.RecordCount=1 then
          begin
            syslabitems:=labCDS.FieldByName('sys_lab_code_id').AsInteger;
            OPDSCreenCDS.Data:= HOSxP_gwGetDataSet('select * from opdscreen where vn="'+Trim(labHead.FieldByName('vn').AsString)+'"');
            if OPDSCreenCDS.RecordCount>0 then
               begin
                 OPDSCreenCDS.Edit;

                 if syslabitems=1 then  field:='bun'
                 else if syslabitems=2 then  field:='fbs'
                 else if syslabitems=3 then  field:='creatinine'
                 else if syslabitems=4 then  field:='cholesterol'
                 else if syslabitems=5 then  field:='tc'
                 else if syslabitems=6 then  field:='hdl'
                 else if syslabitems=7 then  field:='ldl'
                 else if syslabitems=8 then  field:='ast'
                 else if syslabitems=9 then  field:='alt'
                 else if syslabitems=10 then  field:='ua'
                 else if syslabitems=11 then  field:=''
                 else if syslabitems=12 then  field:=''
                 else if syslabitems=13 then  field:='sodium'
                 else if syslabitems=14 then  field:='chloride'
                 else if syslabitems=15 then  field:='potassium'
                 else if syslabitems=16 then  field:='tco2'
                 else if syslabitems=17 then  field:='hba1c'
                 else if syslabitems=18 then  field:='urine_albumin'
                 else if syslabitems=19 then  field:='urine_creatinine'
                 else if syslabitems=20 then  field:='macro_albumin'
                 else if syslabitems=21 then  field:='micro_albumin'
                 else if syslabitems=22 then  field:='hb'
                 else if syslabitems=23 then  field:='upcr'
                 else if syslabitems=24 then  field:='bicarb'
                 else if syslabitems=25 then  field:='phosphate'
                 else if syslabitems=26 then  field:='pth'
                 else    field:='';
                if field<>'' then
                begin
                 try
                  OPDSCreenCDS.FieldByName(field).AsString:=  result;
                  OPDSCreenCDS.Post;
                 Except
                    FormMainApplication.MemoError.Lines.Add('Fields '+field+' 㹵��ҧ opdscreen ����� ');
                 end;
                end;

               end;
            if OPDSCreenCDS.ChangeCount>0 then
              HOSxP_gwUpdateDelta(OPDSCreenCDS.Delta,'select * from opdscreen where vn="'+Trim(labHead.FieldByName('vn').AsString)+'"');

          end;
    end;
finally
 labCDS.Free;
 OPDSCreenCDS.Free;
 end;
end;


procedure TProcessThread.clearMemoLog;
begin
          // clear memo log
          if FormMainApplication.MemoError.Lines.Count>1000 then FormMainApplication.MemoError.Lines.Clear;
          if FormMainApplication.memoProcessLog.Lines.Count>1000 then FormMainApplication.memoProcessLog.Lines.Clear;
end;

function TProcessThread.copyCds(cdsSource,
  cdsTarget,cdsMappFields,mappFieldsTemp: TClientDataSet;WithTrack:boolean;TrackType:string): boolean;
var i,k,ff,allRec,numRec,InsertCount,UpdateCount,intValue,checkCount,icount:integer;
    str,LocateFieds,LocateFiedsValue,strValue:string;
    LocateArray,LocateFiedsList : array of Variant;
    singleValueType : TFieldType;
    skipRow:boolean;

    cdsTrackData : TClientDataSet;
    FTrackStream : TStream;
begin
try
    allRec := cdsSource.RecordCount;
    numRec :=0;
    checkCount:=0;
    InsertCount :=0; UpdateCount :=0;
    Result := False;
    cdsSource.First();

    while (not cdsSource.Eof) do
    begin

      //************ Generate Locate Field list and Values  *********************
      mappFieldsTemp.first;
      if mappFieldsTemp.Active then
      begin
        LocateFieds:='';
        LocateFiedsValue:='';
        mappFieldsTemp.First;
        checkCount:=0;
        for i:=0 to mappFieldsTemp.RecordCount-1 do
        begin
          if  trim(mappFieldsTemp.FieldByName('Acheck').AsString)='Y' then
          begin
            inc(checkcount);
            LocateFieds:=LocateFieds+trim(mappFieldsTemp.FieldByName('targetFieldName').AsString)+';';
            setLength(LocateFiedsList,checkCount);
            LocateFiedsList[checkCount-1] := trim(mappFieldsTemp.FieldByName('targetFieldName').AsString);
            setLength(LocateArray,checkCount);
            singleValueType :=cdsSource.FieldByName(trim(mappFieldsTemp.FieldByName('srcFieldName').AsString)).DataType;
            if cdsSource.FieldByName(trim(mappFieldsTemp.FieldByName('srcFieldName').AsString)).DataType in [ftSmallint, ftInteger,ftFloat, ftCurrency]
            then
              begin
                if checkCount=1 then intValue := cdsSource.FieldByName(trim(mappFieldsTemp.FieldByName('srcFieldName').AsString)).AsInteger;
                LocateArray[checkCount-1] := cdsSource.FieldByName(trim(mappFieldsTemp.FieldByName('srcFieldName').AsString)).AsInteger; //VarArrayCreate([0,1],varInteger);
              end
            else
              begin
                if checkCount=1 then strValue := cdsSource.FieldByName(trim(mappFieldsTemp.FieldByName('srcFieldName').AsString)).AsString;
                LocateArray[checkCount-1] := cdsSource.FieldByName(trim(mappFieldsTemp.FieldByName('srcFieldName').AsString)).AsString;
              end;
          end;
          if not mappFieldsTemp.Eof then mappFieldsTemp.Next;

          if FormMainApplication.StopProcess then
          begin
            Exit;
            //Self.Terminate;
          end;

        end;
      end;

      //************* Check Locate Field is not empty  ************************
      skipRow :=false;

      for icount:=0 to High(LocateFiedsList) do
        if trim(cdsSource.FieldByName(trim(LocateFiedsList[icount])).AsString)='' then
       // if cdsTarget.FieldByName(string(LocateFiedsList[icount])).AsString='' then
        begin
          //FormMainApplication.MemoError.Lines.Add(IntToStr(numRec)+'>>'+LocateFiedsList[icount]);
          skipRow :=true;
        end;




      if skipRow=false then
      begin
        try
          //************ Assing Update Mode Insert or Update  *********************
          if Trim(LocateFieds)='' then
          begin
            Inc(InsertCount);
            cdsTarget.Append();
          end
          else
          if High(LocateArray)>0 then       // 0,1
          begin
            // multiple locate value
            if not ( cdsTarget.Locate(LocateFieds,VarArrayOf(LocateArray),[])) then
            begin
              Inc(InsertCount);
              cdsTarget.Append();
            end
            else
            begin
              inc(UpdateCount);
              cdsTarget.Edit;
            end;
          end else
            // single locate value
            if singleValueType in [ftSmallint, ftInteger,ftFloat, ftCurrency] then
            begin
              if not ( cdsTarget.Locate(LocateFieds,intValue,[])) then
              begin
                Inc(InsertCount);
                cdsTarget.Append();
              end
              else
              begin
                inc(UpdateCount);
                cdsTarget.Edit;
              end;
            end else
            begin
                if not ( cdsTarget.Locate(LocateFieds,strValue,[])) then
                begin
                  Inc(InsertCount);
                  cdsTarget.Append();
                end
                else
                begin
                  inc(UpdateCount);
                  cdsTarget.Edit;
                end;
            end;


          //************ start copy data ********************************
          if cdsMappFields.RecordCount>0 then
          begin
            cdsMappFields.First;

            for ff := 0 to cdsMappFields.RecordCount-1 do
              if  trim(cdsMappFields.FieldByName('targetFieldName').AsString)<>'' then
              begin
                if    (
                           (cdsMappFields.FieldByName('targetFieldName').IsNull )
                        or ( trim(cdsMappFields.FieldByName('Async').AsString)='N') or cdsMappFields.FieldByName('Async').IsNull
                      )
                then
                cdsTarget.FieldByName(trim(cdsMappFields.FieldByName('targetFieldName').AsString)).Value
                  := cdsSource.FieldByName(trim(cdsMappFields.FieldByName('srcFieldName').AsString)).Value;

                  //FErrorProcessLog.Lines.Add(trim(cdsMappFields.FieldByName('srcFieldName').AsString));
                 //*************** process Transfer Type ****************
                 if WithTrack then
                 if UpperCase(cdsMappFields.FieldByName('TransferType').AsString)='TRACK' then
                   begin
                     //FormMainApplication.MemoError.Lines.Add(trim(cdsMappFields.FieldByName('targetFieldName').AsString));

                     FTrackStream := TMemoryStream.Create;
                     FTrackStream := cdsMappFields.CreateBlobStream(cdsMappFields.FieldByName('TransferTrackData') as TBlobField, bmRead);
                     cdsTrackData := TClientDataSet.Create(Application);


                     if sizeof(FTrackStream)>0 then
                     begin
                       cdsTrackData.LoadFromStream(FTrackStream);
                       if cdsTrackData.Active then
                        if cdsTrackData.RecordCount>0 then
                        begin
                          while not cdsTrackData.Eof do
                          begin
                            if cdsTrackData.FieldByName('Track').AsString=TrackType then
                            begin
                              if uppercase(trim(cdsTrackData.FieldByName('TrackEnable').AsString))='Y' then
                                if uppercase(trim(cdsTrackData.FieldByName('TrackType').AsString))='FIXVALUE' then
                                  begin

                                    if cdsTarget.FieldByName(trim(cdsMappFields.FieldByName('targetFieldName').AsString)).DataType in [ftSmallint, ftInteger,ftFloat, ftCurrency]
                                    then
                                        cdsTarget.FieldByName(trim(cdsMappFields.FieldByName('targetFieldName').AsString)).AsInteger := cdsTrackData.FieldByName('TrackValue').AsInteger
                                    else if cdsTarget.FieldByName(trim(cdsMappFields.FieldByName('targetFieldName').AsString)).DataType in [ftDate, ftTime, ftDateTime] then
                                    begin
                                        // fix null date time value   ftDate, ftTime, ftDateTime
                                       if Trim(cdsTrackData.FieldByName('TrackValue').AsString)='' then
                                        cdsTarget.FieldByName(trim(cdsMappFields.FieldByName('targetFieldName').AsString)).Clear
                                       else
                                        cdsTarget.FieldByName(trim(cdsMappFields.FieldByName('targetFieldName').AsString)).AsString := cdsTrackData.FieldByName('TrackValue').AsString;

                                    end else
                                        cdsTarget.FieldByName(trim(cdsMappFields.FieldByName('targetFieldName').AsString)).AsString := cdsTrackData.FieldByName('TrackValue').AsString;


                                  end;
                            end;

                            cdsTrackData.Next;
                          end;
                        end;
                     end;
                   end;


                if not cdsMappFields.Eof then cdsMappFields.Next;
              end;

          end;


          cdsTarget.Post();
          //Sleep(50);
        except
          on ee : Exception do
          begin
              FErrorProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme+' Error ('+IntToStr(numRec)+') : '+ee.Message);
              if not checkGwConnection then FormMainApplication.FConnectionReady:=false;
              if not checkHosConnection then FormMainApplication.FConnectionReady:=false;
          end;
        end;

      end;
      cdsSource.Next();

      //************ show information ********************************
      FProgressBar.Position := FProgressBar.Position+1;
      inc(numRec);
      FormMainApplication.pnRecordInfo.Caption := '  '+FormatCurr('#,##0',numRec)+' / '+FormatCurr('#,##0',allRec) +' records';

    end;
      FMemoProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme+' Insert '+FormatCurr('#,##0',InsertCount)+' records');
      FMemoProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme+' Update '+FormatCurr('#,##0',UpdateCount)+' records');
    finally
    result := True;
  end;
end;

function TProcessThread.copyCdsA(cdsSource,
  cdsTarget: TClientDataSet): boolean;
var i,k:integer;
     str:string;
begin
try
  Result := False;

    cdsSource.First();
    while (not cdsSource.Eof) do
    begin
      cdsTarget.Append();

      for i := 0 to (cdsTarget.FieldCount - 1) do
      begin
        for k := 0 to (cdsSource.FieldCount - 1) do
           if  cdsTarget.Fields[i].FieldName=cdsSource.Fields[k].FieldName then
           begin
                    cdsTarget.FieldByName(cdsTarget.Fields[i].FieldName).Value :=
                      cdsSource.FieldByName(cdsSource.Fields[k].FieldName).Value;
           end;
      end;


      try
      cdsTarget.Post();
      except
      end;
      cdsSource.Next();
    end;



    finally
    result := True;
  end;
end;

constructor TProcessThread.Create(const srcTableName,
  targetTableName: string; FileList: TStringList);
begin
  inherited Create(False);
  Self.FProgressBar := FProgressBar;
end;


destructor TProcessThread.Destroy;
begin
  try
      begin
        FProgressBar.Position:=0;
      end;

  finally

  end;
end;


procedure TProcessThread.Execute;
var icount : integer;
begin


  if not FormMainApplication.StopProcess then
    TransferData;
  if not FormMainApplication.StopProcess then
    TransferBack;


  FormMainApplication.CanStartProcess := true;

  FormMainApplication.WorkProcessCount:= FormMainApplication.WorkProcessCount+1;
  FormMainApplication.grpWork.Caption:='Working process ('+IntToStr(FormMainApplication.WorkProcessCount)+')';
end;



function TProcessThread.getGwLabDataset: OleVariant;
var
  cdsGwLabTrack , cdsOpdConfig: TClientDataSet;
  hospitalcode,DeCryptText,track_type: string;
  order_number:integer;

begin
      cdsGwLabTrack := TClientDataSet.Create(Application);
      //cdsLabTrack.Data := HOSxP_extGetDataSet('select * from lab_lis_track ');
      cdsGwLabTrack.Data := HOSxP_extGetDataSet('select * from login_lab_lis_track where gateway_flag=0 or gateway_flag is null  order by lab_lis_track_id');
      result := cdsGwLabTrack.Data;
end;

function TProcessThread.getHosLabDataset: OleVariant;
var
  cdsLabTrack , cdsOpdConfig: TClientDataSet;
  hospitalcode,DeCryptText,track_type: string;
  order_number:integer;

begin
  hospitalcode:='';
  cdsOpdConfig:=TClientDataSet.Create(Application);
  cdsOpdConfig.Data:= HOSxP_gwGetDataSet('select hospitalcode from opdconfig');
  if cdsOpdConfig.Active then
    if cdsOpdConfig.RecordCount>0 then
    begin
      hospitalcode := cdsOpdConfig.FieldByName('hospitalcode').AsString;
      cdsLabTrack := TClientDataSet.Create(Application);
      cdsLabTrack.Data := HOSxP_gwGetDataSet('select * from lab_lis_track where gateway_flag=0 or gateway_flag is null  order by lab_lis_track_id ');
      if cdsLabTrack.Active then
        if cdsLabTrack.RecordCount>0 then
        begin
          cdsLabTrack.First;
          while not cdsLabTrack.Eof do
          begin
            //DeCryptText := DecrypTTextWithKey(cdsLabTrack.FieldByName('lab_order_number').asstring,cdsLabTrack.FieldByName('lab_lis_track_id').asstring+':'+hospitalcode);
            //DeCryptText := GetLabOrderNumber(cdsLabTrack.FieldByName('lab_order_number').asstring,cdsLabTrack.FieldByName('lab_lis_track_id').AsInteger,hospitalcode);
            DeCryptText := HOSxP_gwGetLabOrderNumber(cdsLabTrack.FieldByName('lab_order_number').asstring,cdsLabTrack.FieldByName('lab_lis_track_id').AsInteger,hospitalcode);
            if trim(DeCryptText)<>'' then
            order_number := StrToInt(DeCryptText);

            track_type:='';
            //DeCryptText := DecrypTTextWithKey(cdsLabTrack.FieldByName('lab_lis_track_type').asstring,cdsLabTrack.FieldByName('lab_lis_track_id').asstring+':'+hospitalcode);
            //DeCryptText := GetLabOrderType(cdsLabTrack.FieldByName('lab_lis_track_type').asstring,cdsLabTrack.FieldByName('lab_lis_track_id').AsInteger,hospitalcode);
            DeCryptText := HOSxP_gwGetLabOrderType(cdsLabTrack.FieldByName('lab_lis_track_type').asstring,cdsLabTrack.FieldByName('lab_lis_track_id').AsInteger,hospitalcode);
            if trim(DeCryptText)<>'' then
            track_type := DeCryptText;

            if not (cdsLabTrack.State in [dsEdit,dsInsert] )
              then
                cdsLabTrack.Edit;
            cdsLabTrack.FieldByName('lab_order_number').AsString    :=  inttostr(order_number);
            cdsLabTrack.FieldByName('lab_lis_track_type').AsString  :=  trim(track_type);
            cdsLabTrack.Post;
            //FErrorProcessLog.Lines.Add('DeCryptText:'+cdsLabTrack.FieldByName('lab_order_number').AsString+' - '+cdsLabTrack.FieldByName('lab_lis_track_type').AsString);
            cdsLabTrack.Next;
          end;
        end;
    end;
  result := cdsLabTrack.Data;

end;


procedure TProcessThread.ProcessHosLabTrack(trackid: integer);
var
  cdsLabTrack , cdsOpdConfig: TClientDataSet;
  hospitalcode,DeCryptText,track_type: string;
  order_number:integer;

begin
  hospitalcode:='';
  cdsOpdConfig:=TClientDataSet.Create(Application);
  cdsOpdConfig.Data:= HOSxP_gwGetDataSet('select hospitalcode from opdconfig');
  if cdsOpdConfig.Active then
    if cdsOpdConfig.RecordCount>0 then
    begin
      hospitalcode := cdsOpdConfig.FieldByName('hospitalcode').AsString;
      cdsLabTrack := TClientDataSet.Create(Application);
      cdsLabTrack.Data := HOSxP_gwGetDataSet('select * from lab_lis_track');
      if cdsLabTrack.Active then
        if cdsLabTrack.RecordCount>0 then
        begin
          cdsLabTrack.First;
          while not cdsLabTrack.Eof do
          begin
            DeCryptText := HOSxP_gwGetLabOrderNumber(cdsLabTrack.FieldByName('lab_order_number').asstring,cdsLabTrack.FieldByName('lab_lis_track_id').AsInteger,hospitalcode);
            if trim(DeCryptText)<>'' then
            order_number := StrToInt(DeCryptText);

            track_type:='';
            DeCryptText := HOSxP_gwGetLabOrderType(cdsLabTrack.FieldByName('lab_lis_track_type').asstring,cdsLabTrack.FieldByName('lab_lis_track_id').AsInteger,hospitalcode);
            if trim(DeCryptText)<>'' then
            track_type := DeCryptText;

            //FErrorProcessLog.Lines.Add('DeCryptText:'+IntToStr(order_number)+' - '+track_type);
            cdsLabTrack.Next;
          end;
        end;
    end;
end;

procedure TProcessThread.RunThread(const srcTableName,
  targetTableName: string; FProgressbarIndex: integer);
var
  _ProcessThread: TProcessThread;
const
  pbColumnIndex = 1;
  pbMax = 100;
begin
    CoInitializeEx(nil, COINIT_MULTITHREADED);
    _ProcessThread := TProcessThread.Create(true);
    _ProcessThread.FreeOnTerminate    :=  true;
    _ProcessThread.FProgressBar       :=  FormMainApplication.ProgressBar;
    _ProcessThread.FMemoProcessLog    :=  FormMainApplication.memoProcessLog;
    _ProcessThread.FErrorProcessLog   :=  FormMainApplication.MemoError;
    _ProcessThread.FProgressbarIndex  :=  FProgressbarIndex;
//    _ProcessThread.FlbItemProgress := FormMainApplication.lbItemProgress;

    _ProcessThread.Resume;

    {
    DownloadThread.FURL := AURL;
    DownloadThread.FLocal := sLocal;
    frmStartUp.ProgressBar1.Visible:=true;
    DownloadThread.FProgressBar :=frmStartUp.ProgressBar1;
    DownloadThread.FProgressbarIndexName := extractfilename(sLocal);
    DownloadThread.FProgressbarIndex := FProgressbarIndex;
    DownloadThread.Resume;

    }
end;


procedure TProcessThread.SetAutoStart(const Value: boolean);
begin
  FAutoStart := Value;
end;

procedure TProcessThread.TransferBack;
var
  srcCds,targetCds,mappCds,mappFields,mappFieldsTemp,cdsGwLabTrack,cdsUpdateGwLabTrack:TClientDataSet;
  icount ,i,lab_order_number : integer;
  mappFieldsStream : TStream;
  LocateFieds,TrackType:string;

begin
  try
      FProgressBar.Min:=0;
      srcCds := TClientDataSet.Create(Application);
      targetCds := TClientDataSet.Create(Application);
      mappCds := TClientDataSet.Create(Application);
      mappFields := TClientDataSet.Create(Application);
      mappFieldsTemp:=TClientDataSet.Create(Application);
      cdsGwLabTrack := TClientDataSet.Create(Application);
      cdsUpdateGwLabTrack := TClientDataSet.Create(Application);


      if FileExists(ExtractFilePath(Application.ExeName)+_datafilename) then
      if FormMainApplication.FConnectionReady then
      begin
        mappCds.LoadFromFile(ExtractFilePath(Application.ExeName)+_datafilename);
        mappCds.addindex('SyncType','SyncType',[ixDescending]); //IndexFieldNames := 'SyncType';
        mappCds.IndexName:='SyncType';

        FormMainApplication.StatusBar1.Panels[0].Text := 'Data file.. '+ExtractFilePath(Application.ExeName)+_datafilename;



       cdsGwLabTrack.Data := getGwLabDataset;

       if cdsGwLabTrack.Active then
         if cdsGwLabTrack.RecordCount>0 then
         begin

          { REQUEST ACCEPT NUMBER }
         if cdsGwLabTrack.Active then
             if cdsGwLabTrack.RecordCount>0 then
             begin
               clearMemoLog;

              TrackType := UpperCase(Trim(cdsGwLabTrack.FieldByName('lab_lis_track_type').AsString));

              cdsGwLabTrack.First;
              while not cdsGwLabTrack.Eof do
              if cdsGwLabTrack.FieldByName('lab_lis_track_datetime').AsDateTime>=getGwTrackDate then
              begin
                  if  FormMainApplication.ckMarkTrack.Checked then
                    if  (TrackType='REQUEST-ACCEPT-NUMBER') then
                    begin
                      cdsUpdateGwLabTrack.Data := HOSxP_extGetDataSet('select * from login_lab_lis_track where lab_lis_track_id='+inttostr(cdsGwLabTrack.FieldByName('lab_lis_track_id').AsInteger));
                      if not (cdsUpdateGwLabTrack.State in [dsInsert,dsEdit]) then cdsUpdateGwLabTrack.Edit;
                      cdsUpdateGwLabTrack.FieldByName('lab_lis_accept_number').AsInteger:=HOSxP_gwGetSerialNumber('lab_receive_number');
                      cdsUpdateGwLabTrack.FieldByName('gateway_flag').AsString:='1';
                      cdsUpdateGwLabTrack.Post;
                      if cdsUpdateGwLabTrack.ChangeCount>0 then
                        HOSxP_extUpdateDelta(cdsUpdateGwLabTrack.Delta,'select * from login_lab_lis_track where lab_lis_track_id='+inttostr(cdsGwLabTrack.FieldByName('lab_lis_track_id').AsInteger));
                    end;

                cdsGwLabTrack.Next;
              end;
           end;



          { TRACK }
          cdsGwLabTrack.First;
          while not cdsGwLabTrack.Eof do
          if cdsGwLabTrack.FieldByName('lab_lis_track_datetime').AsDateTime>=getGwTrackDate then
          begin
            clearMemoLog;
            // write logging
            if Trim(cdsGwLabTrack.FieldByName('lab_order_number').AsString)<>'' then
            begin
              lab_order_number:=strtoint(trim(cdsGwLabTrack.FieldByName('lab_order_number').asstring));
              writelog_labEntryLog(lab_order_number);
            end;


            if mappCds.RecordCount>0 then
            begin
              // transfer
              mappCds.First;
              for  icount := 0 to mappCds.RecordCount-1 do
              begin
                clearMemoLog;
                if mappCds.FieldByName('activate').AsString='Y' then
                begin
                  // ---------------------------------------------------------------------------------------
                  if UpperCase(mappCds.FieldByName('SyncType').AsString)='TRACK' then
                  begin
                     FormMainApplication.pnTablesInfo.Caption:= ' ('+Trim(mappCds.FieldByName('table_src_name').AsString)+' <-- '+Trim(mappCds.FieldByName('table_target_name').AsString)+') '+inttostr(icount+1)+' of '+IntToStr(mappCds.RecordCount)+' Tables';
                     //================================================================================
                     TrackType := UpperCase(Trim(cdsGwLabTrack.FieldByName('lab_lis_track_type').AsString));

                      if  ( TrackType<>'') and (TrackType<>'INIT') then
                      begin
                        FErrorProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme +' '+Trim(mappCds.FieldByName('table_src_name').AsString)+' <-- '+mappCds.FieldByName('table_target_name').AsString+' ');
                        srcCds.Data:=HOSxP_gwGetDataSet('select * from '+mappCds.FieldByName('table_src_name').AsString +' where lab_order_number='+cdsGwLabTrack.FieldByName('lab_order_number').AsString+' ' );
                        targetCds.Data:=HOSxP_extGetDataSet('select * from '+mappCds.FieldByName('table_target_name').AsString +' where lab_order_number='+cdsGwLabTrack.FieldByName('lab_order_number').AsString+' ');
                        FProgressBar.Max:=srcCds.RecordCount;
                        FProgressBar.Min:=0;
                        FProgressBar.Position:=0;

                        mappFieldsStream := TMemoryStream.Create;
                        mappFieldsStream:= mappCds.CreateBlobStream(mappCds.FieldByName('mapping_fields') as TBlobField, bmRead);
                        mappFields.LoadFromStream(mappFieldsStream);

                        mappFieldsTemp.Data:=mappFields.data;

                        FMemoProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme+ ' Start transfer data : '+trim(mappCds.FieldByName('table_src_name').AsString) +' <-- '+ trim(mappCds.FieldByName('table_target_name').AsString));

                        //ASyncCds(srcCds,targetCds,mappFields,mappFieldsTemp,true,UpperCase(Trim('ORDER-NONEACCEPT')));
                        ASyncCds(srcCds,targetCds,mappFields,mappFieldsTemp,true,UpperCase(trim(cdsGwLabTrack.FieldByName('lab_lis_track_type').AsString)),Trim(mappCds.FieldByName('table_src_name').AsString));

                        FProgressBar.Position:=0;

                        if targetCds.ChangeCount>0 then
                          HOSxP_extUpdateDelta(targetCds.Delta,'select * from '+mappCds.FieldByName('table_target_name').AsString+' where lab_order_number='+cdsGwLabTrack.FieldByName('lab_order_number').AsString+' ');

                        FMemoProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme + ' Transfer '+trim(mappCds.FieldByName('table_src_name').AsString)+' ('+FormatCurr('#,##0', srcCds.RecordCount)+' records) to '+trim(mappCds.FieldByName('table_target_name').AsString));

                      end;
                  end;
                end;
                if not mappCds.Eof then mappCds.Next;
              end;

             //================================================================================
              if  FormMainApplication.ckMarkTrack.Checked then
              if  ( TrackType<>'') and (TrackType<>'INIT') then
              begin
                cdsUpdateGwLabTrack.Data := HOSxP_extGetDataSet('select * from login_lab_lis_track where lab_lis_track_id='+inttostr(cdsGwLabTrack.FieldByName('lab_lis_track_id').AsInteger));
                if not (cdsUpdateGwLabTrack.State in [dsInsert,dsEdit]) then cdsUpdateGwLabTrack.Edit;
                cdsUpdateGwLabTrack.FieldByName('gateway_flag').AsString:='1';
                cdsUpdateGwLabTrack.Post;
                if cdsUpdateGwLabTrack.ChangeCount>0 then
                  HOSxP_extUpdateDelta(cdsUpdateGwLabTrack.Delta,'select * from login_lab_lis_track where lab_lis_track_id='+inttostr(cdsGwLabTrack.FieldByName('lab_lis_track_id').AsInteger));
              end;

            cdsGwLabTrack.Next;
          end;
         end;



         { INIT }
         if cdsGwLabTrack.Active then
             if cdsGwLabTrack.RecordCount>0 then
             begin
              clearMemoLog;
              cdsGwLabTrack.First;
              while not cdsGwLabTrack.Eof do
              if cdsGwLabTrack.FieldByName('lab_lis_track_datetime').AsDateTime>=getGwTrackDate then
              begin


                if mappCds.RecordCount>0 then
                begin
                  // transfer
                  mappCds.First;
                  for  icount := 0 to mappCds.RecordCount-1 do
                  begin
                    if mappCds.FieldByName('activate').AsString='Y' then
                    begin
                      // ---------------------------------------------------------------------------------------
                      if UpperCase(mappCds.FieldByName('SyncType').AsString)='DATA' then
                      begin
                         FormMainApplication.pnTablesInfo.Caption:= ' ('+Trim(mappCds.FieldByName('table_src_name').AsString)+' --> '+Trim(mappCds.FieldByName('table_target_name').AsString)+') '+inttostr(icount+1)+' of '+IntToStr(mappCds.RecordCount)+' Tables';
                         //================================================================================
                         TrackType := UpperCase(Trim(cdsGwLabTrack.FieldByName('lab_lis_track_type').AsString));

                          if  (TrackType='INIT') then
                          begin
                            FErrorProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme +' '+Trim(mappCds.FieldByName('table_src_name').AsString)+' <-- '+mappCds.FieldByName('table_target_name').AsString+' ');

                            FormMainApplication.pnTablesInfo.Caption:= ' ('+Trim(mappCds.FieldByName('table_src_name').AsString)+' --> '+Trim(mappCds.FieldByName('table_target_name').AsString)+') '+inttostr(icount+1)+' of '+IntToStr(mappCds.RecordCount)+' Tables';
        //                    FormMainApplication.MemoError.Lines.Add(' ('+Trim(mappCds.FieldByName('table_src_name').AsString)+' <-- '+Trim(mappCds.FieldByName('table_target_name').AsString)+') '+inttostr(icount+1)+' of '+IntToStr(mappCds.RecordCount)+' Tables');

                            srcCds.Data:=HOSxP_gwGetDataSet('select * from '+mappCds.FieldByName('table_src_name').AsString +' '+ mappCds.FieldByName('srcCondition').AsString );
                            targetCds.Data:=HOSxP_extGetDataSet('select * from '+mappCds.FieldByName('table_target_name').AsString +' '+ mappCds.FieldByName('targetCondition').AsString);
                            FProgressBar.Max:=srcCds.RecordCount;
                            FProgressBar.Min:=0;
                            FProgressBar.Position:=0;

                            mappFieldsStream := TMemoryStream.Create;
                            mappFieldsStream:= mappCds.CreateBlobStream(mappCds.FieldByName('mapping_fields') as TBlobField, bmRead);
                            mappFields.LoadFromStream(mappFieldsStream);

                            mappFieldsTemp.Data:=mappFields.data;

                            FMemoProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme+ ' Start transfer data : '+trim(mappCds.FieldByName('table_src_name').AsString) +' --> '+ trim(mappCds.FieldByName('table_target_name').AsString));

                            copyCds(srcCds,targetCds,mappFields,mappFieldsTemp,false,'');

                            FProgressBar.Position:=0;

                            if targetCds.ChangeCount>0 then
                              HOSxP_extUpdateDelta(targetCds.Delta,'select * from '+mappCds.FieldByName('table_target_name').AsString);

                            FMemoProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme + ' Transfer '+trim(mappCds.FieldByName('table_src_name').AsString)+' ('+FormatCurr('#,##0', srcCds.RecordCount)+' records) to '+trim(mappCds.FieldByName('table_target_name').AsString));

                          end;
                      end;
                    end;
                    if not mappCds.Eof then mappCds.Next;
                  end;

                 //================================================================================
                  if  FormMainApplication.ckMarkTrack.Checked then
                  if  (TrackType='INIT') then
                  begin
                    cdsUpdateGwLabTrack.Data := HOSxP_extGetDataSet('select * from login_lab_lis_track where lab_lis_track_id='+inttostr(cdsGwLabTrack.FieldByName('lab_lis_track_id').AsInteger));
                    if not (cdsUpdateGwLabTrack.State in [dsInsert,dsEdit]) then cdsUpdateGwLabTrack.Edit;
                    cdsUpdateGwLabTrack.FieldByName('gateway_flag').AsString:='1';
                    cdsUpdateGwLabTrack.Post;
                    if cdsUpdateGwLabTrack.ChangeCount>0 then
                      HOSxP_extUpdateDelta(cdsUpdateGwLabTrack.Delta,'select * from login_lab_lis_track where lab_lis_track_id='+inttostr(cdsGwLabTrack.FieldByName('lab_lis_track_id').AsInteger));
                  end;

                cdsGwLabTrack.Next;
              end;
             end;
           end;
        end;


      end;
  except
      on ee : Exception do
      begin
          FErrorProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme+' Error : '+ee.Message);

          if not checkGwConnection then
            begin
              FormMainApplication.FConnectionReady:=false;
              FErrorProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme+' Error : disconnect Gateway database server. ');
            end;
          if not checkHosConnection then
            begin
              FormMainApplication.FConnectionReady:=false;
              FErrorProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme+' Error : disconnect HOSxP database server. ');
            end;

          Exit;
      end;

  end;
end;

procedure TProcessThread.TransferData;
var
  srcCds,
  targetCds,
  mappCds,
  mappFields,
  mappFieldsTemp,
  cdsHosLabTrack,cdsUpdateHosLabTrack,cdsUpdateGatewayTrack
                                          :TClientDataSet;
  icount ,i: integer;
  mappFieldsStream : TStream;
  LocateFieds:string;

begin

  try
      FProgressBar.Min:=0;
      srcCds := TClientDataSet.Create(Application);
      targetCds := TClientDataSet.Create(Application);
      mappCds := TClientDataSet.Create(Application);
      mappFields := TClientDataSet.Create(Application);
      mappFieldsTemp:=TClientDataSet.Create(Application);
      cdsHosLabTrack := TClientDataSet.Create(Application);
      cdsUpdateHosLabTrack := TClientDataSet.Create(Application);
      cdsUpdateGatewayTrack := TClientDataSet.Create(Application);


      if FileExists(ExtractFilePath(Application.ExeName)+_datafilename) then
      if FormMainApplication.FConnectionReady then
      begin
        mappCds.LoadFromFile(ExtractFilePath(Application.ExeName)+_datafilename);
        mappCds.addindex('SyncType','SyncType',[ixDescending]); //IndexFieldNames := 'SyncType';
        mappCds.IndexName:='SyncType';

        FormMainApplication.StatusBar1.Panels[0].Text := 'Data file.. '+ExtractFilePath(Application.ExeName)+_datafilename;
        if mappCds.RecordCount>0 then
        begin
          clearMemoLog;

          // transfer
          mappCds.First;
          for  icount := 0 to mappCds.RecordCount-1 do
          begin
            if mappCds.FieldByName('activate').AsString='Y' then
            begin
              FormMainApplication.pnTablesInfo.Caption:= ' ('+Trim(mappCds.FieldByName('table_src_name').AsString)+' --> '+Trim(mappCds.FieldByName('table_target_name').AsString)+') '+inttostr(icount+1)+' of '+IntToStr(mappCds.RecordCount)+' Tables';
              // ---------------------------------------------------------------------------------------
              if UpperCase(mappCds.FieldByName('SyncType').AsString)='TRACK' then
              begin
               cdsHosLabTrack.Data := getHosLabDataset;
               if cdsHosLabTrack.Active then
                 if cdsHosLabTrack.RecordCount>0 then
                 begin
                  //FormMainApplication.grpWork.Caption:=' Table '+mappCds.FieldByName('table_src_name').AsString+' progress ';
                  FErrorProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme +' '+Trim(mappCds.FieldByName('table_src_name').AsString)+' --> '+mappCds.FieldByName('table_target_name').AsString+' ');
                  while not cdsHosLabTrack.Eof do
                  if cdsHosLabTrack.FieldByName('lab_lis_track_datetime').AsDateTime>=getHosTrackDate then
                  begin

                     //================================================================================
                      srcCds.Data:=HOSxP_gwGetDataSet('select * from '+mappCds.FieldByName('table_src_name').AsString +' where lab_order_number='+cdsHosLabTrack.FieldByName('lab_order_number').AsString+' ' );
                      targetCds.Data:=HOSxP_extGetDataSet('select * from '+mappCds.FieldByName('table_target_name').AsString +' where lab_order_number='+cdsHosLabTrack.FieldByName('lab_order_number').AsString+' ');
                      FProgressBar.Max:=srcCds.RecordCount;
                      FProgressBar.Min:=0;
                      FProgressBar.Position:=0;

                      mappFieldsStream := TMemoryStream.Create;
                      mappFieldsStream:= mappCds.CreateBlobStream(mappCds.FieldByName('mapping_fields') as TBlobField, bmRead);
                      mappFields.LoadFromStream(mappFieldsStream);

                      mappFieldsTemp.Data:=mappFields.data;

                      FMemoProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme+ ' Start transfer data : '+trim(mappCds.FieldByName('table_src_name').AsString) +' --> '+ trim(mappCds.FieldByName('table_target_name').AsString));

                      //copyCds(srcCds,targetCds,mappFields,mappFieldsTemp,true,UpperCase(Trim('ORDER-NONEACCEPT')));
                      copyCds(srcCds,targetCds,mappFields,mappFieldsTemp,true,UpperCase(Trim(cdsHosLabTrack.FieldByName('lab_lis_track_type').AsString)));

                      FProgressBar.Position:=0;

                      if targetCds.ChangeCount>0 then
                        HOSxP_extUpdateDelta(targetCds.Delta,'select * from '+mappCds.FieldByName('table_target_name').AsString+' where lab_order_number='+cdsHosLabTrack.FieldByName('lab_order_number').AsString+' ');

                      FMemoProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme + ' Transfer '+trim(mappCds.FieldByName('table_src_name').AsString)+' ('+FormatCurr('#,##0', srcCds.RecordCount)+' records) to '+trim(mappCds.FieldByName('table_target_name').AsString));

                     //================================================================================
                     // mask track
                    if  FormMainApplication.ckMarkTrack.Checked then
                    begin
                      cdsUpdateHosLabTrack.Data := HOSxP_gwGetDataSet('select * from lab_lis_track where lab_lis_track_id='+inttostr(cdsHosLabTrack.FieldByName('lab_lis_track_id').AsInteger));
                      if not (cdsUpdateHosLabTrack.State in [dsInsert,dsEdit]) then cdsUpdateHosLabTrack.Edit;
                      cdsUpdateHosLabTrack.FieldByName('gateway_flag').AsString:='1';
                      cdsUpdateHosLabTrack.Post;
                      //HOSxP_gwUpdateDelta(cdsUpdateHosLabTrack.Delta,'select * from lab_lis_track where lab_lis_track_id='+inttostr(cdsHosLabTrack.FieldByName('lab_lis_track_id').AsInteger));
                      HOSxP_gwUpdateDeltaA(FormMainApplication.MyConnection,FormMainApplication.MyQuery,FormMainApplication.dsp,cdsUpdateHosLabTrack.Delta,'select * from lab_lis_track where lab_lis_track_id='+inttostr(cdsHosLabTrack.FieldByName('lab_lis_track_id').AsInteger));
                    end;

                    // update gateway track
                    cdsUpdateGatewayTrack.Data := HOSxP_extGetDataSet('select * from lab_lis_track where lab_lis_track_id='+inttostr(cdsHosLabTrack.FieldByName('lab_lis_track_id').AsInteger));
                    if not (cdsUpdateGatewayTrack.State in [dsInsert,dsEdit]) then cdsUpdateGatewayTrack.Edit;

                    cdsUpdateGatewayTrack.FieldByName('gateway_flag').AsString:='1';
                    cdsUpdateGatewayTrack.FieldByName('lab_lis_track_datetime').value := cdsHosLabTrack.FieldByName('lab_lis_track_datetime').value;
                    cdsUpdateGatewayTrack.FieldByName('lab_order_number').value := cdsHosLabTrack.FieldByName('lab_order_number').value;
                    cdsUpdateGatewayTrack.FieldByName('lab_lis_track_type').value := cdsHosLabTrack.FieldByName('lab_lis_track_type').value;
                    cdsUpdateGatewayTrack.FieldByName('lab_lis_track_id').value := cdsHosLabTrack.FieldByName('lab_lis_track_id').value;

                    cdsUpdateGatewayTrack.Post;
                    if cdsUpdateGatewayTrack.ChangeCount>0 then
                    HOSxP_extUpdateDelta(cdsUpdateGatewayTrack.Delta,'select * from lab_lis_track where lab_lis_track_id='+inttostr(cdsHosLabTrack.FieldByName('lab_lis_track_id').AsInteger));

                    // update lookup tables
                    if uppercase(trim(mappCds.FieldByName('table_target_name').AsString))='LAB_HEAD' then
                    begin
                      srcCds.First;
                      while not srcCds.Eof do
                      begin
                        updateDoctor(srcCds.FieldByName('doctor_code').AsString)  ;
                        srcCds.Next;
                      end;
                    end;

                    // update lookup tables
                    if uppercase(trim(mappCds.FieldByName('table_target_name').AsString))='LAB_ORDER' then
                    begin
                      srcCds.First;
                      while not srcCds.Eof do
                      begin
                        updateLabItem(srcCds.FieldByName('lab_items_code').AsInteger);
                        srcCds.Next;
                      end;
                    end;




                    cdsHosLabTrack.Next;

                  end;

                 end;
              end;
            end;
            if not mappCds.Eof then mappCds.Next;
          end;

          sleep(1000);

        end;


      end;
  except
          on ee : Exception do
          begin
            FErrorProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme+' Error : '+ee.Message);

            if not checkGwConnection then
              begin
                FormMainApplication.FConnectionReady:=false;
                FErrorProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme+' Error : disconnect Gateway database server. ');
              end;
            if not checkHosConnection then
              begin
                FormMainApplication.FConnectionReady:=false;
                FErrorProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme+' Error : disconnect HOSxP database server. ');
              end;
            Exit;

          end;
  end;
end;

function TProcessThread.updateDoctor(doctorcode: string): boolean;
var
  cdsSrc,cdsTarget : TClientDataSet;
  strSQL : string;
begin
  cdsSrc := TClientDataSet.Create(Application);
  cdsTarget := TClientDataSet.Create(Application);
  strSQL := 'select * from doctor where code='''+doctorcode+'''';

  cdsTarget.Data := HOSxP_extGetDataSet(strSQL);
  if not (cdsTarget.RecordCount>0) then
  begin
    cdsSrc.Data := HOSxP_gwGetDataSet(strSQL);
    copyCdsA(cdsSrc,cdsTarget);
  end;

  if cdsTarget.ChangeCount>0 then
   HOSxP_extUpdateDelta(cdsTarget.Delta,strsql)

end;

procedure TProcessThread.updateGwLabDataset(cds: Tclientdataset);
begin
  HOSxP_extUpdateDelta(cds.Delta,'select * from login_lab_lis_track where gateway_flag=0 or gateway_flag is null  order by lab_lis_track_id ');
end;

procedure TProcessThread.updateHosLabDataset(cds: Tclientdataset);
begin
 // HOSxP_gwUpdateDelta(cds.Delta,'select * from lab_lis_track where gateway_flag=0 or gateway_flag is null  order by lab_lis_track_id ');
end;

function TProcessThread.updateLabItem(LabItemsCode: integer): boolean;
var
  cdsSrc,cdsTarget : TClientDataSet;
  strSQL : string;
begin
  cdsSrc := TClientDataSet.Create(Application);
  cdsTarget := TClientDataSet.Create(Application);
  strSQL := 'select * from lab_items where lab_items_code='+IntToStr(LabItemsCode);

  cdsTarget.Data := HOSxP_extGetDataSet(strSQL);
  if not (cdsTarget.RecordCount>0) then
  begin
    cdsSrc.Data := HOSxP_gwGetDataSet(strSQL);
    copyCdsA(cdsSrc,cdsTarget);
  end;

  if cdsTarget.ChangeCount>0 then
   HOSxP_extUpdateDelta(cdsTarget.Delta,strsql)

end;

function TProcessThread.updateTables(TableName: string; LocateFields,
  LocateValue: array of Variant): boolean;
var
  flen,vlen : integer;
  conSql : string;
begin
 //
  if length(LocateFields)=length(LocateValue) then
  begin
    conSql := ' WHERE ';
    for flen:=0 to length(LocateFields)-1 do
    begin
        conSql := conSql+ LocateFields[flen]+' = '+ LocateValue[flen] ;
    end;
  end;

end;

function TFormMainApplication.getCurrStrDateTIme: string;
begin
  result:='['+FormatDateTime('dd-MM-yyyy hh:mm:ss',Now)+']';
end;

procedure TFormMainApplication.Button1Click(Sender: TObject);
var
  flen,vlen
  ,arrType
  : integer;
  conSql : string;
  LocateFields,LocateValue : array of variant;
  varArr : array of variant;

begin
 //
  SetLength(LocateFields,1);
  LocateFields[0]:=String('AAA');
  SetLength(LocateValue,1);
    LocateValue[0]:=1;

  varArr:=VarArrayCreate([0], varInteger);


  if length(LocateFields)=length(LocateValue) then
  begin
    conSql := ' WHERE ';
    for flen:=0 to length(varArr)-1 do
    begin
        if flen>0 then  conSql:= conSql + ' AND ';
        conSql := conSql+  LocateFields[flen]+' = ';
        {
       if  VarType(LocateValue[flen]) = varString
       then conSql:= conSql+ ''''+LocateValue[flen]+'''';
       if  VarType(LocateValue[flen]) = varInteger
       then conSql:= conSql+ ''+LocateValue[flen]+'';
        }
      arrType :=  VarType(varArr[flen]);
      case arrType of
          varEmpty     : conSql := 'varEmpty';
          varNull      : conSql := 'varNull';
          varSmallInt  : conSql := 'varSmallInt';
          varInteger   : conSql := 'varInteger';
          varSingle    : conSql := 'varSingle';
          varDouble    : conSql := 'varDouble';
          varCurrency  : conSql := 'varCurrency';
          varDate      : conSql := 'varDate';
          varOleStr    : conSql := 'varOleStr';
          varDispatch  : conSql := 'varDispatch';
          varError     : conSql := 'varError';
          varBoolean   : conSql := 'varBoolean';
          varVariant   : conSql := 'varVariant';
          varUnknown   : conSql := 'varUnknown';
          varByte      : conSql := 'varByte';
          varWord      : conSql := 'varWord';
          varLongWord  : conSql := 'varLongWord';
          varInt64     : conSql := 'varInt64';
          varStrArg    : conSql := 'varStrArg';
          varString    : conSql := 'varString';
          varAny       : conSql := 'varAny';
          varTypeMask  : conSql := 'varTypeMask';
          varUString   : conSql :='varUString';
        end;

    end;
  end;

  MemoError.Lines.Text:= conSql;

end;

procedure TFormMainApplication.Button2Click(Sender: TObject);
var
  cdsLabTrack , cdsOpdConfig: TClientDataSet;
  hospitalcode,DeCryptText,track_type: string;
  order_number:integer;

begin
  hospitalcode:='';
  cdsOpdConfig:=TClientDataSet.Create(Application);
  cdsOpdConfig.Data:= HOSxP_gwGetDataSet('select hospitalcode from opdconfig');
  if cdsOpdConfig.Active then
    if cdsOpdConfig.RecordCount>0 then
    begin
      hospitalcode := cdsOpdConfig.FieldByName('hospitalcode').AsString;
      cdsLabTrack := TClientDataSet.Create(Application);
      cdsLabTrack.Data := HOSxP_gwGetDataSet('select * from lab_lis_track');
      if cdsLabTrack.Active then
        if cdsLabTrack.RecordCount>0 then
        begin
          cdsLabTrack.First;
          while not cdsLabTrack.Eof do
          begin
            DeCryptText := HOSxP_gwGetLabOrderNumber(cdsLabTrack.FieldByName('lab_order_number').asstring,cdsLabTrack.FieldByName('lab_lis_track_id').AsInteger,hospitalcode);
            if trim(DeCryptText)<>'' then
            order_number := StrToInt(DeCryptText);

            track_type:='';
            DeCryptText := HOSxP_gwGetLabOrderType(cdsLabTrack.FieldByName('lab_lis_track_type').asstring,cdsLabTrack.FieldByName('lab_lis_track_id').AsInteger,hospitalcode);
            if trim(DeCryptText)<>'' then
            track_type := DeCryptText;

            //FErrorProcessLog.Lines.Add('DeCryptText:'+IntToStr(order_number)+' - '+track_type);
            cdsLabTrack.Next;

            if not (cdsLabTrack.State in [dsEdit,dsInsert] )
              then
                cdsLabTrack.Edit;
            cdsLabTrack.FieldByName('lab_order_number').AsString:=inttostr(order_number);
            cdsLabTrack.FieldByName('lab_lis_track_type').AsString:=trim(track_type);
            cdsLabTrack.Post;
            //FErrorProcessLog.Lines.Add('DeCryptText:'+cdsLabTrack.FieldByName('lab_order_number').AsString+' - '+cdsLabTrack.FieldByName('lab_lis_track_type').AsString);
            cdsLabTrack.Next;


          end;
        end;
        //HOSxP_gwUpdateDelta(cdsLabTrack.Delta,'select * from lab_lis_track');
        HOSxP_gwUpdateDeltaA(FormMainApplication.MyConnection,FormMainApplication.MyQuery,FormMainApplication.dsp,cdsLabTrack.Delta,'select * from lab_lis_track');
    end;
end;





procedure TFormMainApplication.btnConfigurationClick(Sender: TObject);
begin
  formConfiguration.ShowModal;
end;

procedure TFormMainApplication.ShowConfiguration;
var rep:boolean;
xmlConn : TXMLConfig;
_app_address,_app_hostname,_app_database,_app_user,_app_password:string;
begin
  try
    rep:=false;

    if FileExists(ExtractFilePath(Application.ExeName)+_config_file) then
    begin

      xmlConn:=TXMLConfig.Create(ExtractFilePath(Application.ExeName)+_config_file);
       _app_address:= xmlConn.ReadString('ExtConfig','ADDRESS','');
       _app_database:=xmlConn.ReadString('ExtConfig','DATABASE','');

       edGwDBServer.Text:=_app_address;
       edGwDBName.Text:=_app_database;

       _app_address:= xmlConn.ReadString('HOSxPConfig','ADDRESS','');

       //MySQLMonitor.Active:=false;
       //MySQLMonitor.DBMonitorOptions.Host:=_app_address;
       //MySQLMonitor.Active:=true;

       _app_database:=xmlConn.ReadString('HOSxPConfig','DATABASE','');

       edHosDBServer.Text:=_app_address;
       edHosDBName.Text:=_app_database;

       //MySQLMonitor.DBMonitorOptions.Host:=_app_address;
       xmlConn.Free;

    end;
  except
    on err:Exception do
    begin
      rep:=false;
      MessageDlg(err.Message,mtError,[mbOK],0);
      ShowMessage(_app_address+'-'+_app_database+'-'+_app_user+'-'+_app_password);

    end;
  end;


end;

procedure TFormMainApplication.SetStopProcess(const Value: boolean);
begin
  FStopProcess := Value;
end;

procedure TFormMainApplication.btnStopProcessClick(Sender: TObject);
begin
  TimerFlatProcess.Enabled:=false;
  TimerAutoStart.Enabled:=false;

  FStopProcess := true;
  btnStartProcess.Enabled:=true;
  btnStopProcess.Enabled:=false;

  btnStartProcess.Caption:='Start Process';
  //TerminateThread(ProcessThread.ThreadID,0);
end;

procedure TFormMainApplication.SetAutoStart(const Value: boolean);
begin
  FAutoStart := Value;

  if FAutoStart then
  TimerAutoStart.Enabled:=true;

end;

procedure TFormMainApplication.SetCanStartProcess(const Value: boolean);
begin
  FCanStartProcess := Value;
end;

procedure TFormMainApplication.TimerAutoStartTimer(Sender: TObject);
var maxTime:integer;
begin

  maxTime:=10;
  inc(FAutoStartCount);
  btnStartProcess.Enabled:=false;
  btnStartProcess.Caption:='Start .. ('+IntToStr(maxTime-FAutoStartCount)+')';

  if FConnectionReady then
  begin
    if (maxTime-FAutoStartCount)=0 then
    begin
        TimerAutoStart.Enabled:=false;
        FAutoStartCount:=0;
        btnStartProcess.Caption:='Start Process';
        btnStartProcessClick(sender);
    end;
  end;


end;

procedure TFormMainApplication.TimerFlatProcessTimer(Sender: TObject);
begin
  if FConnectionReady then
  begin
    if FCanStartProcess then
    begin
      FStopProcess := false;
      ProcessThread.RunThread('','',0);
      FCanStartProcess := false;

      btnStartProcess.Enabled:=false;
      btnStopProcess.Enabled:=true;
    end;
  end else
  begin
  lbHosConnStatus.Caption:='Disconnected. Try Reconnect...';
  lbGwConnStatus.Caption:= 'Disconnected. Try Reconnect...';
  end;
end;

procedure TFormMainApplication.TimerTestConnectionTimer(Sender: TObject);
begin
  if not FConnectionReady then
  begin
    tryConnected;
  end;

end;

function TFormMainApplication.tryConnected: boolean;
var rep,hosConn,gwConn : boolean;
begin

  lbHosConnStatus.Caption:='Reconnect...';
  lbGwConnStatus.Caption:='Reconnect...';


  rep := false;
  // check hos connection
  hosConn := checkHosConnection;
  if hosConn then    lbHosConnStatus.Caption:='Connected.';

  gwConn := checkGwConnection;
  if gwConn then lbGwConnStatus.Caption :='Connected.';
  // check gateway connection

  rep := hosConn and gwConn;
  FConnectionReady := rep;

  result := rep;
end;

procedure TFormMainApplication.SetWorkProcessCount(const Value: integer);
begin
  FWorkProcessCount := Value;
end;

procedure TFormMainApplication.btnClearLogClick(Sender: TObject);
begin
  memoProcessLog.Lines.Clear;
  MemoError.Lines.Clear;
end;

end.
