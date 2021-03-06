inherited F_clientes_CadPadrao: TF_clientes_CadPadrao
  Caption = 'Cadastro Clientes Herdado'
  OnCreate = FormCreate
  ExplicitWidth = 637
  ExplicitHeight = 528
  PixelsPerInch = 96
  TextHeight = 13
  inherited Grid_dados: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 176
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_nascimento'
        Title.Caption = 'Data de Nascimento'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'telefone'
        Title.Caption = 'Telefone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cidade'
        Width = 118
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
      ExplicitLeft = 0
      object Label2: TLabel
        Left = 3
        Top = 3
        Width = 32
        Height = 13
        Caption = 'Nome'
        FocusControl = DBEdit1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 288
        Top = 3
        Width = 20
        Height = 13
        Caption = 'CPF'
        FocusControl = DBEdit2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 231
        Top = 61
        Width = 16
        Height = 13
        Caption = 'RG'
        FocusControl = DBEdit3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 3
        Top = 61
        Width = 113
        Height = 13
        Caption = 'Data de Nascimento'
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
        Top = 22
        Width = 238
        Height = 21
        DataField = 'nome'
        DataSource = ds_dados
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 288
        Top = 22
        Width = 147
        Height = 21
        DataField = 'cpf'
        DataSource = ds_dados
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 224
        Top = 80
        Width = 147
        Height = 21
        DataField = 'rg'
        DataSource = ds_dados
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 3
        Top = 80
        Width = 153
        Height = 21
        DataField = 'data_nascimento'
        DataSource = ds_dados
        TabOrder = 3
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 419
        Top = 55
        Width = 185
        Height = 59
        Caption = 'Sexo'
        Color = clSilver
        Columns = 2
        DataField = 'sexo'
        DataSource = ds_dados
        Items.Strings = (
          'Masculino'
          'Feminino')
        ParentBackground = False
        ParentColor = False
        TabOrder = 4
        Values.Strings = (
          'M'
          'F')
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Endere'#231'o'
      ImageIndex = 1
      object Label7: TLabel
        Left = 14
        Top = 13
        Width = 52
        Height = 13
        Caption = 'Endere'#231'o'
        FocusControl = DBEdit5
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 14
        Top = 69
        Width = 34
        Height = 13
        Caption = 'Bairro'
        FocusControl = DBEdit6
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 264
        Top = 69
        Width = 20
        Height = 13
        Caption = 'CEP'
        FocusControl = DBEdit7
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 416
        Top = 13
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
      object DBEdit5: TDBEdit
        Left = 14
        Top = 32
        Width = 200
        Height = 21
        DataField = 'endereco'
        DataSource = ds_dados
        TabOrder = 0
      end
      object DBEdit6: TDBEdit
        Left = 14
        Top = 88
        Width = 200
        Height = 21
        DataField = 'bairro'
        DataSource = ds_dados
        TabOrder = 1
      end
      object DBEdit7: TDBEdit
        Left = 264
        Top = 88
        Width = 108
        Height = 21
        DataField = 'cep'
        DataSource = ds_dados
        TabOrder = 2
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 416
        Top = 32
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
    object TabSheet3: TTabSheet
      Caption = 'Contatos'
      ImageIndex = 2
      ExplicitLeft = 0
      object Label11: TLabel
        Left = 19
        Top = 13
        Width = 49
        Height = 13
        Caption = 'Telefone'
        FocusControl = DBEdit8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 19
        Top = 69
        Width = 39
        Height = 13
        Caption = 'Celular'
        FocusControl = DBEdit9
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 264
        Top = 13
        Width = 34
        Height = 13
        Caption = 'E-Mail'
        FocusControl = DBEdit10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit8: TDBEdit
        Left = 19
        Top = 32
        Width = 199
        Height = 21
        DataField = 'telefone'
        DataSource = ds_dados
        TabOrder = 0
      end
      object DBEdit9: TDBEdit
        Left = 19
        Top = 88
        Width = 199
        Height = 21
        DataField = 'celular'
        DataSource = ds_dados
        TabOrder = 1
      end
      object DBEdit10: TDBEdit
        Left = 264
        Top = 32
        Width = 200
        Height = 21
        DataField = 'email'
        DataSource = ds_dados
        TabOrder = 2
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Outros'
      ImageIndex = 3
      object Label14: TLabel
        Left = 304
        Top = 21
        Width = 127
        Height = 13
        Caption = 'Renda Familiar Mensal'
        FocusControl = DBEdit11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit11: TDBEdit
        Left = 304
        Top = 40
        Width = 134
        Height = 21
        DataField = 'renda_familiar'
        DataSource = ds_dados
        TabOrder = 0
      end
      object DBCheckBox1: TDBCheckBox
        Left = 24
        Top = 20
        Width = 129
        Height = 17
        Caption = 'Conheceu por jornais'
        DataField = 'conheceu_por_internet'
        DataSource = ds_dados
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBox2: TDBCheckBox
        Left = 24
        Top = 51
        Width = 129
        Height = 17
        Caption = 'Conheceu por internet'
        DataField = 'conheceu_por_jornais'
        DataSource = ds_dados
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBox3: TDBCheckBox
        Left = 24
        Top = 82
        Width = 129
        Height = 17
        Caption = 'Conheceu por outros'
        DataField = 'conheceu_por_outro'
        DataSource = ds_dados
        TabOrder = 3
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
  end
  inherited q_dados: TFDQuery
    SQL.Strings = (
      'select *'
      'from clientes'
      'order by nome')
    object q_dadoscod_cliente: TFDAutoIncField
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_dadosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 100
    end
    object q_dadoscpf: TStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      EditMask = '999.999.999-99;0;_'
      FixedChar = True
      Size = 11
    end
    object q_dadosrg: TStringField
      FieldName = 'rg'
      Origin = 'rg'
      EditMask = '999.999.999-99;0;_'
      Size = 18
    end
    object q_dadosdata_nascimento: TSQLTimeStampField
      FieldName = 'data_nascimento'
      Origin = 'data_nascimento'
      EditMask = '99/99/9999;1;_'
    end
    object q_dadossexo: TStringField
      FieldName = 'sexo'
      Origin = 'sexo'
      FixedChar = True
      Size = 1
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
    object q_dadosconheceu_por_jornais: TStringField
      FieldName = 'conheceu_por_jornais'
      Origin = 'conheceu_por_jornais'
      FixedChar = True
      Size = 1
    end
    object q_dadosconheceu_por_internet: TStringField
      FieldName = 'conheceu_por_internet'
      Origin = 'conheceu_por_internet'
      FixedChar = True
      Size = 1
    end
    object q_dadosconheceu_por_outro: TStringField
      FieldName = 'conheceu_por_outro'
      Origin = 'conheceu_por_outro'
      FixedChar = True
      Size = 1
    end
    object q_dadosrenda_familiar: TFloatField
      FieldName = 'renda_familiar'
      Origin = 'renda_familiar'
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
    Left = 480
    Top = 184
  end
  object ds_cidades: TDataSource
    DataSet = q_cidades
    Left = 344
    Top = 200
  end
end
