object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'MeterDebugDemo_17A'
  ClientHeight = 885
  ClientWidth = 1250
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1250
    Height = 885
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet2: TTabSheet
      Caption = 'Interface_Debug'
      ImageIndex = 1
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 1242
        Height = 857
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Panel1: TPanel
          Left = 625
          Top = 0
          Width = 617
          Height = 857
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object GroupBox10: TGroupBox
            Left = 0
            Top = 257
            Width = 617
            Height = 600
            Align = alClient
            Caption = #35835#21345#21306
            TabOrder = 0
            object Memo1: TMemo
              Left = 2
              Top = 56
              Width = 613
              Height = 542
              Align = alClient
              PopupMenu = PopupMenu2
              ScrollBars = ssVertical
              TabOrder = 0
            end
            object Panel8: TPanel
              Left = 2
              Top = 15
              Width = 613
              Height = 41
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object Button13: TButton
                Left = 41
                Top = 8
                Width = 75
                Height = 25
                Caption = #35835#21345
                TabOrder = 0
                OnClick = Button13Click
              end
              object Button7: TButton
                Left = 136
                Top = 8
                Width = 75
                Height = 25
                Caption = #35299#26512'Json'
                TabOrder = 1
                Visible = False
                OnClick = Button7Click
              end
            end
          end
          object GroupBox11: TGroupBox
            Left = 0
            Top = 0
            Width = 617
            Height = 257
            Align = alTop
            Caption = #25351#20196#21306
            TabOrder = 1
            object lv_Cmd: TListView
              Left = 2
              Top = 56
              Width = 613
              Height = 199
              Align = alClient
              BorderStyle = bsNone
              Columns = <
                item
                  Caption = #24207#21495
                  Width = 0
                end
                item
                  Caption = #24207#21495
                end
                item
                  Caption = #21629#20196
                  Width = 150
                end
                item
                  Caption = #21629#20196#20869#23481
                  Width = 400
                end>
              ColumnClick = False
              GridLines = True
              HideSelection = False
              ReadOnly = True
              RowSelect = True
              ParentShowHint = False
              PopupMenu = PopupMenu1
              ShowHint = False
              TabOrder = 0
              ViewStyle = vsReport
            end
            object Panel4: TPanel
              Left = 2
              Top = 15
              Width = 613
              Height = 41
              Align = alTop
              BevelOuter = bvNone
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 1
              object Bevel1: TBevel
                Left = 0
                Top = 0
                Width = 613
                Height = 41
                Align = alClient
                Shape = bsBottomLine
                ExplicitTop = -8
                ExplicitWidth = 622
              end
              object Button3: TButton
                Left = 41
                Top = 8
                Width = 75
                Height = 25
                Caption = #20889#21345
                TabOrder = 0
                OnClick = Button3Click
              end
              object RadioButton4: TRadioButton
                Left = 136
                Top = 12
                Width = 49
                Height = 17
                Caption = #26032#21345
                Checked = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                TabStop = True
              end
              object RadioButton5: TRadioButton
                Left = 184
                Top = 12
                Width = 49
                Height = 17
                Caption = #26087#21345
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
              end
              object Button5: TButton
                Left = 296
                Top = 8
                Width = 75
                Height = 25
                Caption = #22238#25910#21345
                TabOrder = 3
                OnClick = Button5Click
              end
            end
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 625
          Height = 857
          Align = alLeft
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 1
          object PageControl2: TPageControl
            Left = 0
            Top = 65
            Width = 625
            Height = 792
            ActivePage = MT3_17A_Debug
            Align = alClient
            TabOrder = 0
            object Protocol_Interface_Debug: TTabSheet
              Caption = 'Protocol_Interface_Debug'
              object Panel6: TPanel
                Left = 0
                Top = 0
                Width = 617
                Height = 764
                Align = alClient
                TabOrder = 0
                object Panel7: TPanel
                  Left = 1
                  Top = 1
                  Width = 295
                  Height = 762
                  Align = alLeft
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox2: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 295
                    Height = 225
                    Align = alTop
                    Caption = #20551#26399#35774#32622
                    TabOrder = 0
                    object lv_Days: TListView
                      Left = 2
                      Top = 81
                      Width = 291
                      Height = 142
                      Align = alClient
                      BorderStyle = bsNone
                      Columns = <
                        item
                          Caption = #26376#20221
                          Width = 0
                        end
                        item
                          Caption = #26376#20221
                        end
                        item
                          Caption = #20551#26085
                          Width = 210
                        end>
                      ColumnClick = False
                      GridLines = True
                      HideSelection = False
                      ReadOnly = True
                      RowSelect = True
                      ParentShowHint = False
                      PopupMenu = PopupMenu3
                      ShowHint = False
                      TabOrder = 0
                      ViewStyle = vsReport
                    end
                    object Panel10: TPanel
                      Left = 2
                      Top = 15
                      Width = 291
                      Height = 66
                      Align = alTop
                      BevelOuter = bvNone
                      TabOrder = 1
                      object Bevel2: TBevel
                        Left = 0
                        Top = 0
                        Width = 291
                        Height = 66
                        Align = alClient
                        Shape = bsBottomLine
                        ExplicitTop = -2
                        ExplicitHeight = 41
                      end
                      object Label8: TLabel
                        Left = 92
                        Top = 12
                        Width = 24
                        Height = 13
                        Caption = #21495#21015
                      end
                      object Label9: TLabel
                        Left = 10
                        Top = 12
                        Width = 24
                        Height = 13
                        Caption = #26376#20221
                      end
                      object edt_Days: TEdit
                        Left = 117
                        Top = 8
                        Width = 172
                        Height = 21
                        TabOrder = 0
                        Text = '1,2,3,4,5'
                      end
                      object edt_month: TEdit
                        Left = 35
                        Top = 8
                        Width = 49
                        Height = 21
                        TabOrder = 1
                        Text = '1'
                      end
                      object Button20: TButton
                        Left = 64
                        Top = 33
                        Width = 75
                        Height = 25
                        Caption = #26032#22686
                        TabOrder = 2
                        OnClick = Button20Click
                      end
                    end
                    object Button21: TButton
                      Left = 154
                      Top = 48
                      Width = 75
                      Height = 25
                      Caption = #22635#21152
                      TabOrder = 2
                      OnClick = Button21Click
                    end
                  end
                  object GroupBox4: TGroupBox
                    Left = 0
                    Top = 299
                    Width = 295
                    Height = 89
                    Align = alTop
                    Caption = 'ID'#35774#32622
                    TabOrder = 1
                    object Label10: TLabel
                      Left = 22
                      Top = 28
                      Width = 11
                      Height = 13
                      Caption = 'ID'
                    end
                    object Label11: TLabel
                      Left = 10
                      Top = 60
                      Width = 23
                      Height = 13
                      Caption = #26032'ID'
                    end
                    object edt_OldID: TEdit
                      Left = 35
                      Top = 24
                      Width = 134
                      Height = 21
                      TabOrder = 0
                      Text = '1'
                    end
                    object edt_NewID: TEdit
                      Left = 35
                      Top = 56
                      Width = 134
                      Height = 21
                      TabOrder = 1
                      Text = '1'
                    end
                    object Button22: TButton
                      Left = 192
                      Top = 54
                      Width = 75
                      Height = 25
                      Caption = #22635#21152
                      TabOrder = 2
                      OnClick = Button22Click
                    end
                    object RadioButton6: TRadioButton
                      Left = 176
                      Top = 28
                      Width = 49
                      Height = 17
                      Caption = #35774#32622
                      Checked = True
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clMaroon
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 3
                      TabStop = True
                    end
                    object RadioButton7: TRadioButton
                      Left = 224
                      Top = 28
                      Width = 49
                      Height = 17
                      Caption = #20462#25913
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clMaroon
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 4
                    end
                  end
                  object GroupBox7: TGroupBox
                    Left = 0
                    Top = 225
                    Width = 295
                    Height = 74
                    Align = alTop
                    Caption = #26102#38047#35774#32622
                    TabOrder = 2
                    object Label27: TLabel
                      Left = 13
                      Top = 22
                      Width = 36
                      Height = 13
                      Caption = #26085#26399#65306
                    end
                    object Label26: TLabel
                      Left = 13
                      Top = 46
                      Width = 36
                      Height = 13
                      Caption = #26102#38388#65306
                    end
                    object Button9: TButton
                      Left = 208
                      Top = 39
                      Width = 75
                      Height = 25
                      Caption = #22635#21152
                      TabOrder = 0
                      OnClick = Button9Click
                    end
                    object dt_Date: TDateTimePicker
                      Left = 64
                      Top = 16
                      Width = 113
                      Height = 21
                      Date = 42658.499074965280000000
                      Time = 42658.499074965280000000
                      TabOrder = 1
                    end
                    object dt_Timer: TDateTimePicker
                      Left = 64
                      Top = 40
                      Width = 113
                      Height = 21
                      Date = 42658.499074965280000000
                      Time = 42658.499074965280000000
                      Kind = dtkTime
                      TabOrder = 2
                    end
                    object Button12: TButton
                      Left = 208
                      Top = 12
                      Width = 75
                      Height = 25
                      Caption = #24403#21069#26102#38388
                      TabOrder = 3
                      OnClick = Button12Click
                    end
                  end
                  object GroupBox12: TGroupBox
                    Left = 0
                    Top = 449
                    Width = 295
                    Height = 313
                    Align = alClient
                    Caption = #20986#21378#35774#32622
                    TabOrder = 3
                    object chk1: TCheckBox
                      Left = 16
                      Top = 17
                      Width = 73
                      Height = 17
                      Caption = #35774#22791#21517#31216#65306
                      TabOrder = 0
                    end
                    object chk2: TCheckBox
                      Left = 16
                      Top = 40
                      Width = 73
                      Height = 17
                      Caption = #20844#31216#27969#37327#65306
                      TabOrder = 1
                    end
                    object chk6: TCheckBox
                      Left = 16
                      Top = 132
                      Width = 73
                      Height = 17
                      Caption = #24320#38400#26102#38388#65306
                      TabOrder = 5
                    end
                    object chk7: TCheckBox
                      Left = 16
                      Top = 159
                      Width = 73
                      Height = 17
                      Caption = #20851#38400#26102#38388#65306
                      TabOrder = 6
                    end
                    object chk8: TCheckBox
                      Left = 16
                      Top = 184
                      Width = 73
                      Height = 17
                      Caption = #24037#20316#27169#24335#65306
                      TabOrder = 7
                    end
                    object chk3: TCheckBox
                      Left = 16
                      Top = 63
                      Width = 73
                      Height = 17
                      Caption = #26368#22823#27969#37327#65306
                      TabOrder = 2
                    end
                    object chk4: TCheckBox
                      Left = 16
                      Top = 86
                      Width = 73
                      Height = 17
                      Caption = #26368#23567#27969#37327#65306
                      TabOrder = 3
                    end
                    object chk5: TCheckBox
                      Left = 16
                      Top = 109
                      Width = 73
                      Height = 17
                      Caption = #33033#20914#24403#37327#65306
                      TabOrder = 4
                    end
                    object edt_devName: TEdit
                      Left = 96
                      Top = 15
                      Width = 89
                      Height = 21
                      TabOrder = 8
                      Text = 'qc-17a'
                    end
                    object edt_gcln: TEdit
                      Left = 96
                      Top = 38
                      Width = 89
                      Height = 21
                      TabOrder = 9
                      Text = '2.5'
                    end
                    object edt_OpenTime: TEdit
                      Left = 96
                      Top = 130
                      Width = 89
                      Height = 21
                      TabOrder = 10
                      Text = '6'
                    end
                    object edt_CloseTime: TEdit
                      Left = 96
                      Top = 157
                      Width = 89
                      Height = 21
                      TabOrder = 11
                      Text = '2'
                    end
                    object edt_WrokMod: TEdit
                      Left = 96
                      Top = 182
                      Width = 89
                      Height = 21
                      TabOrder = 12
                      Text = '2'
                    end
                    object edt_maxGas: TEdit
                      Left = 96
                      Top = 62
                      Width = 89
                      Height = 21
                      TabOrder = 13
                      Text = '0'
                    end
                    object edt_MinGas: TEdit
                      Left = 96
                      Top = 85
                      Width = 89
                      Height = 21
                      TabOrder = 14
                      Text = '0'
                    end
                    object edt_mcdl: TEdit
                      Left = 96
                      Top = 107
                      Width = 89
                      Height = 21
                      TabOrder = 15
                      Text = '100'
                    end
                    object Button24: TButton
                      Left = 200
                      Top = 78
                      Width = 75
                      Height = 25
                      Caption = #22635#21152
                      TabOrder = 16
                      OnClick = Button24Click
                    end
                  end
                  object GroupBox14: TGroupBox
                    Left = 0
                    Top = 388
                    Width = 295
                    Height = 61
                    Align = alTop
                    Caption = #38454#27573#21464#26356
                    TabOrder = 4
                    object Button26: TButton
                      Left = 192
                      Top = 18
                      Width = 75
                      Height = 25
                      Caption = #22635#21152
                      TabOrder = 0
                      OnClick = Button26Click
                    end
                    object RadioButton8: TRadioButton
                      Left = 64
                      Top = 22
                      Width = 49
                      Height = 17
                      Caption = 'A'#38454#27573
                      Checked = True
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clMaroon
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 1
                      TabStop = True
                    end
                    object RadioButton9: TRadioButton
                      Left = 120
                      Top = 22
                      Width = 49
                      Height = 17
                      Caption = 'B'#38454#27573
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clMaroon
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 2
                    end
                  end
                end
                object Panel11: TPanel
                  Left = 300
                  Top = 1
                  Width = 316
                  Height = 762
                  Align = alClient
                  BevelOuter = bvNone
                  Caption = 'Panel6'
                  TabOrder = 1
                  object GroupBox5: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 316
                    Height = 89
                    Align = alTop
                    Caption = #24320#25143
                    TabOrder = 0
                    object Label18: TLabel
                      Left = 24
                      Top = 16
                      Width = 72
                      Height = 13
                      Caption = #26032#20844#21496#32534#21495#65306
                    end
                    object Label19: TLabel
                      Left = 60
                      Top = 40
                      Width = 36
                      Height = 13
                      Caption = #21345#21495#65306
                    end
                    object Label20: TLabel
                      Left = 36
                      Top = 64
                      Width = 60
                      Height = 13
                      Caption = #21021#22987#27425#25968#65306
                    end
                    object edt_newCommpany: TEdit
                      Left = 96
                      Top = 13
                      Width = 97
                      Height = 21
                      TabOrder = 0
                      Text = '8888'
                    end
                    object edt_CardNo: TEdit
                      Left = 96
                      Top = 37
                      Width = 97
                      Height = 21
                      TabOrder = 1
                      Text = '12345678'
                    end
                    object edt_initTimes: TEdit
                      Left = 96
                      Top = 61
                      Width = 97
                      Height = 21
                      TabOrder = 2
                      Text = '0'
                    end
                    object Button6: TButton
                      Left = 208
                      Top = 32
                      Width = 75
                      Height = 25
                      Caption = #22635#21152
                      TabOrder = 3
                      OnClick = Button6Click
                    end
                  end
                  object GroupBox6: TGroupBox
                    Left = 0
                    Top = 89
                    Width = 316
                    Height = 136
                    Align = alTop
                    Caption = #20805#20540
                    TabOrder = 1
                    object Label21: TLabel
                      Left = 61
                      Top = 16
                      Width = 35
                      Height = 13
                      Caption = #34920'ID'#65306
                    end
                    object Label22: TLabel
                      Left = 48
                      Top = 40
                      Width = 48
                      Height = 13
                      Caption = #20805#20540#37327#65306
                    end
                    object Label23: TLabel
                      Left = 24
                      Top = 64
                      Width = 72
                      Height = 13
                      Caption = #19978#27425#20805#20540#37327#65306
                    end
                    object Label24: TLabel
                      Left = 12
                      Top = 88
                      Width = 84
                      Height = 13
                      Caption = #19978#19978#27425#20805#20540#25968#65306
                    end
                    object Label25: TLabel
                      Left = 36
                      Top = 112
                      Width = 60
                      Height = 13
                      Caption = #20805#20540#27425#25968#65306
                    end
                    object edt_meterid: TEdit
                      Left = 96
                      Top = 13
                      Width = 97
                      Height = 21
                      TabOrder = 0
                      Text = '0'
                    end
                    object edt_OneValue: TEdit
                      Left = 96
                      Top = 37
                      Width = 97
                      Height = 21
                      TabOrder = 1
                      Text = '10'
                    end
                    object edt_TwoValue: TEdit
                      Left = 96
                      Top = 61
                      Width = 97
                      Height = 21
                      TabOrder = 2
                      Text = '0'
                    end
                    object edt_ThreeValue: TEdit
                      Left = 96
                      Top = 85
                      Width = 97
                      Height = 21
                      TabOrder = 3
                      Text = '0'
                    end
                    object edt_Times: TEdit
                      Left = 96
                      Top = 109
                      Width = 97
                      Height = 21
                      TabOrder = 4
                      Text = '1'
                    end
                    object Button8: TButton
                      Left = 208
                      Top = 31
                      Width = 75
                      Height = 25
                      Caption = #22635#21152
                      TabOrder = 5
                      OnClick = Button8Click
                    end
                    object Button15: TButton
                      Left = 208
                      Top = 71
                      Width = 75
                      Height = 25
                      Caption = #19979#19968#27425
                      TabOrder = 6
                      OnClick = Button15Click
                    end
                    object Button27: TButton
                      Left = 208
                      Top = 104
                      Width = 75
                      Height = 25
                      Caption = #21021#22987
                      TabOrder = 7
                      OnClick = Button27Click
                    end
                  end
                  object GroupBox9: TGroupBox
                    Left = 0
                    Top = 225
                    Width = 316
                    Height = 72
                    Align = alTop
                    Caption = #36229#32423#20805#20540
                    TabOrder = 2
                    object Label30: TLabel
                      Left = 24
                      Top = 46
                      Width = 36
                      Height = 13
                      Caption = #21333#20215#65306
                    end
                    object Label31: TLabel
                      Left = 13
                      Top = 22
                      Width = 48
                      Height = 13
                      Caption = #20805#20540#37327#65306
                    end
                    object edt_SuperPrice: TEdit
                      Left = 64
                      Top = 43
                      Width = 113
                      Height = 21
                      TabOrder = 0
                      Text = '1'
                      OnKeyUp = edt_KeyKeyUp
                    end
                    object edt_SuperValue: TEdit
                      Left = 64
                      Top = 19
                      Width = 113
                      Height = 21
                      TabOrder = 1
                      Text = '0.5'
                    end
                    object Button11: TButton
                      Left = 208
                      Top = 23
                      Width = 75
                      Height = 25
                      Caption = #22635#21152
                      TabOrder = 2
                      OnClick = Button11Click
                    end
                  end
                  object GroupBox13: TGroupBox
                    Left = 0
                    Top = 449
                    Width = 316
                    Height = 313
                    Align = alClient
                    Caption = #21442#25968#35774#32622
                    TabOrder = 3
                    object Label12: TLabel
                      Left = 184
                      Top = 54
                      Width = 6
                      Height = 13
                      Caption = 'h'
                    end
                    object Label13: TLabel
                      Left = 184
                      Top = 81
                      Width = 6
                      Height = 13
                      Caption = 'h'
                    end
                    object Label14: TLabel
                      Left = 184
                      Top = 108
                      Width = 6
                      Height = 13
                      Caption = 'h'
                    end
                    object chkp7: TCheckBox
                      Left = 16
                      Top = 187
                      Width = 73
                      Height = 17
                      Caption = #36879#25903#37327#65306
                      TabOrder = 6
                    end
                    object chkp6: TCheckBox
                      Left = 16
                      Top = 160
                      Width = 73
                      Height = 17
                      Caption = #25253#35686#37327#65306
                      TabOrder = 5
                    end
                    object chkp5: TCheckBox
                      Left = 16
                      Top = 133
                      Width = 73
                      Height = 17
                      Caption = #23663#37327#38480#21046#65306
                      TabOrder = 4
                    end
                    object chkp4: TCheckBox
                      Left = 16
                      Top = 106
                      Width = 113
                      Height = 17
                      Caption = 'D'#38454#27573#36229#26102#26102#38388#65306
                      TabOrder = 3
                    end
                    object chkp3: TCheckBox
                      Left = 16
                      Top = 79
                      Width = 121
                      Height = 17
                      Caption = #36229#23567#27969#37327#36229#26102#26102#38388#65306
                      TabOrder = 2
                    end
                    object chkp2: TCheckBox
                      Left = 16
                      Top = 52
                      Width = 105
                      Height = 17
                      Caption = 'C'#38454#27573#36229#26102#26102#38388#65306
                      TabOrder = 1
                    end
                    object chkp1: TCheckBox
                      Left = 16
                      Top = 25
                      Width = 73
                      Height = 17
                      Caption = #23567#25968#31934#24230#65306
                      TabOrder = 0
                    end
                    object edt_TZL: TEdit
                      Left = 80
                      Top = 185
                      Width = 97
                      Height = 21
                      TabOrder = 9
                      Text = '-100'
                    end
                    object edt_BJL: TEdit
                      Left = 80
                      Top = 158
                      Width = 97
                      Height = 21
                      TabOrder = 10
                      Text = '0.5'
                    end
                    object edt_MaxCZL: TEdit
                      Left = 88
                      Top = 131
                      Width = 89
                      Height = 21
                      TabOrder = 11
                      Text = '1000'
                    end
                    object edt_Float: TEdit
                      Left = 88
                      Top = 23
                      Width = 89
                      Height = 21
                      TabOrder = 12
                      Text = '100'
                    end
                    object edt_CTime: TEdit
                      Left = 120
                      Top = 50
                      Width = 57
                      Height = 21
                      TabOrder = 13
                      Text = '30'
                    end
                    object edt_DTime: TEdit
                      Left = 120
                      Top = 104
                      Width = 57
                      Height = 21
                      TabOrder = 14
                      Text = '3'
                    end
                    object edt_MinGasTime: TEdit
                      Left = 136
                      Top = 77
                      Width = 41
                      Height = 21
                      TabOrder = 15
                      Text = '30'
                    end
                    object Button25: TButton
                      Left = 208
                      Top = 78
                      Width = 75
                      Height = 25
                      Caption = #22635#21152
                      TabOrder = 16
                      OnClick = Button25Click
                    end
                    object chkp8: TCheckBox
                      Left = 16
                      Top = 211
                      Width = 73
                      Height = 17
                      Caption = #36879#25903#19979#38480#65306
                      TabOrder = 7
                    end
                    object edt_TZXX: TEdit
                      Left = 96
                      Top = 209
                      Width = 81
                      Height = 21
                      TabOrder = 17
                      Text = '-200'
                    end
                    object chkp9: TCheckBox
                      Left = 16
                      Top = 235
                      Width = 73
                      Height = 17
                      Caption = #24320#20851#36229#27969#65306
                      TabOrder = 8
                    end
                    object Panel12: TPanel
                      Left = 88
                      Top = 235
                      Width = 185
                      Height = 19
                      BevelOuter = bvNone
                      TabOrder = 18
                      object RadioButton10: TRadioButton
                        Left = 7
                        Top = 2
                        Width = 50
                        Height = 17
                        Caption = #24320#21551
                        Checked = True
                        TabOrder = 0
                        TabStop = True
                      end
                      object RadioButton11: TRadioButton
                        Left = 63
                        Top = 2
                        Width = 50
                        Height = 17
                        Caption = #20851#38381
                        TabOrder = 1
                      end
                    end
                  end
                  object GroupBox8: TGroupBox
                    Left = 0
                    Top = 297
                    Width = 316
                    Height = 71
                    Align = alTop
                    Caption = #23494#38053#35774#32622
                    TabOrder = 4
                    object Label28: TLabel
                      Left = 24
                      Top = 46
                      Width = 36
                      Height = 13
                      Caption = #23494#38053#65306
                    end
                    object Label29: TLabel
                      Left = 13
                      Top = 22
                      Width = 48
                      Height = 13
                      Caption = #23494#38053#21495#65306
                    end
                    object edt_UpKeyValue: TEdit
                      Left = 64
                      Top = 43
                      Width = 225
                      Height = 21
                      TabOrder = 0
                      Text = 'AD7F3FB245AEDC8F0F9E3830010FE1C1'
                      OnKeyUp = edt_KeyKeyUp
                    end
                    object edt_UpKeyNo: TEdit
                      Left = 64
                      Top = 19
                      Width = 113
                      Height = 21
                      TabOrder = 1
                      Text = '0'
                    end
                    object Button10: TButton
                      Left = 208
                      Top = 15
                      Width = 75
                      Height = 25
                      Caption = #22635#21152
                      TabOrder = 2
                      OnClick = Button10Click
                    end
                  end
                  object GroupBox3: TGroupBox
                    Left = 0
                    Top = 368
                    Width = 316
                    Height = 81
                    Align = alTop
                    Caption = #21151#33021#21345
                    TabOrder = 5
                    object Button14: TButton
                      Left = 24
                      Top = 16
                      Width = 75
                      Height = 25
                      Caption = #28165#38646
                      TabOrder = 0
                      OnClick = Button14Click
                    end
                    object Button16: TButton
                      Left = 208
                      Top = 16
                      Width = 75
                      Height = 25
                      Caption = #27979#35797
                      TabOrder = 1
                      OnClick = Button16Click
                    end
                    object Button17: TButton
                      Left = 24
                      Top = 46
                      Width = 75
                      Height = 25
                      Caption = #26597#35810
                      TabOrder = 2
                      OnClick = Button17Click
                    end
                    object Button18: TButton
                      Left = 116
                      Top = 46
                      Width = 75
                      Height = 25
                      Caption = #35299#38145
                      TabOrder = 3
                      OnClick = Button18Click
                    end
                    object Button19: TButton
                      Left = 208
                      Top = 46
                      Width = 75
                      Height = 25
                      Caption = #36716#31227
                      TabOrder = 4
                      OnClick = Button19Click
                    end
                    object Button23: TButton
                      Left = 116
                      Top = 16
                      Width = 75
                      Height = 25
                      Caption = #20851#38400
                      TabOrder = 5
                      OnClick = Button23Click
                    end
                  end
                end
                object Panel9: TPanel
                  Left = 296
                  Top = 1
                  Width = 4
                  Height = 762
                  Align = alLeft
                  BevelOuter = bvNone
                  TabOrder = 2
                end
              end
            end
            object MT3_17A_Debug: TTabSheet
              Caption = 'Encryption_decryption'
              ImageIndex = 1
              object GroupBox1: TGroupBox
                Left = 0
                Top = 0
                Width = 617
                Height = 129
                Align = alTop
                Caption = #21152#35299#23494
                TabOrder = 0
                object Label1: TLabel
                  Left = 16
                  Top = 24
                  Width = 36
                  Height = 13
                  Caption = #21407#25991#65306
                end
                object Label2: TLabel
                  Left = 16
                  Top = 48
                  Width = 36
                  Height = 13
                  Caption = #23494#25991#65306
                end
                object lb_pl_len: TLabel
                  Left = 344
                  Top = 24
                  Width = 31
                  Height = 13
                  Caption = '8 Byte'
                end
                object lb_En_len: TLabel
                  Left = 344
                  Top = 48
                  Width = 31
                  Height = 13
                  Caption = '0 Byte'
                end
                object Label4: TLabel
                  Left = 16
                  Top = 71
                  Width = 33
                  Height = 13
                  Caption = 'CRC'#65306
                end
                object Button1: TButton
                  Left = 54
                  Top = 96
                  Width = 75
                  Height = 25
                  Caption = #21152#23494
                  TabOrder = 0
                  OnClick = Button1Click
                end
                object edt_Encrypted: TEdit
                  Left = 48
                  Top = 44
                  Width = 289
                  Height = 21
                  TabOrder = 1
                  OnKeyUp = edt_EncryptedKeyUp
                end
                object edt_Plaintext: TEdit
                  Left = 48
                  Top = 20
                  Width = 289
                  Height = 21
                  TabOrder = 2
                  Text = '1234567890123456'
                  OnKeyUp = edt_PlaintextKeyUp
                end
                object Button2: TButton
                  Left = 150
                  Top = 96
                  Width = 75
                  Height = 25
                  Caption = #35299#23494
                  TabOrder = 3
                  OnClick = Button2Click
                end
                object edt_crc: TEdit
                  Left = 48
                  Top = 68
                  Width = 289
                  Height = 21
                  TabOrder = 4
                  OnKeyUp = edt_EncryptedKeyUp
                end
                object Button4: TButton
                  Left = 240
                  Top = 96
                  Width = 75
                  Height = 25
                  Caption = 'CRC'
                  TabOrder = 5
                  OnClick = Button4Click
                end
              end
            end
          end
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 625
            Height = 65
            Align = alTop
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 1
            object Label3: TLabel
              Left = 232
              Top = 38
              Width = 36
              Height = 13
              Caption = #23494#38053#65306
            end
            object lb_key_len: TLabel
              Left = 574
              Top = 38
              Width = 37
              Height = 13
              Caption = '16 Byte'
            end
            object Label7: TLabel
              Left = 21
              Top = 14
              Width = 47
              Height = 13
              Caption = #36523#20221'ID'#65306
            end
            object Label5: TLabel
              Left = 208
              Top = 14
              Width = 60
              Height = 13
              Caption = #20844#21496#32534#21495#65306
            end
            object Label6: TLabel
              Left = 21
              Top = 38
              Width = 48
              Height = 13
              Caption = #23494#38053#21495#65306
            end
            object edt_Key: TEdit
              Left = 272
              Top = 35
              Width = 297
              Height = 21
              TabOrder = 0
              Text = 'AD7F3FB245AEDC8F0F9E3830010FE1C1'
              OnKeyUp = edt_KeyKeyUp
            end
            object edt_CheckID: TEdit
              Left = 72
              Top = 11
              Width = 113
              Height = 21
              TabOrder = 1
              Text = '0'
              OnKeyUp = edt_KeyKeyUp
            end
            object edt_Commpany: TEdit
              Left = 272
              Top = 11
              Width = 113
              Height = 21
              TabOrder = 2
              Text = '0'
              OnKeyUp = edt_KeyKeyUp
            end
            object edt_keyNo: TEdit
              Left = 72
              Top = 35
              Width = 113
              Height = 21
              TabOrder = 3
              Text = '0'
              OnKeyUp = edt_KeyKeyUp
            end
            object RadioButton1: TRadioButton
              Left = 408
              Top = 12
              Width = 57
              Height = 17
              Caption = #19994#21153#21345
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              TabStop = True
            end
            object RadioButton2: TRadioButton
              Left = 488
              Top = 12
              Width = 57
              Height = 17
              Caption = #37197#32622#21345
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
          end
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 744
    Top = 184
    object N1: TMenuItem
      Caption = #31227#38500
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #28165#31354
      OnClick = N3Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 760
    Top = 352
    object N4: TMenuItem
      Caption = #22797#21046
      OnClick = N4Click
    end
    object N10: TMenuItem
      Caption = #20840#36873
      OnClick = N10Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Caption = #28165#31354
      OnClick = N6Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 208
    Top = 248
    object N7: TMenuItem
      Caption = #31227#38500
      OnClick = N7Click
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Caption = #28165#31354
      OnClick = N9Click
    end
  end
end
