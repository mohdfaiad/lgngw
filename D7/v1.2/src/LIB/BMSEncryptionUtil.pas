unit BMSEncryptionUtil;

interface
uses sysUtils,Variants, Classes,

{$IFDEF VER180}
    DCPcrypt, SHA1, IDEA,
{$ENDIF}


{$IFDEF VER220}
    DCPCrypt2,DCPSHa1,DCPIdea,DCPblockciphers,
{$ENDIF}

{$IFDEF VER230}
    DCPCrypt2,DCPSHa1,DCPIdea,DCPblockciphers,
{$ENDIF}

idHash, IdHashMessageDigest,jvstrings;


function DecrypTText(Intext: ansistring): ansistring;
function EncryptText(InText: ansistring): ansistring;
function GetMD5File(const fileName: string): string;
function GetMD5String(const SrcString: string): string;

function DecrypTTextWithKey(Intext,skey: ansistring): ansistring;
function EncryptTextWithKey(InText,skey: ansistring): ansistring;

implementation

const
  HashPhrase: ansistring = 'Manoi is the handsome man';

function Hex2Dec(const S: ansistring): Longint;
var
  HexStr: ansistring;
begin
  if Pos('$', S) = 0 then
    HexStr := '$' + S
  else
    HexStr := S;
  Result := StrToIntDef(HexStr, 0);
 // writeln('hex2dec '+s+' = '+inttostr(result));
end;

{$IFDEF VER220}
function HexStrToStr(const HexStr: string): string;
var
  tmp: AnsiString;
begin
  Assert(not Odd(Length(HexStr)), 'HexToStr input length must be an even number');
  SetLength(tmp, Length(HexStr) div 2);
  HexToBin(PWideChar(HexStr), @tmp[1], Length(tmp));
  result := tmp;
end;
{$ENDIF}

{$IFDEF VER230}
function HexStrToStr(const HexStr: string): string;
var
  tmp: AnsiString;
begin
  Assert(not Odd(Length(HexStr)), 'HexToStr input length must be an even number');
  SetLength(tmp, Length(HexStr) div 2);
  HexToBin(PWideChar(HexStr), @tmp[1], Length(tmp));
  result := tmp;
end;
{$ENDIF}


function UUEncode(Intext: ansistring; encode: boolean): ansistring;
var
  i: integer;
begin
  if encode then
  begin
    result := '';
    for i := 1 to length(intext) do
      result := result + inttohex(byte(intext[i]), 2);
  end
  else
  begin
    result := '';
    repeat
      {$IFDEF VER180}
        result := result + chr(hex2dec(copy(intext, 1, 2)));
      {$ENDIF}

      {$IFDEF VER220}
        result := result + HexStrToStr(copy(intext, 1, 2));
      {$ENDIF}

      {$IFDEF VER230}
        result := result + HexStrToStr(copy(intext, 1, 2));
      {$ENDIF}


      //result := result + chr(hex2dec(copy(intext, 1, 2)));
     // writeln('chr('+
     //  inttostr(hex2dec(copy(intext, 1, 2)))
    //  +') = '+    chr(hex2dec(copy(intext, 1, 2))));
      delete(intext, 1, 2);
    until length(intext) = 0;

  end;
end;

function ConvertByteArrayToString(const Bytes: array of byte): AnsiString;
begin
  SetLength(Result, Length(Bytes));
  Move(Bytes[0], Result[1], Length(Bytes)) ;
  result:=trim(result);
end;

function DecrypTText(Intext: ansistring): ansistring;
var
  Buffer: array[0..8191] of byte;
  Hash: TDCP_sha1;
  HashDigest, HashRead: array[0..31] of byte;
  Decrypt: TDCP_blockcipher;
  // IDEA:TDCP_IDEA;
  Read: integer;
  tm, tx: tStringStream;
  DCP_idea1: TDCP_IDEA;

  s1,s2:string;

begin
  result := '';
  if intext='' then exit;
  FillChar(HashDigest, Sizeof(HashDigest), $FF);
  // fill the digest with $FF as the actual digest may not fill the entire digest
  DCP_idea1 := TDCP_idea.create(nil);
  Hash := TDCP_sha1.Create(nil);
  Hash.Init; // hash the passphrase to get the key
  Hash.UpdateStr(HashPhrase);
  Hash.Final(HashDigest);
  Hash.Free;
  // IDEA:=TDCP_IDEA.create(Application);
  Decrypt := TDCP_blockcipher(dcp_idea1);
  // get the component from the combo box
  if (Sizeof(HashDigest) * 8) > Decrypt.MaxKeySize then
    Decrypt.Init(HashDigest, Decrypt.MaxKeySize, nil)
      // make sure the key isn't too big
  else
    Decrypt.Init(HashDigest, Sizeof(HashDigest) * 8, nil);

  s1:=ConvertByteArrayToString(hashdigest);
//  writeln('Hash digest = '+s1);

  // initialize the cipher with the digest, IV= nil to generate one automatically (note: size in bits ie. sizeof(x)*8)
  Decrypt.EncryptCBC(HashDigest, HashDigest, Sizeof(HashDigest));
  // encrypt the hash to use as confirmation
  Decrypt.Reset;

  s1:=ConvertByteArrayToString(hashdigest);
//  writeln('Hash digest = '+s1);

  intext := uuencode(intext, false);
 // intext := B64Decode(intext);
//  writeln('Intext = '+intext);

  tx := tstringStream.create(intext);
  tm := tstringStream.create('');
  tx.seek(0, soFromBeginning);
  tx.read(HashRead, sizeof(hashread));
  (* if not CompareMem(@HashRead,@HashDigest,Sizeof(HashRead)) then
   begin
     Decrypt.Burn;
     MessageDlg('Incorrect passphrase',mtInformation,[mbOK],0);
     tx.free;
     tm.free;
     Exit;
   end;   *)
  tm.seek(0, soFromBeginning);
  repeat
    read := tx.read(buffer, sizeof(buffer));
    Decrypt.DecryptCBC(Buffer, Buffer, Read);
    // read from the source decrypt and write out the result
    tm.Write(buffer, read);
  until Read <> Sizeof(Buffer);
  Decrypt.Burn;
  // IDEA.free;
  tx.free;
  result := tm.datastring;
  tm.free;
  DCP_idea1.free;

end;

function DecrypTTextWithKey(Intext,skey: ansistring): ansistring;
var
  Buffer: array[0..8191] of byte;
  Hash: TDCP_sha1;
  HashDigest, HashRead: array[0..31] of byte;
  Decrypt: TDCP_blockcipher;
  // IDEA:TDCP_IDEA;
  Read: integer;
  tm, tx: tStringStream;
  DCP_idea1: TDCP_IDEA;

  s1,s2:string;

begin
  result := '';
  if intext='' then exit;
  FillChar(HashDigest, Sizeof(HashDigest), $FF);
  // fill the digest with $FF as the actual digest may not fill the entire digest
  DCP_idea1 := TDCP_idea.create(nil);
  Hash := TDCP_sha1.Create(nil);
  Hash.Init; // hash the passphrase to get the key
  Hash.UpdateStr(skey);
  Hash.Final(HashDigest);
  Hash.Free;
  // IDEA:=TDCP_IDEA.create(Application);
  Decrypt := TDCP_blockcipher(dcp_idea1);
  // get the component from the combo box
  if (Sizeof(HashDigest) * 8) > Decrypt.MaxKeySize then
    Decrypt.Init(HashDigest, Decrypt.MaxKeySize, nil)
      // make sure the key isn't too big
  else
    Decrypt.Init(HashDigest, Sizeof(HashDigest) * 8, nil);

  s1:=ConvertByteArrayToString(hashdigest);
//  writeln('Hash digest = '+s1);

  // initialize the cipher with the digest, IV= nil to generate one automatically (note: size in bits ie. sizeof(x)*8)
  Decrypt.EncryptCBC(HashDigest, HashDigest, Sizeof(HashDigest));
  // encrypt the hash to use as confirmation
  Decrypt.Reset;

  s1:=ConvertByteArrayToString(hashdigest);
//  writeln('Hash digest = '+s1);

  intext := uuencode(intext, false);
 // intext := B64Decode(intext);
//  writeln('Intext = '+intext);

  tx := tstringStream.create(intext);
  tm := tstringStream.create('');
  tx.seek(0, soFromBeginning);
  tx.read(HashRead, sizeof(hashread));
  (* if not CompareMem(@HashRead,@HashDigest,Sizeof(HashRead)) then
   begin
     Decrypt.Burn;
     MessageDlg('Incorrect passphrase',mtInformation,[mbOK],0);
     tx.free;
     tm.free;
     Exit;
   end;   *)
  tm.seek(0, soFromBeginning);
  repeat
    read := tx.read(buffer, sizeof(buffer));
    Decrypt.DecryptCBC(Buffer, Buffer, Read);
    // read from the source decrypt and write out the result
    tm.Write(buffer, read);
  until Read <> Sizeof(Buffer);
  Decrypt.Burn;
  // IDEA.free;
  tx.free;
  result := tm.datastring;
  tm.free;
  DCP_idea1.free;

end;




function EncryptText(InText: ansistring): ansistring;

var
  Buffer: array[0..8191] of byte;
  Hash: TDCP_sha1;
  HashDigest: array[0..31] of byte;
  Encrypt: TDCP_blockcipher;
  //  IDEA:TDCP_IDEA;
  read: integer;
  tm, tx: TStringStream;
  id1:Tdcp_idea;
begin
  result := '';
  FillChar(HashDigest, Sizeof(HashDigest), $FF);
  // fill the digest with $FF as the actual digest may not fill the entire digest
  Hash := TDCP_sha1.Create(nil);
  Hash.Init;
  Hash.UpdateStr(HashPhrase); // hash the passphrase to get the key
  Hash.Final(HashDigest);
  Hash.Free;

 // writeln('Hash phrase = '+HashPhrase);
 // writeln('Hash digest = '+ConvertByteArrayToString(hashdigest));
  // IDEA:=TDCP_IDEA.create(application);
  id1:=Tdcp_idea.create(nil);
  Encrypt := TDCP_blockcipher(id1);
  // get the component from the combo box
  if (Sizeof(HashDigest) * 8) > Encrypt.MaxKeySize then
  begin
 //   Writeln('Init Encrypt.MaxKeySize = '+inttostr(Encrypt.MaxKeySize));
    Encrypt.Init(HashDigest, Encrypt.MaxKeySize, nil);
  end
      // make sure the key isn't too big
  else
  begin
 //   writeln('Init  Sizeof(HashDigest) * 8 = '+inttostr(Sizeof(HashDigest) * 8));
    Encrypt.Init(HashDigest, Sizeof(HashDigest) * 8, nil);
  end;
  // initialize the cipher with the digest, IV= nil to generate one automatically (note: size in bits ie. sizeof(x)*8)

 // writeln('Sizeof(HashDigest) = '+inttostr(Sizeof(HashDigest)));

  Encrypt.EncryptCBC(HashDigest, HashDigest, Sizeof(HashDigest));
 // Encrypt.Encrypt(HashDigest, HashDigest, Sizeof(HashDigest));

 // writeln('Hash digest = '+ConvertByteArrayToString(hashdigest));

  // encrypt the hash and write it to the file to use as passphrase
  Encrypt.Reset;
  tm := tStringstream.create(intext);
  tx := TStringStream.create('');
  tx.seek(0, soFromBeginning);
  tx.write(HashDigest, sizeof(hashdigest));
  tm.seek(0, soFromBeginning);
  repeat
    read := tm.read(buffer, sizeof(buffer));
  //  writeln('Read = '+inttostr(read));
  //  writeln('Buffer = '+  ConvertByteArrayToString(buffer));
    Encrypt.EncryptCBC(Buffer, Buffer, read);
    tx.Write(buffer, read);
  until read <> sizeof(buffer);
  Encrypt.Burn;
  // idea.free;
  tm.free;
  result := uuencode(tx.datastring, true);
  tx.free ;
  id1.free;
end;

function EncryptTextWithKey(InText,skey: ansistring): ansistring;

var
  Buffer: array[0..8191] of byte;
  Hash: TDCP_sha1;
  HashDigest: array[0..31] of byte;
  Encrypt: TDCP_blockcipher;
  //  IDEA:TDCP_IDEA;
  read: integer;
  tm, tx: TStringStream;
  id1:Tdcp_idea;
begin
  result := '';
  FillChar(HashDigest, Sizeof(HashDigest), $FF);
  // fill the digest with $FF as the actual digest may not fill the entire digest
  Hash := TDCP_sha1.Create(nil);
  Hash.Init;
  Hash.UpdateStr(skey); // hash the passphrase to get the key
  Hash.Final(HashDigest);
  Hash.Free;

 // writeln('Hash phrase = '+HashPhrase);
 // writeln('Hash digest = '+ConvertByteArrayToString(hashdigest));
  // IDEA:=TDCP_IDEA.create(application);
  id1:=Tdcp_idea.create(nil);
  Encrypt := TDCP_blockcipher(id1);
  // get the component from the combo box
  if (Sizeof(HashDigest) * 8) > Encrypt.MaxKeySize then
  begin
 //   Writeln('Init Encrypt.MaxKeySize = '+inttostr(Encrypt.MaxKeySize));
    Encrypt.Init(HashDigest, Encrypt.MaxKeySize, nil);
  end
      // make sure the key isn't too big
  else
  begin
 //   writeln('Init  Sizeof(HashDigest) * 8 = '+inttostr(Sizeof(HashDigest) * 8));
    Encrypt.Init(HashDigest, Sizeof(HashDigest) * 8, nil);
  end;
  // initialize the cipher with the digest, IV= nil to generate one automatically (note: size in bits ie. sizeof(x)*8)

 // writeln('Sizeof(HashDigest) = '+inttostr(Sizeof(HashDigest)));

  Encrypt.EncryptCBC(HashDigest, HashDigest, Sizeof(HashDigest));
 // Encrypt.Encrypt(HashDigest, HashDigest, Sizeof(HashDigest));

 // writeln('Hash digest = '+ConvertByteArrayToString(hashdigest));

  // encrypt the hash and write it to the file to use as passphrase
  Encrypt.Reset;
  tm := tStringstream.create(intext);
  tx := TStringStream.create('');
  tx.seek(0, soFromBeginning);
  tx.write(HashDigest, sizeof(hashdigest));
  tm.seek(0, soFromBeginning);
  repeat
    read := tm.read(buffer, sizeof(buffer));
  //  writeln('Read = '+inttostr(read));
  //  writeln('Buffer = '+  ConvertByteArrayToString(buffer));
    Encrypt.EncryptCBC(Buffer, Buffer, read);
    tx.Write(buffer, read);
  until read <> sizeof(buffer);
  Encrypt.Burn;
  // idea.free;
  tm.free;
  result := uuencode(tx.datastring, true);
  tx.free ;
  id1.free;
end;

function GetMD5File(const fileName: string): string;
var
  idmd5: TIdHashMessageDigest5;
  fs: TFileStream;
  hash: T4x4LongWordRecord;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  fs := TFileStream.Create(fileName, fmOpenRead or fmShareDenyWrite);
  try
    result := idmd5.HashStreamAsHex(fs);

    //AsHex(idmd5.HashValue(fs));
  finally
    fs.Free;
    idmd5.Free;
  end;
end;

function GetMD5String(const SrcString: string): string;
var
  idmd5: TIdHashMessageDigest5;
  fs: TFileStream;
  hash: T4x4LongWordRecord;
begin
  idmd5 := TIdHashMessageDigest5.Create;

  try
    result := idmd5.HashStringAsHex(srcstring);

    //AsHex(idmd5.HashValue(fs));
  finally

    idmd5.Free;
  end;
end;


end.
