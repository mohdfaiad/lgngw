object formConfiguration: TformConfiguration
  Left = 415
  Top = 210
  Width = 400
  Height = 271
  BorderIcons = [biSystemMenu]
  Caption = 'Configuration'
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
    392
    244)
  PixelsPerInch = 96
  TextHeight = 13
  object btnOK: TButton
    Left = 230
    Top = 211
    Width = 78
    Height = 29
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 0
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 310
    Top = 211
    Width = 78
    Height = 29
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object PageControl1: TPageControl
    Left = 2
    Top = 3
    Width = 386
    Height = 205
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'HOSxP Connection'
      object cxLabel1: TcxLabel
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
      object edHosDBServer: TcxTextEdit
        Left = 70
        Top = 5
        AutoSize = False
        ParentFont = False
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
      object cxLabel2: TcxLabel
        Left = 0
        Top = 32
        AutoSize = False
        Caption = 'DB Name :'
        Transparent = True
        Height = 26
        Width = 110
      end
      object edHosDBName: TcxTextEdit
        Left = 70
        Top = 29
        AutoSize = False
        ParentFont = False
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
      object cxLabel3: TcxLabel
        Left = 0
        Top = 56
        AutoSize = False
        Caption = 'UserName :'
        Transparent = True
        Height = 26
        Width = 110
      end
      object edHosUserName: TcxTextEdit
        Left = 70
        Top = 53
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = THAI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 5
        Height = 24
        Width = 170
      end
      object cxLabel4: TcxLabel
        Left = 0
        Top = 80
        AutoSize = False
        Caption = 'Password :'
        Transparent = True
        Height = 26
        Width = 110
      end
      object edHosPassword: TcxTextEdit
        Left = 70
        Top = 77
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = THAI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 7
        Height = 24
        Width = 170
      end
      object btnTestHosConnection: TButton
        Left = 70
        Top = 149
        Width = 89
        Height = 25
        Caption = 'Test Connection'
        TabOrder = 8
        OnClick = btnTestHosConnectionClick
      end
      object cxLabel9: TcxLabel
        Left = 0
        Top = 110
        AutoSize = False
        Caption = 'Track Date'
        Transparent = True
        Height = 26
        Width = 110
      end
      object dtHosTrackDate: TDateTimePicker
        Left = 70
        Top = 109
        Width = 168
        Height = 21
        Date = 41345.503583148150000000
        Time = 41345.503583148150000000
        TabOrder = 10
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Gateway Connection'
      ImageIndex = 1
      object cxLabel5: TcxLabel
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
      object edgwDBServer: TcxTextEdit
        Left = 70
        Top = 5
        AutoSize = False
        ParentFont = False
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
      object cxLabel6: TcxLabel
        Left = 0
        Top = 32
        AutoSize = False
        Caption = 'DB Name :'
        Transparent = True
        Height = 26
        Width = 110
      end
      object edgwDBName: TcxTextEdit
        Left = 70
        Top = 29
        AutoSize = False
        ParentFont = False
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
      object cxLabel7: TcxLabel
        Left = 0
        Top = 56
        AutoSize = False
        Caption = 'UserName :'
        Transparent = True
        Height = 26
        Width = 110
      end
      object edgwUserName: TcxTextEdit
        Left = 70
        Top = 53
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = THAI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 5
        Height = 24
        Width = 170
      end
      object cxLabel8: TcxLabel
        Left = 0
        Top = 80
        AutoSize = False
        Caption = 'Password :'
        Transparent = True
        Height = 26
        Width = 110
      end
      object edgwPassword: TcxTextEdit
        Left = 70
        Top = 77
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = THAI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 7
        Height = 24
        Width = 170
      end
      object btnTestGwConnection: TButton
        Left = 70
        Top = 149
        Width = 89
        Height = 25
        Caption = 'Test Connection'
        TabOrder = 8
        OnClick = btnTestGwConnectionClick
      end
      object cxLabel10: TcxLabel
        Left = 0
        Top = 110
        AutoSize = False
        Caption = 'Track Date'
        Transparent = True
        Height = 26
        Width = 110
      end
      object dtGwTrackDate: TDateTimePicker
        Left = 70
        Top = 109
        Width = 168
        Height = 21
        Date = 41345.503583148150000000
        Time = 41345.503583148150000000
        TabOrder = 10
      end
    end
  end
  object MyConnectionTest: TMyConnection
    LoginPrompt = False
    Left = 88
    Top = 176
  end
end
