unit HOSxP_Logging;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, MyAccess, DBClient;

const
  lab_entry_log='lab_entry_log';
  replicate_log='replicate_log';


procedure writelog_labEntryLog(lab_order_number:integer);


implementation

uses HOSxP_gwLIB;

procedure writelog_labEntryLog(lab_order_number:integer);
var  cdsLogging,cdsGw,cdsExt : Tclientdataset;
     labLogNumber : integer;
     strSQL : string;


begin
    cdsGw := TClientDataSet.Create(Application);
    cdsExt := TClientDataSet.Create(Application);

    strSQL := 'select * from lab_order where lab_order_number='+IntToStr(lab_order_number);
    cdsGw.Data := HOSxP_gwGetDataSet(strSQL);  // hos
    cdsExt.Data := HOSxP_extGetDataSet(strSQL); // gateway

    labLogNumber := HOSxP_gwGetSerialNumber('lab_log_number');
    strSQL:= 'select * from '+lab_entry_log+' where log_number='+IntToStr(labLogNumber);

    cdsLogging:=TClientDataSet.Create(Application);
    cdsLogging.Data:=HOSxP_gwGetDataSet(strSQL);  // hos

    if cdsLogging.IsEmpty then
      cdsLogging.Append;


    if cdsGw.RecordCount>0 then
      cdsLogging.FieldByName('old_delta').AsVariant := cdsGw.XMLData;
    cdsLogging.FieldByName('new_delta').AsVariant := cdsExt.XMLData;
    cdsLogging.FieldByName('lab_order_number').AsInteger := lab_order_number;
    cdsLogging.FieldByName('log_date_time').AsVariant := now;
    cdsLogging.FieldByName('log_number').AsInteger := labLogNumber;
    cdsLogging.Post;

    if cdsLogging.ChangeCount>0 then
      HOSxP_gwUpdateDelta(cdsLogging.Delta,strSQL);   // hos

end;

end.
