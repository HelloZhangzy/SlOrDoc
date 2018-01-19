unit Device_MT3;

interface

uses StrUtils,PublicCode;

{$REGION 'MT3 Interface'}
    //Device//
    function HB_Open():longint;stdcall;far;external 'mt_32.dll'name 'HB_Open';
    function HB_Close():smallint;stdcall;far;external 'mt_32.dll'name 'HB_Close';
    function dev_beep(icdev:longint;nMsec,nMsec_end,nTime:Byte):smallint;stdcall;far;external 'mt_32.dll'name ':B_Close';
//    //M1 Card//
    function rf_card(icdev:longint;mode:byte;snr:pAnsiChar):smallint;stdcall;far;external 'mt_32.dll'name 'rf_card';
    function rf_authentication_key(icdev:longint;mode:byte;add:byte;key:pAnsiChar):smallint;stdcall;far;external 'mt_32.dll'name 'rf_authentication_key';
    function rf_read(icdev:longint;add:byte;data:pAnsiChar):smallint;stdcall;far;external 'mt_32.dll'name 'rf_read';
    function rf_write(icdev:longint;add:byte;data:pAnsiChar):smallint;stdcall;far;external 'mt_32.dll'name 'rf_write';
    function rf_initval(icdev:longint;add:byte;val:longint):smallint;stdcall;far;external 'mt_32.dll'name 'rf_initval';
    function rf_decrement(icdev:longint;add:byte;val:longint):smallint;stdcall;far;external 'mt_32.dll'name 'rf_decrement';
    function rf_increment(icdev:longint;add:byte;val:longint):smallint;stdcall;far;external 'mt_32.dll'name 'rf_increment';
    function rf_readval(icdev:longint;add:byte;var val:longint):smallint;stdcall;far;external 'mt_32.dll'name 'rf_readval';
    function rf_reset(icdev:longint):smallint;stdcall;far;external 'mt_32.dll'name 'rf_reset';
    function rf_transfer(icdev:longint;nAdr:byte):smallint;stdcall;far;external 'mt_32.dll'name 'rf_transfer';
    function rf_terminal(icdev:longint):smallint;stdcall;far;external 'mt_32.dll'name 'rf_terminal';
    function rf_restore(icdev:longint;nAdr:byte):smallint;stdcall;far;external 'mt_32.dll'name 'rf_restore';
    //Function
//    function hex_asc(sHex:pAnsiChar;sAsc:pAnsiChar;ulLength:longint):smallint;stdcall;far;external 'mt_32.dll'name 'hex_asc';
//    function asc_hex(sAsc:pAnsiChar;sHex:pAnsiChar;ulLength:longint):smallint;stdcall;far;external 'mt_32.dll'name 'asc_hex';
    function GetErrMsg(ErrCode:integer):string;
 {$ENDREGION}


 type
 TDevice_MT3_S50=class
   private
    icdev_i:LongInt;
    IDCard:string;//��ƬӲ��ID
   public
    function OpenDevice():Boolean;stdcall;//���豸
    function CloseDevice():Boolean;stdcall;//�ر��豸
    function SelectCard():Boolean;stdcall;//Ѱ��
    function VerifyPass(Sector_i:Byte;Mod_i:Byte;PassA,PassB:string):Boolean;stdcall;//У������
    function SetReset():Boolean;stdcall;//��λ��
    function SetHalt():Boolean;stdcall;//��ֹ��
    function ReadCard(Sector_i,Addr_i:Byte;var Data: string):Boolean;stdcall;//��������
    function WriteCard(Sector_i,Addr_i:Byte;Data: string):Boolean;stdcall;//д������
//    constructor Create();
  end;

implementation


function GetErrMsg(ErrCode:integer):string;
begin
  case Abs(ErrCode) of
     $0: begin Result:='����ִ����ȷ��Ӧ';end;
    $11: begin Result:='���ʱ';end;
    $12: begin Result:='��Ч��ͨѶ���';end;
    $13: begin Result:='���ݴ��󣨳�����Χ�����ʹ���ȣ�';end;
    $14: begin Result:='δʶ������';end;
    $15: begin Result:='��ͨѶ�˿ڴ���';end;
//    $16: begin Result:='��ȡͨѶ�˿�״̬����';end;
//    $17: begin Result:='����ͨѶ�˿�״̬����';end;
//    $18: begin Result:='�Ӷ�д����ȡ���ݳ���';end;
//    $19: begin Result:='���д��д�����ݳ���';end;
    $20: begin Result:='������̳�ʱ';end;
    $21: begin Result:='ͨѶ���δ����(δ��������)��������볤�Ȳ���';end;
    $22: begin Result:='STX����';end;
    $23: begin Result:='ETX����';end;
    $24: begin Result:='У��λ����';end;
    $25: begin Result:='��������';end;
    $34: begin Result:='��������ʧ��';end;
    $31: begin Result:='�ǽӴ��洢����ֵ�����';end;
    $32: begin Result:='�ǽӴ��洢��ֵ,��ֵ�����0xFFFFFFFF';end;
    $33: begin Result:='�ǽӴ��洢��ֵ,��ֵ��С��0';end;
    $16: begin Result:='Ѱ��ʧ��';end;
    $08: begin Result:='����ͻʧ��';end;
    $04: begin Result:='��֤ʧ�� ';end;
    $19: begin Result:='������ʧ�� ';end;
    $1a: begin Result:='д����ʧ��(дֵ��ʧ��)';end;
    $1d: begin Result:='�ش�ʧ��';end;
    $1e: begin Result:='��ֵʧ��';end;
  else
    Result:='δ֪����';
  end;
end;

{$REGION 'MT3 Device'}
{ TDevice }

function TDevice_MT3_S50.CloseDevice: Boolean;
begin
  icdev_i:=0;
//  PassA:='';
//  PassB:='';
  SetReset;
  SetHalt;
  if HB_Close()=0 then result:=true else Result:=false;
end;

function TDevice_MT3_S50.OpenDevice: Boolean;
begin
  icdev_i:=HB_Open();
  if icdev_i>0 then
  begin
    Result:=true;
  end
  else Result:=false;
end;

function TDevice_MT3_S50.ReadCard(Sector_i, Addr_i: Byte;var Data: string): Boolean;
var
  result_i:Integer;
  HexData:array[0..15] of AnsiChar;
  AscData:array[0..31] of ansichar;
begin
   Addr_i:=Sector_i*4+Addr_i;
   result_i:=rf_read(icdev_i,Addr_i,HexData);
   if(result_i<>0) then
      Result:=False
   else
   begin
      hex_asc(HexData,AscData,16);
      Data:=AscData;
      result:=true;
   end;
end;

function TDevice_MT3_S50.SetReset: Boolean;
var
 result_i:integer;
begin
  result_i:=rf_reset(icdev_i);
  if(result_i=0) then result:=True else result:=false;
end;

function TDevice_MT3_S50.SetHalt: Boolean;
var
  result_i:Integer;
begin
  result_i:=rf_terminal(icdev_i);
  if result_i=0 then result:=True else result:=false;
end;

function TDevice_MT3_S50.SelectCard: Boolean;
var
  result_i:Integer;
  snr1:array[0..3]of AnsiChar;
  RecData:array[0..20]of AnsiChar;
begin
  //Ѱ��Ѱ���Σ��Է�Ѱ��ʧ�ܡ�
  result_i:=rf_card(icdev_i,0,snr1);
  if(result_i=0) then
  begin
    hex_asc(snr1,RecData,4);
    result:=true;
  end
  else
  begin
    result_i:=rf_card(icdev_i,0,snr1);
    if(result_i=0) then
    begin
     hex_asc(snr1,RecData,4);
     result:=true;
    end
    else Result:=false;
  end
end;

function TDevice_MT3_S50.VerifyPass(Sector_i,Mod_i: Byte;
  PassA,PassB: string): Boolean;
var
  Pass_a:array[0..6]of AnsiChar;
  result_i:Integer;
begin
  result:=false;
  Sector_i:=Sector_i*4;
  case Mod_i of
    0:
    begin
      asc_hex(PAnsiChar(AnsiString(PassA)),Pass_a,6);
      result_i:=rf_authentication_key(icdev_i,0,Sector_i,Pass_a);
      if(result_i=0) then result:=true;
    end;
    1:
    begin
       asc_hex(PAnsiChar(AnsiString(PassB)),Pass_a,6);
       result_i:=rf_authentication_key(icdev_i,1,Sector_i,Pass_a);
       if(result_i=0) then result:=true;
    end;
    2:
    begin
        asc_hex(PAnsiChar(AnsiString(PassA)),Pass_a,6);
        result_i:=rf_authentication_key(icdev_i,0,Sector_i,Pass_a);
        if(result_i=0) then
        begin
          asc_hex(PAnsiChar(AnsiString(PassB)),Pass_a,6);
          result_i:=rf_authentication_key(icdev_i,1,Sector_i,Pass_a);
          if(result_i=0) then result:=true;
        end
    end;
  end;
end;

function TDevice_MT3_S50.WriteCard(Sector_i, Addr_i: Byte; Data: string): Boolean;
var
  result_i,Offset_i:Integer;
  HexData:array[0..15] of AnsiChar;
  AscData:string;
begin
  FillChar(HexData,16,0);
  //���ݲ���32λ������
  AscData:=leftstr(Data+'00000000000000000000000000000000',32);
  Offset_i:=Sector_i*4+Addr_i;
  asc_hex(PAnsiChar(AnsiString(AscData)),HexData,16);
  result_i:=rf_write(icdev_i,Offset_i,HexData);
  if(result_i=0) then result:=true else result:=false;
end;
{$ENDREGION}
end.


