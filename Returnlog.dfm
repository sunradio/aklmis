object SVR002: TSVR002
  Left = 197
  Top = 199
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #36820#20462#36864#36135#30331#35760'-SVR002'
  ClientHeight = 479
  ClientWidth = 674
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #24494#36719#38597#40657
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefaultPosOnly
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TPanel
    Left = 570
    Top = 45
    Width = 104
    Height = 415
    Align = alRight
    BevelInner = bvRaised
    TabOrder = 0
    object Button4: TButton
      Left = 12
      Top = 12
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 0
      TabStop = False
      OnClick = Button4Click
    end
    object Button1: TButton
      Left = 12
      Top = 36
      Width = 75
      Height = 25
      Caption = #25353#26085#26399#26597
      TabOrder = 1
      TabStop = False
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 12
      Top = 160
      Width = 75
      Height = 25
      Caption = #21333#31508#32467#26696
      TabOrder = 2
      TabStop = False
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 12
      Top = 60
      Width = 75
      Height = 25
      Caption = #25171#21360#26126#32454
      TabOrder = 3
      OnClick = Button3Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 45
    Width = 570
    Height = 415
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #32534#36753
      object Label1: TLabel
        Left = 18
        Top = 56
        Width = 48
        Height = 17
        Caption = #20135#21697#24207#21495
      end
      object Label2: TLabel
        Left = 18
        Top = 88
        Width = 48
        Height = 17
        Caption = #20135#21697#21697#21495
      end
      object Label3: TLabel
        Left = 18
        Top = 120
        Width = 48
        Height = 17
        Caption = #36135#29289#26469#28304
      end
      object Label4: TLabel
        Left = 18
        Top = 217
        Width = 48
        Height = 17
        Caption = #19981#33391#31867#21035
      end
      object Label5: TLabel
        Left = 222
        Top = 185
        Width = 48
        Height = 17
        Caption = #22806#31665#32534#21495
      end
      object Label6: TLabel
        Left = 18
        Top = 186
        Width = 48
        Height = 17
        Caption = #36820#22238#21407#22240
      end
      object Label7: TLabel
        Left = 18
        Top = 253
        Width = 48
        Height = 17
        Caption = #38382#39064#25551#36848
      end
      object Label8: TLabel
        Left = 246
        Top = 217
        Width = 24
        Height = 17
        Caption = #26435#36131
      end
      object Label9: TLabel
        Left = 18
        Top = 24
        Width = 48
        Height = 17
        Caption = #36864#22238#24180#26376
      end
      object DBText3: TDBText
        Left = 212
        Top = 92
        Width = 181
        Height = 17
        DataField = 'log031'
        DataSource = DataSource1
      end
      object Label10: TLabel
        Left = 18
        Top = 152
        Width = 48
        Height = 17
        Caption = #36820#20462#36864#36135
      end
      object DBEdit1: TDBEdit
        Left = 80
        Top = 56
        Width = 121
        Height = 25
        DataField = 'log02'
        DataSource = DataSource1
        TabOrder = 1
      end
      object DBComboBox1: TDBComboBox
        Left = 80
        Top = 120
        Width = 121
        Height = 25
        Style = csDropDownList
        DataField = 'log04'
        DataSource = DataSource1
        ItemHeight = 17
        Items.Strings = (
          'AMAZON'
          'JD'
          'TMALL'
          'SUNDAN'
          #20010#20154
          #20854#23427)
        TabOrder = 3
      end
      object DBComboBox2: TDBComboBox
        Left = 80
        Top = 185
        Width = 121
        Height = 25
        Style = csDropDownList
        DataField = 'log10'
        DataSource = DataSource1
        ItemHeight = 17
        Items.Strings = (
          #19971#22825#26080#29702#30001
          #21313#20116#22825#25442#36135
          #20135#21697#36136#37327#38382#39064
          #36816#36755#36807#31243#25684#22351)
        TabOrder = 5
      end
      object DBMemo1: TDBMemo
        Left = 80
        Top = 256
        Width = 445
        Height = 89
        DataField = 'log06'
        DataSource = DataSource1
        TabOrder = 9
      end
      object DBComboBox3: TDBComboBox
        Left = 80
        Top = 217
        Width = 121
        Height = 25
        Style = csDropDownList
        DataField = 'log05'
        DataSource = DataSource1
        ItemHeight = 17
        Items.Strings = (
          #22806#35266
          #30005#22120
          #26426#26500
          #25509#25910
          #22768#38899
          #32508#21512
          #26080#29702#30001)
        TabOrder = 7
      end
      object DBEdit2: TDBEdit
        Left = 280
        Top = 185
        Width = 121
        Height = 25
        DataField = 'log11'
        DataSource = DataSource1
        ReadOnly = True
        TabOrder = 6
      end
      object GroupBox1: TGroupBox
        Left = 320
        Top = 0
        Width = 201
        Height = 69
        Caption = #32500#25252#35760#24405
        TabOrder = 11
        object DBText1: TDBText
          Left = 68
          Top = 19
          Width = 81
          Height = 17
          DataField = 'loguser'
          DataSource = DataSource1
        end
        object DBText2: TDBText
          Left = 68
          Top = 42
          Width = 125
          Height = 17
          DataField = 'logdate'
          DataSource = DataSource1
        end
        object Label12: TLabel
          Left = 9
          Top = 19
          Width = 51
          Height = 17
          Caption = #32500#25252#29992#25143':'
        end
        object Label19: TLabel
          Left = 9
          Top = 43
          Width = 51
          Height = 17
          Caption = #32500#25252#26102#38388':'
        end
      end
      object DBComboBox4: TDBComboBox
        Left = 280
        Top = 217
        Width = 121
        Height = 25
        Style = csDropDownList
        DataField = 'log12'
        DataSource = DataSource1
        ItemHeight = 17
        Items.Strings = (
          #20080#23478
          #21334#23478
          #24037#21378
          #29289#27969)
        TabOrder = 8
      end
      object DBCheckBox1: TDBCheckBox
        Left = 80
        Top = 353
        Width = 97
        Height = 17
        Caption = #32467#26696
        DataField = 'log13'
        DataSource = DataSource1
        ReadOnly = True
        TabOrder = 10
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object DBEdit3: TDBEdit
        Left = 80
        Top = 24
        Width = 85
        Height = 25
        AutoSelect = False
        DataField = 'log14'
        DataSource = DataSource1
        TabOrder = 0
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 80
        Top = 88
        Width = 121
        Height = 25
        DataField = 'log03'
        DataSource = DataSource1
        DropDownRows = 15
        DropDownWidth = 300
        KeyField = 'ab01'
        ListField = 'ab02;ab06;ab08'
        ListSource = DataSource2
        TabOrder = 2
        OnDropDown = DBLookupComboBox1DropDown
        OnExit = DBLookupComboBox1Exit
      end
      object DBComboBox5: TDBComboBox
        Left = 80
        Top = 152
        Width = 121
        Height = 25
        Style = csDropDownList
        DataField = 'log09'
        DataSource = DataSource1
        ItemHeight = 17
        Items.Strings = (
          #36864#36135
          #36820#20462)
        TabOrder = 4
      end
      object GroupBox2: TGroupBox
        Left = 320
        Top = 76
        Width = 201
        Height = 69
        Caption = #32467#26696#21407#22240
        TabOrder = 12
        object DBText4: TDBText
          Left = 8
          Top = 20
          Width = 181
          Height = 37
          DataField = 'log15'
          DataSource = DataSource1
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          ParentFont = False
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #27983#35272
      ImageIndex = 1
      object DBGridPlus1: TDBGridPlus
        Left = 0
        Top = 0
        Width = 562
        Height = 383
        Align = alClient
        DataSource = DataSource1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #24494#36719#38597#40657
        TitleFont.Style = []
        OnMouseWheel = DBGridPlus1MouseWheel
        Columns = <
          item
            Expanded = False
            Visible = True
          end
          item
            Expanded = False
            Visible = True
          end
          item
            Expanded = False
            Visible = True
          end
          item
            Expanded = False
            Visible = True
          end
          item
            Expanded = False
            Visible = True
          end
          item
            Expanded = False
            Visible = True
          end
          item
            Expanded = False
            Visible = True
          end
          item
            Expanded = False
            Visible = True
          end>
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 460
    Width = 674
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 50
      end>
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 0
    Width = 674
    Height = 45
    ButtonHeight = 40
    ButtonWidth = 43
    Caption = 'ToolBar1'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esNone
    EdgeOuter = esRaised
    Flat = True
    Images = Dm.ImageList
    Indent = 5
    ShowCaptions = True
    TabOrder = 3
    object ToolButton15: TToolButton
      Left = 5
      Top = 0
      Caption = #25554#20837
      ImageIndex = 20
      OnClick = ToolButton15Click
    end
    object ToolButton16: TToolButton
      Left = 48
      Top = 0
      Action = Dm.DataSetEdit1
    end
    object ToolButton17: TToolButton
      Left = 91
      Top = 0
      Action = Dm.DataSetPost1
    end
    object ToolButton18: TToolButton
      Left = 134
      Top = 0
      Width = 10
      Caption = 'ToolButton3'
      ImageIndex = 17
      Style = tbsSeparator
    end
    object ToolButton19: TToolButton
      Left = 144
      Top = 0
      Action = Dm.DataSetFirst1
    end
    object ToolButton20: TToolButton
      Left = 187
      Top = 0
      Action = Dm.DataSetPrior1
    end
    object ToolButton21: TToolButton
      Left = 230
      Top = 0
      Action = Dm.DataSetNext1
    end
    object ToolButton22: TToolButton
      Left = 273
      Top = 0
      Action = Dm.DataSetLast1
    end
    object ToolButton23: TToolButton
      Left = 316
      Top = 0
      Width = 12
      Caption = 'ToolButton8'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton24: TToolButton
      Left = 328
      Top = 0
      Action = Dm.DataSetDelete1
    end
    object ToolButton25: TToolButton
      Left = 371
      Top = 0
      Width = 14
      Caption = 'ToolButton11'
      ImageIndex = 15
      Style = tbsSeparator
    end
    object ToolButton26: TToolButton
      Left = 385
      Top = 0
      Action = Dm.DataSetCancel1
    end
    object ToolButton1: TToolButton
      Left = 428
      Top = 0
      Caption = #23548#20986
      ImageIndex = 36
      OnClick = ToolButton1Click
    end
    object ToolButton27: TToolButton
      Left = 471
      Top = 0
      Width = 13
      Caption = 'ToolButton13'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton28: TToolButton
      Left = 484
      Top = 0
      Hint = 'Exit|Quits the application'
      Caption = '  '#20851#38381' '
      ImageIndex = 27
      OnClick = ToolButton14Click
    end
  end
  object DataSource1: TDataSource
    DataSet = PSQLQuery1
    OnStateChange = DataSource1StateChange
    Left = 472
    Top = 124
  end
  object PSQLQuery1: TPSQLQuery
    Database = Dm.PSQLDatabase
    Options = [dsoUseGUIDField]
    AfterOpen = PSQLQuery1AfterOpen
    BeforeEdit = PSQLQuery1BeforeEdit
    AfterEdit = PSQLQuery1AfterEdit
    BeforePost = PSQLQuery1BeforePost
    BeforeCancel = PSQLQuery1BeforeCancel
    BeforeDelete = PSQLQuery1BeforeDelete
    AfterScroll = PSQLQuery1AfterScroll
    OnNewRecord = PSQLQuery1NewRecord
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM MFlog WHERE LOG02='#39'D'#39' ORDER BY LOG01 DESC')
    UpdateObject = PSQLUpdateSQL1
    Left = 504
    Top = 124
  end
  object PSQLUpdateSQL1: TPSQLUpdateSQL
    ModifySQL.Strings = (
      'update MFlog'
      'set'
      '  log02 = :log02,'
      '  log03 = :log03,'
      '  log04 = :log04,'
      '  log05 = :log05,'
      '  log06 = :log06,'
      '  loguser = :loguser,'
      '  log09 = :log09,'
      '  log10 = :log10,'
      '  log11 = :log11,'
      '  log12 = :log12,'
      '  logdate = :logdate,'
      '  log031  =:log031,'
      '  log14 = :log14'
      'where'
      '  log01 = :log01')
    InsertSQL.Strings = (
      'insert into MFlog'
      '  (log02, log03, log04, log05, log06, loguser, log09, log10, '
      '   log11, log12, log13, logdate,log031, log14)'
      'values'
      '  (:log02, :log03, :log04, :log05, :log06, :loguser, :log09, '
      '   :log10, :log11, :log12, :log13, :logdate,:log031, :log14)')
    DeleteSQL.Strings = (
      'delete from MFlog'
      'where'
      '  log01 = :log01')
    Left = 536
    Top = 124
  end
  object PSQLQuery2: TPSQLQuery
    Database = Dm.PSQLDatabase
    Options = [dsoUseGUIDField]
    RequestLive = True
    SQL.Strings = (
      'SELECT AB01,AB02, AB06,AB08 FROM INVAB ORDER BY AB02,AB01')
    Left = 504
    Top = 156
    object PSQLQuery2ab01: TStringField
      FieldName = 'ab01'
      Visible = False
      Size = 15
    end
    object PSQLQuery2ab02: TStringField
      DisplayWidth = 20
      FieldName = 'ab02'
      Size = 50
    end
    object PSQLQuery2ab06: TStringField
      DisplayWidth = 5
      FieldName = 'ab06'
      Size = 6
    end
    object PSQLQuery2ab08: TBooleanField
      DisplayWidth = 4
      FieldName = 'ab08'
    end
  end
  object DataSource2: TDataSource
    DataSet = PSQLQuery2
    Left = 472
    Top = 156
  end
  object frxReport1: TfrxReport
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbZoom, pbPageSetup, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    ReportOptions.CreateDate = 42402.787522812500000000
    ReportOptions.LastChange = 42402.787522812500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 480
    Top = 269
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    DataSource = DataSource1
    Left = 520
    Top = 265
  end
end
