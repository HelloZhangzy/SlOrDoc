unit Protocol_Meter;

interface

uses StrUtils,Device_MT3,superobject,superxmlparser,SysUtils, Variants, Classes, Graphics,PublicCode
      ,Math,TypInfo,DBXJSON, DBXJSONReflect,system.JSON,system.JSONConsts;

type

 TProtocol_Meter=class
    private
      function CheckCrc(Data:string):Boolean;
      function DecryptData(key,Data:string):string;
      function ParsingData(Mod_i:byte;Data:string):string;
    public
      //解析协议
      procedure ProtocolParsing(Key_s,CmdData,AnswerData,MeterStateData:string;var ReturnData:string);
      //组织协议
      function ProtocolPackage(CommandData:string;var ReturnData:string):SmallInt;
      //获取错误信息
      function GetError(ErrCode:Integer):String;
  end;

 IProtocol = interface(IInterface)
    //解析协议
    function ProtocolParsing(Data:string;var CmdData:string):SmallInt;
    //组织协议
    function ProtocolPackage(CommandData:string;var ReturnData:string):SmallInt;
 end;

 TProtocolFactory = class(TObject)
 public
   class function ProtocolParsing(mod_i:byte;Cmd:string): IProtocol;
   class function ProtocolPackage(cmd:integer):IProtocol;
 end;
 //协议头
 TProtocolHead=class(TInterfacedObject,IProtocol)
    //解析协议
    function ProtocolParsing(Data:string;var HeadData:string):SmallInt;
    //组织协议
    function ProtocolPackage(CommandData:string;var ReturnData:string):SmallInt;
 end;

 //开户
 TProtocolassociativeUser=class(TInterfacedObject,IProtocol)
    //解析协议
    function ProtocolParsing(Data:string;var CmdData:string):SmallInt;
    //组织协议
    function ProtocolPackage(CommandData:string;var ReturnData:string):SmallInt;
 end;

 //充值
 TProtocolRecharge=class(TInterfacedObject,IProtocol)
    //解析协议
    function ProtocolParsing(Data:string;var CmdData:string):SmallInt;
    //组织协议
    function ProtocolPackage(CommandData:string;var ReturnData:string):SmallInt;
  end;

  //密钥升级
 TProtocolUpdateKey=class(TInterfacedObject,iprotocol)
     //解析协议
    function ProtocolParsing(Data:string;var CmdData:string):SmallInt;
    //组织协议
    function ProtocolPackage(CommandData:string;var ReturnData:string):SmallInt;
  end;

  //超级充值
 TProtocolSupeRecharge=class(TInterfacedObject,iprotocol)
     //解析协议
    function ProtocolParsing(Data:string;var CmdData:string):SmallInt;
    //组织协议
    function ProtocolPackage(CommandData:string;var ReturnData:string):SmallInt;
  end;

  //简单协议
 TProtocolSimple=class(TInterfacedObject,IProtocol)
    //解析协议
    function ProtocolParsing(Data:string;var CmdData:string):SmallInt;
    //组织协议
    function ProtocolPackage(CommandData:string;var ReturnData:string):SmallInt;
  end;

  TProtocolAnswer=class(TInterfacedObject,IProtocol)
    //解析协议
    function ProtocolParsing(Data:string;var CmdData:string):SmallInt;
    //组织协议
    function ProtocolPackage(CommandData:string;var ReturnData:string):SmallInt;
  end;

  TProtocolMeterState=class(TInterfacedObject,IProtocol)
    //解析协议
    function ProtocolParsing(Data:string;var CmdData:string):SmallInt;
    //组织协议
    function ProtocolPackage(CommandData:string;var ReturnData:string):SmallInt;
  end;

  TProtocolSetDate=class(TInterfacedObject,IProtocol)
    //解析协议
    function ProtocolParsing(Data:string;var CmdData:string):SmallInt;
    //组织协议
    function ProtocolPackage(CommandData:string;var ReturnData:string):SmallInt;
  end;

  TprotocolSetHolidays=class(TInterfacedObject,IProtocol)
    //解析协议
    function ProtocolParsing(Data:string;var CmdData:string):SmallInt;
    //组织协议
    function ProtocolPackage(CommandData:string;var ReturnData:string):SmallInt;
  end;

  TProtocolSetID=class(TInterfacedObject,IProtocol)
    //解析协议
    function ProtocolParsing(Data:string;var CmdData:string):SmallInt;
    //组织协议
    function ProtocolPackage(CommandData:string;var ReturnData:string):SmallInt;
  end;

  TprotocolSetStage=class(TInterfacedObject,IProtocol)
    //解析协议
    function ProtocolParsing(Data:string;var CmdData:string):SmallInt;
    //组织协议
    function ProtocolPackage(CommandData:string;var ReturnData:string):SmallInt;
  end;

  TProtocolProduceSet=class(TInterfacedObject,IProtocol)
    //解析协议
    function ProtocolParsing(Data:string;var CmdData:string):SmallInt;
    //组织协议
    function ProtocolPackage(CommandData:string;var ReturnData:string):SmallInt;
  end;

  TprotocolSetParameters  =class(TInterfacedObject,IProtocol)
    //解析协议
    function ProtocolParsing(Data:string;var CmdData:string):SmallInt;
    //组织协议
    function ProtocolPackage(CommandData:string;var ReturnData:string):SmallInt;
  end;

  TprotocolSelect =class(TInterfacedObject,IProtocol)
    //解析协议
    function ProtocolParsing(Data:string;var CmdData:string):SmallInt;
    //组织协议
    function ProtocolPackage(CommandData:string;var ReturnData:string):SmallInt;
  end;



 implementation

{ TProtocolFactory }

class function TProtocolFactory.ProtocolPackage(cmd: Integer): IProtocol;
begin
  case cmd of
    //   AssociativeUse='A1';   //开户	1
    //   Recharge='A2';//充值	2
    //   UpdateKey='B1';//升级密解	3
    //   SupeRecharge='B2';//超级充值	4
    //   SetDateTime='B0';//设置时间	5
    //   SetHolidays='B3';//设置假期	6
    //   SetvalveState='B4';//设置阀状态	7
    //   SetPrices='B5';//设置价格	8
    //   OutInit='B6';//出厂初始化	9
    //   SetID='B7';//设置ID	10
    //   Test='B8';//测试	11
    //   Select='B9';//查询	12
    //   Clear='BA';//清零	13
    //   Unlock='BB';//解锁	14
    //   Transfer='BC';//转移	15
    //   InitKey='BD';//密钥初始化	16
    0:result:=tprotocolHead.Create;
    1: result:=TProtocolassociativeUser.Create;
    2: result:=TProtocolRecharge.Create;
    3: result:=TProtocolUpdateKey.Create;
    4: result:=TProtocolSupeRecharge.Create;
    5: result:=tProtocolSetDate.Create;
    6: result:=TprotocolSetHolidays.Create;
    9: result:=tprotocolsetStage.Create;
    10: result:=TprotocolsetID.Create;
    7,11,12,13,14,15:result:=TProtocolSimple.Create;
    16: result:=TprotocolsetParameters.Create;
    17: result:=TProtocolProduceSet.create;
  else
      Result:=nil;
  end;
end;

class function TProtocolFactory.ProtocolParsing(mod_i:byte;Cmd: string): IProtocol;
var
  CmdEnum:TCmdEnum;
begin
  CmdEnum := TCmdEnum(GetEnumValue(TypeInfo(TCmdEnum), UpperCase(Cmd)));
  if mod_i=0 then
  begin
    //   AssociativeUse='A1';   //开户	1
    //   Recharge='A2';//充值	2
    //   UpdateKey='B1';//升级密解	3
    //   SupeRecharge='B2';//超级充值	4
    //   SetDateTime='B0';//设置时间	5
    //   SetHolidays='B3';//设置假期	6
    //   SetvalveState='B4';//设置阀状态	7
    //   SetPrices='B5';//设置价格	8
    //   OutInit='B6';//出厂初始化	9
    //   SetID='B7';//设置ID	10
    //   Test='B8';//测试	11
    //   Select='B9';//查询	12
    //   Clear='BA';//清零	13
    //   Unlock='BB';//解锁	14
    //   Transfer='BC';//转移	15
    //   InitKey='BD';//参数设置	16

   case CmdEnum of
    FF:result:=tprotocolHead.Create;
    A1: result:=TProtocolassociativeUser.Create;
    A2: result:=TProtocolRecharge.Create;
    B1: result:=TProtocolUpdateKey.Create;
    B2: result:=TProtocolSupeRecharge.Create;
    B0: result:=TProtocolSetDate.Create;
    B3: result:=TprotocolSetHolidays.Create;
    B7: result:=tprotocolsetid.Create;
    B6:Result:=tprotocolsetStage.Create;
    B4,B8,BA,BB,B9:result:=TProtocolSimple.Create;
    BD:result:=TprotocolSetParameters.create;
    BE:result:=TProtocolProduceSet.Create;
    FE:result:=TProtocolMeterState.Create;
//    BC,B7   不解析
   else
    result:=nil
   end;
  end
  else
  begin
   case CmdEnum of
    A1,A2,B1,B2,BA,B3,B4: result:=TProtocolAnswer.Create;
    B9:result:=TprotocolSelect.Create;
   else
    result:=nil
   end;
  end;

end;

function TProtocolHead.ProtocolPackage(CommandData: string;
  var ReturnData: string): SmallInt;
var
  jo:ISuperObject;
  Ver:Integer;
  ID:Int64;
  Commpany:integer;
  PrType:Integer;
  KeyNo:integer;
  KeyValue:string;
begin
  try
    if (Pos(JSVer,CommandData)<=0)
        or (Pos(JSID,CommandData)<=0)
        or (Pos(JSCommpany,CommandData)<=0)
        or (Pos(JSPrType,CommandData)<=0)
        or (Pos(JSKeyNo,CommandData)<=0)
        or (Pos(JSKeyValue,CommandData)<=0)
        or (Pos(JsMeterVer,CommandData)<=0)
    then
    begin
      Result:=-2; //协议项不完整
      exit;
    end;
    jo:=so(CommandData);
    Ver:=jo[JSVer].AsInteger;
    ID:=jo[JSID].AsInteger;
    Commpany:=jo[JSCommpany].AsInteger;
    PrType:=jo[JSPrType].AsInteger;
    KeyNo:=jo[JSKeyNo].AsInteger;
    KeyValue:=jo[JSKeyValue].AsString;
    //  版本 卡类型	 身份ID 公司编号 密钥号	保留
    ReturnData:='';
    ReturnData:=inttohex(ver,2);

    if PrType=0 then
      ReturnData:=ReturnData+'AA'
    else ReturnData:=ReturnData+'EE';
    ReturnData:=ReturnData+MaxToMin(inttohex(ID,8));
    ReturnData:=ReturnData+MaxToMin(inttohex(commpany,4));
    ReturnData:=ReturnData+ inttohex(KeyNo,2);
    ReturnData:=ReturnData+leftstr(RandomVoerride,10);
//    +'FFFFFFFFFF';
    result:=0;
  except
    on e:Exception do
    begin
      AppendTxt('指令：'+CommandData+'组织失败，原因：'+e.Message,'');
      result:=-1;  //协议解析失败
    end
  end;
end;

function TProtocolHead.ProtocolParsing(Data: string;var HeadData:string): SmallInt;
var
 json:ISuperObject;
begin
  try
    json:=SO();
    json.i[JSVer]:=strtoint('$'+leftstr(Data,2));
    Data:=RightStr(data,Length(data)-2);
    json.S[JSPrType]:=LeftStr(data,2);
    Data:=RightStr(data,Length(data)-2);
    json.i[JSID]:=strtoint('$'+mintomax(leftstr(Data,8)));
    Data:=RightStr(data,Length(data)-8);
    json.i[JSCommpany]:=strtoint('$'+mintomax(LeftStr(data,4)));
    Data:=RightStr(data,Length(data)-4);
    json.i[JSKeyNo]:=StrToInt('$'+leftstr(Data,2));
    HeadData:=json.AsString;
    result:=0;
  except
    result:=-4;
  end;
end;

{ TProtocolassociativeUser }
function TProtocolassociativeUser.ProtocolPackage(CommandData: string;
var ReturnData: string): SmallInt;
var
  newCommand:integer;
  CardNo:Int64;
  Times:Integer;
  json:ISuperObject;
begin
  try
    if (Pos(JSNewCommpany,CommandData)<=0)
      or (Pos(JSCardNo,CommandData)<=0)
      or (Pos(JsInitTimes,CommandData)<=0)
    then
    begin
      Result:=-2; //协议项不完整
      exit;
    end;

    json:=so(CommandData);
    newCommand:=json[JSNewCommpany].AsInteger;
    CardNo:= json[JSCardNo].AsInteger;
    times:=json[JsInitTimes].AsInteger;
    ReturnData:=_AssociativeUse;
    ReturnData:=ReturnData+MaxtoMin(inttohex(newCommand,4));
    ReturnData:=ReturnData+MaxtoMin(inttohex(CardNo,8));
    ReturnData:=ReturnData+MaxtoMin(inttohex(times,4));
    result:=0;
  except
    on e:Exception do
    begin
      AppendTxt('指令：'+CommandData+'组织失败，原因：'+e.Message,'');
      result:=-1;  //协议解析失败
    end;
  end;
end;

function TProtocolassociativeUser.ProtocolParsing(Data: string;var CmdData:string): SmallInt;
var
  json:ISuperObject;
begin
  try
    json:=SO();
    json.S[JSCmd]:=LeftStr(data,2);
    Data:=RightStr(data,Length(data)-2);
    json.i[JSNewCommpany]:=StrToInt('$'+mintomax(leftstr(Data,4)));
    Data:=RightStr(data,Length(data)-4);
    json.I[JSCardNo]:=StrToInt('$'+mintomax(leftstr(data,8)));
    Data:=RightStr(data,Length(data)-8);
    json.I[JsInitTimes]:=StrToInt('$'+mintomax(leftstr(data,4)));
    CmdData:=json.AsString;
    result:=0;
  except
     result:=-4;
  end;
end;

{ TProtocolRecharge }
function TProtocolRecharge.ProtocolPackage(CommandData: string;
  var ReturnData: string): SmallInt;
var
   json:ISuperObject;
   MeterID:Int64;
   OneGas,TwoGas,ThreeGas:Double;
   OneGas_i,TwoGas_i,ThreeGas_i:Int32;
   Times:Integer;
begin
  try
    if (Pos(JSMeterID,CommandData)<=0)
      or (Pos(JSOneValue,CommandData)<=0)
      or (Pos(JSTwoValue,CommandData)<=0)
      or (Pos(JSThreeValue,CommandData)<=0)
      or (Pos(JSTimes,CommandData)<=0)
    then
    begin
      Result:=-2; //协议项不完整
      exit;
    end;
    json:=SO(CommandData);
    MeterID:=json[JSMeterID].AsInteger;
    OneGas:=json[JSOneValue].AsDouble;
    TwoGas:=json[JSTwoValue].asdouble;
    ThreeGas:=json[JSThreeValue].AsDouble;
    Times:=json[JSTimes].AsInteger;
    OneGas_i:=Trunc(strtofloat(FormatFloat('0.00',OneGas))*100);
    TwoGas_i:=Trunc(strtofloat(FormatFloat('0.00',TwoGas))*100);
    ThreeGas_i:=Trunc(strtofloat(FormatFloat('0.00',ThreeGas))*100);
    ReturnData:=_Recharge;
    ReturnData:=ReturnData+maxtomin(inttohex(MeterID,8));
    ReturnData:=ReturnData+maxtomin(rightstr(inttohex(OneGas_i,8),8));
    ReturnData:=ReturnData+maxtomin(rightstr(inttohex(TwoGas_i,8),8));
    ReturnData:=ReturnData+maxtomin(rightstr(inttohex(ThreeGas_i,8),8));
    ReturnData:=ReturnData+maxtomin(inttohex(times,4));
    result:=0;
  except
    on e:Exception do
    begin
      AppendTxt('指令：'+CommandData+'组织失败，原因：'+e.Message,'');
      result:=-1;  //协议解析失败
    end;
  end;
end;

function TProtocolRecharge.ProtocolParsing(Data: string;var CmdData:string): SmallInt;
var
   json:ISuperObject;
begin
  try
    json:=SO();
    json.S[JSCmd]:=LeftStr(data,2);
    Data:=RightStr(data,Length(data)-2);
    json.i[JSMeterID]:=StrToInt64('$'+mintomax(LeftStr(data,8)));
    Data:=RightStr(data,Length(data)-8);
    json.D[JSOneValue]:=StrToInt('$'+mintomax(LeftStr(Data,8)))/100;
    Data:=RightStr(data,Length(data)-8);
    json.D[JSTwoValue]:=StrToInt('$'+mintomax(LeftStr(Data,8)))/100;
    Data:=RightStr(data,Length(data)-8);
    json.D[JSThreeValue]:=StrToInt('$'+mintomax(LeftStr(Data,8)))/100;
    Data:=RightStr(data,Length(data)-8);
    json.I[JSTimes]:=StrToInt('$'+mintomax(leftstr(data,4)));
    CmdData:=json.AsString;
    result:=0;
  except
     result:=-4
  end;
end;

{ TProtocolSupeRecharge }

function TProtocolSupeRecharge.ProtocolPackage(CommandData: string;
  var ReturnData: string): SmallInt;
var
   json:ISuperObject;
   price,SupeValue:double;
   price_i,SupeValue_i:Int32;
begin
  try
    if (Pos(JSSupeValue,CommandData)<=0)
      or (Pos(JSPrice,CommandData)<=0)
    then
    begin
      Result:=-2; //协议项不完整
      exit;
    end;
    json:=SO(CommandData);
    SupeValue:=json[JSSupeValue].AsDouble;
    price:=json[JSPrice].AsDouble;
    SupeValue_i:=Trunc(strtofloat(FormatFloat('0.00',SupeValue))*100);
    price_i:=Trunc(strtofloat(FormatFloat('0.00',price))*100);
    ReturnData:=_SupeRecharge;
    ReturnData:=ReturnData+maxtomin(RightStr(inttohex(SupeValue_i,8),8));
    ReturnData:=ReturnData+maxtomin(inttohex(price_i,8));
    result:=0;
  except
    on e:Exception do
    begin
      AppendTxt('指令：'+CommandData+'组织失败，原因：'+e.Message,'');
      result:=-1;  //协议解析失败
    end;
  end;
end;

function TProtocolSupeRecharge.ProtocolParsing(Data: string;var CmdData:string): SmallInt;
var
   json:ISuperObject;
begin
  try
    json:=SO();
    json.S[JSCmd]:=LeftStr(data,2);
    Data:=RightStr(data,Length(data)-2);
    json.D[JSSupeValue]:=StrToInt('$'+mintomax(LeftStr(data,8)))/100;
    Data:=RightStr(data,Length(data)-8);
    json.D[JSPrice]:=StrToInt('$'+mintomax(LeftStr(data,8)))/100;
    cmddata:=json.AsString;
    result:=0;
  except
    result:=-4;
  end;

end;

{ TProtocolUpdateKey }

function TProtocolUpdateKey.ProtocolPackage(CommandData: string;
  var ReturnData: string): SmallInt;
var
   json:ISuperObject;
   keyNo:integer;
   KeyValue:string;
begin
  try
    if (Pos(JSUpKeyNo,CommandData)<=0)
      or (Pos(JsUpKeyValue,CommandData)<=0)
    then
    begin
      Result:=-2; //协议项不完整
      exit;
    end;
    json:=SO(CommandData);
    keyNo:=json[JSUpKeyNo].AsInteger;
    KeyValue:=json[JsUpKeyValue].AsString;
    KeyValue:=RightStr('0000000000000000000000000000000'+keyvalue,32);
    ReturnData:=_UpdateKey;
    ReturnData:=ReturnData+inttohex(keyNo,2);
    ReturnData:=ReturnData+ KeyValue;
    result:=0;
  except
    on e:Exception do
    begin
      AppendTxt('指令：'+CommandData+'组织失败，原因：'+e.Message,'');
      result:=-1;  //协议解析失败
    end;
  end;
end;

function TProtocolUpdateKey.ProtocolParsing(Data: string;var CmdData:string): SmallInt;
var
   json:ISuperObject;
begin
  try
    json:=SO();
    json.S[JSCmd]:=LeftStr(data,2);
    Data:=RightStr(data,Length(data)-2);
    json.I[JSUpKeyNo]:=StrToInt('$'+LeftStr(data,2));
    Data:=RightStr(data,Length(data)-2);
    json.S[JsUpKeyValue]:=LeftStr(data,32);
    cmddata:=json.AsString;
    result:=0;
  except
    result:=-4;
  end;
end;

{ TProtocolSimple }

function TProtocolSimple.ProtocolPackage(CommandData: string;
  var ReturnData: string): SmallInt;
var
   json:ISuperObject;
   Cmd_s:string;
begin
  try
    json:=SO(CommandData);
    case json[JSCmd].AsInteger of
      1:Cmd_s:=_AssociativeUse;
      2:Cmd_s:=_Recharge;
      3:Cmd_s:=_UpdateKey;
      4:Cmd_s:=_SupeRecharge;
      5:Cmd_s:=_SetDateTime;
      6:Cmd_s:=_SetHolidays;
      7:Cmd_s:=_SetvalveState;
      8:Cmd_s:=_SetPrices;
      9:Cmd_s:=_OutInit;
      10:Cmd_s:=_SetID;
      11:Cmd_s:=_Test;
      12:Cmd_s:=_Select;
      13:Cmd_s:=_Clear;
      14:Cmd_s:=_Unlock;
      15:Cmd_s:=_Transfer;
      16:Cmd_s:=_SetParameters;
    else
      Result:=-3;
      Exit;
    end;
    ReturnData:=cmd_s+'FF';
    result:=0;
  except
    on e:Exception do
    begin
      AppendTxt('指令：'+CommandData+'组织失败，原因：'+e.Message,'');
      result:=-1;  //协议解析失败
    end;
  end;
end;

function TProtocolSimple.ProtocolParsing(Data: string;var CmdData:string): SmallInt;
var
   json:ISuperObject;
begin
  try
    json:=SO();
    json.S[JSCmd]:=LeftStr(data,2);
    CmdData:=json.AsString;
    result:=0;
  except
    result:=-4;
  end;
end;

{ TProtocol }

function TProtocol_Meter.GetError(ErrCode: Integer): String;
begin
  case ErrCode of
    0:result:='成功';
    -1:result:='协议解析/组织失败';
    -2:result:='协议项不完整';
    -3:result:='指令编码无效';
    -4:result:='解析失败';
    -5:result:='数据错误';
  else
      result:='未知错误';
  end;
end;

function TProtocol_Meter.ProtocolPackage(CommandData: string;  var ReturnData: string): SmallInt;
var
  Json:ISuperObject;
  JsonItem:TSuperArray;
  Data_s:string;
  Func:IProtocol;
  key_s,HeadData_s,CmdData_s,Temp_s,ProtocolData_s,CmdLen_s:string;
  rt,KeyNo_i,cmd_i,i,len_i,DataLen_i:integer;
  AscData_c:array[0..2047] of Ansichar;
  HexData_c:array[0..1023] of Ansichar;
  AscKey_c:array[0..31] of Ansichar;
  HexKey_c:array[0..15] of AnsiChar;
  Crc_i:word;
begin
  try
   AppendTxt('处理数据：'+CommandData,'');

   {$REGION '验证协议正确性'}
   if (Pos(JSHead,CommandData)<=0) or (Pos(JsInfo,CommandData)<=0) then
   begin
     Result:=-2;
     exit;
   end;
   Json:=SO(CommandData);
   Data_s:=trim(Json[JsInfo].AsString);
   if (Data_s='')  then
   begin
     Result:=-2;
     exit;
   end;
   Data_s:=trim(Json[JSHead].AsString);
   if Data_s='' then
   begin
     Result:=-2;
     exit;
   end;
   if Pos(jsKeyValue,Data_s)<=0 then
   begin
     Result:=-2;
     exit;
   end;
   key_s:=trim(Json.O[JSHead].S[jsKeyValue]);
   KeyNo_i:=(Json.O[JSHead].i[JSKeyNo]);
   if (key_s='') and (KeyNo_i<>255) then
   begin
    result:=-2;
    exit;
   end;
  {$ENDREGION}

   {$REGION '封装协议主体'}
     Func:=TProtocolFactory.ProtocolPackage(0);
     rt:=Func.ProtocolPackage(Data_s,HeadData_s);
     if rt<>0 then Exit;
     JsonItem:=Json[JsInfo].AsArray;
     CmdLen_s:=IntToHex(JsonItem.Length,2);
     for I := 0 to JsonItem.Length - 1 do
     begin
      data_s:=JsonItem[i].AsString;
      if Pos(JSCmd,Data_s)<=0 then
      begin
        result:=-2;
        exit;
      end;
      cmd_i:=JsonItem[i][JSCmd].AsInteger;
      Func:=TProtocolFactory.ProtocolPackage(cmd_i);
      if Func=nil then
      begin
        result:=-3;
        Exit;
      end;
      rt:=Func.ProtocolPackage(data_s,Temp_s);
      if rt<>0 then
      begin
        result:=-1;
        exit;
      end;
      CmdLen_s:=CmdLen_s+maxtomin(inttohex(Length(Temp_s) div 2,4));
      CmdData_s:=CmdData_s+Temp_s;
     end;
     if trim(CmdData_s)='' then
     begin
       result:=-1;
       Exit;
     end;
     {$REGION '加密'}
       CmdData_s:=CmdLen_s+cmddata_s;
       DataLen_i:=ceil(Length(CmdData_s)/2/4);
       if DataLen_i*8>1024 then
       begin
         result:=-5;
         Exit;
       end;
       if DataLen_i=1 then DataLen_i:=2;//加密最少必须8字节
       CmdData_s:=leftstr(CmdData_s+RandomVoerride,dataLen_i*8);
       AppendTxt('明文：'+CmdData_s,'');
       if KeyNo_i<>255 then
       begin
         asc_hex(PAnsiChar(AnsiString(Key_s)),HexKey_c,16);
         len_i:=Trunc(dataLen_i*8/2);
         asc_hex(PAnsiChar(AnsiString(CmdData_s)),HexData_c,len_i);
         btea(0,HexData_c,DataLen_i,HexKey_c);
         hex_asc(HexData_c,AscData_c,len_i);
         CmdData_s:=LeftStr(AscData_c,len_i*2);
       end;
     {$ENDREGION}
        ProtocolData_s:=HeadData_s+CmdData_s;
        ProtocolData_s:=MaxToMin(IntToHex(((Length(ProtocolData_s)+8) div 2),4))+ProtocolData_s;
     {$region 'CRC'}
        len_i:=Trunc(Length(ProtocolData_s)/2);
        asc_hex(PAnsiChar(AnsiString(ProtocolData_s)),HexData_c,len_i);
        Crc_i:=crc_sum(HexData_c,len_i);
        ProtocolData_s:=ProtocolData_s+maxtomin(inttohex(Crc_i,4));
        AppendTxt('成型：'+ProtocolData_s,'');
     {$ENDREGION}

    {$ENDREGION}

   ReturnData:=ProtocolData_s;
   result:=0;
  except
    on e:Exception do
    begin
      AppendTxt('指令：'+CommandData+'组织失败，原因：'+e.Message,'');
      result:=-1;  //协议解析失败
    end;
  end;
end;

function TProtocol_Meter.CheckCrc(Data:string): Boolean;
var
  Crc_s,checkCrc_s:string;
  len_i:Integer;
  AscData_c:array[0..2047] of Ansichar;
  HexData_c:array[0..1023] of Ansichar;
begin
  AppendTxt('------开始验证CRC','');
  len_i:=strtoint('$'+mintomax(LeftStr(Data,4)));
  Data:=LeftStr(Data,len_i*2);
  AppendTxt('命令数据：'+Data,'');
  Crc_s:=RightStr(Data,4);
  AppendTxt('CRC：'+Crc_s,'');
  FillChar(HexData_c,1023,0);
  asc_hex(PAnsiChar(AnsiString(Data)),HexData_c,len_i-2);
  checkCrc_s:=MinToMax(IntToHex(crc_sum(HexData_c,len_i-2),4));
  AppendTxt('checkCrc_s：'+checkCrc_s,'');
  if UpperCase(Crc_s)<>UpperCase(checkCrc_s) then
    Result:=false else   result:=true;
end;

function TProtocol_Meter.DecryptData(Key,Data:string):string;
var
  AscKey_c:array[0..31] of Ansichar;
  HexKey_c:array[0..15] of AnsiChar;
  AscData_c:array[0..2047] of Ansichar;
  HexData_c:array[0..1023] of Ansichar;
  KeyNo_i:Integer;
  len_i:Integer;
begin
  KeyNo_i:=StrToInt('$'+Copy(Data,21,2));
  if KeyNo_i<>255 then
  begin
     len_i:=strtoint('$'+mintomax(LeftStr(Data,4)))-18;//总长度-Sum(长度、协议头、CRc)
     AppendTxt('解密命令数据：'+Copy(Data,33,len_i*2),'');
     asc_hex(PAnsiChar(AnsiString(Key)),HexKey_c,16);
     asc_hex(PAnsiChar(AnsiString(Copy(Data,33,len_i*2))),HexData_c,len_i);
     btea(1,HexData_c,(len_i  div 4),HexKey_c);
     hex_asc(HexData_c,AscData_c,len_i);
     Result:=LeftStr(AscData_c,len_i*2);
     AppendTxt('命令数据明文：'+Result,'');
  end  else
  begin
    len_i:=strtoint('$'+mintomax(LeftStr(Data,4)))-18;
    result:=Copy(Data,33,len_i*2);
  end;
end;

function TProtocol_Meter.ParsingData(Mod_i:byte;Data:string):string;
var
 Json,JsonItem,JsonCmd,JsonAnswer,JsOnMeterState:ISuperObject;
  len_i,temp_i,AnswerLen_i,MeterStateLen_i:integer;
  CmdPlData_s,AnswerPlData_s,MeterStatePlData_s,HeadData_s,temp_s:string;
  RetData_s:string;
  Answer_b,MeterState_b:Boolean;
  KeyNo_i:SmallInt;
  Func:IProtocol;
  Cmd_ls,Answer_ls,Meterstate_ls:tstringList;
  I,rt: Integer;
  LenData_s:string;
begin
    try
      JsonCmd:=SA([]);
      len_i:=StrToInt('$'+leftstr(Data,2));
      Data:=RightStr(Data,Length(Data)-2);
      LenData_s:=LeftStr(Data,len_i*4);
      Data:=RightStr(Data,Length(Data)-length(LenData_s));
      for I := 0 to len_i - 1 do
      begin
       temp_i:=strtoint('$'+mintomax(LeftStr(LenData_s,4)));
       LenData_s:=RightStr(LenData_s,Length(LenData_s)-4);
       Func:=TProtocolFactory.ProtocolParsing(Mod_i,LeftStr(Data,2));
       if Func=nil then
       begin
         JsonItem:=SO();
         JsonItem.S[JSCmd]:=LeftStr(Data,2);
         JsonItem.i[JsErrCode]:=-4;
         JsonItem.S[JsErrMsg]:='协议错误';
       end
       else
       begin
         rt:=Func.ProtocolParsing(LeftStr(Data,temp_i*2),RetData_s);
         if rt<>0 then
         begin
           JsonItem:=SO();
           JsonItem.S[JSCmd]:=LeftStr(Data,2);
           JsonItem.i[JsErrCode]:=rt;
           JsonItem.S[JsErrMsg]:=GetError(rt);
         end
         else
         begin
            JsonItem:=SO(RetData_s);
         end;
       end;
       JsonCmd.AsArray.Add(JsonItem);
       Data:=RightStr(Data,Length(Data)-temp_i*2);
      end;
      Result:=JsonCmd.AsString;
    except
       JsonItem:=SO();
       JsonItem.S[JSCmd]:=LeftStr(Data,2);
       JsonItem.i[JsErrCode]:=-4;
       JsonItem.S[JsErrMsg]:='协议错误';
       JsonCmd.AsArray.Add(JsonItem);
    end;
end;

procedure TProtocol_Meter.ProtocolParsing(Key_s,CmdData,AnswerData,MeterStateData:string;var ReturnData:string);
var
  Json,JsonItem,JsonCmd,JsonAnswer,JsOnMeterState:ISuperObject;
  len_i,temp_i,AnswerLen_i,MeterStateLen_i:integer;
  CmdPlData_s,AnswerPlData_s,MeterStatePlData_s,HeadData_s,temp_s:string;
  RetData_s:string;
  Answer_b,MeterState_b:Boolean;
  AscData_c:array[0..2047] of Ansichar;
  HexData_c:array[0..1023] of Ansichar;
  AscKey_c:array[0..31] of Ansichar;
  HexKey_c:array[0..15] of AnsiChar;
  KeyNo_i:SmallInt;
  Func:IProtocol;
  Cmd_ls,Answer_ls,Meterstate_ls:tstringList;
  I,rt: Integer;
  LenData_s:string;
begin
  answer_b:=false;
  MeterState_b:=false;
  ReturnData:='';
  json:=SO();
  try
    try

      {$region '验证Crc'}
        if trim(CmdData)='' then
        begin
          Json.S[JsReturnCode]:='-5';
          json.S[JsReturnMsg]:=GetError(-5);
          exit;
        end;
        if not CheckCrc(CmdData)then
        begin
          Json.S[JsReturnCode]:='-5';
          json.S[JsReturnMsg]:=GetError(-5);
          exit;
        end;
        if Trim(AnswerData)<>'' then
        begin
          if  not CheckCrc(AnswerData) then  Answer_b:=false else Answer_b:=true;
        end else answer_b:=false;

        if trim(MeterStateData)<>'' then
        begin
          if  not CheckCrc(MeterStateData) then  MeterState_b:=false else MeterState_b:=true;
        end else MeterState_b:=false;
      {$ENDREGION}

      {$region '解密数据'}

        CmdPlData_s:= DecryptData(Key_s,CmdData);

        if Answer_b then
        begin
          AnswerPlData_s:= DecryptData(Key_s,AnswerData);
        end;

        if MeterState_b then
        begin
          MeterStatePlData_s:= DecryptData(Key_s,MeterStateData);
        end;
      {$ENDREGION}

      {$REGION '解析数据'}
      JsonCmd:=SA([]);
      JsonAnswer:=SA([]);
      JsOnMeterState:=SA([]);

      HeadData_s:=Copy(CmdData,5,28);
      Func:=TProtocolFactory.ProtocolParsing(0,'FF');
      rt:=Func.ProtocolParsing(HeadData_s,RetData_s);
      if rt<>0 then exit;
      Json.S[JSHead]:=RetData_s;

      JsonItem:=SO(ParsingData(0,CmdPlData_s));
      Json.O[JsInfo]:=JsonItem;

      if (Answer_b) and (Trim(AnswerPlData_s)<>'')  then
      begin
        JsonItem:=SO(ParsingData(1,AnswerPlData_s));
//        JsonAnswer.AsArray.Add(JsonItem);
      end
      else
      begin
       JsonItem:=SO();
       JsonItem.I[JsErrCode]:=-1;
       jsonitem.S[JsErrMsg]:='无应答';
//       JsonAnswer.AsArray.Add(JsonItem);
      end;
      Json.O[JsAnswer]:=JsonItem;

      if (meterstate_b) and (Trim(MeterStatePlData_s)<>'') then
      begin
        JsonItem:=SO(ParsingData(0,MeterStatePlData_s));
//        JsOnMeterState.AsArray.Add(JsonItem);
      end
      else
      begin
       JsonItem:=SO();
       JsonItem.I[JsErrCode]:=-1;
       jsonitem.S[JsErrMsg]:='无状态数据';
//       JsOnMeterState.AsArray.Add(JsonItem);
      end;
      Json.O[JsMeterState]:=jsonitem;
      {$ENDREGION}

      Json.i[JsReturnCode]:=0;
      json.S[JsReturnMsg]:=GetError(0);
    except
      Json.i[JsReturnCode]:=-5;
      json.S[JsReturnMsg]:=GetError(-5);
    end;

  finally
    ReturnData:=Json.AsString;
  end;

end;

{ IProtocolMeterState }

function TProtocolMeterState.ProtocolPackage(CommandData: string;
  var ReturnData: string): SmallInt;
begin

end;

function TProtocolMeterState.ProtocolParsing(Data: string;
  var CmdData: string): SmallInt;
var
  json,js_Even,js_Lock:ISuperObject;
  I,temp_i: Integer;
  temp_s:string;

begin
  try
    json:=SO();
    json.S[JSCmd]:=LeftStr(data,2);
    Data:=RightStr(data,Length(data)-2);
    json.s[JsStatus]:=leftstr(Data,2);
    Data:=RightStr(data,Length(data)-2);
    Data:=RightStr(data,Length(data)-4);//保留
    json.i[Jsdeviceid]:=StrToInt('$'+mintomax(leftstr(Data,8)));
    Data:=RightStr(data,Length(data)-8);
    json.d[JsWarnSetOVM]:=StrToInt('$'+mintomax(leftstr(Data,8)))/100;
    Data:=RightStr(data,Length(data)-8);
    json.d[JsOffSetOVM]:=StrToInt('$'+mintomax(leftstr(Data,8)))/100;
    Data:=RightStr(data,Length(data)-8);
    json.i[JsOVerageVM]:=StrToInt('$'+mintomax(leftstr(Data,8)));
    Data:=RightStr(data,Length(data)-8);
    json.i[JSLastBSNV]:=StrToInt('$'+mintomax(leftstr(Data,4)));
    Data:=RightStr(data,Length(data)-4);
    Data:=RightStr(data,Length(data)-4);//预留
    json.d[JsTotalVolume]:=StrToInt('$'+mintomax(leftstr(Data,8)))/100;
    Data:=RightStr(data,Length(data)-8);

    js_Even:=SO();
    temp_s:= hextobit(MinToMax(LeftStr(data,8)),8);
    Data:=RightStr(data,Length(data)-8);
    js_Even.S[JsEvent]:=temp_s;

    for I := 0 to 19 do
    begin
      if i=0 then begin
        temp_i:=bittohex(RightStr(temp_s,8));
        temp_s:=LeftStr(temp_s,Length(temp_s)-8);
        js_Even.S[EvenInfo[i]]:=OffReason[temp_i];
        Continue;
      end;
      js_Even.S[EvenInfo[i]]:=RightStr(temp_s,1);
      temp_s:=LeftStr(temp_s,Length(temp_s)-1);
    end;
    json.o[JsEvent]:=js_Even;

    js_Lock:=so();
    temp_s:= hextobit(MinToMax(LeftStr(data,8)),8);
    js_Lock.S[Jslock]:=temp_s;
    Data:=RightStr(data,Length(data)-8);

    js_Lock.S[lockInfo[0]]:=Noflow[bittohex(RightStr(temp_s,2))];
    temp_s:=LeftStr(temp_s,Length(temp_s)-2);

    js_Lock.S[lockInfo[1]]:=HifhtFlow[bittohex(RightStr(temp_s,2))];
    temp_s:=LeftStr(temp_s,Length(temp_s)-2);

    js_Lock.S[lockInfo[2]]:=OverageV[bittohex(RightStr(temp_s,2))];
    temp_s:=LeftStr(temp_s,Length(temp_s)-2);

    js_Lock.S[lockInfo[3]]:=OverageV[bittohex(RightStr(temp_s,2))];
    temp_s:=LeftStr(temp_s,Length(temp_s)-2);

    js_Lock.S[lockInfo[4]]:=StrongMagnetic[bittohex(RightStr(temp_s,4))];
    temp_s:=LeftStr(temp_s,Length(temp_s)-4);

    for I := 5 to 12 do
    begin
      js_Lock.S[lockInfo[i]]:=RightStr(temp_s,1);
      temp_s:=LeftStr(temp_s,Length(temp_s)-1);
    end;
    json.O[Jslock]:=js_Lock;

    json.d[JsPaymentVM1]:=StrToInt('$'+mintomax(LeftStr(data,8)))/100;
    Data:=RightStr(data,Length(data)-8);
    json.d[JsPaymentVM2]:=StrToInt('$'+mintomax(LeftStr(data,8)))/100;
    Data:=RightStr(data,Length(data)-8);
    json.d[JsPaymentVM3]:=StrToInt('$'+mintomax(LeftStr(data,8)))/100;
    Data:=RightStr(data,Length(data)-8);
    json.d[JsPaymentVM4]:=StrToInt('$'+mintomax(LeftStr(data,8)))/100;
    Data:=RightStr(data,Length(data)-8);
    json.d[JsPaymentVM5]:=StrToInt('$'+mintomax(LeftStr(data,8)))/100;
    Data:=RightStr(data,Length(data)-8);
    json.d[JsPaymentVM6]:=StrToInt('$'+mintomax(LeftStr(data,8)))/100;
    Data:=RightStr(data,Length(data)-8);
    Data:=RightStr(data,Length(data)-2);//保留
    json.s[JsDays]:='20'+LeftStr(data,14);

//    JsStatus='Status'; //	设备状态
//    Jsdeviceid='deviceid';//	设备id
//    JsWarnSetOVM='WarnSetOVM';//	报警动作点
//    JsOffSetOVM='OffSetOVM';//	关阀动作点
//    JsOVerageVM='OVerageVM';//	余量，余额
//    JSLastBSNV='LastBSNV';//充值次数
////      reverse01	预留
//    JsTotalVolume='TotalVolume';//	总量（方量）
//    JsEvent='event';//	事件
//    Jslock='lock';//	锁状态
//    JsPaymentVM1=Payment1;//	充值记录
//    JsPaymentVM2=Payment2;//	充值记录
//    JsPaymentVM3=Payment3;//	充值记录
//    JsPaymentVM4=Payment4;//	充值记录
//    JsPaymentVM5=Payment5;//	充值记录
//    JsPaymentVM6=Payment6;//	充值记录
    CmdData:=json.AsString;
//    status	设备状态
//    deviceid	设备id
//    WarnSetOVM	报警动作点
//    OffSetOVM	关阀动作点
//    OVerageVM	余量，余额
//    LastBSNV	充值次数
//    reverse01	预留
//    TotalVolume	总量（方量）
//    event	事件
//    lock	锁状态
//    PaymentVM[6]	充值记录

    result:=0;
  except
    result:=-4;
  end;
end;

{ TProtocolAnswer }

function TProtocolAnswer.ProtocolPackage(CommandData: string;
  var ReturnData: string): SmallInt;
begin

end;

function TProtocolAnswer.ProtocolParsing(Data: string;
  var CmdData: string): SmallInt;
var
   json:ISuperObject;
begin
  try
    json:=SO();
    json.S[JSCmd]:=LeftStr(data,2);
    data:=RightStr(data,Length(data)-2);
    json.i[JsExec]:=strtoint(leftstr(data,2));
    CmdData:=json.AsString;
    result:=0;
  except
    result:=-4;
  end;

end;

{ TProtocolSetDate }

function TProtocolSetDate.ProtocolPackage(CommandData: string;
  var ReturnData: string): SmallInt;
var
   json:ISuperObject;
   DateTime_s:string;
   Year,Month,Day,Hour,minutes,Second,Week:integer;
begin
  try
    if Pos(JsDateTime,CommandData)<=0 then
    begin
      result:=-2;
      exit;
    end;
    json:=SO(CommandData);
    DateTime_s:=trim(json[JsDateTime].AsString);
    ReturnData:=_SetDateTime;
    ReturnData:=ReturnData+FormatDateTime('YYMMDDHHmmss',strtodatetime(DateTime_s));
    ReturnData:=ReturnData+inttohex(DayOfWeek(strtodatetime(DateTime_s))-1,2);
    result:=0;
  except
    on e:Exception do
    begin
      AppendTxt('指令：'+CommandData+'组织失败，原因：'+e.Message,'');
      result:=-1;  //协议解析失败
    end;
  end;
end;

function TProtocolSetDate.ProtocolParsing(Data: string;
  var CmdData: string): SmallInt;
var
   json:ISuperObject;
   Year,Month,Day,Hour,Minutes,Second,Week:string;

begin
  try
    json:=SO();
    json.S[JSCmd]:=LeftStr(data,2);
    data:=RightStr(data,Length(data)-2);
    Year:=LeftStr(data,2);
    data:=RightStr(data,Length(data)-2);
    Month:=LeftStr(data,2);
    data:=RightStr(data,Length(data)-2);
    Day:=LeftStr(data,2);
    data:=RightStr(data,Length(data)-2);
    Hour:=LeftStr(data,2);
    data:=RightStr(data,Length(data)-2);
    Minutes:=LeftStr(data,2);
    data:=RightStr(data,Length(data)-2);
    Second:=LeftStr(data,2);
    data:=RightStr(data,Length(data)-2);
    Week:=LeftStr(data,2);
    case StrToInt(Week) of
      0:week:='星期日';
      1:week:='星期一';
      2:week:='星期二';
      3:week:='星期三';
      4:week:='星期四';
      5:week:='星期五';
      6:week:='星期六';
    end;
    json.s[jsdatetime]:=Format('20%s-%s-%s %s:%s:%s',[Year,month,day,hour,minutes,second]);
    json.S[JsWeek]:=week;
    CmdData:=json.AsString;
    result:=0;
  except
    result:=-4;
  end;

end;

{ TprotocolSetHolidays }

function TprotocolSetHolidays.ProtocolPackage(CommandData: string;
  var ReturnData: string): SmallInt;
var
  Json,jsonDays:ISuperObject;
  tt:TSuperArray;
  i,j,month_i:Integer;
  Days:TStringList;
  Temp_i:Integer;
  temp_s:string;
  Day_b:array[0..11] of Integer;
begin
  try
    if (pos(JSCmd,CommandData)<=0)
        or (pos(JsJQ,CommandData)<=0)
    then
    begin
      result:=-2;
      exit;
    end;
    json:=SO(CommandData);
    FillChar(Day_B,12,0);
    tt:=json[JsJQ].AsArray;
    if tt<>nil then
    begin
      for I := 0 to tt.Length - 1 do
      begin
       temp_s:=tt[i].AsString;
       if (pos(JsDays,temp_s)<=0)
          or (pos(jsMonth,temp_s)<=0)
       then
       begin
         result:=-2;
         exit;
       end;
       jsonDays:=SO(temp_s);
       Days:=TStringList.Create;
       Days.Delimiter:=',';
       days.DelimitedText:=jsonDays[JsDays].AsString;
       month_i:=jsonDays[jsMonth].AsInteger;
       if (month_i>12) or (month_i<1) then
       begin
        result:=-5;
        Exit;
       end;

       Temp_i:=0;
       for j := 0 to Days.Count - 1 do
       begin
        if Trim(Days[j])='' then
        begin
          result:=-5;
          exit;
        end;
        if (StrToInt(Days[j])<=0)
          or ((month_i in [1,3,5,7,8,10,12]) and (StrToInt(Days[j])>31))
          or ((month_i in [4,6,9,11]) and (StrToInt(Days[j])>30))
          or ((month_i=2) and (StrToInt(Days[j])>29))
        then
        begin
          result:=-5;
          Exit;
        end;
        Temp_i:=Temp_i+(1 shl (strtoint(Days[j])-1));
       end;
       Day_b[month_i-1]:=temp_i;
      end;
    end;
    ReturnData:=_SetHolidays;
    for I := 0 to 11 do
    begin
     ReturnData:=ReturnData+maxtomin(inttohex(Day_b[i],8));
    end;
    Result:=0;
  except
    on e:Exception do
    begin
      AppendTxt('指令：'+CommandData+'组织失败，原因：'+e.Message,'');
      result:=-1;  //协议解析失败
    end;
  end;
end;

function TprotocolSetHolidays.ProtocolParsing(Data: string;
  var CmdData: string): SmallInt;
var
   json,JSItem,jo:ISuperObject;
   TEMP_S:STRING;
   I,j,temp_i: Integer;
begin
  try
    json:=SO();
    JSItem:=SA([]);
    json.S[JSCmd]:=LeftStr(Data,2);
    Data:=RightStr(data,Length(data)-2);
    for I := 0 to 11 do
    begin
      TEMP_S:='';
      temp_i:=StrToInt('$'+mintomax(LEFTSTR(Data,8)));
      Data:=RightStr(data,Length(data)-8);
      jo:=SO();
      jo.i[jsMonth]:=i+1;
      for j := 0 to 30 do
      begin
       if (temp_i and (1 shl j)) >0 then
       BEGIN
         if TEMP_S='' then temp_s:=IntToStr(j+1) else temp_s:=temp_s+','+IntToStr(j+1);
       END;
      end;
      jo.S[JsDays]:=temp_s;
      if TEMP_S<>'' then
        JSItem.AsArray.Add(jo);
    end;
    json.o[JsJQ]:=JSItem;
    CmdData:=json.AsString;
  except
   result:=-4;
  end;

end;

{ TProtocolSetID }

function TProtocolSetID.ProtocolPackage(CommandData: string;
  var ReturnData: string): SmallInt;
  var
  json:ISuperObject;
begin

 try
  if (pos(JSCmd,CommandData)<=0)
    or (pos(JsIDOperType,CommandData)<=0)
    or (pos(JsOldID,CommandData)<=0)
    or (pos(JsNewID,CommandData)<=0)
  then
  begin
    result:=-2;
     exit;
  end;
  json:=SO(CommandData);
  ReturnData:=_SetID;
  ReturnData:=ReturnData+IntToHex(json[JsIDOperType].AsInteger,2);
  ReturnData:=ReturnData+'00';
  ReturnData:=ReturnData+MaxToMin(IntToHex(StrToInt64(json[JsOldID].AsString),8));
  if json[JsIDOperType].AsInteger=0 then
    ReturnData:=ReturnData+MaxToMin(IntToHex(StrToInt64(json[JsOldID].AsString),8))
  else
    ReturnData:=ReturnData+MaxToMin(IntToHex(StrToInt64(json[JsNewID].AsString),8));
  Result:=0;
 except
  on e:Exception do
  begin
    AppendTxt('指令：'+CommandData+'组织失败，原因：'+e.Message,'');
    result:=-1;  //协议解析失败
  end;
 end;
end;

function TProtocolSetID.ProtocolParsing(Data: string;
  var CmdData: string): SmallInt;
var
   json,JSItem,jo:ISuperObject;
begin
  try
    json:=SO();
    JSItem:=SA([]);
    json.S[JSCmd]:=LeftStr(Data,2);
    Data:=RightStr(data,Length(data)-2);
    json.S[JsIDOperType]:=LeftStr(Data,2);
    Data:=RightStr(data,Length(data)-2);
    Data:=RightStr(data,Length(data)-2);
    json.i[JsOldID]:=strtoint64('$'+MinToMax(LeftStr(Data,8)));
    Data:=RightStr(data,Length(data)-8);
    json.i[JsNewID]:=strtoint64('$'+MinToMax(LeftStr(Data,8)));
    CmdData:=json.AsString;
    result:=0;
  except
    result:=-4;
  end;

end;

{ TprotocolSetStage }

function TprotocolSetStage.ProtocolPackage(CommandData: string;
  var ReturnData: string): SmallInt;
var
   json:ISuperObject;
   Cmd_s:string;
begin
  try
    if Pos(JSStage,CommandData)<=0 then
    begin
      result:=-2;
      exit;
    end;
    json:=SO(CommandData);
    cmd_s:=_OutInit;
    ReturnData:=cmd_s+inttohex(json[JSStage].AsInteger,2);
    result:=0;
  except
    on e:Exception do
    begin
      AppendTxt('指令：'+CommandData+'组织失败，原因：'+e.Message,'');
      result:=-1;  //协议解析失败
    end;
  end;
end;

function TprotocolSetStage.ProtocolParsing(Data: string;
  var CmdData: string): SmallInt;
 var
   json:ISuperObject;
begin
  try
    json:=SO();
    json.S[JSCmd]:=LeftStr(data,2);
    data:=RightStr(data,Length(data)-2);
    json.S[JSStage]:=LeftStr(data,2);
    CmdData:=json.AsString;
    result:=0;
  except
    result:=-4;
  end;
end;
{ TProtocolProduceSet }

function TProtocolProduceSet.ProtocolPackage(CommandData: string;
  var ReturnData: string): SmallInt;
var
  Days:TStringList;
  json:ISuperObject;
  i,temp_i:integer;
begin
  if (Pos(JSCmd,CommandData)<=0)
    or (Pos(JsDeviceName,CommandData)<=0)
    or (Pos(JsQN,CommandData)<=0)
    or (Pos(JsQMAX,CommandData)<=0)
    or (Pos(JsQMIN,CommandData)<=0)
    or (Pos(JsQS,CommandData)<=0)
    or (Pos(JsVavleOnTime,CommandData)<=0)
    or (Pos(JsVavleOffTime,CommandData)<=0)
    or (Pos(JsDWM,CommandData)<=0)
    or (Pos(JsParmaters,CommandData)<=0)
  then
  begin
    result:=-2;
     exit;
  end;
  try
    json:=SO(CommandData);
    Days:=tstringlist.Create;
    Days.Delimiter:=',';
    days.DelimitedText:=json[JsParmaters].AsString;
    for I := 0 to days.Count - 1 do
    begin
       Temp_i:=Temp_i+(1 shl (strtoint(Days[i])-1));
    end;
    ReturnData:=_ProduceSet;
    ReturnData:=ReturnData+maxtomin(inttohex(temp_i,8));
    ReturnData:=ReturnData+leftstr((strtoascii(json[JsDeviceName].AsString))+'0000000000000000000000000000000',32);
    ReturnData:=ReturnData+maxtomin(inttohex(Trunc(json[JsQN].AsDouble*10),4));
    ReturnData:=ReturnData+maxtomin(inttohex(Trunc(json[JsQMAX].AsDouble),4));
    ReturnData:=ReturnData+maxtomin(inttohex(Trunc(json[JsQMIN].AsDouble),4));
    ReturnData:=ReturnData+maxtomin(inttohex(Trunc(json[JsQS].AsDouble),4));
    ReturnData:=ReturnData+(inttohex(json[JsVavleOnTime].AsInteger,2));
    ReturnData:=ReturnData+(inttohex(json[JsVavleOffTime].AsInteger,2));
    ReturnData:=ReturnData+maxtomin(inttohex(json[JsDWM].AsInteger,4));
    result:=0;
  except
    on e:Exception do
    begin
      AppendTxt('指令：'+CommandData+'组织失败，原因：'+e.Message,'');
      result:=-1;  //协议解析失败
    end;
  end;
end;

function TProtocolProduceSet.ProtocolParsing(Data: string;
  var CmdData: string): SmallInt;
var
   json:ISuperObject;
   Temp_s:string;
   j,temp_i:integer;
begin
  try
    json:=SO();
    json.S[JSCmd]:=LeftStr(data,2);
    data:=RightStr(data,Length(data)-2);
    Temp_i:=StrToInt('$'+mintomax(LeftStr(data,8)));
    data:=RightStr(data,Length(data)-8);
    Temp_s:='';
    for j := 0 to 31 do
    begin
     if (temp_i and (1 shl j)) >0 then
     BEGIN
       if TEMP_S='' then temp_s:=IntToStr(j+1) else temp_s:=temp_s+','+IntToStr(j+1);
     END;
    end;
    json.S[JsParmaters]:=Temp_s;
    json.s[JsDeviceName]:=asciitoStr((LeftStr(data,32)));
    data:=RightStr(data,Length(data)-32);
    json.d[JsQN]:=StrToInt('$'+mintomax(LeftStr(data,4)))/10;
    data:=RightStr(data,Length(data)-4);
    json.i[JsQMAX]:=StrToInt('$'+mintomax(LeftStr(data,4)));
    data:=RightStr(data,Length(data)-4);
    json.i[JsQMIN]:=StrToInt('$'+mintomax(LeftStr(data,4)));
    data:=RightStr(data,Length(data)-4);
    json.i[JsQS]:=StrToInt('$'+mintomax(LeftStr(data,4)));
    data:=RightStr(data,Length(data)-4);
    json.i[JsVavleOnTime]:=StrToInt('$'+(LeftStr(data,2)));
    data:=RightStr(data,Length(data)-2);
    json.i[JsVavleOffTime]:=StrToInt('$'+(LeftStr(data,2)));
    data:=RightStr(data,Length(data)-2);
    json.i[jsdwm]:=StrToInt('$'+mintomax(LeftStr(data,4)));

    CmdData:=json.AsString;
    result:=0;
  except
    result:=-4;
  end;
end;

{ TprotocolSetParameters }

function TprotocolSetParameters.ProtocolPackage(CommandData: string;
  var ReturnData: string): SmallInt;
  var
  Days:TStringList;
  json:ISuperObject;
  temp_i:Int64;
  i:Integer;
begin
   if (Pos(JSCmd,CommandData)<=0)
    or (Pos(JsPS,CommandData)<=0)
    or (Pos(JsConstNoFlowTimeOut,CommandData)<=0)
    or (Pos(JsConstSmallFlowTimeOut,CommandData)<=0)
    or (Pos(JsConstNoFlowTimeOutEx,CommandData)<=0)
    or (Pos(JsMaxOverageVM,CommandData)<=0)
    or (Pos(JsWarnSetOverageVM,CommandData)<=0)
    or (Pos(JsOffSetOverageVM,CommandData)<=0)
    or (Pos(JsParmaters,CommandData)<=0)
    or (Pos(JsOverdraftLimit,CommandData)<=0)
    or (Pos(JsSwitchSuperflow,CommandData)<=0)
  then
  begin
    result:=-2;
     exit;
  end;
  try
    json:=SO(CommandData);
    Days:=tstringlist.Create;
    Days.Delimiter:=',';
    days.DelimitedText:=json[JsParmaters].AsString;
    for I := 0 to days.Count - 1 do
    begin
       Temp_i:=Temp_i+(1 shl (strtoint(Days[i])-1));
    end;
    ReturnData:=_SetParameters;
    ReturnData:=ReturnData+maxtomin(inttohex(temp_i,8));
    ReturnData:=returndata+maxtomin(IntToHex(json[JsPS].AsInteger,4));
//    ReturnData:=ReturnData+maxtomin(RightStr(inttohex(json[JsConstNoFlowTimeOut].AsInteger*24,4),4));
//    ReturnData:=ReturnData+maxtomin(rightstr(inttohex(json[JsConstSmallFlowTimeOut].AsInteger*24,4),4));
//    ReturnData:=ReturnData+maxtomin(RightStr(inttohex(json[JsConstNoFlowTimeOutEx].AsInteger*24,4),4));
    ReturnData:=ReturnData+maxtomin(RightStr(inttohex(json[JsConstNoFlowTimeOut].AsInteger,4),4));
    ReturnData:=ReturnData+maxtomin(rightstr(inttohex(json[JsConstSmallFlowTimeOut].AsInteger,4),4));
    ReturnData:=ReturnData+maxtomin(RightStr(inttohex(json[JsConstNoFlowTimeOutEx].AsInteger,4),4));
    ReturnData:=ReturnData+maxtomin(inttohex(round(json[JsMaxOverageVM].AsDouble*100),8));
    ReturnData:=ReturnData+maxtomin(inttohex(round(json[JsWarnSetOverageVM].AsDouble*100),8));
    ReturnData:=ReturnData+maxtomin(RightStr(inttohex(round(json[JsOffSetOverageVM].AsDouble*100),8),8));
    returndata:=ReturnData+maxtomin(rightstr(inttohex(round(json[JsOverdraftLimit].AsDouble*100),8),8));
    returndata:=ReturnData+inttohex(json[JsSwitchSuperflow].AsInteger,2);
    result:=0;
  except
    on e:Exception do
    begin
      AppendTxt('指令：'+CommandData+'组织失败，原因：'+e.Message,'');
      result:=-1;  //协议解析失败
    end;
  end;
end;

function TprotocolSetParameters.ProtocolParsing(Data: string;
  var CmdData: string): SmallInt;
var
   json:ISuperObject;
   Temp_s:string;
   j,temp_i:integer;
begin
  try
    json:=SO();
    json.S[JSCmd]:=LeftStr(data,2);
    data:=RightStr(data,Length(data)-2);
    Temp_i:=StrToInt('$'+mintomax(LeftStr(data,8)));
    data:=RightStr(data,Length(data)-8);
    Temp_s:='';
    for j := 0 to 31 do
    begin
     if (temp_i and (1 shl j)) >0 then
     BEGIN
       if TEMP_S='' then temp_s:=IntToStr(j+1) else temp_s:=temp_s+','+IntToStr(j+1);
     END;
    end;
    json.S[JsParmaters]:=Temp_s;
    json.d[JsPS]:=StrToInt('$'+mintomax(LeftStr(data,4)));
    data:=RightStr(data,Length(data)-4);
    json.d[JsConstNoFlowTimeOut]:=StrToInt('$'+mintomax(LeftStr(data,4)));
    data:=RightStr(data,Length(data)-4);
    json.d[JsConstSmallFlowTimeOut]:=StrToInt('$'+mintomax(LeftStr(data,4)));
    data:=RightStr(data,Length(data)-4);
    json.d[JsConstNoFlowTimeOutEx]:=StrToInt('$'+mintomax(LeftStr(data,4)));
    data:=RightStr(data,Length(data)-4);

    json.d[JsMaxOverageVM]:=StrToInt('$'+mintomax(LeftStr(data,8)))/100;
    data:=RightStr(data,Length(data)-8);
    json.d[JsWarnSetOverageVM]:=StrToInt('$'+mintomax(LeftStr(data,8)))/100;
    data:=RightStr(data,Length(data)-8);
    json.d[JsOffSetOverageVM]:=StrToInt('$'+mintomax(LeftStr(data,8)))/100;
    data:=RightStr(data,Length(data)-8);
    json.d[JsOverdraftLimit]:=StrToInt('$'+mintomax(LeftStr(data,8)))/100;
    data:=RightStr(data,Length(data)-8);
    json.d[JsSwitchSuperflow]:=StrToInt('$'+mintomax(LeftStr(data,2)));

    CmdData:=json.AsString;
    result:=0;
  except
    result:=-4;
  end;

end;

{ TprotocolSelect }

function TprotocolSelect.ProtocolPackage(CommandData: string;
  var ReturnData: string): SmallInt;
begin

end;


function TprotocolSelect.ProtocolParsing(Data: string;
  var CmdData: string): SmallInt;
var
  Data_H:array[0..1000] of AnsiChar;
  SelectData:PSelectData;
  Offset:integer;
  json:ISuperObject;
  lMarshal: TJSONMarshal;
  lJSONValue: TJSONValue;
  Value:TJSONObject;
  i:integer;
  StrData:TSelectDataStr;
  cmd,TEMP:string;
begin
  cmd:=LeftStr(Data,2);
  Data:=RightStr(Data,Length(Data)-2);
  Offset:=StrToInt('$'+mintomax(leftstr(Data,4)));
  Data:=RightStr(Data,Length(Data)-4);
  asc_hex(PAnsiChar(AnsiString(Data)),data_H,(Length(Data) div 2));
  SelectData:=PSelectData(@data_H[0]);
  StrData:=RecordToClass(SelectData^);
  lMarshal:=TJSONMarshal.Create(TJSONConverter.Create);
  lJSONValue:=lMarshal.Marshal(StrData);  //序列化
  json:=SO(lJSONValue.tostring);
  lJSONValue.Free;
//  json.S[JSCmd]:=cmd;
  CmdData:=json['fields'].AsString;
  StrData.Free;
  Result:=0;
end;

end.
