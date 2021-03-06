inherited F_encomendas_CadPadrao: TF_encomendas_CadPadrao
  Caption = 'Cadastro de Encomendas - Herdado'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [3]
    Left = 24
    Top = 24
    Width = 53
    Height = 18
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [4]
    Left = 232
    Top = 24
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
    Left = 391
    Top = 24
    Width = 82
    Height = 18
    Caption = 'Valor Total'
    FocusControl = DBEdit3
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
        FieldName = 'num_encomenda'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Encomenda'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'clientes'
        Title.Caption = 'Cliente'
        Width = 199
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Title.Caption = 'Data'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor_total'
        Title.Caption = 'Valor'
        Width = 97
        Visible = True
      end>
  end
  object DBEdit2: TDBEdit [14]
    Left = 232
    Top = 56
    Width = 81
    Height = 21
    DataField = 'data'
    DataSource = ds_dados
    TabOrder = 8
  end
  object DBEdit3: TDBEdit [15]
    Left = 391
    Top = 56
    Width = 134
    Height = 21
    DataField = 'valor_total'
    DataSource = ds_dados
    TabOrder = 9
  end
  object DBLookupComboBox1: TDBLookupComboBox [16]
    Left = 24
    Top = 56
    Width = 153
    Height = 21
    DataField = 'cod_cliente'
    DataSource = ds_dados
    KeyField = 'cod_cliente'
    ListField = 'nome'
    ListSource = ds_clientes
    TabOrder = 10
  end
  inherited q_dados: TFDQuery
    SQL.Strings = (
      'select *'
      'from encomendas'
      'order by num_encomenda')
    object q_dadosnum_encomenda: TFDAutoIncField
      FieldName = 'num_encomenda'
      Origin = 'num_encomenda'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_dadoscod_cliente: TIntegerField
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
      Required = True
    end
    object q_dadosdata: TSQLTimeStampField
      FieldName = 'data'
      Origin = 'data'
      Required = True
      EditMask = '99/99/9999;1;_'
    end
    object q_dadosvalor_total: TFloatField
      FieldName = 'valor_total'
      Origin = 'valor_total'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
    object q_dados_clientes: TStringField
      FieldKind = fkLookup
      FieldName = 'clientes'
      LookupDataSet = q_clientes
      LookupKeyFields = 'cod_cliente'
      LookupResultField = 'nome'
      KeyFields = 'cod_cliente'
      Size = 100
      Lookup = True
    end
  end
  object ds_clientes: TDataSource
    DataSet = q_clientes
    Left = 264
    Top = 104
  end
  object q_clientes: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select *'
      'from clientes'
      'order by nome')
    Left = 360
    Top = 112
  end
end
