inherited F_ingredientes_CadPadrao: TF_ingredientes_CadPadrao
  Caption = 'Cadastro de Ingredientes - Herdado'
  OnCreate = FormCreate
  ExplicitWidth = 637
  ExplicitHeight = 528
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [3]
    Left = 26
    Top = 21
    Width = 35
    Height = 16
    Caption = 'Nome'
    FocusControl = DBEdit1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [4]
    Left = 26
    Top = 85
    Width = 38
    Height = 16
    Caption = 'Valor '
    FocusControl = DBEdit2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel [5]
    Left = 338
    Top = 21
    Width = 51
    Height = 16
    Caption = 'Unidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Grid_dados: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'cod_ingrediente'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 278
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor_unitario'
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unidade'
        Width = 78
        Visible = True
      end>
  end
  object DBEdit1: TDBEdit [14]
    Left = 26
    Top = 43
    Width = 239
    Height = 21
    DataField = 'descricao'
    DataSource = ds_dados
    TabOrder = 8
  end
  object DBEdit2: TDBEdit [15]
    Left = 26
    Top = 107
    Width = 134
    Height = 21
    DataField = 'valor_unitario'
    DataSource = ds_dados
    TabOrder = 9
  end
  object DBLookupComboBox1: TDBLookupComboBox [16]
    Left = 338
    Top = 43
    Width = 145
    Height = 21
    DataField = 'cod_unidade'
    DataSource = ds_dados
    KeyField = 'cod_unidade'
    ListField = 'descricao'
    ListSource = ds_unidades
    TabOrder = 10
  end
  inherited q_dados: TFDQuery
    SQL.Strings = (
      'select * from ingredientes order by descricao')
    object q_dadoscod_ingrediente: TFDAutoIncField
      FieldName = 'cod_ingrediente'
      Origin = 'cod_ingrediente'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_dadosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 100
    end
    object q_dadosvalor_unitario: TFloatField
      FieldName = 'valor_unitario'
      Origin = 'valor_unitario'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
    object q_dadoscod_unidade: TIntegerField
      FieldName = 'cod_unidade'
      Origin = 'cod_unidade'
      Required = True
    end
    object q_dadosUnidade: TStringField
      FieldKind = fkLookup
      FieldName = 'Unidade'
      LookupDataSet = q_unidades
      LookupKeyFields = 'cod_unidade'
      LookupResultField = 'descricao'
      KeyFields = 'cod_unidade'
      Lookup = True
    end
  end
  object q_unidades: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select * '
      'from unidades'
      'order by descricao')
    Left = 360
    Top = 80
  end
  object ds_unidades: TDataSource
    DataSet = q_unidades
    Left = 464
    Top = 80
  end
end
