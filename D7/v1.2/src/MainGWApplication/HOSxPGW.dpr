program HOSxPGW;

uses
  Forms,
  DBClient,
  Dialogs,
  Windows,
  SysUtils,
  MainApplicationForm in 'MainApplicationForm.pas' {FormMainApplication},
  HOSxP_gwLIB in 'HOSxP_gwLIB.pas',
  MappingTablesForm in 'MappingTablesForm.pas' {formMappingTables},
  MappingFieldsForm in 'MappingFieldsForm.pas' {formMappingFields},
  SettingSyncSQLForm in 'SettingSyncSQLForm.pas' {formSettingSyncSQL},
  ConfigurationForm in 'ConfigurationForm.pas' {formConfiguration},
  uCiaXml in '..\LIB\uCiaXml.pas',
  SQLPopUpForm in 'SQLPopUpForm.pas' {FormSQLPopUp},
  HOSxP_LabTrack in '..\LIB\HOSxP_LabTrack.pas',
  Sha1 in '..\LIB\Sha1.pas',
  HOSxP_Logging in '..\LIB\HOSxP_Logging.pas';

{$R *.res}
const
  versionInfo=5602001;

var AllowExecute:boolean;
  cdsx : TClientDataSet;


begin
  Application.Initialize;

  AllowExecute:=true;

  //check connection
  if (checkHosConnection and checkGwConnection) then
  begin
    // check license

    cdsx :=TClientDataSet.Create(nil);
    cdsx.Data := HOSxP_gwGetDataSet('select hospitalcode from opdconfig');
    if cdsx.Active then
    begin
        if cdsx.RecordCount>0 then
        begin
            AllowExecute := HOSxp_gwCheckLisenceGateway(cdsx.FieldByName('hospitalcode').AsString);
            if not AllowExecute then
              Application.MessageBox(pchar('License Invalid !!!'),pchar('Warning'),MB_OK or MB_ICONWARNING);
        end else AllowExecute:=false;
    end else AllowExecute:=false;


    AllowExecute:=true;
  //

    if AllowExecute then
    begin
    Application.Title := 'BMS HOSxP LIS Gateway';
    Application.CreateForm(TFormMainApplication, FormMainApplication);
  Application.CreateForm(TformConfiguration, formConfiguration);
  Application.CreateForm(TFormSQLPopUp, FormSQLPopUp);
  if ParamCount>0 then
      if (uppercase(ParamStr(1))='AUTOSTART') then
          FormMainApplication.AutoStart := true;
    end;
  end else
     TformConfiguration.Create(Application).ShowModal;

  Application.Run;
end.
