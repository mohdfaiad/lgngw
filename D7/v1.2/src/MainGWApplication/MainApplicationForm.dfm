object FormMainApplication: TFormMainApplication
  Left = 313
  Top = 109
  Width = 894
  Height = 596
  Caption = 'BMS HOSxP LIS Gateway 1.2 '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    886
    569)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 886
    Height = 513
    ActivePage = TabSheet1
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Flat Transfer'
      object Splitter1: TSplitter
        Left = 605
        Top = 73
        Height = 412
        Align = alRight
      end
      object pnTop: TPanel
        Left = 0
        Top = 0
        Width = 878
        Height = 73
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Button1: TButton
          Left = 16
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Button1'
          TabOrder = 0
          Visible = False
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 8
          Top = 112
          Width = 75
          Height = 25
          Caption = 'Button2'
          TabOrder = 1
          Visible = False
          OnClick = Button2Click
        end
        object JvNavPanelHeader1: TJvNavPanelHeader
          Left = 0
          Top = 0
          Width = 878
          Height = 73
          Align = alClient
          Alignment = taCenter
          Caption = 'BMS HOSxP LIS Gateways'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ColorFrom = clGray
          ColorTo = clGray
          ImageIndex = 0
        end
      end
      object pnRight: TPanel
        Left = 608
        Top = 73
        Width = 270
        Height = 412
        Align = alRight
        TabOrder = 1
        object cxGroupBox1: TcxGroupBox
          Left = 1
          Top = 1
          Align = alClient
          Caption = 'Status'
          Style.LookAndFeel.SkinName = 'UserSkin'
          StyleDisabled.LookAndFeel.SkinName = 'UserSkin'
          StyleFocused.LookAndFeel.SkinName = 'UserSkin'
          StyleHot.LookAndFeel.SkinName = 'UserSkin'
          TabOrder = 0
          Height = 410
          Width = 268
          object cxGroupBox4: TcxGroupBox
            Left = 3
            Top = 15
            Align = alTop
            Caption = ' Controller '
            Style.LookAndFeel.Kind = lfStandard
            StyleDisabled.LookAndFeel.Kind = lfStandard
            StyleFocused.LookAndFeel.Kind = lfStandard
            StyleHot.LookAndFeel.Kind = lfStandard
            TabOrder = 0
            Transparent = True
            Height = 162
            Width = 262
            object Label1: TLabel
              Left = 102
              Top = 89
              Width = 21
              Height = 13
              Caption = 'Sec.'
              Transparent = True
            end
            object Label2: TLabel
              Left = 14
              Top = 88
              Width = 26
              Height = 13
              Caption = 'Timer'
              Transparent = True
            end
            object btnMapping: TButton
              Left = 4
              Top = 21
              Width = 98
              Height = 25
              Caption = 'Mapping'
              TabOrder = 0
              OnClick = btnMappingClick
            end
            object btnStartProcess: TButton
              Left = 4
              Top = 52
              Width = 98
              Height = 25
              Caption = 'Start Process'
              TabOrder = 1
              OnClick = btnStartProcessClick
            end
            object btnConfiguration: TButton
              Left = 105
              Top = 21
              Width = 81
              Height = 25
              Caption = 'Configuration'
              TabOrder = 2
              OnClick = btnConfigurationClick
            end
            object btnStopProcess: TButton
              Left = 105
              Top = 52
              Width = 81
              Height = 25
              Caption = 'Stop'
              TabOrder = 3
              OnClick = btnStopProcessClick
            end
            object spSec: TcxSpinEdit
              Left = 48
              Top = 85
              ParentFont = False
              Properties.MinValue = 1.000000000000000000
              Style.Font.Charset = THAI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.IsFontAssigned = True
              TabOrder = 4
              Value = 10
              Width = 49
            end
            object btnClearLog: TButton
              Left = 190
              Top = 52
              Width = 68
              Height = 25
              Caption = 'Clear Log'
              TabOrder = 5
              OnClick = btnClearLogClick
            end
            object ckMarkTrack: TCheckBox
              Left = 24
              Top = 128
              Width = 97
              Height = 17
              Caption = 'MarkTrack'
              Checked = True
              State = cbChecked
              TabOrder = 6
              Visible = False
            end
          end
          object cxGroupBox5: TcxGroupBox
            Left = 3
            Top = 177
            Align = alClient
            Caption = ' Database Infomation '
            Style.LookAndFeel.Kind = lfStandard
            StyleDisabled.LookAndFeel.Kind = lfStandard
            StyleFocused.LookAndFeel.Kind = lfStandard
            StyleHot.LookAndFeel.Kind = lfStandard
            TabOrder = 1
            Transparent = True
            Height = 223
            Width = 262
            object cxLabel1: TcxLabel
              Left = 5
              Top = 32
              AutoSize = False
              Caption = 'HOS DB Server '
              ParentFont = False
              Style.Font.Charset = THAI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.LookAndFeel.Kind = lfUltraFlat
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.Kind = lfUltraFlat
              StyleFocused.LookAndFeel.Kind = lfUltraFlat
              StyleHot.LookAndFeel.Kind = lfUltraFlat
              Transparent = True
              Height = 26
              Width = 105
            end
            object edHosDBServer: TcxTextEdit
              Left = 111
              Top = 29
              AutoSize = False
              ParentFont = False
              Properties.ReadOnly = True
              Style.Color = clSilver
              Style.Font.Charset = THAI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.IsFontAssigned = True
              TabOrder = 1
              Height = 24
              Width = 147
            end
            object edHosDBName: TcxTextEdit
              Left = 111
              Top = 53
              AutoSize = False
              ParentFont = False
              Properties.ReadOnly = True
              Style.Color = clSilver
              Style.Font.Charset = THAI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.IsFontAssigned = True
              TabOrder = 2
              Height = 24
              Width = 147
            end
            object cxLabel2: TcxLabel
              Left = 5
              Top = 56
              AutoSize = False
              Caption = 'HOS DB Name '
              ParentFont = False
              Style.Font.Charset = THAI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
              Height = 26
              Width = 110
            end
            object cxLabel5: TcxLabel
              Left = 5
              Top = 104
              AutoSize = False
              Caption = 'Gateway DB Server '
              ParentFont = False
              Style.Font.Charset = THAI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.LookAndFeel.Kind = lfUltraFlat
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.Kind = lfUltraFlat
              StyleFocused.LookAndFeel.Kind = lfUltraFlat
              StyleHot.LookAndFeel.Kind = lfUltraFlat
              Transparent = True
              Height = 26
              Width = 105
            end
            object edGwDBServer: TcxTextEdit
              Left = 111
              Top = 101
              AutoSize = False
              ParentFont = False
              Properties.ReadOnly = True
              Style.Color = clSilver
              Style.Font.Charset = THAI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.IsFontAssigned = True
              TabOrder = 5
              Height = 24
              Width = 147
            end
            object edGwDBName: TcxTextEdit
              Left = 111
              Top = 125
              AutoSize = False
              ParentFont = False
              Properties.ReadOnly = True
              Style.Color = clSilver
              Style.Font.Charset = THAI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.IsFontAssigned = True
              TabOrder = 6
              Height = 24
              Width = 147
            end
            object cxLabel6: TcxLabel
              Left = 5
              Top = 128
              AutoSize = False
              Caption = 'Gateway DB Name '
              ParentFont = False
              Style.Font.Charset = THAI_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Transparent = True
              Height = 26
              Width = 110
            end
            object lbHosConnStatus: TcxLabel
              Left = 5
              Top = 79
              AutoSize = False
              Caption = 'Not Connect.'
              ParentFont = False
              Style.Font.Charset = THAI_CHARSET
              Style.Font.Color = clNavy
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.IsFontAssigned = True
              Transparent = True
              Height = 26
              Width = 253
            end
            object lbGwConnStatus: TcxLabel
              Left = 4
              Top = 151
              AutoSize = False
              Caption = 'Not Connect.'
              ParentFont = False
              Style.Font.Charset = THAI_CHARSET
              Style.Font.Color = clNavy
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.IsFontAssigned = True
              Transparent = True
              Height = 26
              Width = 253
            end
          end
        end
      end
      object pnClients: TPanel
        Left = 0
        Top = 73
        Width = 605
        Height = 412
        Align = alClient
        TabOrder = 2
        object Splitter2: TSplitter
          Left = 1
          Top = 153
          Width = 603
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object grpWork: TGroupBox
          Left = 1
          Top = 156
          Width = 603
          Height = 255
          Align = alClient
          Caption = ' Working process '
          TabOrder = 0
          object memoProcessLog: TMemo
            Left = 2
            Top = 15
            Width = 599
            Height = 238
            Align = alClient
            Lines.Strings = (
              'memoProcessLog')
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
        object grpError: TGroupBox
          Left = 1
          Top = 1
          Width = 603
          Height = 152
          Align = alTop
          Caption = 'Error Logging'
          TabOrder = 1
          object MemoError: TMemo
            Left = 2
            Top = 15
            Width = 599
            Height = 135
            Align = alClient
            Lines.Strings = (
              'memoProcessLog')
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Drill down Transfer'
      Enabled = False
      ImageIndex = 1
      TabVisible = False
      object Splitter3: TSplitter
        Left = 605
        Top = 145
        Height = 321
        Align = alRight
      end
      object Panel2: TPanel
        Left = 608
        Top = 145
        Width = 270
        Height = 321
        Align = alRight
        TabOrder = 0
        object cxGroupBox6: TcxGroupBox
          Left = 1
          Top = 1
          Align = alClient
          Caption = 'Status'
          Style.LookAndFeel.SkinName = 'UserSkin'
          StyleDisabled.LookAndFeel.SkinName = 'UserSkin'
          StyleFocused.LookAndFeel.SkinName = 'UserSkin'
          StyleHot.LookAndFeel.SkinName = 'UserSkin'
          TabOrder = 0
          Height = 319
          Width = 268
          object cxGroupBox7: TcxGroupBox
            Left = 3
            Top = 15
            Align = alTop
            Caption = ' Controller '
            Style.LookAndFeel.Kind = lfStandard
            StyleDisabled.LookAndFeel.Kind = lfStandard
            StyleFocused.LookAndFeel.Kind = lfStandard
            StyleHot.LookAndFeel.Kind = lfStandard
            TabOrder = 0
            Transparent = True
            Height = 122
            Width = 262
            object Button3: TButton
              Left = 16
              Top = 21
              Width = 81
              Height = 25
              Caption = 'Mapping'
              TabOrder = 0
              OnClick = btnMappingClick
            end
            object btnStartDrillDownProcess: TButton
              Left = 16
              Top = 52
              Width = 81
              Height = 25
              Caption = 'Start Process'
              TabOrder = 1
            end
            object Button5: TButton
              Left = 104
              Top = 21
              Width = 81
              Height = 25
              Caption = 'Configuration'
              TabOrder = 2
              OnClick = btnConfigurationClick
            end
          end
          object cxGroupBox8: TcxGroupBox
            Left = 3
            Top = 137
            Align = alClient
            Caption = ' Database Infomation '
            Style.LookAndFeel.Kind = lfStandard
            StyleDisabled.LookAndFeel.Kind = lfStandard
            StyleFocused.LookAndFeel.Kind = lfStandard
            StyleHot.LookAndFeel.Kind = lfStandard
            TabOrder = 1
            Transparent = True
            DesignSize = (
              262
              172)
            Height = 172
            Width = 262
            object cxPageControl2: TcxPageControl
              Left = 3
              Top = 13
              Width = 258
              Height = 158
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              Properties.ActivePage = cxTabSheet3
              LookAndFeel.Kind = lfStandard
              LookAndFeel.SkinName = 'UserSkin'
              ClientRectBottom = 152
              ClientRectLeft = 3
              ClientRectRight = 252
              ClientRectTop = 26
              object cxTabSheet3: TcxTabSheet
                Caption = ' HOSxP  '
                ImageIndex = 0
                object cxLabel3: TcxLabel
                  Left = 0
                  Top = 8
                  AutoSize = False
                  Caption = 'DB Server :'
                  Style.LookAndFeel.Kind = lfUltraFlat
                  StyleDisabled.LookAndFeel.Kind = lfUltraFlat
                  StyleFocused.LookAndFeel.Kind = lfUltraFlat
                  StyleHot.LookAndFeel.Kind = lfUltraFlat
                  Transparent = True
                  Height = 26
                  Width = 105
                end
                object cxTextEdit1: TcxTextEdit
                  Left = 70
                  Top = 5
                  AutoSize = False
                  ParentFont = False
                  Properties.ReadOnly = True
                  Style.Color = clSilver
                  Style.Font.Charset = THAI_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  TabOrder = 1
                  Height = 24
                  Width = 170
                end
                object cxLabel4: TcxLabel
                  Left = 0
                  Top = 32
                  AutoSize = False
                  Caption = 'DB Name :'
                  Transparent = True
                  Height = 26
                  Width = 110
                end
                object cxTextEdit2: TcxTextEdit
                  Left = 70
                  Top = 29
                  AutoSize = False
                  ParentFont = False
                  Properties.ReadOnly = True
                  Style.Color = clSilver
                  Style.Font.Charset = THAI_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  TabOrder = 3
                  Height = 24
                  Width = 170
                end
              end
              object cxTabSheet4: TcxTabSheet
                Caption = ' Gateway '
                ImageIndex = 1
                object cxLabel7: TcxLabel
                  Left = 0
                  Top = 8
                  AutoSize = False
                  Caption = 'DB Server :'
                  Style.LookAndFeel.Kind = lfUltraFlat
                  StyleDisabled.LookAndFeel.Kind = lfUltraFlat
                  StyleFocused.LookAndFeel.Kind = lfUltraFlat
                  StyleHot.LookAndFeel.Kind = lfUltraFlat
                  Transparent = True
                  Height = 26
                  Width = 105
                end
                object cxTextEdit3: TcxTextEdit
                  Left = 70
                  Top = 5
                  AutoSize = False
                  ParentFont = False
                  Properties.ReadOnly = True
                  Style.Color = clSilver
                  Style.Font.Charset = THAI_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  TabOrder = 1
                  Height = 24
                  Width = 170
                end
                object cxLabel8: TcxLabel
                  Left = 0
                  Top = 32
                  AutoSize = False
                  Caption = 'DB Name :'
                  Transparent = True
                  Height = 26
                  Width = 110
                end
                object cxTextEdit4: TcxTextEdit
                  Left = 70
                  Top = 29
                  AutoSize = False
                  ParentFont = False
                  Properties.ReadOnly = True
                  Style.Color = clSilver
                  Style.Font.Charset = THAI_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  TabOrder = 3
                  Height = 24
                  Width = 170
                end
              end
            end
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 145
        Width = 605
        Height = 321
        Align = alClient
        TabOrder = 1
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 878
        Height = 145
        Align = alTop
        TabOrder = 2
      end
      object StatusBar2: TStatusBar
        Left = 0
        Top = 466
        Width = 878
        Height = 19
        Panels = <
          item
            Width = 50
          end>
      end
    end
  end
  object ProgressBar: TProgressBar
    Left = 0
    Top = 541
    Width = 886
    Height = 8
    Anchors = [akLeft, akRight, akBottom]
    Smooth = True
    Step = 100
    TabOrder = 1
  end
  object pnRecordInfo: TPanel
    Left = 496
    Top = 519
    Width = 382
    Height = 19
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 550
    Width = 886
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object pnTablesInfo: TPanel
    Left = 4
    Top = 519
    Width = 357
    Height = 19
    Alignment = taLeftJustify
    Anchors = [akLeft, akBottom]
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 296
  end
  object TimerFlatProcess: TTimer
    Enabled = False
    OnTimer = TimerFlatProcessTimer
    Left = 716
    Top = 104
  end
  object TimerAutoStart: TTimer
    Enabled = False
    OnTimer = TimerAutoStartTimer
    Left = 272
    Top = 296
  end
  object TimerTestConnection: TTimer
    Interval = 5000
    OnTimer = TimerTestConnectionTimer
    Left = 376
    Top = 296
  end
  object MyQuery: TMyQuery
    Connection = MyConnection
    Left = 200
    Top = 144
  end
  object MyConnection: TMyConnection
    Database = 'hos'
    Username = 'root'
    Password = '123456'
    Server = 'localhost'
    Left = 320
    Top = 160
  end
  object dsp: TDataSetProvider
    Left = 208
    Top = 48
  end
end
