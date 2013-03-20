object formSettingSyncSQL: TformSettingSyncSQL
  Left = 281
  Top = 131
  Width = 930
  Height = 493
  Caption = 'formSettingSyncSQL'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 752
    Top = 0
    Width = 170
    Height = 466
    Align = alRight
    TabOrder = 0
    DesignSize = (
      170
      466)
    object btnOK: TButton
      Left = 13
      Top = 6
      Width = 153
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 13
      Top = 37
      Width = 153
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 752
    Height = 466
    Align = alClient
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 1
      Top = 225
      Width = 750
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object srcSQL: TSynEdit
      Left = 1
      Top = 1
      Width = 750
      Height = 224
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      TabOrder = 0
      Gutter.Font.Charset = DEFAULT_CHARSET
      Gutter.Font.Color = clWindowText
      Gutter.Font.Height = -11
      Gutter.Font.Name = 'Courier New'
      Gutter.Font.Style = []
      Highlighter = SynSQLSyn1
    end
    object targetSQL: TSynEdit
      Left = 1
      Top = 228
      Width = 750
      Height = 237
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      TabOrder = 1
      Gutter.Font.Charset = DEFAULT_CHARSET
      Gutter.Font.Color = clWindowText
      Gutter.Font.Height = -11
      Gutter.Font.Name = 'Courier New'
      Gutter.Font.Style = []
      Highlighter = SynSQLSyn1
    end
  end
  object SynSQLSyn1: TSynSQLSyn
    CommentAttri.Foreground = clGreen
    DataTypeAttri.Foreground = clBlack
    IdentifierAttri.Foreground = clBlack
    KeyAttri.Foreground = clBlue
    PLSQLAttri.Foreground = clBlack
    StringAttri.Foreground = clRed
    VariableAttri.Foreground = clBlue
    Left = 224
    Top = 344
  end
end
