object formMappingFields: TformMappingFields
  Left = 277
  Top = 114
  Width = 968
  Height = 538
  Caption = 'Mapping Fields'
  Color = clBtnFace
  Font.Charset = THAI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 775
    Height = 511
    Align = alClient
    Font.Charset = THAI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Visible = True
      DataController.DataSource = dsMappingFields
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1Column1: TcxGridDBColumn
        Caption = 'No.'
        OnGetDataText = cxGrid1DBTableView1Column1GetDataText
        Options.Sorting = False
        Width = 47
      end
      object cxGrid1DBTableView1srcFieldName: TcxGridDBColumn
        Caption = 'Source FieldName'
        DataBinding.FieldName = 'srcFieldName'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'FieldName'
        Properties.ListColumns = <
          item
            FieldName = 'FieldName'
          end>
        Properties.ListSource = dsSource
        Options.Sorting = False
        Width = 194
      end
      object cxGrid1DBTableView1targetFieldName: TcxGridDBColumn
        Caption = 'Target FieldName'
        DataBinding.FieldName = 'targetFieldName'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'FieldName'
        Properties.ListColumns = <
          item
            FieldName = 'FieldName'
          end>
        Properties.ListSource = dsTarget
        Options.Sorting = False
        Width = 206
      end
      object cxGrid1DBTableView1Async: TcxGridDBColumn
        Caption = 'ASync'
        DataBinding.FieldName = 'Async'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Options.Sorting = False
        Width = 102
      end
      object cxGrid1DBTableView1Acheck: TcxGridDBColumn
        Caption = 'Locate Field'
        DataBinding.FieldName = 'Acheck'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 87
      end
      object cxGrid1DBTableView1TargetValueSQLSTR: TcxGridDBColumn
        DataBinding.FieldName = 'TargetValueSQLSTR'
        Visible = False
        Options.Sorting = False
      end
      object cxGrid1DBTableView1SrcValueSQLSTR: TcxGridDBColumn
        DataBinding.FieldName = 'SrcValueSQLSTR'
        Visible = False
        Options.Sorting = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Panel1: TPanel
    Left = 775
    Top = 0
    Width = 185
    Height = 511
    Align = alRight
    TabOrder = 1
    object btnCancel: TButton
      Left = 22
      Top = 39
      Width = 153
      Height = 25
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 22
      Top = 8
      Width = 153
      Height = 25
      Caption = 'OK'
      TabOrder = 1
      OnClick = btnOKClick
    end
    object btnSettingSyncData: TButton
      Left = 22
      Top = 95
      Width = 153
      Height = 25
      Caption = 'Condition Setting'
      Enabled = False
      TabOrder = 2
      OnClick = btnSettingSyncDataClick
    end
    object btnGen: TButton
      Left = 22
      Top = 152
      Width = 153
      Height = 25
      Caption = 'Auto Generate Field Name'
      TabOrder = 3
      OnClick = btnGenClick
    end
    object btnClearNoneLinkField: TButton
      Left = 22
      Top = 176
      Width = 153
      Height = 25
      Caption = 'Clear None Map Field'
      TabOrder = 4
      OnClick = btnClearNoneLinkFieldClick
    end
  end
  object cdsSource: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 544
    Top = 64
    Data = {
      380000009619E0BD010000001800000001000000000003000000380009466965
      6C644E616D65010049000000010005574944544802000200C8000000}
    object cdsSourceFieldName: TStringField
      FieldName = 'FieldName'
      Size = 200
    end
  end
  object dsSource: TDataSource
    DataSet = cdsSource
    Left = 544
    Top = 128
  end
  object cdsTarget: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 600
    Top = 64
    Data = {
      380000009619E0BD010000001800000001000000000003000000380009466965
      6C644E616D65010049000000010005574944544802000200C8000000}
    object cdsTargetFieldName: TStringField
      FieldName = 'FieldName'
      Size = 200
    end
  end
  object dsTarget: TDataSource
    DataSet = cdsTarget
    Left = 600
    Top = 128
  end
  object cdsMappingFields: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 544
    Top = 208
    Data = {
      820100009619E0BD01000000180000000B000000000003000000820102696404
      000100000000000C7372634669656C644E616D65010049000000010005574944
      544802000200C8000F7461726765744669656C644E616D650100490000000100
      05574944544802000200C8000C7372635461626C654E616D6501004900000001
      0005574944544802000200C8000F7461726765745461626C654E616D65010049
      000000010005574944544802000200C800054173796E63010049000000010005
      57494454480200020001000D636B53726356616C756553514C01004900000001
      0005574944544802000200010010636B54617267657456616C756553514C0100
      4900000001000557494454480200020001001154617267657456616C75655351
      4C53545204004B0000000100075355425459504502004900050054657874000E
      53726356616C756553514C53545204004B000000010007535542545950450200
      4900050054657874000641636865636B01004900000001000557494454480200
      020001000000}
    object cdsMappingFieldsid: TIntegerField
      FieldName = 'id'
    end
    object cdsMappingFieldssrcFieldName: TStringField
      FieldName = 'srcFieldName'
      Size = 200
    end
    object cdsMappingFieldstargetFieldName: TStringField
      FieldName = 'targetFieldName'
      Size = 200
    end
    object cdsMappingFieldssrcTableName: TStringField
      FieldName = 'srcTableName'
      Size = 200
    end
    object cdsMappingFieldstargetTableName: TStringField
      FieldName = 'targetTableName'
      Size = 200
    end
    object cdsMappingFieldsAsync: TStringField
      FieldName = 'Async'
      Size = 1
    end
    object cdsMappingFieldsckSrcValueSQL: TStringField
      FieldName = 'ckSrcValueSQL'
      Size = 1
    end
    object cdsMappingFieldsckTargetValueSQL: TStringField
      FieldName = 'ckTargetValueSQL'
      Size = 1
    end
    object cdsMappingFieldsTargetValueSQLSTR: TMemoField
      FieldName = 'TargetValueSQLSTR'
      BlobType = ftMemo
    end
    object cdsMappingFieldsSrcValueSQLSTR: TMemoField
      FieldName = 'SrcValueSQLSTR'
      BlobType = ftMemo
    end
    object cdsMappingFieldsAcheck: TStringField
      FieldName = 'Acheck'
      Size = 1
    end
  end
  object dsMappingFields: TDataSource
    DataSet = cdsMappingFields
    Left = 544
    Top = 272
  end
end
