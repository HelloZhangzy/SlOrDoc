unit PublicCode;

interface

uses IniFiles,SysUtils,StrUtils,superobject,superxmlparser;

 //{"head":"{协议头参数项}","CMD":"[{"命令项"},{"命令项"}]"}
 {$REGION 'JSON项定义'}
  const
    //主项
    JSHead='Head';
    JsInfo='Cmd';
    JsAnswer='Answer';
    JsMeterState='MeterState';
    //协议头参数项
    JSVer='prVer';    //版本
    JSID='Identity'; //身份ID
    JSCommpany='Commpany';//当前公司编码
    JSPrType='ProtocolType'; //协议类型 0：业务数据为主 1：配置数据为主 2:超级卡
    JSKeyNo='KeyNo'; //加密密钥号
    jsKeyValue='KeyValue';//加密密钥
    JsMeterVer='MeterVer';//气表版号

    {$REGION '命令项'}
     JSCmd='CmdCode';
    //开户项参数
     JSNewCommpany='NewCommpany';  //公司编号
     JSCardNo='CardNo';  //卡号
     JsInitTimes='ItitTimes'; //初始充值次数
     //充值参数
      JSMeterID='MeterID';
      JSOneValue='OneValue';
      JSTwoValue='TwoValue';
      JSThreeValue='ThreeValue';
      JSTimes='Times';
      //超级充值项
      JSPrice='Price';
      JSSupeValue='SupeValue';
      //密钥升级
      JSUpKeyNo='UpKeyNo';
      JsUpKeyValue='UpKeyValue';
      //时间设置
      JsDateTime='Date';
      JsWeek='Week';
      //节日设置
      JsJQ='JQ';
      JsDays='JQDays';
      jsMonth='JQMonth';
      //ID设置
      JsIDOperType='IDOperType';
      JsOldID='OldID';
      JsNewID='NewID';
      //阶段变更
      JSStage='Stage';
      //生产设置
      JsParmaters='Parmaters';
      JsDeviceName='DeviceName';
      JsQN='QN';
      JsQMAX='QMAX';
      JsQMIN='QMIN';
      JsQS='QS';
      JsVavleOnTime='VavleOnTime';
      JsVavleOffTime='VavleOffTime';
      JsDWM='DWM';
      //参数设置
      JsPS='PS';
      JsConstNoFlowTimeOut='ConstNoFlowTimeOut';
      JsConstSmallFlowTimeOut='ConstSmallFlowTimeOut';
      JsConstNoFlowTimeOutEx='ConstNoFlowTimeOutEx';
      JsMaxOverageVM='MaxOverageVM';
      JsWarnSetOverageVM='WarnSetOverageVM';
      JsOffSetOverageVM='OffSetOverageVM';
      JsOverdraftLimit='OverdraftLimit';
      JsSwitchSuperflow='SwitchSuperflow';
      //解析信息
      JsErrMsg='ErrMsg';
      JsErrCode='ErrCode';
      JsReturnCode='RetCode';
      JsReturnMsg='RetMsg';
      //表状态
      JsStatus='Status'; //	设备状态
      Jsdeviceid='deviceid';//	设备id
      JsWarnSetOVM='WarnSetOVM';//	报警动作点
      JsOffSetOVM='OffSetOVM';//	关阀动作点
      JsOVerageVM='OVerageVM';//	余量，余额
      JSLastBSNV='LastBSNV';//充值次数
//      reverse01	预留
      JsTotalVolume='TotalVolume';//	总量（方量）
      JsEvent='event';//	事件
      Jslock='lock';//	锁状态
      JsPaymentVM1='Payment1';//	充值记录
      JsPaymentVM2='Payment2';//	充值记录
      JsPaymentVM3='Payment3';//	充值记录
      JsPaymentVM4='Payment4';//	充值记录
      JsPaymentVM5='Payment5';//	充值记录
      JsPaymentVM6='Payment6';//	充值记录
      //应答
      JsExec='Exec';

    {$ENDREGION}


 {$ENDREGION}

 {$REGION '指令编码'}
  Const
   _AssociativeUse='A1';   //开户
   _Recharge='A2';//充值
   _UpdateKey='B1';//升级密解
   _SupeRecharge='B2';//超级充值
   _SetDateTime='B0';//设置时间
   _SetHolidays='B3';//设置假期
   _SetvalveState='B4';//设置阀状态
   _SetPrices='B5';//设置价格
   _OutInit='B6';//出厂初始化
   _SetID='B7';//设置ID
   _Test='B8';//测试
   _Select='B9';//查询
   _Clear='BA';//清零
   _Unlock='BB';//解锁
   _Transfer='BC';//转移
   _SetParameters='BD';//参数设置
   _ProduceSet='BE';//生产设置

   _DecAssociativeUse='1';   //开户
   _DecRecharge='2';//充值
   _DecUpdateKey='3';//升级密解
   _DecSupeRecharge='4';//超级充值
   _DecSetDateTime='5';//设置时间
   _DecSetHolidays='6';//设置假期
   _DecSetvalveState='7';//设置阀状态
   _DecSetPrices='8';//设置价格
   _DecOutInit='9';//出厂初始化
   _DecSetID='10';//设置ID
   _DecTest='11';//测试
   _DecSelect='12';//查询
   _DecClear='13';//清零
   _DecUnlock='14';//解锁
   _DecTransfer='15';//转移
   _DecSetParameters='16';//参数设置
   _DcProduceSet='17';//生产设置

  OffReason:array[0..14] of string=('无事件关阀','硬件故障关阀','低压关阀','高压关阀','无流量超时关阀','小流量超时',
		'过流关阀',		'持续流量关阀',		'余气量不足关阀',		'余气量不足关阀',		'余额不足关阀',		'余额不足关阀',		'强磁关阀',
		'外部信号(报警器等，未使用)',		'服务商关阀');
  Noflow:array[0..2] of string=('0：无','1：超时，按钮解锁','2：超时，解锁卡解');
  HifhtFlow:array[0..1] of string=('0：无','1：过流，按钮解锁');
  OverageV:array[0..2] of string=('0：无','1：提示关阀，按钮解锁','2：关阀，充值解锁');
  OverageM:array[0..2] of string=('0：无','1：提示关阀，按钮解锁','2：关阀，充值解锁');
  StrongMagnetic :array[0..5] of string=('0：无','1：强磁关阀，按钮解锁','2：强磁关阀，按钮解锁','3：强磁关阀，按钮解锁','4：强磁关阀，按钮解锁','5：强磁锁定，解锁卡解锁');

  EvenInfo:array[0..19] of string=('bOffReason', 'bPower1On ',      'bPower1Off',      'bPower1LoWarning',      'bPower1LoOff',
        'bPower1OvWarning',      'bPower1OvOff',      'bStrongMagnetic',      'bStrongElectric',     'bHightFlow',      'bConstUsedOverTime',
      'bSmallConstOverTime',      'bNoFlowOverTime',      'bOVnotEnoughWarning',      'bOVnotEnoughOFF',      'bOMnotEnoughWarning',      'bOMnotEnoughOFF',
      'bSeverOff',      'bSeverOn',      'bFlowPulseOffTimeOut');

  LockInfo:array[0..11] of string=('bNoflow',			 'bHifhtFlow',			 'bOverageV',			 'bOverageM',			 'bStrongMagnetic',       'bPowerDown',
       'bPowerHight',			 'bSeverOff',			 'bSeverOn',			 'bSmallFlow',			 'bConstUsedOverTime',			 'bFlowPulseOffTimeOut');

  type TCmdEnum=(FF,A1,A2,B1,B2,B0,B3,B4,B5,B6,B7,B8,B9,BA,BB,BC,BD,BE,FE);



  type
    TSelectData=record
        HardWareVer:array[0..3] of Byte;			//硬件版本号
        SoftWareVer:array[0..3] of Byte;			//软件版本号
        ProtocolVer:array[0..3] of Byte;			//协议版本号
        SN:array[0..15] of Byte;					//设备序列号
        DeviceName:array[0..15] of Byte;			//设备名称或者型号
        QN:Word;						//标称流量，
        QMAX:Word;					//最大流量，
        QMIN:Word;					//最小流量，
        QS:Word;						//脉冲当量，
        MMR:Word;					//最大测量(显示)范围，
        VavleOnTime:Word;			//开阀门需要的时间,s·
        VavleOffTime:Word;			//关阀门需要的时间,s·
        xreverse00:Byte;				//预留，对齐
        Superflow:Byte;				//预留，对齐
        DWM:Word;					//工作模式，普通抄表模式，气量模式等
        PS:Word;						//最小计价单位，与硬件信息无关
        ConstFlowTimeOut:Word;		//超时设置
        ConstNoFlowTimeOut:Word;		//长时间不用气设置，
        ConstSmallFlowTimeOut:Word;	//长时间小流量
        ConstNoFlowTimeOutEx:Word;				//预留，对齐
        SetpPrice:array[0..5] of integer;			//阶梯价格
        SetpVolume:array[0..5] of integer;			//阶梯价格用量
        MaxOverageVM:Integer;			//最大屯气量
        rdPeriod:Word;			//结算周期
             xreverse001:Byte;
             xreverse002:Byte;
        ReadTime:array[0..3] of Byte;			//结算时间
        PriceCoeff:array[0..11] of Word;			//调价系数，以及调价算法
        WarnSetOverageVM:Integer;
        OffSetOverageVM:Integer;
        LimitOffsetVM:integer;
        ID:UInt32;						//设备id
        userID:UInt32;				//用户id
        keyIndex:Byte;			//秘钥等级，密匙索引
             xreverse0:Byte;
          CompanyCode:Word;				//用户id
        cardKeyCreatKey:array [0..15] of Byte;				//ic卡密码，
        DefaultKey:array [0..15] of Byte;				//厂家,	针对des 128bits
        userKey:array [0..15] of Byte;				//用户秘钥
        YY:Byte;				//上次结算年
        MM:Byte;              //上次结算月
        DLCS:Word;					//设备状态生命周期,可兼容S=ABCDE
        OVerageVM:Integer;			//余量
        LastBSNVM:Integer;	   			//上次充值业务流水号
        TotalVolume:Integer;			//总量
        VolumePerMon:array[0..5] of Integer;		//最近6月历史用量,方量
        TotalPayment:Integer;			//总金额
        //MoneyPerMon:array[0..5]of Integer;			//最近6月历史用量,金额
        MoneyPerMon1:Integer;			//最近6月历史用量,金额
        MoneyPerMon2:Integer;
        MoneyPerMon3:Integer;
        MoneyPerMon4:Integer;
        MoneyPerMon5:Integer;
        MoneyPerMon6:Integer;
        event:Integer;				//事件记录
        lock:Integer;				//锁定记录
        PaymentVM:array[0..5] of Integer;
        PaymentVMBSNM:array[0..5] of Integer;
        HolidayInf:array[0..47]of Byte;			//节假日信息
        crc:Word;
    end;
     PSelectData =^TSelectData;

  TSelectDataStr=Class
      C_HardWareVer:String;			//硬件版本号
      C_SoftWareVer:String;			//软件版本号
      c_ProtocolVer:String;			//协议版本号
      C_SN:String;					//设备序列号
      C_DeviceName:String;			//设备名称或者型号
      C_QN:Word;						//标称流量，
      C_QMAX:Word;					//最大流量，
      C_QMIN:Word;					//最小流量，
      C_QS:Word;						//脉冲当量，
      C_MMR:Word;					//最大测量(显示)范围，
      C_VavleOnTime:Word;			//开阀门需要的时间,s·
      C_VavleOffTime:Word;			//关阀门需要的时间,s·
      C_xreverse00:Byte;				//预留，对齐
      C_Superflow:Byte;				//预留，对齐
      c_DWM:Word;					//工作模式，普通抄表模式，气量模式等
      C_PS:Word;						//最小计价单位，与硬件信息无关
      c_ConstFlowTimeOut:Word;		//超时设置
      c_ConstNoFlowTimeOut:Word;		//长时间不用气设置，
      c_ConstSmallFlowTimeOut:Word;	//长时间小流量
      c_ConstNoFlowTimeOutEx:Word;				//预留，对齐
      c_SetpPrice:String;			//阶梯价格
      c_SetpVolume:String;			//阶梯价格用量
      c_MaxOverageVM:Integer;			//最大屯气量
      c_rdPeriod:Word;			//结算周期
      c_xreverse001:Byte;
      c_xreverse002:Byte;
      c_ReadTime:String;			//结算时间
      c_PriceCoeff:String;			//调价系数，以及调价算法
      c_WarnSetOverageVM:Integer;
      c_OffSetOverageVM:Integer;
      C_LimitOffsetVM:integer;
      c_ID:UInt32;						//设备id
      c_userID:UInt32;				//用户id
      c_keyIndex:Byte;			//秘钥等级，密匙索引
      c_xreverse0:Byte;
      c_CompanyCode:Word;				//用户id
      c_cardKeyCreatKey:String;				//ic卡密码，
      c_DefaultKey:String;				//厂家,	针对des 128bits
      c_userKey:String;				//用户秘钥
      c_YY:Byte;				//上次结算年
      c_MM:Byte;              //上次结算月
      c_DLCS:Word;					//设备状态生命周期,可兼容S=ABCDE
      c_OVerageVM:Integer;			//余量
      c_LastBSNVM:Integer;	   			//上次充值业务流水号
      c_TotalVolume:Integer;			//总量
      c_VolumePerMon1:Integer;		//最近6月历史用量,方量
      c_VolumePerMon2:Integer;		//最近6月历史用量,方量
      c_VolumePerMon3:Integer;		//最近6月历史用量,方量
      c_VolumePerMon4:Integer;		//最近6月历史用量,方量
      c_VolumePerMon5:Integer;		//最近6月历史用量,方量
      c_VolumePerMon6:Integer;		//最近6月历史用量,方量
      c_TotalPayment:Integer;			//总金额
      c_MoneyPerMon1:Integer;			//最近6月历史用量,金额
      c_MoneyPerMon2:Integer;
      c_MoneyPerMon3:Integer;
      c_MoneyPerMon4:Integer;
      c_MoneyPerMon5:Integer;
      c_MoneyPerMon6:Integer;
      c_event:Integer;				//事件记录
      c_eventInfo:string;
      c_lock:Integer;				//锁定记录
      c_lockInfo:string;
      c_PaymentVM1:Integer;
      c_PaymentVM2:Integer;
      c_PaymentVM3:Integer;
      c_PaymentVM4:Integer;
      c_PaymentVM5:Integer;
      c_PaymentVM6:Integer;
      c_PaymentVMBSNM1:Integer;
      c_PaymentVMBSNM2:Integer;
      c_PaymentVMBSNM3:Integer;
      c_PaymentVMBSNM4:Integer;
      c_PaymentVMBSNM5:Integer;
      c_PaymentVMBSNM6:Integer;
      c_HolidayInf:String;			//节假日信息
      c_crc:Word;
    end;

 {$ENDREGION}

 {$REGION 'Key'}
    procedure btea(Mod_i:SmallInt;Data:PAnsiChar;Len_i:SmallInt;Key:PAnsiChar);cdecl;far;external 'XXTea.dll';
    function  crc_sum(puchMsg:PAnsiChar;usDataLen:Word):Word;cdecl;far;external 'XXTea.dll';
 {$ENDREGION}

  Procedure AppendTxt(Str:String;FileName:String);

  function HexToBit(msData: string; miLen: Integer): string;
  {******二进制转十进制}
  function BitToHex(msData: string): Integer;

  function MaxToMin(Data_s:string):string;
  function MinToMax(Data_s:string):string;
   //10进制与16进制互转
  function hex_asc(HexStr: PAnsiChar;var AscStr: array of AnsiChar;lengths: smallint):smallint;
  function asc_hex(ascStr: PAnsiChar;var HexStr: array of AnsiChar;lengths: smallint):smallint;stdcall;
  function RandomVoerride: string;
  function StrToASCII(Data: string): string;
  function ASCIIToStr(Data: string): string;

  function RecordToClass(Rec:TSelectData):TSelectDataStr;stdcall;

//  var
//    icdev_i:LongInt;
//    PassA:string;
//    PassB:string;

implementation

function RecordToClass(Rec:TSelectData):TSelectDataStr;
var
    StrData:TSelectDataStr;
    AscData:array[0..255] of AnsiChar;
    temp_s,EvenIn,LockIn:string;
    json,jo:isuperobject;
    i,temp_i:Integer;
begin
    Result:=TSelectDataStr.Create;
    with (Rec)do
    begin
      with Result do
      begin
        FillChar(AscData,256,0);
        hex_asc(@HardWareVer[0],AscData,4);
        C_HardWareVer:=Trim(ASCIIToStr(AnsiString(AscData)));			//硬件版本号
        FillChar(AscData,256,0);
        hex_asc(@SoftWareVer[0],AscData,4);
        C_SoftWareVer:=Trim(ASCIIToStr(AnsiString(AscData)));			//软件版本号
        FillChar(AscData,256,0);
        hex_asc(@ProtocolVer[0],AscData,4);
        c_ProtocolVer:=Trim(ASCIIToStr(AnsiString(AscData)));			//协议版本号
        FillChar(AscData,256,0);
        hex_asc(@SN[0],AscData,16);
        C_SN:=Trim(ASCIIToStr(AnsiString(AscData)));					//设备序列号
        FillChar(AscData,256,0);
        hex_asc(@DeviceName[0],AscData,16);
        C_DeviceName:=Trim(ASCIIToStr(LeftStr(AnsiString(AscData),32)));			//设备名称或者型号
        C_QN:=QN;						//标称流量，
        C_QMAX:=QMAX;					//最大流量，
        C_QMIN:=QMIN;					//最小流量，
        C_QS:=QS;						//脉冲当量，
        C_LimitOffsetVM:=LimitOffsetVM;
        C_MMR:=MMR;					//最大测量(显示)范围，
        C_VavleOnTime:=VavleOnTime;			//开阀门需要的时间,s·
        C_VavleOffTime:=VavleOffTime;			//关阀门需要的时间,s·
        C_xreverse00:=xreverse00;				//预留，对齐
        C_Superflow:=Superflow;
        c_DWM:=DWM;					//工作模式，普通抄表模式，气量模式等
        C_PS:=PS;						//最小计价单位，与硬件信息无关
        c_ConstFlowTimeOut:=ConstFlowTimeOut;		//超时设置
        c_ConstNoFlowTimeOut:=ConstNoFlowTimeOut;		//长时间不用气设置，
        c_ConstSmallFlowTimeOut:=ConstSmallFlowTimeOut;	//长时间小流量
        c_ConstNoFlowTimeOutEx:=ConstNoFlowTimeOutEx;				//预留，对齐
        c_SetpPrice:='';			//阶梯价格
        c_SetpVolume:='';			//阶梯价格用量
        c_MaxOverageVM:=MaxOverageVM;			//最大屯气量
        c_rdPeriod:=rdPeriod;			//结算周期
        c_xreverse001:=xreverse001;
        c_xreverse002:=xreverse002;
        c_ReadTime:='';			//结算时间
        c_PriceCoeff:='';			//调价系数，以及调价算法
        c_WarnSetOverageVM:=WarnSetOverageVM;
        c_OffSetOverageVM:=OffSetOverageVM;
        C_xreverse00:=xreverse00;
        c_ID:=ID;						//设备id
        c_userID:=userID;				//用户id
        c_keyIndex:=keyIndex;			//秘钥等级，密匙索引
        c_xreverse0:=xreverse0;
        c_CompanyCode:=CompanyCode;				//用户id
        FillChar(AscData,256,0);
        hex_asc(@cardKeyCreatKey[0],AscData,16);
        c_cardKeyCreatKey:=trim(AscData);				//ic卡密码，
        FillChar(AscData,256,0);
        hex_asc(@DefaultKey[0],AscData,16);
        c_DefaultKey:=trim(AscData);				//厂家,	针对des 128bits
        FillChar(AscData,256,0);
        hex_asc(@userKey[0],AscData,16);
        c_userKey:=trim(AscData);				//用户秘钥
        c_YY:=YY;				//上次结算年
        c_MM:=MM;              //上次结算月
        c_DLCS:=DLCS;					//设备状态生命周期,可兼容S=ABCDE
        c_OVerageVM:=OVerageVM;			//余量
        c_LastBSNVM:=LastBSNVM;	   			//上次充值业务流水号
        c_TotalVolume:=TotalVolume;			//总量
        c_VolumePerMon1:=VolumePerMon[0];		//最近6月历史用量,方量
        c_VolumePerMon2:=VolumePerMon[1];
        c_VolumePerMon3:=VolumePerMon[2];
        c_VolumePerMon4:=VolumePerMon[3];
        c_VolumePerMon5:=VolumePerMon[4];
        c_VolumePerMon6:=VolumePerMon[5];
        c_TotalPayment:=TotalPayment;			    //总金额
        c_MoneyPerMon1:=MoneyPerMon1;			//最近6月历史用量,金额
        c_MoneyPerMon2:=MoneyPerMon2;			//最近6月历史用量,金额
        c_MoneyPerMon3:=MoneyPerMon3;			//最近6月历史用量,金额
        c_MoneyPerMon4:=MoneyPerMon4;			//最近6月历史用量,金额
        c_MoneyPerMon5:=MoneyPerMon5;			//最近6月历史用量,金额
        c_MoneyPerMon6:=MoneyPerMon6;			//最近6月历史用量,金额
        c_event:=event;				//事件记录
        c_lock:=lock;				//锁定记录

        temp_s:= hextobit(IntToHex(event,8),8);
        json:=so();
        jo:=SO();
        EvenIn:='Event:'+temp_s;
        //LockInfo
        for I := 0 to 19 do
        begin
          if i=0 then begin
            temp_i:=bittohex(rightstr(temp_s,8));
            EvenIn:=EvenIn+','+EvenInfo[i]+':'+OffReason[temp_i];
            temp_s:=LeftStr(temp_s,Length(temp_s)-8);
            Continue;
          end;
          //json.S[EvenInfo[i]]:=Copy(temp_s,(i+8),1);
          EvenIn:=EvenIn+','+EvenInfo[i]+':'+rightstr(temp_s,1);
          temp_s:=LeftStr(temp_s,Length(temp_s)-1);
        end;
        //jo.O['evenInfo']:=json;
        c_eventInfo:='Event:'+EvenIn;

        temp_s:= hextobit(IntToHex(lock,8),8);
//        json.S[Jslock]:=temp_s;
        LockIn:=temp_s;
//        json.S[EvenInfo[0]]:=Noflow[bittohex(Copy(temp_s,1,2))];
        LockIn:=LockIn+','+lockinfo[0]+':'+Noflow[bittohex(RightStr(temp_s,2))];
        temp_s:=LeftStr(temp_s,Length(temp_s)-2);
//        json.S[EvenInfo[1]]:=HifhtFlow[bittohex(Copy(temp_s,3,2))];
        LockIn:=LockIn+','+lockinfo[1]+':'+HifhtFlow[bittohex(RightStr(temp_s,2))];
        temp_s:=LeftStr(temp_s,Length(temp_s)-2);
//        json.S[EvenInfo[2]]:=OverageV[bittohex(Copy(temp_s,5,2))];
        LockIn:=LockIn+','+lockinfo[2]+':'+OverageV[bittohex(RightStr(temp_s,2))];
        temp_s:=LeftStr(temp_s,Length(temp_s)-2);

        LockIn:=LockIn+','+lockinfo[3]+':'+OverageV[bittohex(RightStr(temp_s,2))];
        temp_s:=LeftStr(temp_s,Length(temp_s)-2);

//        json.S[EvenInfo[3]]:=StrongMagnetic[bittohex(Copy(temp_s,7,4))];
        LockIn:=LockIn+','+lockinfo[4]+':'+StrongMagnetic[bittohex(RightStr(temp_s,4))];
        temp_s:=LeftStr(temp_s,Length(temp_s)-4);

        for I := 5 to 11 do
        begin
           LockIn:=LockIn+','+lockinfo[i]+':'+RightStr(temp_s,1);
           temp_s:=LeftStr(temp_s,Length(temp_s)-1);
        end;
        //jo.O['LockInfo']:=json;
        c_lockInfo:=LockIn;

        c_PaymentVM1:=PaymentVM[0];
        c_PaymentVM2:=PaymentVM[1];
        c_PaymentVM3:=PaymentVM[2];
        c_PaymentVM4:=PaymentVM[3];
        c_PaymentVM5:=PaymentVM[4];
        c_PaymentVM6:=PaymentVM[5];

        c_PaymentVMBSNM1:=PaymentVMBSNM[0];
        c_PaymentVMBSNM2:=PaymentVMBSNM[1];
        c_PaymentVMBSNM3:=PaymentVMBSNM[2];
        c_PaymentVMBSNM4:=PaymentVMBSNM[3];
        c_PaymentVMBSNM5:=PaymentVMBSNM[4];
        c_PaymentVMBSNM6:=PaymentVMBSNM[5];



        FillChar(AscData,256,0);

        hex_asc(@HolidayInf[0],AscData,48);
        c_HolidayInf:=trim(AscData);			//节假日信息
        c_crc:=crc;
      end;
    end;
end;


function StrToASCII(Data: string): string;
var
 i:Integer;
 C:AnsiChar;
begin
  result:='';
  for I := 1 to Length(Data) do
  begin
    C:=AnsiChar(data[i]);
    result:=result+IntToHex(Ord(C),2);
  end;
end;
function ASCIIToStr(Data: string): string;
begin
  while Data<>'' do
  begin
   result:=result+Chr(StrToInt('$'+leftstr(data,2)));
   data:=RightStr(data,Length(data)-2);
  end;
end;

function RandomVoerride: string;
var
  miMax,miMin,miNum:int64;
begin
  //产生17位随机数     10000000000000000~72057594037927935
  Randomize;
  miMax := random(720575940);
  while (miMax < 100000000) do
    miMax := random(720575940);

  miMin := random(37927935);
  while (miMin < 10000000) do
    miMin := random(37927935);

  miNum:=strtoint64(inttostr(miMax)+inttostr(miMin));
  result:=inttohex(miNum,14);
end;


function MaxToMin(Data_s:string):string;
var
  Len_i,i:integer;  
begin
  result:='';
  Len_i:=Length(Data_s) div 2; 
  for I := 0 to Len_i - 1 do
  begin
   result:=Copy(Data_s,i*2+1,2)+result;
  end;      
end;

function MinToMax(Data_s:string):string;
var
  Len_i,i:integer;  
begin
  result:='';
  Len_i:=Length(Data_s) div 2; 
  for I := 0 to Len_i - 1 do
  begin
   result:=Copy(Data_s,i*2+1,2)+result;
  end; 
end;

function hex_asc(HexStr: PAnsiChar;var AscStr: array of AnsiChar;lengths: smallint):smallint;
var
  msAscStr,msHexStr:AnsiString;
  i:integer;
  tempar:array of AnsiChar;
begin
   result:=-1;
   try
      msHexStr:=HexStr;
      msAscStr:='';
      SetLength(tempar,lengths*2+10);
      i:=0;
      while i<lengths do
      begin
          msAscStr:=inttohex(ord(HexStr[i]),2);
          tempar[i*2]:=msAscStr[1];
          tempar[i*2+1]:=msAscStr[2];
          Inc(i);
      end;
      for i:=0 to lengths*2 do
      begin
         AscStr[i]:=tempar[i];
      end;
      result:=0;
   except
   end;
end;

function BitToHex(msData: string): Integer;
const  msBit:array[0..15] of string=
('0000','0001','0010','0011','0100','0101','0110','0111',
'1000','1001','1010','1011','1100','1101','1110','1111');
var
  mi,i,j:Integer;
  ms:string;
begin
//  result:='';
//  for I := 0 to miLen - 1 do
//  begin
//    mi:=StrToInt('$'+Copy(msData,i+1,1));
//    Result:=result+msbit[mi];
//  end;
  mi:=0;
  result:=0;
  msData:=RightStr('00000000'+msdata,8);
  ms:=LeftStr(msData,4);
  for I := 1 to  2 do
  begin
    for j := 0 to 15 do
    begin
       if ms=msBit[j] then
       begin
        if i=2 then
          mi:=mi+j
        else
          mi:=mi+j*16;
       end;
    end;
    ms:=RightStr(msdata,4);
  end;
  result:=mi;
end;

function asc_hex(ascStr: PAnsiChar;var HexStr: array of AnsiChar;lengths: smallint):smallint;
var
  msAscStr,msHexStr,mstemp:AnsiString;
  i,j,temp:integer;
  tempchar:array of AnsiChar;
begin
   result:=-1;
   msAscStr:=Trim(StrPas(ascStr));
   msHexStr:='';
   SetLength(tempchar,lengths+10);
   i:=1;
   j:=0;
   try
      while i<=lengths*2 do
      begin
         mstemp:=copy(msAscStr,i,2);
         temp:=strtoint('0x'+mstemp);
         tempchar[j]:=AnsiChar(temp);
         inc(i,2);
         if j<Lengths then   Inc(j);
      end;
      for i:=0 to lengths-1 do
      begin
         HexStr[i]:=tempchar[i];
      end;
      result:=0;
   except
    result:=1;
   end;
end;

Procedure AppendTxt(Str:String;FileName:String);
Var
   F:Textfile;
Begin
  FileName:='Log\'+ FormatDateTime('yyyy-mm-dd',Now)+'_Log.log';

 if not fileExists(FileName) then begin AssignFile(F, FileName);  Rewrite(F) ; end else   AssignFile(F, FileName);
  Append(F);
  Writeln(F, Str);
  Closefile(F);
End;

function HexToBit(msData: string; miLen: Integer): string;
const  msBit:array[0..15] of string=
('0000','0001','0010','0011','0100','0101','0110','0111',
'1000','1001','1010','1011','1100','1101','1110','1111');
var
  mi,i:Integer;
begin
  result:='';
  for I := 0 to miLen - 1 do
  begin
    mi:=StrToInt('$'+Copy(msData,i+1,1));
    Result:=result+msbit[mi];
  end;
end;

end.



//var
//   json:ISuperObject;
//begin
//  try
//
//    if (Pos(JSMeterID,CommandData)<=0)
//      or (Pos(JSOneGas,CommandData)<=0)
//      or (Pos(JSTwoGas,CommandData)<=0)
//      or (Pos(JSThreeGas,CommandData)<=0)
//      or (Pos(JSTimes,CommandData)<=0)
//    then
//    begin
//      Result:=-2; //协议项不完整
//      exit;
//    end;
//
//
//
//    result:=0;
//  except
//    on e:Exception do
//    begin
//      AppendTxt('指令：'+CommandData+'组织失败，原因：'+e.Message,'');
//      result:=-1;  //协议解析失败
//    end;
//  end;
