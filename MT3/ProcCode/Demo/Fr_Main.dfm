object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'MT3_Debug_Demo'
  ClientHeight = 491
  ClientWidth = 739
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 385
    Top = 0
    Width = 354
    Height = 491
    Align = alClient
    BorderStyle = bsSingle
    Caption = 'Panel2'
    TabOrder = 0
    object mm_Record: TMemo
      Left = 1
      Top = 1
      Width = 350
      Height = 487
      Align = alClient
      BorderStyle = bsNone
      PopupMenu = PopupMenu1
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 385
    Height = 491
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object Panel6: TPanel
      Left = 0
      Top = 0
      Width = 385
      Height = 193
      Align = alTop
      BevelEdges = []
      BevelOuter = bvNone
      TabOrder = 0
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 385
        Height = 193
        Align = alClient
        Shape = bsBottomLine
        ExplicitLeft = 168
      end
      object Label6: TLabel
        Left = 221
        Top = 12
        Width = 31
        Height = 13
        Caption = #23494#30721'A'
      end
      object Label7: TLabel
        Left = 222
        Top = 42
        Width = 30
        Height = 13
        Caption = #23494#30721'B'
      end
      object Label8: TLabel
        Left = 4
        Top = 103
        Width = 48
        Height = 13
        Caption = #35748#35777#25159#21306
      end
      object Label9: TLabel
        Left = 216
        Top = 103
        Width = 36
        Height = 13
        Caption = #22359#22320#22336
      end
      object Label10: TLabel
        Left = 16
        Top = 73
        Width = 36
        Height = 13
        Caption = #25511#21046#20301
      end
      object Label1: TLabel
        Left = 16
        Top = 134
        Width = 36
        Height = 13
        Caption = #22359#25968#25454
      end
      object Label2: TLabel
        Left = 16
        Top = 164
        Width = 36
        Height = 13
        Caption = #20889#25968#25454
      end
      object Label3: TLabel
        Left = 228
        Top = 73
        Width = 24
        Height = 13
        Caption = #22359#20540
      end
      object edt_PassA: TEdit
        Left = 256
        Top = 9
        Width = 121
        Height = 19
        MaxLength = 12
        TabOrder = 0
        Text = 'FFFFFFFFFFFF'
      end
      object edt_PassB: TEdit
        Left = 256
        Top = 39
        Width = 121
        Height = 19
        MaxLength = 12
        TabOrder = 1
        Text = 'FFFFFFFFFFFF'
      end
      object edt_Sector: TEdit
        Left = 56
        Top = 100
        Width = 121
        Height = 19
        TabOrder = 2
        Text = '0'
      end
      object edt_Addr: TEdit
        Left = 256
        Top = 100
        Width = 121
        Height = 19
        TabOrder = 3
        Text = '1'
      end
      object edt_Contrl: TEdit
        Left = 56
        Top = 70
        Width = 121
        Height = 19
        MaxLength = 8
        TabOrder = 4
        Text = 'FF078069'
      end
      object edt_ReadData: TEdit
        Left = 56
        Top = 131
        Width = 321
        Height = 19
        ReadOnly = True
        TabOrder = 5
      end
      object edt_WriteData: TEdit
        Left = 56
        Top = 161
        Width = 321
        Height = 19
        MaxLength = 32
        TabOrder = 6
        Text = 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF'
      end
      object RadioButton1: TRadioButton
        Left = 116
        Top = 10
        Width = 89
        Height = 17
        Caption = #35748#35777#23494#30721'A'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        TabStop = True
      end
      object RadioButton2: TRadioButton
        Left = 116
        Top = 25
        Width = 89
        Height = 17
        Caption = #35748#35777#23494#30721'B'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object RadioButton3: TRadioButton
        Left = 116
        Top = 40
        Width = 89
        Height = 17
        Caption = #35748#35777#23494#30721'AB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object edt_InitValue: TEdit
        Left = 256
        Top = 70
        Width = 121
        Height = 19
        TabOrder = 10
        Text = '1000'
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 193
      Width = 385
      Height = 298
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Label4: TLabel
        Left = 106
        Top = 174
        Width = 31
        Height = 13
        Caption = 'Label4'
      end
      object Label5: TLabel
        Left = 132
        Top = 247
        Width = 48
        Height = 13
        Caption = #35748#35777#25159#21306
      end
      object Button4: TButton
        Left = 104
        Top = 13
        Width = 75
        Height = 25
        Caption = #23547#21345
        TabOrder = 0
        OnClick = Button4Click
      end
      object Button6: TButton
        Left = 8
        Top = 13
        Width = 75
        Height = 25
        Caption = #25171#24320#35774#22791
        TabOrder = 1
        OnClick = Button6Click
      end
      object Button1: TButton
        Left = 200
        Top = 13
        Width = 75
        Height = 25
        Caption = #35748#35777
        TabOrder = 2
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 8
        Top = 53
        Width = 75
        Height = 25
        Caption = #35835#25968#25454
        TabOrder = 3
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 104
        Top = 53
        Width = 75
        Height = 25
        Caption = #20889#25968#25454
        TabOrder = 4
        OnClick = Button3Click
      end
      object Button7: TButton
        Left = 8
        Top = 93
        Width = 75
        Height = 25
        Caption = #35835#20540#22359
        TabOrder = 5
        OnClick = Button7Click
      end
      object Button8: TButton
        Left = 104
        Top = 93
        Width = 75
        Height = 25
        Caption = #21021#22987#20540#22359
        TabOrder = 6
        OnClick = Button8Click
      end
      object Button9: TButton
        Left = 200
        Top = 93
        Width = 75
        Height = 25
        Caption = #21152#20540
        TabOrder = 7
        OnClick = Button9Click
      end
      object Button10: TButton
        Left = 296
        Top = 93
        Width = 75
        Height = 25
        Caption = #20943#20540
        TabOrder = 8
        OnClick = Button10Click
      end
      object Button11: TButton
        Left = 200
        Top = 53
        Width = 75
        Height = 25
        Caption = #24674#22797
        TabOrder = 9
        OnClick = Button11Click
      end
      object Button12: TButton
        Left = 296
        Top = 53
        Width = 75
        Height = 25
        Caption = #26242#23384
        TabOrder = 10
        OnClick = Button12Click
      end
      object Button13: TButton
        Left = 296
        Top = 133
        Width = 75
        Height = 25
        Caption = #20013#27490
        TabOrder = 11
        OnClick = Button13Click
      end
      object Button5: TButton
        Left = 296
        Top = 13
        Width = 75
        Height = 25
        Caption = #22797#20301
        TabOrder = 12
        OnClick = Button5Click
      end
      object button: TButton
        Left = 200
        Top = 133
        Width = 75
        Height = 25
        Caption = #20889#20840#21345
        TabOrder = 13
        OnClick = buttonClick
      end
      object Button14: TButton
        Left = 104
        Top = 133
        Width = 75
        Height = 25
        Caption = #35835#20840#21345
        TabOrder = 14
        OnClick = Button14Click
      end
      object Button15: TButton
        Left = 8
        Top = 133
        Width = 75
        Height = 25
        Caption = #29983#25104#25511#21046#22359
        TabOrder = 15
        OnClick = Button15Click
      end
      object Button16: TButton
        Left = 280
        Top = 168
        Width = 91
        Height = 25
        Caption = #24674#22797#40664#35748#20301
        TabOrder = 16
        OnClick = Button13Click
      end
      object Button17: TButton
        Left = 8
        Top = 168
        Width = 75
        Height = 25
        Caption = #24320#22987
        TabOrder = 17
        OnClick = Button17Click
      end
      object Button18: TButton
        Left = 8
        Top = 200
        Width = 75
        Height = 25
        Caption = #25346#36215
        TabOrder = 18
        OnClick = Button18Click
      end
      object Button19: TButton
        Left = 104
        Top = 200
        Width = 75
        Height = 25
        Caption = #36864#20986
        TabOrder = 19
        OnClick = Button19Click
      end
      object Edit1: TEdit
        Left = 8
        Top = 244
        Width = 121
        Height = 19
        TabOrder = 20
        Text = '0'
      end
      object Button20: TButton
        Left = 8
        Top = 272
        Width = 75
        Height = 25
        Caption = 'Button20'
        TabOrder = 21
        OnClick = Button20Click
      end
    end
  end
  object Button21: TButton
    Left = 104
    Top = 464
    Width = 75
    Height = 25
    Caption = 'Button20'
    TabOrder = 2
    OnClick = Button21Click
  end
  object PopupMenu1: TPopupMenu
    Left = 688
    Top = 392
    object N1: TMenuItem
      Caption = #28165#31354
      OnClick = N1Click
    end
  end
end
