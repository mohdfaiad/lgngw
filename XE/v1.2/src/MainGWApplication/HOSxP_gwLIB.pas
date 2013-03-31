unit HOSxP_gwLIB;

interface

uses Windows, uCiaXml,MyAccess,Forms,SysUtils,Provider;

const
  HOSxPLIB = 'hosxpcon.dll';
  ExtLIB = 'extcon.dll';
  LISEncryptionLIB='LISEncryptionUtilsLIB.dll';

  _config_file ='gwconfig.xml';
  _sample_db='dba0';
  AutoGenReceiveNumber = true;

type
  TgwExecuteSQL = procedure(SQL: string);
  TgwGetDataSet = function(const SQL: string): Variant;stdcall;
  TgwGetDataSetA = function(Conn:TMyConnection;lQuery: TMyQuery;lDSP: TDataSetProvider;const SQL: string): Variant;stdcall;
  TgwGetSerialNumber = function(sn: string): Integer;stdcall;
  TgwUpdateDelta = function (Delta: OleVariant; SQLText: string): Integer;
  TgwUpdateDeltaA = function (Conn:TMyConnection;lQuery: TMyQuery;lDSP: TDataSetProvider;Delta: OleVariant; SQLText: string): Integer;
  TgwVersionInfo = function ():integer;

  // encryption
  TgwGetLabOrderNumber = procedure (LaborderEncrytext:String;LISTrackID:integer;hospcode:string;out buffer:string);
  TgwGetLabOrderType = procedure (LabTypetext:String;LISTrackID:integer;hospcode:string;out buffer:string);
  TgwCheckLisenceGateway = function (hospcode:string):boolean;


  TextGetDataSet = function(const SQL: string): Variant;stdcall;
  TextUpdateDelta = function (Delta: OleVariant; SQLText: string): Integer;
  TextVersionInfo = function ():integer;



procedure HOSxP_gwExecuteSQL(SQL: string);
function HOSxP_gwUpdateDelta(Delta: OleVariant; SQLText: string): Integer;
function HOSxP_gwUpdateDeltaA(Conn:TMyConnection;lQuery: TMyQuery;lDSP: TDataSetProvider;Delta: OleVariant; SQLText: string): Integer;

function HOSxP_gwGetDataSet(const SQL: string): Variant;stdcall;
function HOSxP_gwGetDataSetA(Conn:TMyConnection;lQuery: TMyQuery;lDSP: TDataSetProvider;const SQL: string): Variant;stdcall;

function HOSxP_gwGetSerialNumber(sn: string): Integer; stdcall;
function HOSxP_gwVersionInfo():integer;

function HOSxP_extUpdateDelta(Delta: OleVariant; SQLText: string): Integer;
function HOSxP_extGetDataSet(const SQL: string): Variant;stdcall;
function HOSxP_extVersionInfo():integer;

// encryption
function HOSxP_gwGetLabOrderNumber(LaborderEncrytext:String;LISTrackID:integer;hospcode:string):string;
procedure HOSxP_gwGetLabOrderType(LabTypetext:String;LISTrackID:integer;hospcode:string;out _buffer:string);
function HOSxp_gwCheckLisenceGateway(hospcode:string):boolean;


function checkHosConnection: boolean;
function checkGwConnection: boolean;
function getHosTrackDate : TDateTime;
function getGwTrackDate : TDateTime;







implementation

uses MyXML;





var

  HOSxPLIB_DLLHandle : THandle;
  ExtLIB_DLLHandle : THandle;
  Encryption_DLLHandle : THandle;


  _HOSxP_gwExecuteSQL : TgwExecuteSQL;
  _HOSxP_gwGetDataSet : TgwGetDataSet;
  _HOSxP_gwGetDataSetA : TgwGetDataSetA;

  _HOSxp_gwGetSerialNumber : TgwGetSerialNumber;
  _HOSxP_gwUpdateDelta : TgwUpdateDelta;
  _HOSxP_gwUpdateDeltaA : TgwUpdateDeltaA;

  _HOSxP_gwVersionInfo : TgwVersionInfo;

  _HOSxP_extGetDataSet : TextGetDataSet;
  _HOSxP_extUpdateDelta  : TextUpdateDelta;
  _HOSxP_extVersionInfo : TextVersionInfo;

  _HOSxP_gwGetLabOrderNumber :  TgwGetLabOrderNumber;
  _HOSxP_gwGetLabOrderType :  TgwGetLabOrderType;
  _HOSxp_gwCheckLisenceGateway : TgwCheckLisenceGateway;






function getHosTrackDate : TDateTime;
var dt : TDateTime;
    dd,mm,yyyy:word;
    Xml: TMyXml;
    xmlConn : TXMLConfig;
begin
  if FileExists(ExtractFilePath(Application.ExeName)+_config_file) then
  begin

        Xml := TMyXml.Create;
        Xml.LoadFromFile(_config_file);

        dd      :=StrToInt( Xml.Root.Find('HOSxPConfig').Find('TRACKDATE_DD').Text);
        mm     :=StrToInt(xml.Root.Find('HOSxPConfig').Find('TRACKDATE_MM').Text);
        yyyy     :=StrToInt(Xml.Root.Find('HOSxPConfig').Find('TRACKDATE_YYYY').Text);
        Xml.Free;
  end;
  result:=EncodeDate(yyyy,mm,dd);

end;

function getGwTrackDate : TDateTime;
var dt : TDateTime;
    dd,mm,yyyy:word;
    Xml: TMyXml;
    xmlConn : TXMLConfig;
begin


  if FileExists(ExtractFilePath(Application.ExeName)+_config_file) then
  begin

        Xml := TMyXml.Create;
        Xml.LoadFromFile(_config_file);

        dd      :=StrToInt(Xml.Root.Find('GatewayConfig').Find('TRACKDATE_DD').Text);
        mm     :=StrToInt(Xml.Root.Find('GatewayConfig').Find('TRACKDATE_MM').Text);
        yyyy     :=StrToInt(Xml.Root.Find('GatewayConfig').Find('TRACKDATE_YYYY').Text);
        Xml.Free;
  end;
  result:=EncodeDate(yyyy,mm,dd);

end;

function checkHosConnection: boolean;
var MyConnectionTest:TMyConnection;
    rep:boolean;
    xmlConn : TXMLConfig;

    Xml: TMyXml;
    Node, Child, SubChild: TXmlNode;

    _app_address,_app_hostname,_app_database,_app_user,_app_password:string;
begin
     MyConnectionTest :=TMyConnection.Create(Application);
     with MyConnectionTest do
     begin

      //
      rep:=false;


        if not FileExists(ExtractFilePath(Application.ExeName)+_config_file) then
        begin

          Xml := TMyXml.Create;
          Xml.Header.Attribute['encoding'] := 'utf-8';


          Xml.Root.NodeName := 'Configuration';
          Node := Xml.Root.AddChild('HOSxPConfig');
          SubChild := Node.AddChild('ADDRESS');SubChild.Text := 'localhost';
          SubChild := Node.AddChild('HOSTNAME');SubChild.Text := 'www.hosxp.net';
          SubChild := Node.AddChild('USER');SubChild.Text := 'root';
          SubChild := Node.AddChild('PASSWORD');SubChild.Text := '123456';
          SubChild := Node.AddChild('DATABASE');SubChild.Text := 'hos';
          SubChild := Node.AddChild('TRACKDATE_DD');SubChild.Text := '12';
          SubChild := Node.AddChild('TRACKDATE_MM');SubChild.Text := '03';
          SubChild := Node.AddChild('TRACKDATE_YYYY');SubChild.Text := '2012';



          Node := Xml.Root.AddChild('GatewayConfig');
          SubChild := Node.AddChild('ADDRESS');SubChild.Text := 'localhost';
          SubChild := Node.AddChild('HOSTNAME');SubChild.Text := 'www.hosxp.net';
          SubChild := Node.AddChild('USER');SubChild.Text := 'root';
          SubChild := Node.AddChild('PASSWORD');SubChild.Text := '123456';
          SubChild := Node.AddChild('DATABASE');SubChild.Text := _sample_db;
          SubChild := Node.AddChild('TRACKDATE_DD');SubChild.Text := '12';
          SubChild := Node.AddChild('TRACKDATE_MM');SubChild.Text := '03';
          SubChild := Node.AddChild('TRACKDATE_YYYY');SubChild.Text := '2012';
          Xml.SaveToFile(ExtractFilePath(Application.ExeName)+_config_file);
          Xml.Free;

        end;


        // Load XML from Memo1
        Xml := TMyXml.Create;
        Xml.LoadFromFile(_config_file);

        _app_address      :=Xml.Root.Find('HOSxPConfig').Find('ADDRESS').Text;
        //_app_password     :=Xml.Root.Find('HOSxPConfig').Find('HOSTNAME').Text;
        _app_user     :=Xml.Root.Find('HOSxPConfig').Find('USER').Text;
        _app_password     :=Xml.Root.Find('HOSxPConfig').Find('PASSWORD').Text;
        _app_database     :=Xml.Root.Find('HOSxPConfig').Find('DATABASE').Text;
        //_app_user         :=Xml.Root.Find('HOSxPConfig').Find('TRACKDATE_DD').Text;
        //_app_user         :=Xml.Root.Find('HOSxPConfig').Find('TRACKDATE_MM').Text;
        Xml.Free;


        MyConnectionTest.Connected:=false;
        MyConnectionTest.Database:=_app_database;
        MyConnectionTest.Server:= _app_address;
        MyConnectionTest.Username:=_app_user;
        MyConnectionTest.Password:=_app_password;
        MyConnectionTest.Port:=3306;


      MyConnectionTest.Options.Charset:='tis620';
      try
        MyConnectionTest.Connected:=true;
        MyConnectionTest.Connected:=false;
        MyConnectionTest.Free;

        rep := true;
      except
        rep := false;
      end;

     end;
     result := rep;
end;


function checkGwConnection: boolean;
var MyConnectionTest:TMyConnection;
    rep:boolean;
    xmlConn : TXMLConfig;
    Xml: TMyXml;
    Node, Child, SubChild: TXmlNode;

    _app_address,_app_hostname,_app_database,_app_user,_app_password:string;
begin
     MyConnectionTest :=TMyConnection.Create(Application);
     with MyConnectionTest do
     begin

      //
      rep:=false;


        if not FileExists(ExtractFilePath(Application.ExeName)+_config_file) then
        begin

          Xml := TMyXml.Create;
          Xml.Header.Attribute['encoding'] := 'utf-8';


          Xml.Root.NodeName := 'Configuration';
          Node := Xml.Root.AddChild('HOSxPConfig');
          SubChild := Node.AddChild('ADDRESS');SubChild.Text := 'localhost';
          SubChild := Node.AddChild('HOSTNAME');SubChild.Text := 'www.hosxp.net';
          SubChild := Node.AddChild('USER');SubChild.Text := 'root';
          SubChild := Node.AddChild('PASSWORD');SubChild.Text := '123456';
          SubChild := Node.AddChild('DATABASE');SubChild.Text := 'hos';
          SubChild := Node.AddChild('TRACKDATE_DD');SubChild.Text := '12';
          SubChild := Node.AddChild('TRACKDATE_MM');SubChild.Text := '03';
          SubChild := Node.AddChild('TRACKDATE_YYYY');SubChild.Text := '2012';



          Node := Xml.Root.AddChild('GatewayConfig');
          SubChild := Node.AddChild('ADDRESS');SubChild.Text := 'localhost';
          SubChild := Node.AddChild('HOSTNAME');SubChild.Text := 'www.hosxp.net';
          SubChild := Node.AddChild('USER');SubChild.Text := 'root';
          SubChild := Node.AddChild('PASSWORD');SubChild.Text := '123456';
          SubChild := Node.AddChild('DATABASE');SubChild.Text := 'hosgateway';
          SubChild := Node.AddChild('TRACKDATE_DD');SubChild.Text := '12';
          SubChild := Node.AddChild('TRACKDATE_MM');SubChild.Text := '03';
          SubChild := Node.AddChild('TRACKDATE_YYYY');SubChild.Text := '2012';

          Xml.SaveToFile(ExtractFilePath(Application.ExeName)+_config_file);
          Xml.Free;

        end;


        // Load XML from Memo1
        Xml := TMyXml.Create;
        Xml.LoadFromFile(ExtractFilePath(Application.ExeName)+_config_file);

        _app_address      :=Xml.Root.Find('GatewayConfig').Find('ADDRESS').Text;
        //_app_password     :=Xml.Root.Find('HOSxPConfig').Find('HOSTNAME').Text;
        _app_user     :=Xml.Root.Find('GatewayConfig').Find('USER').Text;
        _app_password     :=Xml.Root.Find('GatewayConfig').Find('PASSWORD').Text;
        _app_database     :=Xml.Root.Find('GatewayConfig').Find('DATABASE').Text;
        //_app_user         :=Xml.Root.Find('HOSxPConfig').Find('TRACKDATE_DD').Text;
        //_app_user         :=Xml.Root.Find('HOSxPConfig').Find('TRACKDATE_MM').Text;
        Xml.Free;


        MyConnectionTest.Connected:=false;
        MyConnectionTest.Database:=_app_database;
        MyConnectionTest.Server:= _app_address;
        MyConnectionTest.Username:=_app_user;
        MyConnectionTest.Password:=_app_password;

      MyConnectionTest.Options.Charset:='tis620';
      MyConnectionTest.Port:=3306;
      try
        MyConnectionTest.Connected:=true;
        MyConnectionTest.Connected:=false;
        MyConnectionTest.Free;
        rep := true;
      except
        rep := false;
      end;


     end;
     result := rep;
end;



//========================================================================================================


//function HOSxP_gwUpdateDelta(Delta: OleVariant; SQLText: string): Integer;  external HOSxPLIB name 'HOSxP_gwUpdateDelta';
//function HOSxP_gwGetDataSet(const SQL: string): Variant;stdcall;  external HOSxPLIB name 'HOSxP_gwGetDataSet';
//function HOSxP_gwVersionInfo():integer;external HOSxPLIB name 'HOSxP_gwVersionInfo';

function HOSxP_gwVersionInfo():integer;
begin
  try
    HOSxPLIB_DLLHandle := LoadLibrary(HOSxPLIB);
    if HOSxPLIB_DLLHandle<>0 then
    if checkHosConnection then
    begin
       _HOSxP_gwVersionInfo := GetProcAddress(HOSxPLIB_DLLHandle,'HOSxP_gwVersionInfo');
      if Assigned(_HOSxP_gwVersionInfo) then
      begin
           Result := _HOSxP_gwVersionInfo;
      end;
    end;
  finally
    FreeLibrary(HOSxPLIB_DLLHandle);
  end;
end;

procedure HOSxP_gwExecuteSQL(SQL: string);
begin
  try
    HOSxPLIB_DLLHandle := LoadLibrary(HOSxPLIB);
    if checkHosConnection then
    if HOSxPLIB_DLLHandle<>0 then
    begin
       _HOSxP_gwExecuteSQL := GetProcAddress(HOSxPLIB_DLLHandle,'HOSxP_gwExecuteSQL');
      if Assigned(_HOSxP_gwExecuteSQL) then
      begin
           _HOSxP_gwExecuteSQL(SQL);
      end;
    end;
  finally
    FreeLibrary(HOSxPLIB_DLLHandle);
  end;
end;


function HOSxP_gwUpdateDelta(Delta: OleVariant; SQLText: string): Integer;
begin
  try
    HOSxPLIB_DLLHandle := LoadLibrary(HOSxPLIB);
    if checkHosConnection then
    if HOSxPLIB_DLLHandle<>0 then
    begin
       _HOSxP_gwUpdateDelta := GetProcAddress(HOSxPLIB_DLLHandle,'HOSxP_gwUpdateDelta');
      if Assigned(_HOSxP_gwUpdateDelta) then
      begin
           Result := _HOSxP_gwUpdateDelta(delta,SQLText);
      end;
    end;
  finally
    FreeLibrary(HOSxPLIB_DLLHandle);
  end;
end;



function HOSxP_gwUpdateDeltaA(Conn:TMyConnection;lQuery: TMyQuery;lDSP: TDataSetProvider;Delta: OleVariant; SQLText: string): Integer;
begin
  try
    HOSxPLIB_DLLHandle := LoadLibrary(HOSxPLIB);
    if checkHosConnection then
    if HOSxPLIB_DLLHandle<>0 then
    begin
       _HOSxP_gwUpdateDeltaA := GetProcAddress(HOSxPLIB_DLLHandle,'HOSxP_gwUpdateDeltaA');
      if Assigned(_HOSxP_gwUpdateDeltaA) then
      begin
           Result := _HOSxP_gwUpdateDeltaA(conn,lQuery,lDSP,Delta,SQLText);
      end;
    end;
  finally
    FreeLibrary(HOSxPLIB_DLLHandle);
  end;
end;



function HOSxP_gwGetDataSet(const SQL: string): Variant;
begin
  try
    HOSxPLIB_DLLHandle := LoadLibrary(HOSxPLIB);
    if checkHosConnection then
    if HOSxPLIB_DLLHandle<>0 then
    begin
       _HOSxP_gwGetDataSet := GetProcAddress(HOSxPLIB_DLLHandle,'HOSxP_gwGetDataSet');
      if Assigned(_HOSxP_gwGetDataSet) then
      begin
           Result := _HOSxP_gwGetDataSet(SQL);
      end;
    end;
  finally
   FreeLibrary(HOSxPLIB_DLLHandle);
  end;
end;

function HOSxP_gwGetDataSetA(Conn:TMyConnection;lQuery: TMyQuery;lDSP: TDataSetProvider;const SQL: string): Variant;stdcall;
begin
  try
    HOSxPLIB_DLLHandle := LoadLibrary(HOSxPLIB);
    if checkHosConnection then
    if HOSxPLIB_DLLHandle<>0 then
    begin
       _HOSxP_gwGetDataSetA := GetProcAddress(HOSxPLIB_DLLHandle,'HOSxP_gwGetDataSetA');
      if Assigned(_HOSxP_gwGetDataSetA) then
      begin
           Result := _HOSxP_gwGetDataSetA(Conn,lQuery,lDSP,SQL);
      end;
    end;
  finally
   FreeLibrary(HOSxPLIB_DLLHandle);
  end;
end;


function HOSxP_gwGetSerialNumber(sn: string): Integer;
begin
  try
    HOSxPLIB_DLLHandle := LoadLibrary(HOSxPLIB);
    if checkHosConnection then
    if HOSxPLIB_DLLHandle<>0 then
    begin
       _HOSxp_gwGetSerialNumber := GetProcAddress(HOSxPLIB_DLLHandle,'HOSxP_gwGetSerialNumber');
      if Assigned(_HOSxp_gwGetSerialNumber) then
      begin
           Result := _HOSxp_gwGetSerialNumber(sn);
      end;
    end;
  finally
   FreeLibrary(HOSxPLIB_DLLHandle);
  end;
end;

//function HOSxP_extUpdateDelta(Delta: OleVariant; SQLText: string): Integer;  external ExtLIB name 'HOSxP_extUpdateDelta';
//function HOSxP_extGetDataSet(const SQL: string): Variant;stdcall;  external ExtLIB name 'HOSxP_extGetDataSet';
//function HOSxP_extVersionInfo():integer; external ExtLIB name 'HOSxP_extVersionInfo';

function HOSxP_extGetDataSet(const SQL: string): Variant;
begin
  try
    ExtLIB_DLLHandle := LoadLibrary(ExtLIB);
    if checkGwConnection then
    if ExtLIB_DLLHandle<>0 then
    begin
       _HOSxP_extGetDataSet := GetProcAddress(ExtLIB_DLLHandle,'HOSxP_extGetDataSet');
      if Assigned(_HOSxP_extGetDataSet) then
      begin
           Result := _HOSxP_extGetDataSet(SQL);
      end;
    end;
  finally
   FreeLibrary(ExtLIB_DLLHandle);
  end;
end;

function HOSxP_extUpdateDelta(Delta: OleVariant; SQLText: string): Integer;
begin
  try
    ExtLIB_DLLHandle := LoadLibrary(ExtLIB);
    if checkGwConnection then
    if ExtLIB_DLLHandle<>0 then
    begin
       _HOSxP_extUpdateDelta := GetProcAddress(ExtLIB_DLLHandle,'HOSxP_extUpdateDelta');
      if Assigned(_HOSxP_extUpdateDelta) then
      begin
           Result := _HOSxP_extUpdateDelta(delta,SQLText);
      end;
    end;
  finally
    FreeLibrary(ExtLIB_DLLHandle);
  end;
end;


function HOSxP_extVersionInfo():integer;
begin
  try
    ExtLIB_DLLHandle := LoadLibrary(ExtLIB);
    if checkGwConnection then
    if ExtLIB_DLLHandle<>0 then
    begin
       _HOSxP_extVersionInfo := GetProcAddress(ExtLIB_DLLHandle,'HOSxP_gwVersionInfo');
      if Assigned(_HOSxP_extVersionInfo) then
      begin
           Result := _HOSxP_extVersionInfo;
      end;
    end;
  finally
    FreeLibrary(ExtLIB_DLLHandle);
  end;
end;


// encryption
function HOSxP_gwGetLabOrderNumber(LaborderEncrytext:String;LISTrackID:integer;hospcode:string):string;
var
 _buffer:string;
begin
  try
    Encryption_DLLHandle := LoadLibrary(LISEncryptionLIB);
    if checkHosConnection then
    if Encryption_DLLHandle<>0 then
    begin
       _HOSxP_gwGetLabOrderNumber := GetProcAddress(Encryption_DLLHandle,'HOSxP_gwGetLabOrderNumber');
      if Assigned(_HOSxP_gwGetLabOrderNumber) then
      begin
           _HOSxP_gwGetLabOrderNumber(LaborderEncrytext,LISTrackID,hospcode,_buffer);
           Result := _buffer;
      end;
    end;
  finally
   FreeLibrary(Encryption_DLLHandle);
  end;
end;

procedure HOSxP_gwGetLabOrderType(LabTypetext:String;LISTrackID:integer;hospcode:string;out _buffer:string);
begin
  try
    Encryption_DLLHandle := LoadLibrary(LISEncryptionLIB);
    if checkHosConnection then
    if Encryption_DLLHandle<>0 then
    begin
       _HOSxP_gwGetLabOrderType := GetProcAddress(Encryption_DLLHandle,'HOSxP_gwGetLabOrderType');
      if Assigned(_HOSxP_gwGetLabOrderType) then
      begin
           _HOSxP_gwGetLabOrderType(LabTypetext,LISTrackID,hospcode,_buffer);
      end;
    end;
  finally
   FreeLibrary(Encryption_DLLHandle);
  end;
end;

function HOSxp_gwCheckLisenceGateway(hospcode:string):boolean;
begin
  try
    Encryption_DLLHandle := LoadLibrary(LISEncryptionLIB);
    if checkHosConnection then
    if Encryption_DLLHandle<>0 then
    begin
       _HOSxp_gwCheckLisenceGateway := GetProcAddress(Encryption_DLLHandle,'HOSxP_gwCheckLisenceGateway');
      if Assigned(_HOSxp_gwCheckLisenceGateway) then
      begin
           Result := _HOSxp_gwCheckLisenceGateway(hospcode);
      end;
    end;
  finally
   FreeLibrary(Encryption_DLLHandle);
  end;
end;




procedure initProc();
begin
  HOSxPLIB_DLLHandle := LoadLibrary(HOSxPLIB);
  ExtLIB_DLLHandle  := LoadLibrary(ExtLIB);

end;


initialization
//initProc;



end.
