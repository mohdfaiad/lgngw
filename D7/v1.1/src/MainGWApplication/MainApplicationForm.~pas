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
  cxPCdxBarPopupMenu, cxPC, cxTextEdit, VirtualTrees, cxMaskEdit,
  cxSpinEdit;


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

  protected
    procedure Execute; override;
    procedure RunThread(const srcTableName, targetTableName: string; FProgressbarIndex: integer);
    procedure TransferData();
    procedure TransferBack();
    function copyCds(cdsSource:TClientDataSet;cdsTarget,cdsMappFields,mappFieldsTemp:TClientDataSet):boolean;
    function ASyncCds(cdsSource:TClientDataSet;cdsTarget,cdsMappFields,mappFieldsTemp:TClientDataSet):boolean;

  public
    constructor Create(const srcTableName, targetTableName: string; FileList: TStringList); reintroduce; overload;
    destructor Destroy; override;
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
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxLabel1: TcxLabel;
    edHosDBServer: TcxTextEdit;
    cxLabel2: TcxLabel;
    edHosDBName: TcxTextEdit;
    cxTabSheet2: TcxTabSheet;
    cxLabel5: TcxLabel;
    edGwDBServer: TcxTextEdit;
    cxLabel6: TcxLabel;
    edGwDBName: TcxTextEdit;
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
    cxGroupBox9: TcxGroupBox;
    FieldTree: TVirtualStringTree;
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
    procedure Button1Click(Sender: TObject);
    procedure btnMappingClick(Sender: TObject);
    procedure btnStartProcessClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnConfigurationClick(Sender: TObject);
    procedure FieldTreeInitChildren(Sender: TBaseVirtualTree;
      Node: PVirtualNode; var ChildCount: Cardinal);
    procedure FieldTreeGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure btnStartDrillDownProcessClick(Sender: TObject);
    procedure btnStopProcessClick(Sender: TObject);
    procedure TimerFlatProcessTimer(Sender: TObject);
    procedure btnClearLogClick(Sender: TObject);
  private
    FStopProcess: boolean;
    FCanStartProcess: boolean;
    FWorkProcessCount: integer;
    { Private declarations }
    procedure ShowConfiguration();
    function CreateConnectionNodes : Integer;
    procedure SetStopProcess(const Value: boolean);
    procedure SetCanStartProcess(const Value: boolean);
    procedure SetWorkProcessCount(const Value: integer);

  public
    { Public declarations }
    function getCurrStrDateTIme():string;
    property StopProcess:boolean read FStopProcess write SetStopProcess;
    property CanStartProcess : boolean read FCanStartProcess write SetCanStartProcess;

     property WorkProcessCount:integer read FWorkProcessCount write SetWorkProcessCount;
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
  _config_file ='gwconfig.xml';
  _sample_db='dba0';

implementation

uses HOSxP_gwLIB, MappingTablesForm, ConfigurationForm, uCiaXml;

{$R *.dfm}

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

procedure TFormMainApplication.Button1Click(Sender: TObject);
begin

{      ClientDataSet1.Data:= HOSxP_extGetDataSet('select * from products');
      ShowMessage(inttostr(ClientDataSet1.RecordCount));

      ClientDataSet1.First;
      ClientDataSet1.Edit;
      ClientDataSet1.FieldByName('prodname').AsString:='sample 0044dddd';
      ClientDataSet1.Post;
      if ClientDataSet1.ChangeCount>0 then
      HOSxP_extUpdateDelta(ClientDataSet1.Delta,'select * from products');
}
end;


procedure TFormMainApplication.FormShow(Sender: TObject);
begin
  ShowConfiguration;
  memoProcessLog.Lines.Text:='';
  MemoError.Lines.Text :='';
  ProgressBar.Position:=0;
  FWorkProcessCount:=0;

end;

procedure TFormMainApplication.btnMappingClick(Sender: TObject);
var frmMappingTables : TformMappingTables;
begin
  frmMappingTables := TformMappingTables.Create(Application);
  frmMappingTables.ShowModal;
end;

{ TProcessThread }

function TProcessThread.ASyncCds(cdsSource, cdsTarget, cdsMappFields,
  mappFieldsTemp: TClientDataSet): boolean;
var i,k,ff,allRec,numRec,InsertCount,UpdateCount,intValue,checkCount,icount:integer;
    str,LocateFieds,LocateFiedsValue,strValue:string;
    LocateArray,LocateFiedsList: array of Variant;
    singleValueType : TFieldType;
    skipRow:boolean;
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

            setLength(LocateArray,checkcount+1);
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
            Inc(InsertCount);
            cdsSource.Append();
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
              Inc(InsertCount);
              cdsSource.Append();
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
                Inc(InsertCount);
                cdsSource.Append();
              end
              else
              begin
                inc(UpdateCount);
                cdsSource.Edit;
              end;
          end;


        //************ start copy data ********************************
        if cdsMappFields.RecordCount>0 then
        begin
          cdsMappFields.First;
          for ff := 0 to cdsMappFields.RecordCount-1 do
            if  trim(cdsSource.FieldByName(trim(cdsMappFields.FieldByName('srcFieldName').AsString)).AsString)<>'' then
            begin
              if trim(cdsMappFields.FieldByName('Async').AsString)='Y'  then
              cdsSource.FieldByName(trim(cdsMappFields.FieldByName('srcFieldName').AsString)).Value
                := cdsTarget.FieldByName(trim(cdsMappFields.FieldByName('targetFieldName').AsString)).Value;

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




function TProcessThread.copyCds(cdsSource,
  cdsTarget,cdsMappFields,mappFieldsTemp: TClientDataSet): boolean;
var i,k,ff,allRec,numRec,InsertCount,UpdateCount,intValue,checkCount,icount:integer;
    str,LocateFieds,LocateFiedsValue,strValue:string;
    LocateArray,LocateFiedsList : array of Variant;
    singleValueType : TFieldType;
    skipRow:boolean;
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

              if not cdsMappFields.Eof then cdsMappFields.Next;
            end;

        end;

        try
          cdsTarget.Post();
          //Sleep(50);
        except
          on ee : Exception do
          begin
              FErrorProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme+' Error ('+IntToStr(numRec)+') : '+ee.Message);
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


procedure TProcessThread.TransferBack;
var
  srcCds,targetCds,mappCds,mappFields,mappFieldsTemp:TClientDataSet;
  icount ,i : integer;
  mappFieldsStream : TStream;
  LocateFieds:string;

begin
  FProgressBar.Min:=0;
  srcCds := TClientDataSet.Create(Application);
  targetCds := TClientDataSet.Create(Application);
  mappCds := TClientDataSet.Create(Application);
  mappFields := TClientDataSet.Create(Application);
  mappFieldsTemp:=TClientDataSet.Create(Application);

  if FileExists(ExtractFilePath(Application.ExeName)+_datafilename) then
  begin
    mappCds.LoadFromFile(ExtractFilePath(Application.ExeName)+_datafilename);

    FormMainApplication.StatusBar1.Panels[0].Text := 'Data file.. '+ExtractFilePath(Application.ExeName)+_datafilename;
    if mappCds.RecordCount>0 then
    begin

      // transfer
      mappCds.First;
      for  icount := 0 to mappCds.RecordCount-1 do
      begin
        if mappCds.FieldByName('activate').AsString='Y' then
        begin
          FormMainApplication.pnTablesInfo.Caption:= inttostr(icount+1)+' of '+IntToStr(mappCds.RecordCount)+' Tables';
          FErrorProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme + ' '+Trim(mappCds.FieldByName('table_src_name').AsString)+' <-- '+mappCds.FieldByName('table_target_name').AsString+' ');

          srcCds.Data:=HOSxP_gwGetDataSet('select * from '+mappCds.FieldByName('table_src_name').AsString+' '+ mappCds.FieldByName('srcCondition').AsString);
          targetCds.Data:=HOSxP_extGetDataSet('select * from '+mappCds.FieldByName('table_target_name').AsString+' '+ mappCds.FieldByName('targetCondition').AsString);
          FProgressBar.Max:=targetCds.RecordCount;
          FProgressBar.Min:=0;
          FProgressBar.Position:=0;

          mappFieldsStream := TMemoryStream.Create;
          mappFieldsStream:= mappCds.CreateBlobStream(mappCds.FieldByName('mapping_fields') as TBlobField, bmRead);
          mappFields.LoadFromStream(mappFieldsStream);

          mappFieldsTemp.Data:=mappFields.data;
          FMemoProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme+ ' Start transfer data : '+trim(mappCds.FieldByName('table_src_name').AsString) +' <-- '+ trim(mappCds.FieldByName('table_target_name').AsString));

          ASyncCds(srcCds,targetCds,mappFields,mappFieldsTemp);
          FProgressBar.Position:=0;
          try
            if srcCds.ChangeCount>0 then
            HOSxP_gwUpdateDelta(srcCds.Delta,'select * from '+mappCds.FieldByName('table_src_name').AsString);
          except
            on ee:Exception do
            begin
               FMemoProcessLog.Lines.Add('Error : '+ee.Message);
            end;
          end;
          FMemoProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme + ' Transfer '+trim(mappCds.FieldByName('table_src_name').AsString)+' ('+FormatCurr('#,##0', srcCds.RecordCount)+' records) to '+trim(mappCds.FieldByName('table_target_name').AsString));
        end;
        if not mappCds.Eof then mappCds.Next;
      end;
    end;


  end;

end;

procedure TProcessThread.TransferData;
var
  srcCds,targetCds,mappCds,mappFields,mappFieldsTemp:TClientDataSet;
  icount ,i : integer;
  mappFieldsStream : TStream;
  LocateFieds:string;

begin
  FProgressBar.Min:=0;
  srcCds := TClientDataSet.Create(Application);
  targetCds := TClientDataSet.Create(Application);
  mappCds := TClientDataSet.Create(Application);
  mappFields := TClientDataSet.Create(Application);
  mappFieldsTemp:=TClientDataSet.Create(Application);

  if FileExists(ExtractFilePath(Application.ExeName)+_datafilename) then
  begin
    mappCds.LoadFromFile(ExtractFilePath(Application.ExeName)+_datafilename);

    FormMainApplication.StatusBar1.Panels[0].Text := 'Data file.. '+ExtractFilePath(Application.ExeName)+_datafilename;
    if mappCds.RecordCount>0 then
    begin

      // transfer
      mappCds.First;
      for  icount := 0 to mappCds.RecordCount-1 do
      begin
        if mappCds.FieldByName('activate').AsString='Y' then
        begin
          FormMainApplication.pnTablesInfo.Caption:= inttostr(icount+1)+' of '+IntToStr(mappCds.RecordCount)+' Tables';
          FormMainApplication.grpWork.Caption:=' Table '+mappCds.FieldByName('table_src_name').AsString+' progress ';
          FErrorProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme +' '+Trim(mappCds.FieldByName('table_src_name').AsString)+' --> '+mappCds.FieldByName('table_target_name').AsString+' ');
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

          copyCds(srcCds,targetCds,mappFields,mappFieldsTemp);

          FProgressBar.Position:=0;

          if targetCds.ChangeCount>0 then
            HOSxP_extUpdateDelta(targetCds.Delta,'select * from '+mappCds.FieldByName('table_target_name').AsString);

          FMemoProcessLog.Lines.Add(FormMainApplication.getCurrStrDateTIme + ' Transfer '+trim(mappCds.FieldByName('table_src_name').AsString)+' ('+FormatCurr('#,##0', srcCds.RecordCount)+' records) to '+trim(mappCds.FieldByName('table_target_name').AsString));
        end;
        if not mappCds.Eof then mappCds.Next;
      end;
    end;


  end;

end;

function TFormMainApplication.getCurrStrDateTIme: string;
begin
  result:='['+FormatDateTime('dd-MM-yyyy hh:mm:ss',Now)+']';
end;

procedure TFormMainApplication.Button2Click(Sender: TObject);
begin
  {if ClientDataSet2.ChangeCount>0 then
  begin
    ShowMessage(IntToStr(ClientDataSet2.ChangeCount));
    HOSxP_gwUpdateDelta(ClientDataSet2.Delta,'select * from products');
  end;

  ClientDataSet2.Data := HOSxP_gwGetDataSet('select * from products');
  }
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
       _app_database:=xmlConn.ReadString('HOSxPConfig','DATABASE','');

       edHosDBServer.Text:=_app_address;
       edHosDBName.Text:=_app_database;


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

procedure TFormMainApplication.FieldTreeInitChildren(
  Sender: TBaseVirtualTree; Node: PVirtualNode; var ChildCount: Cardinal);
var
  ChildNode : PVirtualNode;
  ChildNodeData : PNodeData;
begin

      ChildNode := FieldTree.AddChild(Node);
      ChildNode.States := ChildNode.States + [vsHasChildren];
      ChildNodeData := FieldTree.GetNodeData(ChildNode);
      ChildNodeData.Name := 'Table Name';
      ChildNodeData.DataType := '';
end;

procedure TFormMainApplication.FieldTreeGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var
  TableName: string;
  ReferenceName: string;
  ColumnName: string;
  sParams: String;
  I : Integer;



  NodeData: PNodeData;
begin
  NodeData:= Sender.GetNodeData(Node);

  CellText := '';

  if TextType = ttNormal then
    case Column of
      0 : CellText := NodeData.Name;
      2 : if Sender.GetNodeLevel(Node) = 2 then begin

            ColumnName:= NodeData.Name;
            TableName:= 'Table Name';
            ReferenceName:= 'ReferenceName';


          end;
    end;
end;

function TFormMainApplication.CreateConnectionNodes: Integer;
var
  i : integer;
  Node : PVirtualNode;
  NodeData : PNodeData;
begin
  FieldTree.Clear;
    Node := FieldTree.AddChild(nil);
    Node.States := Node.States + [vsHasChildren];
    NodeData := FieldTree.GetNodeData(Node);
    NodeData.Name := 'HOSxP';
    NodeData.DataType := '';
  Result := 0;
end;

procedure TFormMainApplication.btnStartDrillDownProcessClick(
  Sender: TObject);
begin
  CreateConnectionNodes;
end;

procedure TFormMainApplication.SetStopProcess(const Value: boolean);
begin
  FStopProcess := Value;
end;

procedure TFormMainApplication.btnStopProcessClick(Sender: TObject);
begin
  TimerFlatProcess.Enabled:=false;
  FStopProcess := true;
  btnStartProcess.Enabled:=true;
  btnStopProcess.Enabled:=false;
  //TerminateThread(ProcessThread.ThreadID,0);
end;

procedure TFormMainApplication.SetCanStartProcess(const Value: boolean);
begin
  FCanStartProcess := Value;
end;

procedure TFormMainApplication.TimerFlatProcessTimer(Sender: TObject);
begin
  if FCanStartProcess then
  begin
    FStopProcess := false;
    ProcessThread.RunThread('','',0);
    FCanStartProcess := false;

    btnStartProcess.Enabled:=false;
    btnStopProcess.Enabled:=true;
  end;
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
