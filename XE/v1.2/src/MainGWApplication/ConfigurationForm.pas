unit ConfigurationForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  cxTextEdit, cxLabel, DB, DBAccess, MyAccess;

type
  TformConfiguration = class(TForm)
    btnOK: TButton;
    btnCancel: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    cxLabel1: TcxLabel;
    edHosDBServer: TcxTextEdit;
    cxLabel2: TcxLabel;
    edHosDBName: TcxTextEdit;
    cxLabel3: TcxLabel;
    edHosUserName: TcxTextEdit;
    cxLabel4: TcxLabel;
    edHosPassword: TcxTextEdit;
    cxLabel5: TcxLabel;
    edgwDBServer: TcxTextEdit;
    cxLabel6: TcxLabel;
    edgwDBName: TcxTextEdit;
    cxLabel7: TcxLabel;
    edgwUserName: TcxTextEdit;
    cxLabel8: TcxLabel;
    edgwPassword: TcxTextEdit;
    btnTestHosConnection: TButton;
    btnTestGwConnection: TButton;
    MyConnectionTest: TMyConnection;
    cxLabel9: TcxLabel;
    dtHosTrackDate: TDateTimePicker;
    cxLabel10: TcxLabel;
    dtGwTrackDate: TDateTimePicker;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnTestHosConnectionClick(Sender: TObject);
    procedure btnTestGwConnectionClick(Sender: TObject);
  private
    { Private declarations }
    procedure SaveMyGwConnection();
    procedure SaveMyExtConnection();
    procedure TestConnection(_server,_user,_password,_database:string);
  public
    { Public declarations }
  end;

var
  formConfiguration: TformConfiguration;

implementation

uses uCiaXml, HOSxP_gwLIB, MyXML;



{$R *.dfm}



procedure TformConfiguration.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TformConfiguration.btnOKClick(Sender: TObject);
var
xmlConn : TXMLConfig;
Xml: TMyXml;
Node, Child, SubChild: TXmlNode;
_app_address,_app_hostname,_app_database,_app_user,_app_password:string;
begin
    //--

    if not FileExists(ExtractFilePath(Application.ExeName)+_config_file) then
    begin
      Xml := TMyXml.Create;
      Xml.Header.Attribute['encoding'] := 'utf-8';

      Xml.Root.NodeName := 'Configuration';
      Node := Xml.Root.AddChild('HOSxPConfig');
      SubChild := Node.AddChild('ADDRESS');SubChild.Text := edHosDBServer.Text;
      SubChild := Node.AddChild('HOSTNAME');SubChild.Text := 'www.hosxp.net';
      SubChild := Node.AddChild('USER');SubChild.Text := edHosUserName.Text;
      SubChild := Node.AddChild('PASSWORD');SubChild.Text := edHosPassword.Text;
      SubChild := Node.AddChild('DATABASE');SubChild.Text := edHosDBName.Text;
      SubChild := Node.AddChild('TRACKDATE_DD');SubChild.Text := FormatDateTime('dd',dtHosTrackDate.Date);
      SubChild := Node.AddChild('TRACKDATE_MM');SubChild.Text := FormatDateTime('MM',dtHosTrackDate.Date);
      SubChild := Node.AddChild('TRACKDATE_YYYY');SubChild.Text := FormatDateTime('yyyy',dtHosTrackDate.Date);

      Node := Xml.Root.AddChild('GatewayConfig');
      SubChild := Node.AddChild('ADDRESS');SubChild.Text := edgwDBServer.Text;
      SubChild := Node.AddChild('HOSTNAME');SubChild.Text := 'www.hosxp.net';
      SubChild := Node.AddChild('USER');SubChild.Text := edgwUserName.Text;
      SubChild := Node.AddChild('PASSWORD');SubChild.Text := edgwPassword.Text;
      SubChild := Node.AddChild('DATABASE');SubChild.Text := edgwDBName.Text;
      SubChild := Node.AddChild('TRACKDATE_DD');SubChild.Text := FormatDateTime('dd',dtGwTrackDate.Date);
      SubChild := Node.AddChild('TRACKDATE_MM');SubChild.Text := FormatDateTime('MM',dtGwTrackDate.Date);
      SubChild := Node.AddChild('TRACKDATE_YYYY');SubChild.Text := FormatDateTime('yyyy',dtGwTrackDate.Date);

      Xml.SaveToFile(ExtractFilePath(Application.ExeName)+_config_file);
      Xml.Free;

      //--

      ShowMessage('Save Configuration Success.');
    end;
  Close;
end;

procedure TformConfiguration.SaveMyExtConnection;
var rep:boolean;
xmlConn : TXMLConfig;
Xml: TMyXml;
Node, Child, SubChild: TXmlNode;
_app_address,_app_hostname,_app_database,_app_user,_app_password:string;
begin
  try
    rep:=false;
    // gateway
    if not FileExists(ExtractFilePath(Application.ExeName)+_config_file) then
    begin
      Xml := TMyXml.Create;
      Xml.Header.Attribute['encoding'] := 'utf-8';

      Node := Xml.Root.AddChild('GatewayConfig');
      SubChild := Node.AddChild('ADDRESS');SubChild.Text := '127.0.0.1';
      SubChild := Node.AddChild('HOSTNAME');SubChild.Text := 'www.hosxp.net';
      SubChild := Node.AddChild('USER');SubChild.Text := 'root';
      SubChild := Node.AddChild('PASSWORD');SubChild.Text := '123456';
      SubChild := Node.AddChild('DATABASE');SubChild.Text := 'gatewaydbname';
      SubChild := Node.AddChild('TRACKDATE_DD');SubChild.Text := '01';
      SubChild := Node.AddChild('TRACKDATE_MM');SubChild.Text := '01';
      SubChild := Node.AddChild('TRACKDATE_YYYY');SubChild.Text := '2012';


      Xml.SaveToFile(ExtractFilePath(Application.ExeName)+_config_file);
      Xml.Free;

      //--

      ShowMessage('Save Configuration Success.');
    end;


    Xml := TMyXml.Create;
    Xml.LoadFromFile(ExtractFilePath(Application.ExeName)+_config_file);

    _app_address      :=Xml.Root.Find('GatewayConfig').Find('ADDRESS').Text;
    _app_user         :=Xml.Root.Find('GatewayConfig').Find('USER').Text;
    _app_password     :=Xml.Root.Find('GatewayConfig').Find('PASSWORD').Text;
    _app_database     :=Xml.Root.Find('GatewayConfig').Find('DATABASE').Text;
    Xml.Free;


     edgwDBServer.Text:=_app_address;
     edgwDBName.Text:=_app_database;
     edgwUserName.Text := _app_user;
     edgwPassword.Text := _app_password;


  except
    on err:Exception do
    begin
      rep:=false;
      MessageDlg(err.Message,mtError,[mbOK],0);
      ShowMessage(_app_address+'-'+_app_database+'-'+_app_user+'-'+_app_password);

    end;
  end;


end;

procedure TformConfiguration.SaveMyGwConnection;
var rep:boolean;
xmlConn : TXMLConfig;
Xml: TMyXml;
Node, Child, SubChild: TXmlNode;
_app_address,_app_hostname,_app_database,_app_user,_app_password:string;
begin
  try
    rep:=false;
    // hos
    if not FileExists(ExtractFilePath(Application.ExeName)+_config_file) then
    begin
      Xml := TMyXml.Create;
      Xml.Header.Attribute['encoding'] := 'utf-8';

      Node := Xml.Root.AddChild('HOSxPConfig');
      SubChild := Node.AddChild('ADDRESS');SubChild.Text := '127.0.0.1';
      SubChild := Node.AddChild('HOSTNAME');SubChild.Text := 'www.hosxp.net';
      SubChild := Node.AddChild('USER');SubChild.Text := 'root';
      SubChild := Node.AddChild('PASSWORD');SubChild.Text := '123456';
      SubChild := Node.AddChild('DATABASE');SubChild.Text := 'hosdbname';
      SubChild := Node.AddChild('TRACKDATE_DD');SubChild.Text := '01';
      SubChild := Node.AddChild('TRACKDATE_MM');SubChild.Text := '01';
      SubChild := Node.AddChild('TRACKDATE_YYYY');SubChild.Text := '2012';

      Xml.SaveToFile(ExtractFilePath(Application.ExeName)+_config_file);
      Xml.Free;

      //--

      ShowMessage('Save Configuration Success.');
    end;


    Xml := TMyXml.Create;
    Xml.LoadFromFile(ExtractFilePath(Application.ExeName)+_config_file);

    _app_address      :=Xml.Root.Find('HOSxPConfig').Find('ADDRESS').Text;
    _app_user         :=Xml.Root.Find('HOSxPConfig').Find('USER').Text;
    _app_password     :=Xml.Root.Find('HOSxPConfig').Find('PASSWORD').Text;
    _app_database     :=Xml.Root.Find('HOSxPConfig').Find('DATABASE').Text;
    Xml.Free;


     edHosDBServer.Text:=_app_address;
     edHosDBName.Text:=_app_database;
     edHosUserName.Text := _app_user;
     edHosPassword.Text := _app_password;


  except
    on err:Exception do
    begin
      rep:=false;
      MessageDlg(err.Message,mtError,[mbOK],0);
      ShowMessage(_app_address+'-'+_app_database+'-'+_app_user+'-'+_app_password);

    end;
  end;


end;


procedure TformConfiguration.FormShow(Sender: TObject);
begin
    SaveMyGwConnection;
    SaveMyExtConnection;
end;

procedure TformConfiguration.TestConnection(_server, _user, _password,
  _database: string);
begin
     with MyConnectionTest do
     begin
      MyConnectionTest.Connected:=false;
      MyConnectionTest.Database:=_database;
      MyConnectionTest.Server:= _server;
      MyConnectionTest.Username:=_user;
      MyConnectionTest.Password:=_password;

      MyConnectionTest.Options.Charset:='tis620';
      try
        MyConnectionTest.Connected:=true;
        Application.MessageBox(pchar('Connection Success.'),pchar('Information'),MB_OK or MB_ICONINFORMATION);
      except
        on ee :Exception do
         Application.MessageBox(pchar(ee.Message),pchar('Warning'),MB_OK or MB_ICONWARNING);
      end;

     end;
end;

procedure TformConfiguration.btnTestHosConnectionClick(Sender: TObject);
begin
  TestConnection(edHosDBServer.Text,edHosUserName.Text,edHosPassword.Text,edHosDBName.Text);
end;

procedure TformConfiguration.btnTestGwConnectionClick(Sender: TObject);
begin
  TestConnection(edgwDBServer.Text,edgwUserName.Text,edgwPassword.Text,edgwDBName.Text);
end;

end.
