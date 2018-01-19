unit MeterDebugDemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls,Device_MT3,PublicCode,Math,StrUtils
  , ExtCtrls,superobject,LogicUnit, Menus;
type
  TForm2 = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Panel5: TPanel;
    Panel1: TPanel;
    GroupBox10: TGroupBox;
    Memo1: TMemo;
    Panel8: TPanel;
    Button13: TButton;
    Button7: TButton;
    GroupBox11: TGroupBox;
    lv_Cmd: TListView;
    Panel4: TPanel;
    Bevel1: TBevel;
    Button3: TButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    Button5: TButton;
    Panel2: TPanel;
    PageControl2: TPageControl;
    Protocol_Interface_Debug: TTabSheet;
    Panel9: TPanel;
    MT3_17A_Debug: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    lb_pl_len: TLabel;
    lb_En_len: TLabel;
    Label4: TLabel;
    Button1: TButton;
    edt_Encrypted: TEdit;
    edt_Plaintext: TEdit;
    Button2: TButton;
    edt_crc: TEdit;
    Button4: TButton;
    Panel3: TPanel;
    Label3: TLabel;
    lb_key_len: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edt_Key: TEdit;
    edt_CheckID: TEdit;
    edt_Commpany: TEdit;
    edt_keyNo: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    PopupMenu3: TPopupMenu;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    Panel6: TPanel;
    Panel7: TPanel;
    GroupBox2: TGroupBox;
    lv_Days: TListView;
    Panel10: TPanel;
    Bevel2: TBevel;
    Label8: TLabel;
    Label9: TLabel;
    edt_Days: TEdit;
    edt_month: TEdit;
    Button20: TButton;
    Button21: TButton;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    edt_OldID: TEdit;
    edt_NewID: TEdit;
    Button22: TButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    Panel11: TPanel;
    GroupBox5: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    edt_newCommpany: TEdit;
    edt_CardNo: TEdit;
    edt_initTimes: TEdit;
    Button6: TButton;
    GroupBox6: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    edt_meterid: TEdit;
    edt_OneValue: TEdit;
    edt_TwoValue: TEdit;
    edt_ThreeValue: TEdit;
    edt_Times: TEdit;
    Button8: TButton;
    GroupBox7: TGroupBox;
    Label27: TLabel;
    Label26: TLabel;
    Button9: TButton;
    dt_Date: TDateTimePicker;
    dt_Timer: TDateTimePicker;
    Button12: TButton;
    GroupBox9: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    edt_SuperPrice: TEdit;
    edt_SuperValue: TEdit;
    Button11: TButton;
    GroupBox13: TGroupBox;
    edt_TZL: TEdit;
    edt_BJL: TEdit;
    edt_MaxCZL: TEdit;
    chkp5: TCheckBox;
    chkp6: TCheckBox;
    chkp7: TCheckBox;
    chkp1: TCheckBox;
    edt_Float: TEdit;
    edt_CTime: TEdit;
    chkp2: TCheckBox;
    chkp4: TCheckBox;
    edt_DTime: TEdit;
    edt_MinGasTime: TEdit;
    chkp3: TCheckBox;
    GroupBox8: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    edt_UpKeyValue: TEdit;
    edt_UpKeyNo: TEdit;
    Button10: TButton;
    GroupBox12: TGroupBox;
    chk1: TCheckBox;
    chk2: TCheckBox;
    chk6: TCheckBox;
    chk7: TCheckBox;
    chk8: TCheckBox;
    chk3: TCheckBox;
    chk4: TCheckBox;
    chk5: TCheckBox;
    edt_devName: TEdit;
    edt_gcln: TEdit;
    edt_OpenTime: TEdit;
    edt_CloseTime: TEdit;
    edt_WrokMod: TEdit;
    edt_maxGas: TEdit;
    edt_MinGas: TEdit;
    edt_mcdl: TEdit;
    Button24: TButton;
    Button25: TButton;
    GroupBox3: TGroupBox;
    Button14: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button23: TButton;
    GroupBox14: TGroupBox;
    Button26: TButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Button15: TButton;
    Button27: TButton;
    chkp8: TCheckBox;
    edt_TZXX: TEdit;
    chkp9: TCheckBox;
    Panel12: TPanel;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edt_PlaintextKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_KeyKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edt_EncryptedKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
  private
    { Private declarations }
    procedure AppendCmd(CmdName,CmdData:string);
    procedure TraversalJson(Data:string);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.AppendCmd(CmdName,CmdData: string);
var
  Item:TListItem;
begin
  Item:=TListItem.Create(lv_Cmd.Items);
  item.Caption:=IntToStr(lv_Cmd.Items.Count+1);
  Item.SubItems.Add(IntToStr(lv_Cmd.Items.Count+1));
  Item.SubItems.Add(CmdName);
  Item.SubItems.Add(CmdData);
  lv_Cmd.Items.AddItem(Item);
end;

procedure TForm2.Button10Click(Sender: TObject);
var
 Json:ISuperObject;
begin
 Json:=SO();
 Json.S[JSCmd]:=_DecUpdateKey;
 Json.I[JSUpKeyNo]:=StrToInt(edt_UpKeyNo.Text);
 Json.s[JsUpKeyValue]:=(edt_UpKeyValue.Text);
 AppendCmd('密钥设置',json.AsString);
end;

procedure TForm2.Button11Click(Sender: TObject);
var
 Json:ISuperObject;
begin
 Json:=SO();
 Json.S[JSCmd]:=_DecSupeRecharge;
 Json.S[JSSupeValue]:=FormatFloat('0.00',strtofloat(edt_SuperValue.Text));
 Json.S[JSPrice]:=FormatFloat('0.00',strtofloat(edt_SuperPrice.Text));
 AppendCmd('超级充值',json.AsString);
end;

procedure TForm2.Button12Click(Sender: TObject);
begin
  dt_Date.Date:=Now();
  dt_Timer.Time:=Now();
  //ShowMessage(inttostr(DayOfWeek(Now)));
//  ShowMessage(FormatdateTime('ddd',now));
end;

procedure TForm2.Button13Click(Sender: TObject);
var
    Protocol:TBusinessInterface;
    Data,key:string;
    rt:integer;
begin
 Memo1.Clear;
 key:=Trim(edt_Key.Text);
 Protocol:=TBusinessInterface.Create;
 Protocol.ReadData(key,Data);
 Memo1.Lines.Add(Data);
 Button7Click(nil);
end;

procedure TForm2.Button14Click(Sender: TObject);
var
 Json:ISuperObject;
begin
 Json:=SO();
 Json.S[JSCmd]:=_DecClear;
 AppendCmd('清零',json.AsString);
end;

procedure TForm2.Button15Click(Sender: TObject);
begin
  edt_ThreeValue.Text:=edt_TwoValue.Text;
  edt_TwoValue.Text:=edt_OneValue.Text;
  edt_Times.Text:=inttostr(strtoint(edt_Times.Text)+1);
end;

procedure TForm2.Button16Click(Sender: TObject);
var
 Json:ISuperObject;
begin
 Json:=SO();
 Json.S[JSCmd]:=_DecTest;
 AppendCmd('测试',json.AsString);
end;

procedure TForm2.Button17Click(Sender: TObject);
var
 Json:ISuperObject;
begin
 Json:=SO();
 Json.S[JSCmd]:=_DecSelect;
 AppendCmd('查询',json.AsString);

end;

procedure TForm2.Button18Click(Sender: TObject);
var
 Json:ISuperObject;
begin
 Json:=SO();
 Json.S[JSCmd]:=_DecUnlock;
 AppendCmd('解锁',json.AsString);
end;

procedure TForm2.Button19Click(Sender: TObject);
var
 Json:ISuperObject;
begin
 Json:=SO();
 Json.S[JSCmd]:=_DecTransfer;
 AppendCmd('转移',json.AsString);
end;

procedure TForm2.Button1Click(Sender: TObject);
var
  AscData_c:array[0..199] of Ansichar;
  HexData_c:array[0..99] of Ansichar;
  AscKey_c:array[0..31] of Ansichar;
  HexKey_c:array[0..15] of AnsiChar;
  Len_i:Integer;
  DataLen_i:SmallInt;
  Key_s,Data_s:string;
begin
  fillchar(AscData_c,199,0);
  fillchar(HexData_c,99,0);
  Key_s:=trim(edt_Key.Text);
  Data_s:=Trim(edt_Plaintext.Text);
  asc_hex(PAnsiChar(AnsiString(Key_s)),HexKey_c,16);
  Len_i:=Length(Data_s);
  if Len_i mod 2<>0 then
  begin
    ShowMessage('原文数据长度必须为2的倍数');
    exit;
  end;
  if Len_i<16 then
  begin
    ShowMessage('原文数据长度最小8个字节');
    exit;
  end;
  DataLen_i:=ceil(len_i/2/4);
  Data_s:=leftstr(Data_s+'00000000',dataLen_i*8);
  len_i:=Trunc(dataLen_i*8/2);
  asc_hex(PAnsiChar(AnsiString(Data_s)),HexData_c,len_i);
  btea(0,HexData_c,DataLen_i,HexKey_c);
  hex_asc(HexData_c,AscData_c,len_i);
  edt_Encrypted.Text:=AscData_c;
  lb_En_len.Caption:=floattostr(Length(edt_Encrypted.Text)/2)+' Byte';
end;

procedure TForm2.Button20Click(Sender: TObject);
var
  Item:TListItem;
begin
  Item:=TListItem.Create(lv_Days.Items);
  item.Caption:=(edt_month.Text);
  Item.SubItems.Add(edt_month.Text);
  Item.SubItems.Add(edt_Days.Text);
  lv_Days.Items.AddItem(Item);
end;

procedure TForm2.Button21Click(Sender: TObject);
var
 Json,JsonItem,JsonDay:ISuperObject;
 i:Integer;
begin
 Json:=SO();
 JsonItem:=SA([]);
 Json.S[JSCmd]:=_DecSetHolidays;
  for I := 0 to lv_Days.Items.Count-1 do
  begin
    JsonDay:=SO();
    jsonday.S[jsMonth]:=lv_Days.Items[i].SubItems[0];
    jsonday.S[jsdays]:=lv_Days.Items[i].SubItems[1];
    JsonItem.AsArray.Add(JsonDay);
  end;
  json.o[JsJQ]:=JsonItem;
  AppendCmd('节日设置',json.AsString);
end;

procedure TForm2.Button22Click(Sender: TObject);
var
 Json,JsonItem,JsonDay:ISuperObject;
 i:Integer;
begin
  Json:=SO();
  Json.S[JSCmd]:=_DecSetID;
  if RadioButton6.Checked then   Json.I[JsIDOperType]:=0 else  Json.I[JsIDOperType]:=1;
  Json.S[JsOldID]:=edt_OldID.Text;
  Json.S[JsNewID]:=edt_NewID.Text;
  AppendCmd('ID设置',json.AsString);
end;

procedure TForm2.Button23Click(Sender: TObject);
var
 Json:ISuperObject;
begin
 Json:=SO();
 Json.S[JSCmd]:=_DecSetvalveState;
 AppendCmd('关阀',json.AsString);
end;

procedure TForm2.Button24Click(Sender: TObject);
var
  Temp_s:string;
  json:ISuperObject;
begin
  if chk1.Checked then
     Temp_s:=Temp_s+',1';
  if chk2.Checked then
     Temp_s:=Temp_s+',2';
  if chk3.Checked then
    Temp_s:=Temp_s+',3';
  if chk4.Checked then
    Temp_s:=Temp_s+',4';
  if chk5.Checked then
    Temp_s:=Temp_s+',5';
  if chk6.Checked then
    Temp_s:=Temp_s+',6';
  if chk7.Checked then
    Temp_s:=Temp_s+',7';
  if chk8.Checked then
    Temp_s:=Temp_s+',8';
  if Temp_s='' then
  begin
    exit;
  end;
  if LeftStr(Temp_s,1)=',' then
    temp_s:=rightstr(temp_s,Length(Temp_s)-1);
  json:=SO();
  json.S[JSCmd]:=_DcProduceSet;
  json.S[JsParmaters]:=temp_s;
  json.S[JsDeviceName]:=trim(edt_devName.Text);
  json.S[JsQN]:=trim(edt_gcln.Text);

  json.S[JsQMAX]:=trim(edt_maxGas.Text);
  json.S[JsQMIN]:=trim(edt_MinGas.Text);

  json.S[JsQS]:=trim(edt_mcdl.Text);
  json.S[JsVavleOnTime]:=trim(edt_OpenTime.Text);
  json.S[JsVavleOffTime]:=trim(edt_CloseTime.Text);
  json.S[JsDWM]:=trim(edt_WrokMod.Text);

  AppendCmd('生产设置',json.AsString);
end;

procedure TForm2.Button25Click(Sender: TObject);
var
  Temp_s:string;
  json:ISuperObject;
begin
  if chkp1.Checked then
     Temp_s:=Temp_s+',1';
  if chkp2.Checked then
     Temp_s:=Temp_s+',2';
  if chkp3.Checked then
    Temp_s:=Temp_s+',3';
  if chkp4.Checked then
    Temp_s:=Temp_s+',4';
  if chkp5.Checked then
    Temp_s:=Temp_s+',5';
  if chkp6.Checked then
    Temp_s:=Temp_s+',6';
  if chkp7.Checked then
    Temp_s:=Temp_s+',7';
  if chkp8.Checked then
    Temp_s:=Temp_s+',8';
  if chkp9.Checked then
    Temp_s:=Temp_s+',9';
  if Temp_s='' then
  begin
    exit;
  end;
  if LeftStr(Temp_s,1)=',' then
    temp_s:=rightstr(temp_s,Length(Temp_s)-1);
  json:=SO();
  json.S[JSCmd]:=_DecSetParameters;
  json.S[JsParmaters]:=temp_s;
  json.S[JsPS]:=Trim(edt_Float.Text);
  json.S[JsConstNoFlowTimeOut]:=Trim(edt_CTime.Text);
  json.S[JsConstSmallFlowTimeOut]:=Trim(edt_MinGasTime.Text);
  json.S[JsConstNoFlowTimeOutEx]:=Trim(edt_DTime.Text);
  json.S[JsMaxOverageVM]:=Trim(edt_MaxCZL.Text);
  json.S[JsWarnSetOverageVM]:=Trim(edt_BJL.Text);
  json.S[JsOffSetOverageVM]:=Trim(edt_TZL.Text);
  json.S[JsOverdraftLimit]:=Trim(edt_TZXX.Text);
  if RadioButton10.Checked then   json.S[JsSwitchSuperflow]:='1' else  json.S[JsSwitchSuperflow]:='0';
  AppendCmd('参数设置',json.AsString);
end;

procedure TForm2.Button26Click(Sender: TObject);
var
 Json:ISuperObject;
begin
 Json:=SO();
 Json.S[JSCmd]:=_DecOutInit;
 if RadioButton8.Checked then  Json.I[JSStage]:=0 else    Json.I[JSStage]:=1;
 AppendCmd('阶段变更',json.AsString);
end;

procedure TForm2.Button27Click(Sender: TObject);
begin
  edt_ThreeValue.Text:='0';
  edt_TwoValue.Text:='0';
  edt_Times.Text:='1';
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  AscData_c:array[0..200] of Ansichar;
  HexData_c:array[0..100] of Ansichar;
  AscKey_c:array[0..31] of Ansichar;
  HexKey_c:array[0..15] of AnsiChar;
  Len_i:Integer;
  DataLen_i:SmallInt;
  Key_s,Data_s:string;
begin
  fillchar(AscData_c,200,0);
  fillchar(HexData_c,200,0);
  Key_s:=trim(edt_Key.Text);
  Data_s:=Trim(edt_Encrypted.Text);
  asc_hex(PAnsiChar(AnsiString(Key_s)),HexKey_c,16);
  Len_i:=Length(Data_s);
  if Len_i mod 2<>0 then
  begin
    ShowMessage('密文数据长度必须为2的倍数');
    exit;
  end;
  DataLen_i:=ceil(len_i/2/4);
  asc_hex(PAnsiChar(AnsiString(Data_s)),HexData_c,Trunc(Len_i/2));
  btea(1,HexData_c,DataLen_i,HexKey_c);
  hex_asc(HexData_c,AscData_c,Trunc(Len_i/2));
  edt_Plaintext.Text:=AscData_c;
  lb_En_len.Caption:=floattostr(Length(edt_Plaintext.Text)/2)+' Byte';

end;

procedure TForm2.Button3Click(Sender: TObject);
var
  Json,JsonCMD,JsonItem,JsonHead:ISuperObject;
  Protocol:TBusinessInterface;
  ErrMsg:string;
  rt:Integer;
  I,mod_i: Integer;
begin
  if lv_Cmd.Items.Count<=0 then begin exit; end;
  
  Protocol:=TBusinessInterface.create;
  Json:=SO();
  JsonHead:=SO();
  JsonCMD :=SA([]);  
  JsonHead.S[JSVer]:='100';
  JsonHead.S[JSID]:=edt_CheckID.Text;
  JsonHead.S[JSCommpany]:=edt_Commpany.Text;
  if RadioButton1.Checked then
    JsonHead.S[JSPrType]:='0'
  else if RadioButton2.Checked then
    jsonhead.S[JSPrType]:='1'
  else
    jsonhead.S[JSPrType]:='2';
  JsonHead.S[JSKeyNo]:=edt_KeyNo.Text;
  JsonHead.S[jsKeyValue]:=edt_Key.Text;
  JsonHead.S[JsMeterVer]:='0'; 
  for I := 0 to lv_Cmd.Items.Count-1 do 
  begin    
    JsonItem:=SO(lv_Cmd.Items[i].SubItems[2]);
    JsonCMD.AsArray.Add(JsonItem);
  end;
  Json.O[JSHead]:=JsonHead;
  Json.o[JsInfo]:=JsonCMD;
  if RadioButton4.Checked then mod_i:=0 else mod_i:=1;
  rt:=Protocol.writeData(mod_i,Json.AsString,ErrMsg);
  ShowMessage(inttostr(rt)+','+ErrMsg);

end;

procedure TForm2.Button4Click(Sender: TObject);
var
  AscData_c:array[0..199] of Ansichar;
  HexData_c:array[0..99] of Ansichar;
  Len_i:Integer;
  Data_s:string;
begin
  Data_s:=trim(edt_Plaintext.Text);
  Len_i:=Trunc(Length(Data_s)/2);
  asc_hex(PAnsiChar(AnsiString(Data_s)),HexData_c,Len_i);
  edt_crc.Text:=IntToHex(crc_sum(HexData_c,Len_i),4);
end;

procedure TForm2.Button5Click(Sender: TObject);
var
  Protocol:TBusinessInterface;
  rt:Integer;
begin
  Protocol:=TBusinessInterface.create;
  rt:=Protocol.InitCard();
  ShowMessage(IntToStr(rt));
end;

procedure TForm2.Button6Click(Sender: TObject);
var
  Json:ISuperObject;

begin
  Json:=SO();
  Json.S[JSCmd]:=_DecAssociativeUse;
  Json.S[JSNewCommpany]:=edt_newCommpany.Text;
  Json.S[JSCardNo]:=edt_CardNo.Text;
  Json.i[JsInitTimes]:=StrToInt(edt_initTimes.Text);

  AppendCmd('开户',json.AsString);
end;

procedure TForm2.Button7Click(Sender: TObject);
var
  item,json,jo: ISuperObject;
  tt:TSuperArray;
  i,j:integer;
begin
  json := SO(Memo1.Text);
  memo1.Clear;
  Memo1.Lines.Add('RetCode:'+json[JsReturnCode].AsString);
  Memo1.Lines.Add('RetMsg:'+json[JsReturnMsg].AsString);
  Memo1.Lines.Add('Head:');
  if Pos(JSHead,json.AsString)>0 then
  begin
    for item in json[JsHead] do
      Memo1.Lines.Add(item.AsJSon(False, False));
    TraversalJson(json[JsHead].AsString);
  end;
  Memo1.Lines.Add('Cmd:');
  if Pos(jsinfo,json.AsString)>0 then
  begin
    tt:=json[jsinfo].AsArray;
    for i:=0 to tt.Length-1 do
    begin
      Memo1.Lines.Add('  Cmd'+inttostr(i+1)+':');
      TraversalJson(tt[i].AsString);
    end;
  end;

  Memo1.Lines.Add('Answer:');
  if Pos(JsAnswer,json.AsString)>0 then
  begin
    tt:=json[JsAnswer].AsArray;
    if tt<>nil then
    begin
      for i:=0 to tt.Length-1 do
      begin
        Memo1.Lines.Add('  Answer'+inttostr(i+1)+':');
        TraversalJson(tt[i].AsString);
      end;
    end
    else
    begin
     TraversalJson(json[JsAnswer].AsString);
    end;
  end;

  Memo1.Lines.Add('MeterState:');
  if Pos(JsMeterState,json.AsString)>0 then
  begin
    tt:=json[JsMeterState].AsArray;
    if tt<>nil then
    begin
      for i:=0 to tt.Length-1 do
      begin
        TraversalJson(tt[i].AsString);
      end;
    end
    else
    begin
     TraversalJson(json[JsMeterState].AsString);
    end;
  end;
end;

procedure TForm2.TraversalJson(Data:string);
var
  jo:isuperobject;
  item: TSuperAvlEntry;
begin
  jo := SO(Data);
  for item in jo.AsObject do
    memo1.Lines.Add(Format('      %s : %s', [item.Name, item.Value.AsString]));


end;

procedure TForm2.Button8Click(Sender: TObject);
var
  Json:ISuperObject;
begin
  Json:=SO();
  Json.S[JSCmd]:=_DecRecharge;
  Json.S[JSMeterID]:=edt_meterid.Text;
  Json.S[JSOneValue]:=FormatFloat('0.00',strtofloat(edt_onevalue.Text));
  Json.S[JSTwoValue]:=FormatFloat('0.00',strtofloat(edt_Twovalue.Text));
  Json.S[JSThreeValue]:=FormatFloat('0.00',strtofloat(edt_Threevalue.Text));
  Json.i[JSTimes]:=StrToInt(edt_Times.Text);
  AppendCmd('充值',json.AsString);
end;

procedure TForm2.Button9Click(Sender: TObject);
var
  Json:ISuperObject;
  DT:string;
begin
  Json:=SO();
  DT:= DateToStr(dt_Date.Date)+' '+ TimeToStr(dt_Timer.Time);
  Json.S[JsDateTime]:=DT;
  Json.S[JSCmd]:=_DecSetDateTime;
  AppendCmd('时间设置',json.AsString);
end;

procedure TForm2.edt_EncryptedKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   lb_En_len.Caption:=floattostr(Length(edt_Encrypted.Text)/2)+' Byte';
end;

procedure TForm2.edt_KeyKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  lb_Key_len.Caption:=floattostr(Length(edt_Key.Text)/2)+' Byte';
end;

procedure TForm2.edt_PlaintextKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   lb_Pl_len.Caption:=floattostr(Length(edt_Plaintext.Text)/2)+' Byte';
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  dt_Date.Date:=Now();
  dt_Timer.Time:=Now();
end;

procedure TForm2.N10Click(Sender: TObject);
begin
  memo1.SelectAll;
end;

procedure TForm2.N1Click(Sender: TObject);
begin
  if lv_Cmd.Selected<>nil then
  begin
    lv_Cmd.Items.Delete(lv_Cmd.ItemIndex);
  end;
end;

procedure TForm2.N3Click(Sender: TObject);
begin
  lv_Cmd.Clear;
end;

procedure TForm2.N4Click(Sender: TObject);
begin
  Memo1.CopyToClipboard;
end;

procedure TForm2.N6Click(Sender: TObject);
begin
  Memo1.Clear;
end;

procedure TForm2.N7Click(Sender: TObject);
begin
  if lv_Days.Selected<>nil then
    lv_days.Items.Delete(lv_Days.ItemIndex);
end;

procedure TForm2.N9Click(Sender: TObject);
begin
  lv_days.Items.Clear;
end;

end.
