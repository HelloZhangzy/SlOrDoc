unit PublicCode;

interface

uses IniFiles,SysUtils,StrUtils,superobject,superxmlparser;

 //{"head":"{Э��ͷ������}","CMD":"[{"������"},{"������"}]"}
 {$REGION 'JSON���'}
  const
    //����
    JSHead='Head';
    JsInfo='Cmd';
    JsAnswer='Answer';
    JsMeterState='MeterState';
    //Э��ͷ������
    JSVer='prVer';    //�汾
    JSID='Identity'; //���ID
    JSCommpany='Commpany';//��ǰ��˾����
    JSPrType='ProtocolType'; //Э������ 0��ҵ������Ϊ�� 1����������Ϊ�� 2:������
    JSKeyNo='KeyNo'; //������Կ��
    jsKeyValue='KeyValue';//������Կ
    JsMeterVer='MeterVer';//������

    {$REGION '������'}
     JSCmd='CmdCode';
    //���������
     JSNewCommpany='NewCommpany';  //��˾���
     JSCardNo='CardNo';  //����
     JsInitTimes='ItitTimes'; //��ʼ��ֵ����
     //��ֵ����
      JSMeterID='MeterID';
      JSOneValue='OneValue';
      JSTwoValue='TwoValue';
      JSThreeValue='ThreeValue';
      JSTimes='Times';
      //������ֵ��
      JSPrice='Price';
      JSSupeValue='SupeValue';
      //��Կ����
      JSUpKeyNo='UpKeyNo';
      JsUpKeyValue='UpKeyValue';
      //ʱ������
      JsDateTime='Date';
      JsWeek='Week';
      //��������
      JsJQ='JQ';
      JsDays='JQDays';
      jsMonth='JQMonth';
      //ID����
      JsIDOperType='IDOperType';
      JsOldID='OldID';
      JsNewID='NewID';
      //�׶α��
      JSStage='Stage';
      //��������
      JsParmaters='Parmaters';
      JsDeviceName='DeviceName';
      JsQN='QN';
      JsQMAX='QMAX';
      JsQMIN='QMIN';
      JsQS='QS';
      JsVavleOnTime='VavleOnTime';
      JsVavleOffTime='VavleOffTime';
      JsDWM='DWM';
      //��������
      JsPS='PS';
      JsConstNoFlowTimeOut='ConstNoFlowTimeOut';
      JsConstSmallFlowTimeOut='ConstSmallFlowTimeOut';
      JsConstNoFlowTimeOutEx='ConstNoFlowTimeOutEx';
      JsMaxOverageVM='MaxOverageVM';
      JsWarnSetOverageVM='WarnSetOverageVM';
      JsOffSetOverageVM='OffSetOverageVM';
      JsOverdraftLimit='OverdraftLimit';
      JsSwitchSuperflow='SwitchSuperflow';
      //������Ϣ
      JsErrMsg='ErrMsg';
      JsErrCode='ErrCode';
      JsReturnCode='RetCode';
      JsReturnMsg='RetMsg';
      //��״̬
      JsStatus='Status'; //	�豸״̬
      Jsdeviceid='deviceid';//	�豸id
      JsWarnSetOVM='WarnSetOVM';//	����������
      JsOffSetOVM='OffSetOVM';//	�ط�������
      JsOVerageVM='OVerageVM';//	���������
      JSLastBSNV='LastBSNV';//��ֵ����
//      reverse01	Ԥ��
      JsTotalVolume='TotalVolume';//	������������
      JsEvent='event';//	�¼�
      Jslock='lock';//	��״̬
      JsPaymentVM1='Payment1';//	��ֵ��¼
      JsPaymentVM2='Payment2';//	��ֵ��¼
      JsPaymentVM3='Payment3';//	��ֵ��¼
      JsPaymentVM4='Payment4';//	��ֵ��¼
      JsPaymentVM5='Payment5';//	��ֵ��¼
      JsPaymentVM6='Payment6';//	��ֵ��¼
      //Ӧ��
      JsExec='Exec';

    {$ENDREGION}


 {$ENDREGION}

 {$REGION 'ָ�����'}
  Const
   _AssociativeUse='A1';   //����
   _Recharge='A2';//��ֵ
   _UpdateKey='B1';//�����ܽ�
   _SupeRecharge='B2';//������ֵ
   _SetDateTime='B0';//����ʱ��
   _SetHolidays='B3';//���ü���
   _SetvalveState='B4';//���÷�״̬
   _SetPrices='B5';//���ü۸�
   _OutInit='B6';//������ʼ��
   _SetID='B7';//����ID
   _Test='B8';//����
   _Select='B9';//��ѯ
   _Clear='BA';//����
   _Unlock='BB';//����
   _Transfer='BC';//ת��
   _SetParameters='BD';//��������
   _ProduceSet='BE';//��������

   _DecAssociativeUse='1';   //����
   _DecRecharge='2';//��ֵ
   _DecUpdateKey='3';//�����ܽ�
   _DecSupeRecharge='4';//������ֵ
   _DecSetDateTime='5';//����ʱ��
   _DecSetHolidays='6';//���ü���
   _DecSetvalveState='7';//���÷�״̬
   _DecSetPrices='8';//���ü۸�
   _DecOutInit='9';//������ʼ��
   _DecSetID='10';//����ID
   _DecTest='11';//����
   _DecSelect='12';//��ѯ
   _DecClear='13';//����
   _DecUnlock='14';//����
   _DecTransfer='15';//ת��
   _DecSetParameters='16';//��������
   _DcProduceSet='17';//��������

  OffReason:array[0..14] of string=('���¼��ط�','Ӳ�����Ϲط�','��ѹ�ط�','��ѹ�ط�','��������ʱ�ط�','С������ʱ',
		'�����ط�',		'���������ط�',		'����������ط�',		'����������ط�',		'����ط�',		'����ط�',		'ǿ�Źط�',
		'�ⲿ�ź�(�������ȣ�δʹ��)',		'�����̹ط�');
  Noflow:array[0..2] of string=('0����','1����ʱ����ť����','2����ʱ����������');
  HifhtFlow:array[0..1] of string=('0����','1����������ť����');
  OverageV:array[0..2] of string=('0����','1����ʾ�ط�����ť����','2���ط�����ֵ����');
  OverageM:array[0..2] of string=('0����','1����ʾ�ط�����ť����','2���ط�����ֵ����');
  StrongMagnetic :array[0..5] of string=('0����','1��ǿ�Źط�����ť����','2��ǿ�Źط�����ť����','3��ǿ�Źط�����ť����','4��ǿ�Źط�����ť����','5��ǿ������������������');

  EvenInfo:array[0..19] of string=('bOffReason', 'bPower1On ',      'bPower1Off',      'bPower1LoWarning',      'bPower1LoOff',
        'bPower1OvWarning',      'bPower1OvOff',      'bStrongMagnetic',      'bStrongElectric',     'bHightFlow',      'bConstUsedOverTime',
      'bSmallConstOverTime',      'bNoFlowOverTime',      'bOVnotEnoughWarning',      'bOVnotEnoughOFF',      'bOMnotEnoughWarning',      'bOMnotEnoughOFF',
      'bSeverOff',      'bSeverOn',      'bFlowPulseOffTimeOut');

  LockInfo:array[0..11] of string=('bNoflow',			 'bHifhtFlow',			 'bOverageV',			 'bOverageM',			 'bStrongMagnetic',       'bPowerDown',
       'bPowerHight',			 'bSeverOff',			 'bSeverOn',			 'bSmallFlow',			 'bConstUsedOverTime',			 'bFlowPulseOffTimeOut');

  type TCmdEnum=(FF,A1,A2,B1,B2,B0,B3,B4,B5,B6,B7,B8,B9,BA,BB,BC,BD,BE,FE);



  type
    TSelectData=record
        HardWareVer:array[0..3] of Byte;			//Ӳ���汾��
        SoftWareVer:array[0..3] of Byte;			//����汾��
        ProtocolVer:array[0..3] of Byte;			//Э��汾��
        SN:array[0..15] of Byte;					//�豸���к�
        DeviceName:array[0..15] of Byte;			//�豸���ƻ����ͺ�
        QN:Word;						//���������
        QMAX:Word;					//���������
        QMIN:Word;					//��С������
        QS:Word;						//���嵱����
        MMR:Word;					//������(��ʾ)��Χ��
        VavleOnTime:Word;			//��������Ҫ��ʱ��,s��
        VavleOffTime:Word;			//�ط�����Ҫ��ʱ��,s��
        xreverse00:Byte;				//Ԥ��������
        Superflow:Byte;				//Ԥ��������
        DWM:Word;					//����ģʽ����ͨ����ģʽ������ģʽ��
        PS:Word;						//��С�Ƽ۵�λ����Ӳ����Ϣ�޹�
        ConstFlowTimeOut:Word;		//��ʱ����
        ConstNoFlowTimeOut:Word;		//��ʱ�䲻�������ã�
        ConstSmallFlowTimeOut:Word;	//��ʱ��С����
        ConstNoFlowTimeOutEx:Word;				//Ԥ��������
        SetpPrice:array[0..5] of integer;			//���ݼ۸�
        SetpVolume:array[0..5] of integer;			//���ݼ۸�����
        MaxOverageVM:Integer;			//���������
        rdPeriod:Word;			//��������
             xreverse001:Byte;
             xreverse002:Byte;
        ReadTime:array[0..3] of Byte;			//����ʱ��
        PriceCoeff:array[0..11] of Word;			//����ϵ�����Լ������㷨
        WarnSetOverageVM:Integer;
        OffSetOverageVM:Integer;
        LimitOffsetVM:integer;
        ID:UInt32;						//�豸id
        userID:UInt32;				//�û�id
        keyIndex:Byte;			//��Կ�ȼ����ܳ�����
             xreverse0:Byte;
          CompanyCode:Word;				//�û�id
        cardKeyCreatKey:array [0..15] of Byte;				//ic�����룬
        DefaultKey:array [0..15] of Byte;				//����,	���des 128bits
        userKey:array [0..15] of Byte;				//�û���Կ
        YY:Byte;				//�ϴν�����
        MM:Byte;              //�ϴν�����
        DLCS:Word;					//�豸״̬��������,�ɼ���S=ABCDE
        OVerageVM:Integer;			//����
        LastBSNVM:Integer;	   			//�ϴγ�ֵҵ����ˮ��
        TotalVolume:Integer;			//����
        VolumePerMon:array[0..5] of Integer;		//���6����ʷ����,����
        TotalPayment:Integer;			//�ܽ��
        //MoneyPerMon:array[0..5]of Integer;			//���6����ʷ����,���
        MoneyPerMon1:Integer;			//���6����ʷ����,���
        MoneyPerMon2:Integer;
        MoneyPerMon3:Integer;
        MoneyPerMon4:Integer;
        MoneyPerMon5:Integer;
        MoneyPerMon6:Integer;
        event:Integer;				//�¼���¼
        lock:Integer;				//������¼
        PaymentVM:array[0..5] of Integer;
        PaymentVMBSNM:array[0..5] of Integer;
        HolidayInf:array[0..47]of Byte;			//�ڼ�����Ϣ
        crc:Word;
    end;
     PSelectData =^TSelectData;

  TSelectDataStr=Class
      C_HardWareVer:String;			//Ӳ���汾��
      C_SoftWareVer:String;			//����汾��
      c_ProtocolVer:String;			//Э��汾��
      C_SN:String;					//�豸���к�
      C_DeviceName:String;			//�豸���ƻ����ͺ�
      C_QN:Word;						//���������
      C_QMAX:Word;					//���������
      C_QMIN:Word;					//��С������
      C_QS:Word;						//���嵱����
      C_MMR:Word;					//������(��ʾ)��Χ��
      C_VavleOnTime:Word;			//��������Ҫ��ʱ��,s��
      C_VavleOffTime:Word;			//�ط�����Ҫ��ʱ��,s��
      C_xreverse00:Byte;				//Ԥ��������
      C_Superflow:Byte;				//Ԥ��������
      c_DWM:Word;					//����ģʽ����ͨ����ģʽ������ģʽ��
      C_PS:Word;						//��С�Ƽ۵�λ����Ӳ����Ϣ�޹�
      c_ConstFlowTimeOut:Word;		//��ʱ����
      c_ConstNoFlowTimeOut:Word;		//��ʱ�䲻�������ã�
      c_ConstSmallFlowTimeOut:Word;	//��ʱ��С����
      c_ConstNoFlowTimeOutEx:Word;				//Ԥ��������
      c_SetpPrice:String;			//���ݼ۸�
      c_SetpVolume:String;			//���ݼ۸�����
      c_MaxOverageVM:Integer;			//���������
      c_rdPeriod:Word;			//��������
      c_xreverse001:Byte;
      c_xreverse002:Byte;
      c_ReadTime:String;			//����ʱ��
      c_PriceCoeff:String;			//����ϵ�����Լ������㷨
      c_WarnSetOverageVM:Integer;
      c_OffSetOverageVM:Integer;
      C_LimitOffsetVM:integer;
      c_ID:UInt32;						//�豸id
      c_userID:UInt32;				//�û�id
      c_keyIndex:Byte;			//��Կ�ȼ����ܳ�����
      c_xreverse0:Byte;
      c_CompanyCode:Word;				//�û�id
      c_cardKeyCreatKey:String;				//ic�����룬
      c_DefaultKey:String;				//����,	���des 128bits
      c_userKey:String;				//�û���Կ
      c_YY:Byte;				//�ϴν�����
      c_MM:Byte;              //�ϴν�����
      c_DLCS:Word;					//�豸״̬��������,�ɼ���S=ABCDE
      c_OVerageVM:Integer;			//����
      c_LastBSNVM:Integer;	   			//�ϴγ�ֵҵ����ˮ��
      c_TotalVolume:Integer;			//����
      c_VolumePerMon1:Integer;		//���6����ʷ����,����
      c_VolumePerMon2:Integer;		//���6����ʷ����,����
      c_VolumePerMon3:Integer;		//���6����ʷ����,����
      c_VolumePerMon4:Integer;		//���6����ʷ����,����
      c_VolumePerMon5:Integer;		//���6����ʷ����,����
      c_VolumePerMon6:Integer;		//���6����ʷ����,����
      c_TotalPayment:Integer;			//�ܽ��
      c_MoneyPerMon1:Integer;			//���6����ʷ����,���
      c_MoneyPerMon2:Integer;
      c_MoneyPerMon3:Integer;
      c_MoneyPerMon4:Integer;
      c_MoneyPerMon5:Integer;
      c_MoneyPerMon6:Integer;
      c_event:Integer;				//�¼���¼
      c_eventInfo:string;
      c_lock:Integer;				//������¼
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
      c_HolidayInf:String;			//�ڼ�����Ϣ
      c_crc:Word;
    end;

 {$ENDREGION}

 {$REGION 'Key'}
    procedure btea(Mod_i:SmallInt;Data:PAnsiChar;Len_i:SmallInt;Key:PAnsiChar);cdecl;far;external 'XXTea.dll';
    function  crc_sum(puchMsg:PAnsiChar;usDataLen:Word):Word;cdecl;far;external 'XXTea.dll';
 {$ENDREGION}

  Procedure AppendTxt(Str:String;FileName:String);

  function HexToBit(msData: string; miLen: Integer): string;
  {******������תʮ����}
  function BitToHex(msData: string): Integer;

  function MaxToMin(Data_s:string):string;
  function MinToMax(Data_s:string):string;
   //10������16���ƻ�ת
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
        C_HardWareVer:=Trim(ASCIIToStr(AnsiString(AscData)));			//Ӳ���汾��
        FillChar(AscData,256,0);
        hex_asc(@SoftWareVer[0],AscData,4);
        C_SoftWareVer:=Trim(ASCIIToStr(AnsiString(AscData)));			//����汾��
        FillChar(AscData,256,0);
        hex_asc(@ProtocolVer[0],AscData,4);
        c_ProtocolVer:=Trim(ASCIIToStr(AnsiString(AscData)));			//Э��汾��
        FillChar(AscData,256,0);
        hex_asc(@SN[0],AscData,16);
        C_SN:=Trim(ASCIIToStr(AnsiString(AscData)));					//�豸���к�
        FillChar(AscData,256,0);
        hex_asc(@DeviceName[0],AscData,16);
        C_DeviceName:=Trim(ASCIIToStr(LeftStr(AnsiString(AscData),32)));			//�豸���ƻ����ͺ�
        C_QN:=QN;						//���������
        C_QMAX:=QMAX;					//���������
        C_QMIN:=QMIN;					//��С������
        C_QS:=QS;						//���嵱����
        C_LimitOffsetVM:=LimitOffsetVM;
        C_MMR:=MMR;					//������(��ʾ)��Χ��
        C_VavleOnTime:=VavleOnTime;			//��������Ҫ��ʱ��,s��
        C_VavleOffTime:=VavleOffTime;			//�ط�����Ҫ��ʱ��,s��
        C_xreverse00:=xreverse00;				//Ԥ��������
        C_Superflow:=Superflow;
        c_DWM:=DWM;					//����ģʽ����ͨ����ģʽ������ģʽ��
        C_PS:=PS;						//��С�Ƽ۵�λ����Ӳ����Ϣ�޹�
        c_ConstFlowTimeOut:=ConstFlowTimeOut;		//��ʱ����
        c_ConstNoFlowTimeOut:=ConstNoFlowTimeOut;		//��ʱ�䲻�������ã�
        c_ConstSmallFlowTimeOut:=ConstSmallFlowTimeOut;	//��ʱ��С����
        c_ConstNoFlowTimeOutEx:=ConstNoFlowTimeOutEx;				//Ԥ��������
        c_SetpPrice:='';			//���ݼ۸�
        c_SetpVolume:='';			//���ݼ۸�����
        c_MaxOverageVM:=MaxOverageVM;			//���������
        c_rdPeriod:=rdPeriod;			//��������
        c_xreverse001:=xreverse001;
        c_xreverse002:=xreverse002;
        c_ReadTime:='';			//����ʱ��
        c_PriceCoeff:='';			//����ϵ�����Լ������㷨
        c_WarnSetOverageVM:=WarnSetOverageVM;
        c_OffSetOverageVM:=OffSetOverageVM;
        C_xreverse00:=xreverse00;
        c_ID:=ID;						//�豸id
        c_userID:=userID;				//�û�id
        c_keyIndex:=keyIndex;			//��Կ�ȼ����ܳ�����
        c_xreverse0:=xreverse0;
        c_CompanyCode:=CompanyCode;				//�û�id
        FillChar(AscData,256,0);
        hex_asc(@cardKeyCreatKey[0],AscData,16);
        c_cardKeyCreatKey:=trim(AscData);				//ic�����룬
        FillChar(AscData,256,0);
        hex_asc(@DefaultKey[0],AscData,16);
        c_DefaultKey:=trim(AscData);				//����,	���des 128bits
        FillChar(AscData,256,0);
        hex_asc(@userKey[0],AscData,16);
        c_userKey:=trim(AscData);				//�û���Կ
        c_YY:=YY;				//�ϴν�����
        c_MM:=MM;              //�ϴν�����
        c_DLCS:=DLCS;					//�豸״̬��������,�ɼ���S=ABCDE
        c_OVerageVM:=OVerageVM;			//����
        c_LastBSNVM:=LastBSNVM;	   			//�ϴγ�ֵҵ����ˮ��
        c_TotalVolume:=TotalVolume;			//����
        c_VolumePerMon1:=VolumePerMon[0];		//���6����ʷ����,����
        c_VolumePerMon2:=VolumePerMon[1];
        c_VolumePerMon3:=VolumePerMon[2];
        c_VolumePerMon4:=VolumePerMon[3];
        c_VolumePerMon5:=VolumePerMon[4];
        c_VolumePerMon6:=VolumePerMon[5];
        c_TotalPayment:=TotalPayment;			    //�ܽ��
        c_MoneyPerMon1:=MoneyPerMon1;			//���6����ʷ����,���
        c_MoneyPerMon2:=MoneyPerMon2;			//���6����ʷ����,���
        c_MoneyPerMon3:=MoneyPerMon3;			//���6����ʷ����,���
        c_MoneyPerMon4:=MoneyPerMon4;			//���6����ʷ����,���
        c_MoneyPerMon5:=MoneyPerMon5;			//���6����ʷ����,���
        c_MoneyPerMon6:=MoneyPerMon6;			//���6����ʷ����,���
        c_event:=event;				//�¼���¼
        c_lock:=lock;				//������¼

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
        c_HolidayInf:=trim(AscData);			//�ڼ�����Ϣ
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
  //����17λ�����     10000000000000000~72057594037927935
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
//      Result:=-2; //Э�������
//      exit;
//    end;
//
//
//
//    result:=0;
//  except
//    on e:Exception do
//    begin
//      AppendTxt('ָ�'+CommandData+'��֯ʧ�ܣ�ԭ��'+e.Message,'');
//      result:=-1;  //Э�����ʧ��
//    end;
//  end;
