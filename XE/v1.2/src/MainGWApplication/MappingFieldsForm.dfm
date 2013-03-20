object formMappingFields: TformMappingFields
  Left = 167
  Top = 40
  Caption = 'Mapping Fields'
  ClientHeight = 604
  ClientWidth = 1023
  Color = clBtnFace
  Font.Charset = THAI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 838
    Top = 0
    Width = 185
    Height = 604
    Align = alRight
    TabOrder = 0
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
  object pnAllClients: TRzPanel
    Left = 0
    Top = 0
    Width = 838
    Height = 604
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 0
      Top = 318
      Width = 838
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      ExplicitTop = 357
      ExplicitWidth = 934
    end
    object pnButtom: TRzPanel
      Left = 0
      Top = 321
      Width = 838
      Height = 283
      Align = alBottom
      BorderOuter = fsNone
      TabOrder = 0
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 838
        Height = 283
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = 'Track Transfer'
          object grdTrackTranfers: TcxGrid
            Left = 0
            Top = 0
            Width = 830
            Height = 255
            Align = alClient
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            LookAndFeel.Kind = lfStandard
            object cxGridDBTableView1: TcxGridDBTableView
              Navigator.Visible = True
              DataController.DataSource = dsTrackTranferData
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsView.GridLines = glNone
              OptionsView.GroupByBox = False
              object cxGridDBColumn1: TcxGridDBColumn
                Caption = 'No.'
                OnGetDataText = grdFieldsDBTableView1Column1GetDataText
                Options.Editing = False
                Options.Sorting = False
                Width = 47
              end
              object cxGridDBTableView1Track: TcxGridDBColumn
                DataBinding.FieldName = 'Track'
                PropertiesClassName = 'TcxComboBoxProperties'
                Width = 154
              end
              object cxGridDBTableView1TrackType: TcxGridDBColumn
                DataBinding.FieldName = 'TrackType'
                PropertiesClassName = 'TcxComboBoxProperties'
                Width = 196
              end
              object cxGridDBTableView1TrackEnable: TcxGridDBColumn
                DataBinding.FieldName = 'TrackEnable'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.ValueChecked = 'Y'
                Properties.ValueUnchecked = 'N'
                Width = 124
              end
              object cxGridDBTableView1TrackValue: TcxGridDBColumn
                DataBinding.FieldName = 'TrackValue'
                Width = 249
              end
            end
            object cxGridLevel1: TcxGridLevel
              GridView = cxGridDBTableView1
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Track ASync'
          ImageIndex = 1
          object cxGrid3: TcxGrid
            Left = 0
            Top = 0
            Width = 830
            Height = 255
            Align = alClient
            Font.Charset = THAI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            LookAndFeel.Kind = lfStandard
            object cxGridDBTableView2: TcxGridDBTableView
              Navigator.Visible = True
              DataController.DataSource = dsTrackAsyncData
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsView.GridLines = glNone
              OptionsView.GroupByBox = False
              object cxGridDBColumn18: TcxGridDBColumn
                Caption = 'No.'
                OnGetDataText = grdFieldsDBTableView1Column1GetDataText
                Options.Editing = False
                Options.Sorting = False
                Width = 47
              end
              object cxGridDBTableView2Track: TcxGridDBColumn
                DataBinding.FieldName = 'Track'
                PropertiesClassName = 'TcxComboBoxProperties'
                Width = 154
              end
              object cxGridDBTableView2TrackType: TcxGridDBColumn
                DataBinding.FieldName = 'TrackType'
                PropertiesClassName = 'TcxComboBoxProperties'
                Width = 196
              end
              object cxGridDBTableView2TrackEnable: TcxGridDBColumn
                DataBinding.FieldName = 'TrackEnable'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.ValueChecked = 'Y'
                Properties.ValueUnchecked = 'N'
                Width = 124
              end
              object cxGridDBTableView2TrackValue: TcxGridDBColumn
                DataBinding.FieldName = 'TrackValue'
                Width = 249
              end
            end
            object cxGridLevel2: TcxGridLevel
              GridView = cxGridDBTableView2
            end
          end
        end
      end
    end
    object pnTop: TRzPanel
      Left = 0
      Top = 0
      Width = 838
      Height = 318
      Align = alClient
      BorderOuter = fsNone
      TabOrder = 1
      object grdFields: TcxGrid
        Left = 0
        Top = 0
        Width = 838
        Height = 318
        Align = alClient
        Font.Charset = THAI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        LookAndFeel.Kind = lfStandard
        object grdFieldsDBTableView1: TcxGridDBTableView
          Navigator.Visible = True
          DataController.DataSource = dsMappingFields
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          object grdFieldsDBTableView1Column1: TcxGridDBColumn
            Caption = 'No.'
            OnGetDataText = grdFieldsDBTableView1Column1GetDataText
            Options.Editing = False
            Options.Sorting = False
            Width = 47
          end
          object grdFieldsDBTableView1srcFieldName: TcxGridDBColumn
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
          object grdFieldsDBTableView1targetFieldName: TcxGridDBColumn
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
          object grdFieldsDBTableView1Async: TcxGridDBColumn
            Caption = 'ASync'
            DataBinding.FieldName = 'Async'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Options.Sorting = False
            Width = 102
          end
          object grdFieldsDBTableView1Acheck: TcxGridDBColumn
            Caption = 'Locate Field'
            DataBinding.FieldName = 'Acheck'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 87
          end
          object grdFieldsDBTableView1TargetValueSQLSTR: TcxGridDBColumn
            DataBinding.FieldName = 'TargetValueSQLSTR'
            Visible = False
            Options.Sorting = False
          end
          object grdFieldsDBTableView1SrcValueSQLSTR: TcxGridDBColumn
            DataBinding.FieldName = 'SrcValueSQLSTR'
            Visible = False
            Options.Sorting = False
          end
          object grdFieldsDBTableView1TransferType: TcxGridDBColumn
            DataBinding.FieldName = 'TransferType'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.DropDownListStyle = lsFixedList
            Properties.Items.Strings = (
              'AAA'
              'BBB'
              'CCC')
            Width = 95
          end
          object grdFieldsDBTableView1TransferIsFixValue: TcxGridDBColumn
            DataBinding.FieldName = 'TransferIsFixValue'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 117
          end
          object grdFieldsDBTableView1TransferFixSTRValue: TcxGridDBColumn
            DataBinding.FieldName = 'TransferFixSTRValue'
            Width = 142
          end
          object grdFieldsDBTableView1TransferSQLData: TcxGridDBColumn
            DataBinding.FieldName = 'TransferSQLData'
            Width = 132
          end
          object grdFieldsDBTableView1AsyncType: TcxGridDBColumn
            DataBinding.FieldName = 'AsyncType'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.DropDownListStyle = lsFixedList
            Properties.Items.Strings = (
              'AAA'
              'BBB'
              'CCC')
            Width = 95
          end
          object grdFieldsDBTableView1AsyncIsFixValue: TcxGridDBColumn
            DataBinding.FieldName = 'AsyncIsFixValue'
            Width = 117
          end
          object grdFieldsDBTableView1AsyncFixSTRValue: TcxGridDBColumn
            DataBinding.FieldName = 'AsyncFixSTRValue'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 142
          end
          object grdFieldsDBTableView1AsyncSQLData: TcxGridDBColumn
            DataBinding.FieldName = 'AsyncSQLData'
            Width = 132
          end
        end
        object grdFieldsLevel1: TcxGridLevel
          GridView = grdFieldsDBTableView1
        end
      end
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
    AfterScroll = cdsMappingFieldsAfterScroll
    Left = 544
    Top = 208
    Data = {
      070300009619E0BD010000001800000015000000000003000000070302696404
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
      020001000C5472616E7366657254797065010049000000010005574944544802
      0002001E00125472616E73666572497346697856616C75650100490000000100
      055749445448020002000100135472616E7366657246697853545256616C7565
      020049000000010005574944544802000200FF00115472616E73666572547261
      636B4461746104004B0000000100075355425459504502004900070042696E61
      7279000F5472616E7366657253514C4461746104004B00000001000753554254
      5950450200490005005465787400094173796E63547970650100490000000100
      055749445448020002001E000F4173796E63497346697856616C756501004900
      00000100055749445448020002000100104173796E6346697853545256616C75
      65020049000000010005574944544802000200FF000E4173796E63547261636B
      4461746104004B0000000100075355425459504502004900070042696E617279
      000C4173796E6353514C4461746104004B000000010007535542545950450200
      4900050054657874000000}
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
    object cdsMappingFieldsTransferType: TStringField
      FieldName = 'TransferType'
      Size = 30
    end
    object cdsMappingFieldsTransferIsFixValue: TStringField
      FieldName = 'TransferIsFixValue'
      Size = 1
    end
    object cdsMappingFieldsTransferFixSTRValue: TStringField
      FieldName = 'TransferFixSTRValue'
      Size = 255
    end
    object cdsMappingFieldsTransferTrackData: TBlobField
      FieldName = 'TransferTrackData'
    end
    object cdsMappingFieldsTransferSQLData: TMemoField
      FieldName = 'TransferSQLData'
      BlobType = ftMemo
    end
    object cdsMappingFieldsAsyncType: TStringField
      FieldName = 'AsyncType'
      Size = 30
    end
    object cdsMappingFieldsAsyncIsFixValue: TStringField
      FieldName = 'AsyncIsFixValue'
      Size = 1
    end
    object cdsMappingFieldsAsyncFixSTRValue: TStringField
      FieldName = 'AsyncFixSTRValue'
      Size = 255
    end
    object cdsMappingFieldsAsyncTrackData: TBlobField
      FieldName = 'AsyncTrackData'
    end
    object cdsMappingFieldsAsyncSQLData: TMemoField
      FieldName = 'AsyncSQLData'
      BlobType = ftMemo
    end
  end
  object dsMappingFields: TDataSource
    DataSet = cdsMappingFields
    Left = 544
    Top = 272
  end
  object cdsTrackTranferData: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    BeforePost = cdsTrackTranferDataBeforePost
    AfterPost = cdsTrackTranferDataAfterPost
    AfterDelete = cdsTrackTranferDataAfterPost
    Left = 172
    Top = 440
    Data = {
      980000009619E0BD010000001800000004000000000003000000980005547261
      636B010049000000010005574944544802000200640009547261636B54797065
      01004900000001000557494454480200020064000B547261636B456E61626C65
      01004900000001000557494454480200020001000A547261636B56616C756504
      004B0000000100075355425459504502004900050054657874000000}
    object cdsTrackTranferDataTrack: TStringField
      FieldName = 'Track'
      Size = 100
    end
    object cdsTrackTranferDataTrackType: TStringField
      FieldName = 'TrackType'
      Size = 100
    end
    object cdsTrackTranferDataTrackEnable: TStringField
      FieldName = 'TrackEnable'
      Size = 1
    end
    object cdsTrackTranferDataTrackValue: TMemoField
      FieldName = 'TrackValue'
      BlobType = ftMemo
    end
  end
  object dsTrackTranferData: TDataSource
    DataSet = cdsTrackTranferData
    Left = 268
    Top = 448
  end
  object cdsTrackAsyncData: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    BeforePost = cdsTrackAsyncDataBeforePost
    AfterPost = cdsTrackAsyncDataAfterPost
    AfterDelete = cdsTrackAsyncDataAfterPost
    Left = 580
    Top = 416
    Data = {
      980000009619E0BD010000001800000004000000000003000000980005547261
      636B010049000000010005574944544802000200640009547261636B54797065
      01004900000001000557494454480200020064000B547261636B456E61626C65
      01004900000001000557494454480200020001000A547261636B56616C756504
      004B0000000100075355425459504502004900050054657874000000}
    object cdsTrackAsyncDataTrack: TStringField
      FieldName = 'Track'
      Size = 100
    end
    object cdsTrackAsyncDataTrackType: TStringField
      FieldName = 'TrackType'
      Size = 100
    end
    object cdsTrackAsyncDataTrackEnable: TStringField
      FieldName = 'TrackEnable'
      Size = 1
    end
    object cdsTrackAsyncDataTrackValue: TMemoField
      FieldName = 'TrackValue'
      BlobType = ftMemo
    end
  end
  object dsTrackAsyncData: TDataSource
    DataSet = cdsTrackAsyncData
    Left = 676
    Top = 424
  end
end
