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
    IDCard:string;//卡片硬件ID
   public
    function OpenDevice():Boolean;stdcall;//打开设备
    function CloseDevice():Boolean;stdcall;//关闭设备
    function SelectCard():Boolean;stdcall;//寻卡
    function VerifyPass(Sector_i:Byte;Mod_i:Byte;PassA,PassB:string):Boolean;stdcall;//校验密码
    function SetReset():Boolean;stdcall;//复位卡
    function SetHalt():Boolean;stdcall;//中止卡
    function ReadCard(Sector_i,Addr_i:Byte;var Data: string):Boolean;stdcall;//读卡数据
    function WriteCard(Sector_i,Addr_i:Byte;Data: string):Boolean;stdcall;//写卡数据
//    constructor Create();
  end;

implementation


function GetErrMsg(ErrCode:integer):string;
begin
  case Abs(ErrCode) of
     $0: begin Result:='命令执行正确回应';end;
    $11: begin Result:='命令超时';end;
    $12: begin Result:='无效的通讯句柄';end;
    $13: begin Result:='数据错误（超出范围、类型错误等）';end;
    $14: begin Result:='未识别卡类型';end;
    $15: begin Result:='打开通讯端口错误';end;
//    $16: begin Result:='获取通讯端口状态错误';end;
//    $17: begin Result:='设置通讯端口状态错误';end;
//    $18: begin Result:='从读写器读取数据出错';end;
//    $19: begin Result:='向读写器写入数据出错';end;
    $20: begin Result:='密码键盘超时';end;
    $21: begin Result:='通讯句柄未定义(未建立连接)或键盘密码长度不对';end;
    $22: begin Result:='STX错误';end;
    $23: begin Result:='ETX错误';end;
    $24: begin Result:='校验位错误';end;
    $25: begin Result:='其他错误';end;
    $34: begin Result:='擦除数据失败';end;
    $31: begin Result:='非接触存储卡读值块错误';end;
    $32: begin Result:='非接触存储卡值,加值后大于0xFFFFFFFF';end;
    $33: begin Result:='非接触存储卡值,减值后小于0';end;
    $16: begin Result:='寻卡失败';end;
    $08: begin Result:='防冲突失败';end;
    $04: begin Result:='认证失败 ';end;
    $19: begin Result:='读数据失败 ';end;
    $1a: begin Result:='写数据失败(写值块失败)';end;
    $1d: begin Result:='回传失败';end;
    $1e: begin Result:='传值失败';end;
  else
    Result:='未知错误';
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
  //寻卡寻两次，以防寻卡失败。
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
  //数据不足32位，后补零
  AscData:=leftstr(Data+'00000000000000000000000000000000',32);
  Offset_i:=Sector_i*4+Addr_i;
  asc_hex(PAnsiChar(AnsiString(AscData)),HexData,16);
  result_i:=rf_write(icdev_i,Offset_i,HexData);
  if(result_i=0) then result:=true else result:=false;
end;
{$ENDREGION}
end.


