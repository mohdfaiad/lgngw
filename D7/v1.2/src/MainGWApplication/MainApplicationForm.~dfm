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
        object lbHosConnStatus: TLabel
          Left = 16
          Top = 264
          Width = 82
          Height = 13
          Caption = 'lbHosConnStatus'
        end
        object lbGwConnStatus: TLabel
          Left = 24
          Top = 312
          Width = 79
          Height = 13
          Caption = 'lbGwConnStatus'
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
        object btnConfiguration: TButton
          Left = 105
          Top = 21
          Width = 81
          Height = 25
          Caption = 'Configuration'
          TabOrder = 1
          OnClick = btnConfigurationClick
        end
        object btnStopProcess: TButton
          Left = 105
          Top = 52
          Width = 81
          Height = 25
          Caption = 'Stop'
          TabOrder = 2
          OnClick = btnStopProcessClick
        end
        object btnStartProcess: TButton
          Left = 4
          Top = 52
          Width = 98
          Height = 25
          Caption = 'Start Process'
          TabOrder = 3
          OnClick = btnStartProcessClick
        end
        object btnClearLog: TButton
          Left = 190
          Top = 52
          Width = 68
          Height = 25
          Caption = 'Clear Log'
          TabOrder = 4
          OnClick = btnClearLogClick
        end
        object edGwDBName: TEdit
          Left = 112
          Top = 256
          Width = 145
          Height = 21
          TabOrder = 5
          Text = 'edGwDBName'
        end
        object edGwDBServer: TEdit
          Left = 112
          Top = 224
          Width = 121
          Height = 21
          TabOrder = 6
          Text = 'edGwDBServer'
        end
        object edHosDBName: TEdit
          Left = 112
          Top = 176
          Width = 121
          Height = 21
          TabOrder = 7
          Text = 'edHosDBName'
        end
        object edHosDBServer: TEdit
          Left = 112
          Top = 112
          Width = 121
          Height = 21
          TabOrder = 8
          Text = 'edHosDBServer'
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
  object MySQLMonitor: TMySQLMonitor
    DBMonitorOptions.Host = 'localhost'
    DBMonitorOptions.Port = 3306
    TraceFlags = [tfMisc]
    OnSQL = MySQLMonitorSQL
    Left = 416
    Top = 160
  end
  object MyQuery: TMyQuery
    Connection = MyConnection
    Left = 152
    Top = 160
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
