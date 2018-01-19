unit LogicUnit;

interface

uses Protocol_Meter,Protocol_IC,StrUtils,StdCtrls,superobject,PublicCode;

type
  TBusinessInterface=class
    public
      procedure ReadData(Key_s:string;var Data:string);
      function writeData(mod_i:Byte;CmdData:string;var ErrMsg:string):SmallInt;
      function InitCard():SmallInt;
  end;

implementation

{ TBusinessInterface }

function TBusinessInterface.InitCard: SmallInt;
var
  ICProtocol:TProtocol_IC;
begin
   ICProtocol:=tprotocol_ic.create;
   try
     Result:=ICProtocol.InitCard;
     if Result<>0 then Result:=-100+Result;
   finally
     ICProtocol.Free;
   end;
end;

procedure TBusinessInterface.ReadData(Key_s:string;var Data: string);
var
  ICProtocol:TProtocol_IC;
  MeterProtocol:TProtocol_meter;
  CmdData,AnswerData,MeterStateData:string;
  rt:integer;
  Json:Isuperobject;
begin
  MeterProtocol:=TProtocol_meter.Create;
  ICProtocol:=tprotocol_ic.create;
  try
    rt:=ICProtocol.ReadData(CmdData,AnswerData,MeterStateData);
    if rt<>0 then
    begin
      Json:=SO();
      json.I[JsReturnCode]:=-100+rt;
      Json.S[JsReturnMsg]:=ICProtocol.GetError(rt);
      Data:=json.AsString;
      exit;
    end;
    MeterProtocol.ProtocolParsing(Key_s,CmdData,AnswerData,MeterStateData,Data);
  finally
   MeterProtocol.Free;
   ICProtocol.Free;
  end;
end;

function TBusinessInterface.writeData(mod_i:Byte;CmdData: string;var ErrMsg:string): SmallInt;
var
  MeterProtocol:TProtocol_meter;
  ICProtocol:TProtocol_IC;
  Data_s:string;
  rt:integer;
begin
   MeterProtocol:=TProtocol_meter.Create;
   ICProtocol:=tprotocol_ic.create;
   try
     Result:=MeterProtocol.ProtocolPackage(CmdData,Data_s);
     if Result<>0 then
     begin
       ErrMsg:=MeterProtocol.GetError(rt);
       Result:=-100+rt;
       exit;
     end;
     Result:=ICProtocol.WriteData(mod_i,Data_s);
     if Result<>0 then
     begin
       ErrMsg:=ICProtocol.GetError(Result);
       Result:=-200+Result;
     end;
   finally
     MeterProtocol.Free;
     ICProtocol.Free;
   end;
end;

end.
