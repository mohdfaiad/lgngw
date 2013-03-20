library LISEncryptionUtilsLIB;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,LISEncryptionUtil,
  Classes;

{$R *.res}

function HOSxP_gwCheckLisenceGateway (hospcode:string):boolean;
begin
  Result := CheckLisenceGateway(hospcode);
end;

function HOSxP_gwGetLabOrderNumber(LaborderEncrytext:String;LISTrackID:integer;hospcode:string):pchar;
var rep : string;
begin
  rep := GetLabOrderNumber(LaborderEncrytext,LISTrackID,hospcode);
  GetMem( Result, length( rep ) +1 );
  StrPCopy( Result, rep )
end;

function HOSxP_gwGetLabOrderType(LabTypetext:String;LISTrackID:integer;hospcode:string):pchar;
var rep : string;
begin
  rep := GetLabOrderType(LabTypetext,LISTrackID,hospcode);
  GetMem( Result, length( rep ) +1 );
  StrPCopy( Result, rep )
end;

function HOSxP_gwGetLabOrderResult(LabOrderNumber,LISItemcode:integer;hospcode:string):pchar;
var rep : string;
begin
  rep := GetLabOrderResult(LabOrderNumber,LISItemcode,hospcode);
  GetMem( Result, length( rep ) +1 );
  StrPCopy( Result, rep )
end;

exports
   HOSxP_gwGetLabOrderNumber,HOSxP_gwGetLabOrderType,HOSxP_gwCheckLisenceGateway,HOSxP_gwGetLabOrderResult;

begin
end.
