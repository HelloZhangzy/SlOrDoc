unit Fr_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus,Device_MT3,StrUtils,PublicCode;

 type
  PExecCount=procedure(niCount:UInt64);
  PExit=procedure(Data:string);

  ThreaCheckPass=class(TThread)
   private
     FOnExecCount:PExecCount;
     FonExit:PExit;
     procedure DoExecCount(niCount:UInt64);
     procedure DoExit(Data:string);
   public
    constructor Create;
    procedure Execute(); override;
   protected
    property  OnExceCount:PExecCount read FOnExecCount write FOnExecCount;
    property  OnThreadExit:PExit read FonExit write FonExit;
  end;

  TForm1 = class(TForm)
    Panel2: TPanel;
    mm_Record: TMemo;
    Panel5: TPanel;
    Panel6: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edt_PassA: TEdit;
    edt_PassB: TEdit;
    edt_Sector: TEdit;
    edt_Addr: TEdit;
    edt_Contrl: TEdit;
    Panel1: TPanel;
    Button4: TButton;
    Button6: TButton;
    Label1: TLabel;
    edt_ReadData: TEdit;
    edt_WriteData: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Bevel1: TBevel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Label3: TLabel;
    edt_InitValue: TEdit;
    Button5: TButton;
    button: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Label4: TLabel;
    Button18: TButton;
    Button19: TButton;
    Label5: TLabel;
    Edit1: TEdit;
    Button20: TButton;
    Button21: TButton;
    procedure N1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure buttonClick(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
  private
    { Private declarations }
    icdev_i:LongInt;
    CheckThread:ThreaCheckPass;
    procedure AppendOpRecord(Msg:string);
  public
    { Public declarations }
  end;
  procedure OnExecCount(niCount:UInt64);
  procedure OnThreadExit(Data:string);
var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AppendOpRecord(Msg: string);
begin
   mm_Record.Lines.Insert(0,'');
   mm_Record.Lines.Insert(0,DateTimeToStr(Now)+'__'+Msg);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  PassA,passB:string;
  Pass_a:array[0..6]of AnsiChar;
  Sector_i:SmallInt;
  result_i:Integer;
begin
  passA:=edt_PassA.Text;
  passB:=edt_PassB.Text;
  Sector_i:=strtoint(edt_Sector.Text)*4;
  if RadioButton1.Checked then
  begin
    if Length(passA)<>12then
    begin
      AppendOpRecord('密码A必须为12个字符');
      exit;
    end;
    asc_hex(PAnsiChar(AnsiString(PassA)),Pass_a,6);
    result_i:=rf_authentication_key(icdev_i,0,Sector_i,Pass_a);
     if(result_i<>0) then
        AppendOpRecord('扇区'+edt_Sector.Text+'密码A认证失败!'+GetErrMsg(result_i))
     else
        AppendOpRecord('扇区'+edt_Sector.Text+'密码A认证成功!');
  end
  else if RadioButton2.Checked then
  begin
    if Length(passB)<>12 then
    begin
      AppendOpRecord('密码B必须为12个字符');
      exit;
    end;
    asc_hex(PAnsiChar(AnsiString(PassB)),Pass_a,6);
    result_i:=rf_authentication_key(icdev_i,1,Sector_i,Pass_a);
     if(result_i<>0) then
        AppendOpRecord('扇区'+edt_Sector.Text+'密码B认证失败!'+GetErrMsg(result_i))
     else
        AppendOpRecord('扇区'+edt_Sector.Text+'密码B认证成功!');
  end
  else if RadioButton3.Checked then
  begin
    if Length(passA)<>12 then
    begin
      AppendOpRecord('密码A必须为12个字符');
      exit;
    end;
    if Length(passB)<>12 then
    begin
      AppendOpRecord('密码B必须为12个字符');
      exit;
    end;
    asc_hex(PAnsiChar(AnsiString(PassA)),Pass_a,6);
    result_i:=rf_authentication_key(icdev_i,0,Sector_i,Pass_a);
     if(result_i<>0) then
        AppendOpRecord('扇区'+edt_Sector.Text+'密码A认证失败!'+GetErrMsg(result_i))
     else
        AppendOpRecord('扇区'+edt_Sector.Text+'密码A认证成功!');
    asc_hex(PAnsiChar(AnsiString(PassB)),Pass_a,6);
    result_i:=rf_authentication_key(icdev_i,1,Sector_i,Pass_a);
     if(result_i<>0) then
        AppendOpRecord('扇区'+edt_Sector.Text+'密码B认证失败!'+GetErrMsg(result_i))
     else
        AppendOpRecord('扇区'+edt_Sector.Text+'密码B认证成功!');
  end
end;

procedure TForm1.Button20Click(Sender: TObject);
var
  temp_i:Int64;
begin
  temp_i:=StrToInt64(edit1.Text);
  Label5.Caption:=IntToHex(temp_i,8);
end;

procedure TForm1.Button21Click(Sender: TObject);
var
  temp_i:Int64;
begin
  temp_i:=StrToInt64('$'+rightstr(Label5.Caption,8));
  Edit1.Text:=IntToStr(temp_i);
end;

procedure TForm1.Button2Click(Sender: TObject);
 var
  result_i:Integer;
  HexData:array[0..15] of AnsiChar;
  AscData:array[0..31] of Ansichar;
  Addr_i:SmallInt;
begin
   Addr_i:=StrToInt(edt_Sector.text)*4+strtoint(edt_Addr.Text);
   result_i:=rf_read(icdev_i,Addr_i,HexData);
   if(result_i<>0) then
      AppendOpRecord('读块'+inttostr(Addr_i)+'数据失败!'+GetErrMsg(result_i))
   else
   begin
      hex_asc(HexData,AscData,16);
      edt_ReadData.Text:=AscData;
      AppendOpRecord('读块'+inttostr(Addr_i)+'读数据成功,数据:');
      AppendOpRecord(AscData);
   end;
end;


procedure TForm1.Button3Click(Sender: TObject);
 var
  result_i:Integer;
  HexData:array[0..15] of AnsiChar;
  AscData:string;
  Addr_i:SmallInt;
begin
  AscData:=edt_WriteData.Text;
  AscData:=rightStr('00000000000000000000000000000000'+AscData,32);
//  Addr_i:=StrToInt(edt_Sector.text)*4+strtoint(edt_Addr.Text);
  Addr_i:=StrToInt(edt_Sector.text)*4+strtoint(edt_Addr.Text);
  asc_hex(PAnsiChar(AnsiString(AscData)),HexData,16);
  result_i:=rf_write(icdev_i,Addr_i,HexData);
   if(result_i<>0) then
      AppendOpRecord('写块'+inttostr(Addr_i)+'数据失败!'+GetErrMsg(result_i))
   else
      AppendOpRecord('写块'+inttostr(Addr_i)+'数据成功!');
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  result_i:Integer;
  snr1:array[0..15]of AnsiChar;
  RecData:array[0..20]of AnsiChar;
begin
  result_i:=rf_card(icdev_i,0,snr1);
  if(result_i=0) then
  begin
     hex_asc(snr1,RecData,16);
     AppendOpRecord('寻卡成功!卡号：'+StrPas(RecData));
  end else
    AppendOpRecord('寻卡失败!'+GetErrMsg(result_i-100));
end;

procedure TForm1.Button5Click(Sender: TObject);
var
 result_i:integer;
begin
  result_i:=rf_reset(icdev_i);
  if(result_i<>0) then
      AppendOpRecord('复位失败!')
  else
      AppendOpRecord('复位成功!');
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  if Button6.Caption='打开设备' then
  begin
    icdev_i:=HB_Open();
    if icdev_i>0 then
    begin
      Button6.Caption:='关闭设备';
      AppendOpRecord('打开设备成功');
    end
    else AppendOpRecord('打开设备失败，错误编码：'+GetErrMsg(icdev_i));
  end
  else
  begin
    if HB_Close()=0 then
    begin
      Button6.Caption:='打开设备';
      AppendOpRecord('关闭设备成功');
    end
    else
    begin
      AppendOpRecord('关闭设备失败，错误编码：'+GetErrMsg(icdev_i));
    end;
  end;
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  result_i:Integer;
  Addr_i:SmallInt;
  Value_i:longint;
  val:array[0..30]of AnsiChar ;
begin
   Addr_i:=StrToInt(edt_Sector.text)*4+strtoint(edt_Addr.Text);
   result_i:=rf_readval(icdev_i,Addr_i,Value_i);
   if(result_i<>0) then
      AppendOpRecord('读值块'+inttostr(Addr_i)+'失败!'+GetErrMsg(result_i))
   else
      AppendOpRecord('读值块'+inttostr(Addr_i)+'成功!值：'+inttostr(Value_i));
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  result_i:Integer;
  Addr_i:SmallInt;
  Value_i:longint;
begin
 Addr_i:=StrToInt(edt_Sector.text)*4+strtoint(edt_Addr.Text);
 Value_i:=strtoint(edt_InitValue.Text);
 result_i:=rf_initval(icdev_i,Addr_i,Value_i);
 if(result_i<>0) then
    AppendOpRecord('初始块'+inttostr(Addr_i)+'值失败!'+GetErrMsg(result_i))
 else
    AppendOpRecord('初始块'+inttostr(Addr_i)+'值成功!');
end;

procedure TForm1.Button9Click(Sender: TObject);
var
  result_i:Integer;
  Addr_i:SmallInt;
  Value_i:longint;
begin
 Addr_i:=StrToInt(edt_Sector.text)*4+strtoint(edt_Addr.Text);
 Value_i:=strtoint(edt_InitValue.Text);
 result_i:=rf_decrement(icdev_i,Addr_i,Value_i);
 if(result_i<>0) then
    AppendOpRecord(inttostr(Addr_i)+'块加值失败!'+GetErrMsg(result_i))
 else
    AppendOpRecord(inttostr(Addr_i)+'块加值成功!');
end;

procedure TForm1.buttonClick(Sender: TObject);
var
  PassA,passB:string;
  Pass_a:array[0..6]of AnsiChar;
  Sector_i,Addr_i,i:SmallInt;
  result_i:Integer;
  HexData:array[0..15] of AnsiChar;
  AscData:string;
begin
  passA:=edt_PassA.Text;
  asc_hex(PAnsiChar(AnsiString(PassA)),Pass_a,6);
  AscData:=edt_WriteData.Text;
  AscData:=rightStr('00000000000000000000000000000000'+AscData,32);
  Addr_i:=0;
  AppendOpRecord('写全卡开始');
  for Sector_i := 0 to 15 do
  begin
    result_i:=rf_authentication_key(icdev_i,0,Sector_i*4,Pass_a);
    if(result_i<>0) then
      AppendOpRecord('扇区"'+IntToStr(Sector_i)+'" 密码A认证失败!'+GetErrMsg(result_i));
    for I := 0 to 2 do
    begin
      Addr_i:=Sector_i*4+i;
      if Addr_i=0 then Continue;
      asc_hex(PAnsiChar(AnsiString(AscData)),HexData,16);
      result_i:=rf_write(icdev_i,Addr_i,HexData);
      if(result_i<>0) then
        AppendOpRecord('块"'+IntToStr(Addr_i)+'" 写数据失败!'+GetErrMsg(result_i));
    end;
  end;
  AppendOpRecord('写全卡完成');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 CheckThread:=ThreaCheckPass.Create;
end;

procedure TForm1.Button10Click(Sender: TObject);
var
  result_i:Integer;
  Addr_i:SmallInt;
  Value_i:longint;
begin
   Addr_i:=StrToInt(edt_Sector.text)*4+strtoint(edt_Addr.Text);
   Value_i:=strtoint(edt_InitValue.Text);
   result_i:=rf_increment(icdev_i,Addr_i,Value_i);
   if(result_i<>0) then
      AppendOpRecord(inttostr(Addr_i)+'块减值失败!'+GetErrMsg(result_i))
   else
      AppendOpRecord(inttostr(Addr_i)+'块减值成功!');
end;

procedure TForm1.Button11Click(Sender: TObject);
var
  result_i:Integer;
  Addr_i:SmallInt;
begin
  Addr_i:=StrToInt(edt_Sector.text)*4+strtoint(edt_Addr.Text);
  result_i:=rf_restore(icdev_i,Addr_i);
  if(result_i<>0) then
      AppendOpRecord(inttostr(Addr_i)+'块回传失败!'+GetErrMsg(result_i))
   else
      AppendOpRecord(inttostr(Addr_i)+'块回传成功!');

end;

procedure TForm1.Button12Click(Sender: TObject);
var
  result_i:Integer;
  Addr_i:SmallInt;
begin
  Addr_i:=StrToInt(edt_Sector.text)*4+strtoint(edt_Addr.Text);
  result_i:=rf_transfer(icdev_i,Addr_i);
  if(result_i<>0) then
      AppendOpRecord(inttostr(Addr_i)+'块传送失败!'+GetErrMsg(result_i))
   else
      AppendOpRecord(inttostr(Addr_i)+'块传送成功!');
end;

procedure TForm1.Button13Click(Sender: TObject);
var
  result_i:Integer;
  Addr_i:SmallInt;
begin
  Addr_i:=StrToInt(edt_Sector.text)*4+strtoint(edt_Addr.Text);
  result_i:=rf_terminal(icdev_i);
  if(result_i<>0) then
      AppendOpRecord('终止失败!'+GetErrMsg(result_i))
   else
      AppendOpRecord('终止成功!');

end;

procedure TForm1.Button14Click(Sender: TObject);
 var
  result_i:Integer;
  HexData:array[0..15] of AnsiChar;
  AscData:array[0..31] of ansichar;
  Addr_i,i,j:SmallInt;
  PassA,passB:string;
  Pass_a:array[0..6]of AnsiChar;
begin
//   Addr_i:=StrToInt(edt_Sector.text)*4+strtoint(edt_Addr.Text);
   passA:=edt_PassA.Text;
   asc_hex(PAnsiChar(AnsiString(PassA)),Pass_a,6);
   for I := 0 to 15 do
   begin
     result_i:=rf_authentication_key(icdev_i,0,i*4,Pass_a);
      if(result_i<>0) then
        AppendOpRecord('扇区"'+IntToStr(i)+'" 密码B认证失败!'+GetErrMsg(result_i))
      else
      begin
        for j := 0 to 3 do
        begin
         Addr_i:=i*4+j;
         result_i:=rf_read(icdev_i,Addr_i,HexData);
         if(result_i<>0) then
            AppendOpRecord('读块'+inttostr(Addr_i)+'数据失败!'+GetErrMsg(result_i))
         else
         begin
            hex_asc(HexData,AscData,16);
            edt_ReadData.Text:=AscData;
            AppendOpRecord('读块'+inttostr(Addr_i)+'读数据成功,数据:');
            AppendOpRecord(AscData);
         end;
        end;
      end;
   end;
end;

procedure TForm1.Button15Click(Sender: TObject);
var
  PassA,passB:string;
  Pass_a:array[0..6]of AnsiChar;
  Sector_i:SmallInt;
  result_i:Integer;
  Ctrl_s:string;
begin
    passA:=Trim(edt_PassA.Text);
    passB:=trim(edt_PassB.Text);
    Ctrl_s:=Trim(edt_Contrl.Text);
    if Length(passA)<>12 then
    begin
      AppendOpRecord('密码A必须为12个字符');
      exit;
    end;
    if Length(passB)<>12 then
    begin
      AppendOpRecord('密码B必须为12个字符');
      exit;
    end;
    if Length(Ctrl_s)<>8 then
    begin
      AppendOpRecord('控制位必须为8个字符');
      exit;
    end;
    edt_WriteData.Text:=PassA+ctrl_s+passB;
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  CheckThread.OnExceCount:=OnExecCount;
  CheckThread.OnThreadExit:=OnThreadExit;
  CheckThread.Resume;
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  if button18.Caption='挂起' then
  begin
    CheckThread.Suspend;
    Button18.Caption:='重启';
  end
  else
  begin
    CheckThread.Resume;
  end;
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  CheckThread.Terminate;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  mm_Record.Clear;
end;

procedure OnExecCount(niCount: UInt64);
begin
   Form1.label4.Caption:=IntToStr(niCount);
end;

procedure OnThreadExit(Data:string);
begin
   Form1.label4.Caption:=Data;
end;

{ ThreaCheckPass }

constructor ThreaCheckPass.Create;
begin
  Inherited Create(True);
end;

procedure ThreaCheckPass.DoExecCount(niCount: UInt64);
begin
   FonExecCount(StrToInt64('$FFFFFFFFFFFF')-niCount);
end;

procedure ThreaCheckPass.DoExit(Data: string);
begin
   FonExit(Data);
end;

procedure ThreaCheckPass.Execute;
var
  pass_i:UInt64;
  Device:TDevice_MT3_S50;
  str:string;
begin
  try
    pass_i:=StrToInt64('$FFFFFFFFFFFF');
    if Device.OpenDevice then
    begin
      while not Terminated do
      begin
        if (Device.SelectCard)  then
        begin
          str:=IntToHex(pass_i,32);
          if Device.VerifyPass(1,1,str,str) then
          begin
            DoExit(str);
            exit;
          end;
          DoExecCount(pass_i);
          dec(pass_i);
        end
        else
          DoExit('寻卡失败');
        if pass_i =0 then
        begin
          DoExit('轮寻结束');
          exit;
        end;
        Sleep(10);
      end;
    end
    else
       DoExit('打开设备失败');
  finally
      device.CloseDevice;
  end;
end;

end.



