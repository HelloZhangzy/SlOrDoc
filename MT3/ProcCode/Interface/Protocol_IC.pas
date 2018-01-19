unit Protocol_IC;

interface

uses Device_MT3,PublicCode,Math,StrUtils,StdCtrls,SysUtils, Windows, Messages
,  Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls;

type
  TProtocol_IC=class(TDevice_MT3_S50)
  const InitPass='FFFFFFFFFFFF';
            Key='BAED03C869FC4FDE0DF3E0AE36F71ED2';
            Commpany='436451634B6A467A597847734E66436B';
            //CtrlValue='88778769';  //密码B可读取，块0~块3密码AB可读密码B可写
            CtrlValue='08778F69';   //密码B不可读取，块0~块3密码AB可读密码B可写
    private
      CmdSaveInfo:array[0..47] of Byte;
      AnswerSaveInfo:array[0..47] of Byte;
      PassA:string;
      PassB:string;
      procedure CalculationPass(InitData_s:string);
      function InitDevice():SmallInt;
      function CheckCard():SmallInt;
      function GeneratedSaveinfo(Addr_i:SmallInt):string;
    public
      function WriteData(mod_i:byte;Data_s:string):SmallInt;
      function ReadData(var CmdData_s,AnswerData_s,MeterStateData_s:string):SmallInt;
      function GetError(ErrCode:smallint):string;
      function InitCard():SmallInt;
  end;

implementation

{ TProtocol_IC }


function TProtocol_IC.GetError(ErrCode: smallint): string;
begin
   case ErrCode of
      -1:result:='设备打开失败';
      -2:result:='寻卡失败';
      -3:result:='认证失败';
      -4:Result:='读卡失败';
      -5:Result:='写卡失败';
      -6:result:='非本厂卡';
      -7:result:='新卡';
      -8:result:='该卡已使用';
   else
     result:='';
   end;
end;

function TProtocol_IC.InitCard: SmallInt;
var
  i,j:integer;
  WriteData_s:string;
  const
    Data_s='00000000000000000000000000000000';
    Ctr_s='FFFFFFFFFFFFFF078069FFFFFFFFFFFF';
begin
  try
    try
      Result :=InitDevice;
      if Result<>0  then
      begin
        exit;
      end;
      for I := 0 to 15 do
      begin
        if not VerifyPass(i,1,PassA,PassB) then
        begin
          if not SelectCard then
          begin
            result:=-2;
            exit;
          end;
          if not VerifyPass(i,0,InitPass,InitPass) then
          begin
            result:=-3;
            exit;
          end;
        end;
        for j := 0 to 3 do
        begin
          if (i=0) and (j=0) then  Continue;

          if j<3 then WriteData_s:=data_s else WriteData_s:=Ctr_s;

          if not WriteCard(i,j,WriteData_s) then
          begin
            result:=-5;
            Exit;
          end;
        end;
      end;
      Result:=0;
    except
    end;
  finally
   CloseDevice;
  end;
end;

function TProtocol_IC.InitDevice: SmallInt;
var
  Data_s:string;
begin
  if not (OpenDevice) then
  begin
    result:=-1;
    Exit;
  end;
  if not SelectCard then
  begin
    result:=-2;
    Exit;
  end;
  if not VerifyPass(0,0,InitPass,InitPass) then
  begin
    result:=-6;
    Exit;
  end;
  if not readcard(0,0,Data_s) then
  begin
    result:=-4;
    exit;
  end;
  CalculationPass(Data_s);
  result:=0;
end;

procedure TProtocol_IC.CalculationPass(InitData_s: string);
var
  AscData_c:array[0..199] of Ansichar;
  HexData_c:array[0..99] of Ansichar;
  AscKey_c:array[0..31] of Ansichar;
  HexKey_c:array[0..15] of AnsiChar;
  Len_i:Integer;
  DataLen_i:SmallInt;
  Data_s:string;
begin
  PassA:='';
  PassB:='';
  fillchar(AscData_c,199,0);
  fillchar(HexData_c,99,0);
  Data_s:=InitData_s;
  asc_hex(PAnsiChar(AnsiString(key)),HexKey_c,16);
  Len_i:=Length(Data_s);
  DataLen_i:=ceil(len_i/2/4);
  Data_s:=leftstr(Data_s+'00000000',dataLen_i*8);
  len_i:=Trunc(dataLen_i*8/2);
  asc_hex(PAnsiChar(AnsiString(Data_s)),HexData_c,len_i);
  btea(0,HexData_c,DataLen_i,HexKey_c);
  hex_asc(HexData_c,AscData_c,len_i);
  Data_s:=LeftStr(AscData_c,len_i*2);
  PassA:=LeftStr(Data_s,12);
  PassB:=RightStr(Data_s,12);
end;

function TProtocol_IC.CheckCard: SmallInt;
var
  Temp_s:string;
begin
  if not readcard(0,1,Temp_s) then
  begin
    result:=-4;
    exit;
  end;
  Temp_s:= UpperCase(Temp_s);
  if Temp_s='00000000000000000000000000000000' then
  begin
    Result:=-7;//新卡
    Exit;
  end;
  if Temp_s=commpany then
  begin
    result:=0; //本厂卡
    exit;
  end
  else
  begin
    Result:=-6;//非本厂卡
  end;
end;

function TProtocol_IC.ReadData(var CmdData_s, AnswerData_s,MeterStateData_s: string): SmallInt;
var
  rt,Sector_i,Addr_i:SmallInt;
  Flag_i:byte;
  SaveInfo_c:array[0..15] of AnsiChar;
  Data_s,Temp_s:string;
begin
  CmdData_s:='';
  AnswerData_s:='';
  MeterStateData_s:='';
  try
    rt:=InitDevice;
    if (rt<0) then
    begin
      result:=rt;
      exit;
    end;
    rt:=CheckCard;
    if (rt<0) then
    begin
      result:=rt;
      exit;
    end;
    if not readcard(0,2,Data_s) then
    begin
      result:=-4;
      exit;
    end;
    asc_hex(PAnsiChar(AnsiString(Data_s)),SaveInfo_c,16);
    for Sector_i := 1 to Length(SaveInfo_c) - 1 do
    begin
      if Ord(SaveInfo_c[Sector_i])=0 then Continue;
      Data_s:='';
      for Addr_i:= 0 to 2 do
      begin
         if not VerifyPass(Sector_i,0,PassA,PassB) then
         begin
           Result:=-3;
           exit;
         end;
         temp_s:='';
         if (Ord(SaveInfo_c[Sector_i]) and (1 shl ((Addr_i))) shr (addr_i)=1) then
         begin
           if not readcard(sector_i,Addr_i,Temp_s) then
           begin
             Result:=-4;
             Exit;
           end;
         end;
         Data_s:=Data_s+temp_s;
      end;
      Flag_i:=(Ord(SaveInfo_c[Sector_i]) and (1 shl 3)) shr 3;
      if Flag_i=0 then
          CmdData_s:=CmdData_s+Data_s
      else if Sector_i<14 then AnswerData_s:=AnswerData_s+Data_s else MeterStateData_s:=MeterStateData_s+Data_s;
    end;
    result:=0;
    AppendTxt('指令信息：'+CmdData_s,'');
    AppendTxt('应答信息：'+Data_s,'');
  finally
   CloseDevice;
  end;
end;

function TProtocol_IC.GeneratedSaveinfo(Addr_i: SmallInt): string;
var
  Temp_i:byte;
  i:Integer;
  Ctrl_s:string;
begin
  Ctrl_s:='06';
  for I := 0 to (Addr_i div 3)-1 do
  begin
    Ctrl_s:=Ctrl_s+IntToHex((1 shl 3)-1,2);;
  end;
  Ctrl_s:=Ctrl_s+IntToHex((1 shl (Addr_i mod 3))-1,2);
  result:=ctrl_s;
end;

function TProtocol_IC.WriteData(mod_i:byte;Data_s: string): SmallInt;
var
  Len_i:integer;
  rt,Sector_i,block_i,addr_i,i,l:SmallInt;
  CheckPassA,checkPassB,temp_s,WStr_s:string;
  ZeroCtrl_s,Ctrl_s,SaveInfo_s:string;
  W_Ctrl_i:Boolean;
  VerMod_i:byte;
  const
    DefaultData_s='00000000000000000000000000000000';
begin
 try
    {$REGION '初始设备及密码'}
      rt:=InitDevice;
      if rt<0 then
      begin
        result:=rt;
        exit;
      end;

      rt:=CheckCard;
      if (rt<0) and (rt<>-7) then
      begin
        result:=rt;
        exit;
      end;
      if mod_i=0 then //开卡
      begin
        if rt=0 then
        begin
          result:=-8;
          exit;
        end;
        CheckPassA:=InitPass;
        checkPassB:=InitPass;
        Ctrl_s:=PassA+CtrlValue+passB;
        ZeroCtrl_s:=InitPass+CtrlValue+passB;
        AppendTxt('控制位：'+Ctrl_s,'');
        W_Ctrl_i:=true;
        VerMod_i:=0;
      end
      else
      begin
        if rt=-7 then
        begin
          Result:=rt;
          exit;
        end;
        CheckPassA:=PassA;
        checkPassB:=PassB;
        Ctrl_s:='';
        W_Ctrl_i:=false;
        VerMod_i:=1;
      end;
      {$ENDREGION}

    {$REGION '写数据区'}
    Len_i:=Length(Data_s) div 2;
    block_i:=Ceil(len_i/16);
    Sector_i:=0;
    for I := 0 to 15 do
    begin
      if not VerifyPass(I,VerMod_i,checkpassA,checkPassB) then
      begin
        result:=-3;
        Exit;
      end;      
      if i=0 then
      begin
        if not  writecard(i,1,Commpany) then
        begin
            Result:=-5;
            exit;
        end;
        SaveInfo_s:=GeneratedSaveinfo(block_i);
        if not  writecard(0,2,SaveInfo_s) then
        begin
          Result:=-5;
          exit;
        end;
        if W_Ctrl_i then
        begin
          if not  writecard(i,3,ZeroCtrl_s) then
          begin
            result:=-5;
            Exit;
          end;

        end;
      end
      else
      begin
        if Data_s<>'' then
        begin
         WStr_s:=leftstr(Data_s,96);
         if length(WStr_s)<96 then
         begin
           WStr_s:=WStr_s+'00000000000000000000000000000000';
           WStr_s:=WStr_s+'00000000000000000000000000000000';
           WStr_s:=WStr_s+'00000000000000000000000000000000';
           WStr_s:=LeftStr(WStr_s,96);
         end;
         Data_s:=RightStr(Data_s,Length(Data_s)-96);
//         Sector_i:=i;
         addr_i:=-1;
         while WStr_s<>'' do
         begin
           addr_i:=addr_i+1;
           temp_s:=LeftStr(WStr_s,32);
           WStr_s:=RightStr(WStr_s,Length(WStr_s)-32);
           if not writecard(i,addr_i,temp_s) then
           begin
            Result:=-5;
            exit;
           end;
         end;
        end
        else
        begin
          for l := 0 to 2 do
          begin
           if not writecard(i,l,DefaultData_s) then
           begin
            Result:=-5;
            exit;
           end;
          end;
        end;
        if W_Ctrl_i then
        begin
          if not  writecard(i,3,Ctrl_s) then
          begin
            result:=-5;
            Exit;
          end;
        end;
      end;      
    end;

    Result:=0;
    {$ENDREGION}
 finally
    CloseDevice;
 end;
end;

end.
