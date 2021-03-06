inherited F_fornecedores_CadPadrao: TF_fornecedores_CadPadrao
  Caption = 'Cadastro de Fornecedores - Herdado'
  OnCreate = FormCreate
  ExplicitWidth = 637
  ExplicitHeight = 527
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid_dados: TDBGrid
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cod_fornecedor'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome_fantasia'
        Title.Caption = 'Nome Fantasia'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cidade'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'telefone'
        Title.Caption = 'Telefone'
        Width = 116
        Visible = True
      end>
  end
  object PageControl1: TPageControl [11]
    Left = 8
    Top = 8
    Width = 615
    Height = 145
    ActivePage = TabSheet1
    TabOrder = 8
    object TabSheet1: TTabSheet
      Caption = 'Documentos'
      object Label2: TLabel
        Left = 3
        Top = 10
        Width = 71
        Height = 13
        Caption = 'Raz'#227'o Social'
        FocusControl = DBEdit1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 3
        Top = 64
        Width = 83
        Height = 13
        Caption = 'Nome Fantasia'
        FocusControl = DBEdit2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 336
        Top = 10
        Width = 27
        Height = 13
        Caption = 'CNPJ'
        FocusControl = DBEdit3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 336
        Top = 64
        Width = 103
        Height = 13
        Caption = 'Inscri'#231#227'o Estadual'
        FocusControl = DBEdit4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 3
        Top = 29
        Width = 262
        Height = 21
        DataField = 'razao_social'
        DataSource = ds_dados
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 3
        Top = 83
        Width = 262
        Height = 21
        DataField = 'nome_fantasia'
        DataSource = ds_dados
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 336
        Top = 29
        Width = 137
        Height = 21
        DataField = 'cnpj'
        DataSource = ds_dados
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 336
        Top = 83
        Width = 137
        Height = 21
        DataField = 'inscricao_estadual'
        DataSource = ds_dados
        TabOrder = 3
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Contatos'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label6: TLabel
        Left = 10
        Top = 3
        Width = 49
        Height = 13
        Caption = 'Telefone'
        FocusControl = DBEdit5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 10
        Top = 64
        Width = 39
        Height = 13
        Caption = 'Celular'
        FocusControl = DBEdit6
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 280
        Top = 3
        Width = 35
        Height = 13
        Caption = 'E-mail'
        FocusControl = DBEdit7
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit5: TDBEdit
        Left = 10
        Top = 22
        Width = 135
        Height = 21
        DataField = 'telefone'
        DataSource = ds_dados
        TabOrder = 0
      end
      object DBEdit6: TDBEdit
        Left = 10
        Top = 83
        Width = 135
        Height = 21
        DataField = 'celular'
        DataSource = ds_dados
        TabOrder = 1
      end
      object DBEdit7: TDBEdit
        Left = 280
        Top = 22
        Width = 200
        Height = 21
        DataField = 'email'
        DataSource = ds_dados
        TabOrder = 2
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Endere'#231'o'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label9: TLabel
        Left = 3
        Top = 3
        Width = 52
        Height = 13
        Caption = 'Endere'#231'o'
        FocusControl = DBEdit8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 3
        Top = 64
        Width = 34
        Height = 13
        Caption = 'Bairro'
        FocusControl = DBEdit9
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 264
        Top = 64
        Width = 20
        Height = 13
        Caption = 'CEP'
        FocusControl = DBEdit10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 420
        Top = 3
        Width = 38
        Height = 13
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit8: TDBEdit
        Left = 3
        Top = 22
        Width = 200
        Height = 21
        DataField = 'endereco'
        DataSource = ds_dados
        TabOrder = 0
      end
      object DBEdit9: TDBEdit
        Left = 3
        Top = 83
        Width = 200
        Height = 21
        DataField = 'bairro'
        DataSource = ds_dados
        TabOrder = 1
      end
      object DBEdit10: TDBEdit
        Left = 264
        Top = 83
        Width = 108
        Height = 21
        DataField = 'cep'
        DataSource = ds_dados
        TabOrder = 2
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 420
        Top = 22
        Width = 177
        Height = 21
        DataField = 'cod_cidade'
        DataSource = ds_dados
        KeyField = 'cod_cidade'
        ListField = 'nome'
        ListSource = ds_cidades
        TabOrder = 3
      end
    end
  end
  inherited q_dados: TFDQuery
    SQL.Strings = (
      'select *'
      'from fornecedores'
      'order by nome_fantasia')
    object q_dadoscod_fornecedor: TFDAutoIncField
      FieldName = 'cod_fornecedor'
      Origin = 'cod_fornecedor'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_dadosrazao_social: TStringField
      FieldName = 'razao_social'
      Origin = 'razao_social'
      Required = True
      Size = 100
    end
    object q_dadosnome_fantasia: TStringField
      FieldName = 'nome_fantasia'
      Origin = 'nome_fantasia'
      Required = True
      Size = 100
    end
    object q_dadoscnpj: TStringField
      FieldName = 'cnpj'
      Origin = 'cnpj'
      FixedChar = True
      Size = 16
    end
    object q_dadosinscricao_estadual: TStringField
      FieldName = 'inscricao_estadual'
      Origin = 'inscricao_estadual'
      Size = 18
    end
    object q_dadosendereco: TStringField
      FieldName = 'endereco'
      Origin = 'endereco'
      Size = 100
    end
    object q_dadosbairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 100
    end
    object q_dadoscod_cidade: TIntegerField
      FieldName = 'cod_cidade'
      Origin = 'cod_cidade'
    end
    object q_dadoscep: TStringField
      FieldName = 'cep'
      Origin = 'cep'
      EditMask = '99999-999;0;_'
      FixedChar = True
      Size = 8
    end
    object q_dadostelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      EditMask = '!\(99\)0000-0000;1;_'
      Size = 15
    end
    object q_dadoscelular: TStringField
      FieldName = 'celular'
      Origin = 'celular'
      EditMask = '!\(99\)00000-0000;1;_'
      Size = 15
    end
    object q_dadosemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 150
    end
    object q_dadosCidade: TStringField
      FieldKind = fkLookup
      FieldName = 'Cidade'
      LookupDataSet = q_cidades
      LookupKeyFields = 'cod_cidade'
      LookupResultField = 'nome'
      KeyFields = 'cod_cidade'
      Size = 100
      Lookup = True
    end
  end
  object q_cidades: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select *'
      'from cidades'
      'order by nome')
    Left = 488
    Top = 184
  end
  object ds_cidades: TDataSource
    DataSet = q_cidades
    Left = 376
    Top = 184
  end
end
