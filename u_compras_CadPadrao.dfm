inherited F_compras_CadPadrao: TF_compras_CadPadrao
  Caption = 'Cadastro Compras - Herdade '
  OnCreate = FormCreate
  ExplicitWidth = 637
  ExplicitHeight = 527
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [3]
    Left = 19
    Top = 16
    Width = 84
    Height = 18
    Caption = 'Nota Fiscal'
    FocusControl = DBEdit1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [4]
    Left = 19
    Top = 78
    Width = 35
    Height = 18
    Caption = 'Data'
    FocusControl = DBEdit2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel [5]
    Left = 407
    Top = 16
    Width = 85
    Height = 18
    Caption = 'Fornecedor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel [6]
    Left = 192
    Top = 78
    Width = 82
    Height = 18
    Caption = 'Valor Total'
    FocusControl = DBEdit4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Grid_dados: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'nota_fiscal'
        Title.Caption = 'Nota Fiscal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fornecedor'
        Width = 174
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Title.Caption = 'Data'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor_total'
        Title.Caption = 'Valor'
        Width = 89
        Visible = True
      end>
  end
  object DBEdit1: TDBEdit [15]
    Left = 19
    Top = 40
    Width = 134
    Height = 21
    DataField = 'nota_fiscal'
    DataSource = ds_dados
    TabOrder = 8
  end
  object DBEdit2: TDBEdit [16]
    Left = 19
    Top = 102
    Width = 102
    Height = 21
    DataField = 'data'
    DataSource = ds_dados
    TabOrder = 9
  end
  object DBEdit4: TDBEdit [17]
    Left = 192
    Top = 102
    Width = 134
    Height = 21
    DataField = 'valor_total'
    DataSource = ds_dados
    TabOrder = 10
  end
  object DBLookupComboBox1: TDBLookupComboBox [18]
    Left = 407
    Top = 48
    Width = 178
    Height = 21
    DataField = 'cod_fornecedor'
    DataSource = ds_dados
    KeyField = 'cod_fornecedor'
    ListField = 'nome_fantasia'
    ListSource = ds_fornecedor
    TabOrder = 11
  end
  object b_relatorio: TButton [19]
    Left = 531
    Top = 438
    Width = 84
    Height = 29
    Caption = 'Relat'#243'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    OnClick = b_relatorioClick
  end
  inherited q_dados: TFDQuery
    SQL.Strings = (
      'select * '
      'from compras'
      'order by nota_fiscal')
    object q_dadoscod_compra: TFDAutoIncField
      FieldName = 'cod_compra'
      Origin = 'cod_compra'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_dadosnota_fiscal: TIntegerField
      FieldName = 'nota_fiscal'
      Origin = 'nota_fiscal'
      Required = True
    end
    object q_dadosdata: TSQLTimeStampField
      FieldName = 'data'
      Origin = 'data'
      Required = True
      EditMask = '99/99/9999;1;_'
    end
    object q_dadoscod_fornecedor: TIntegerField
      FieldName = 'cod_fornecedor'
      Origin = 'cod_fornecedor'
      Required = True
    end
    object q_dadosvalor_total: TFloatField
      FieldName = 'valor_total'
      Origin = 'valor_total'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
    object q_dadosFornecedor: TStringField
      FieldKind = fkLookup
      FieldName = 'Fornecedor'
      LookupDataSet = q_fornecedor
      LookupKeyFields = 'cod_fornecedor'
      LookupResultField = 'nome_fantasia'
      KeyFields = 'cod_fornecedor'
      Size = 100
      Lookup = True
    end
  end
  object q_fornecedor: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select *'
      'from fornecedores'
      'order by nome_fantasia')
    Left = 504
    Top = 112
  end
  object ds_fornecedor: TDataSource
    DataSet = q_fornecedor
    Left = 384
    Top = 128
  end
end
