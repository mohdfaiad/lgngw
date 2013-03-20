unit HOSxP_gwLIB;

interface

uses Windows;

type
  TgwGetDataSet = function(const SQL: string): Variant;stdcall;
  TgwUpdateDelta = function (Delta: OleVariant; SQLText: string): Integer;
  TgwVersionInfo = function ():integer;

  TextGetDataSet = function(const SQL: string): Variant;stdcall;
  TextUpdateDelta = function (Delta: OleVariant; SQLText: string): Integer;
  TextVersionInfo = function ():integer;



function HOSxP_gwUpdateDelta(Delta: OleVariant; SQLText: string): Integer;
function HOSxP_gwGetDataSet(const SQL: string): Variant;stdcall;
function HOSxP_gwVersionInfo():integer;

function HOSxP_extUpdateDelta(Delta: OleVariant; SQLText: string): Integer;
function HOSxP_extGetDataSet(const SQL: string): Variant;stdcall;
function HOSxP_extVersionInfo():integer;




implementation

const
  HOSxPLIB = 'hosxpcon.dll';
  ExtLIB = 'extcon.dll';



var

  HOSxPLIB_DLLHandle : THandle;
  ExtLIB_DLLHandle : THandle;

  _HOSxP_gwGetDataSet : TgwGetDataSet;
  _HOSxP_gwUpdateDelta : TgwUpdateDelta;
  _HOSxP_gwVersionInfo : TgwVersionInfo;

  _HOSxP_extGetDataSet : TextGetDataSet;
  _HOSxP_extUpdateDelta  : TextUpdateDelta;
  _HOSxP_extVersionInfo : TextVersionInfo;


//function HOSxP_gwUpdateDelta(Delta: OleVariant; SQLText: string): Integer;  external HOSxPLIB name 'HOSxP_gwUpdateDelta';
//function HOSxP_gwGetDataSet(const SQL: string): Variant;stdcall;  external HOSxPLIB name 'HOSxP_gwGetDataSet';
//function HOSxP_gwVersionInfo():integer;external HOSxPLIB name 'HOSxP_gwVersionInfo';

function HOSxP_gwVersionInfo():integer;
begin
  try
    HOSxPLIB_DLLHandle := LoadLibrary(HOSxPLIB);
    if HOSxPLIB_DLLHandle<>0 then
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

function HOSxP_gwUpdateDelta(Delta: OleVariant; SQLText: string): Integer;
begin
  try
    HOSxPLIB_DLLHandle := LoadLibrary(HOSxPLIB);
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


function HOSxP_gwGetDataSet(const SQL: string): Variant;
begin
  try
    HOSxPLIB_DLLHandle := LoadLibrary(HOSxPLIB);
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

//function HOSxP_extUpdateDelta(Delta: OleVariant; SQLText: string): Integer;  external ExtLIB name 'HOSxP_extUpdateDelta';
//function HOSxP_extGetDataSet(const SQL: string): Variant;stdcall;  external ExtLIB name 'HOSxP_extGetDataSet';
//function HOSxP_extVersionInfo():integer; external ExtLIB name 'HOSxP_extVersionInfo';

function HOSxP_extGetDataSet(const SQL: string): Variant;
begin
  try
    ExtLIB_DLLHandle := LoadLibrary(ExtLIB);
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


procedure initProc();
begin
  HOSxPLIB_DLLHandle := LoadLibrary(HOSxPLIB);
  ExtLIB_DLLHandle  := LoadLibrary(ExtLIB);

end;


initialization
//initProc;



end.
