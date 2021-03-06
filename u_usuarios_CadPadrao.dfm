inherited f_usuarios_CadPadrao: Tf_usuarios_CadPadrao
  Caption = 'Usuarios'
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [3]
    Left = 24
    Top = 24
    Width = 75
    Height = 13
    Caption = 'Nome Completo'
    FocusControl = DBEdit1
  end
  object Label3: TLabel [4]
    Left = 24
    Top = 80
    Width = 25
    Height = 13
    Caption = 'Login'
    FocusControl = DBEdit2
  end
  object Label4: TLabel [5]
    Left = 296
    Top = 24
    Width = 30
    Height = 13
    Caption = 'Senha'
    FocusControl = DBEdit3
  end
  object Label5: TLabel [6]
    Left = 296
    Top = 80
    Width = 80
    Height = 13
    Caption = 'Confirmar Senha'
  end
  object Label6: TLabel [7]
    Left = 456
    Top = 24
    Width = 25
    Height = 13
    Caption = 'Ativo'
  end
  object Label7: TLabel [8]
    Left = 456
    Top = 80
    Width = 66
    Height = 13
    Caption = 'Administrador'
  end
  inherited Grid_dados: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'nome_completo'
        Title.Caption = 'Nome'
        Width = 356
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ativo'
        Title.Caption = 'Ativo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'administrador'
        Title.Caption = 'Administrador'
        Visible = True
      end>
  end
  object DBEdit1: TDBEdit [17]
    Left = 24
    Top = 43
    Width = 200
    Height = 21
    DataField = 'nome_completo'
    DataSource = ds_dados
    TabOrder = 8
  end
  object DBEdit2: TDBEdit [18]
    Left = 24
    Top = 99
    Width = 105
    Height = 21
    DataField = 'login'
    DataSource = ds_dados
    TabOrder = 9
  end
  object DBEdit3: TDBEdit [19]
    Left = 296
    Top = 43
    Width = 105
    Height = 21
    DataField = 'senha'
    DataSource = ds_dados
    TabOrder = 10
  end
  object editConfirm_senha: TEdit [20]
    Left = 296
    Top = 99
    Width = 105
    Height = 21
    TabOrder = 11
  end
  object DBComboBox1: TDBComboBox [21]
    Left = 456
    Top = 43
    Width = 145
    Height = 21
    DataField = 'ativo'
    DataSource = ds_dados
    Items.Strings = (
      '1'
      '0')
    TabOrder = 12
  end
  object DBComboBox2: TDBComboBox [22]
    Left = 456
    Top = 99
    Width = 145
    Height = 21
    DataField = 'administrador'
    DataSource = ds_dados
    Items.Strings = (
      '1'
      '0')
    TabOrder = 13
  end
  object b_permissoes: TButton [23]
    Left = 531
    Top = 246
    Width = 84
    Height = 29
    Caption = 'Permissoes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    OnClick = b_permissoesClick
  end
  inherited q_dados: TFDQuery
    SQL.Strings = (
      'select * '
      'from usuarios '
      'left join usuario_permissao on '
      '(usuarios.cod_usuario = usuario_permissao.cod_usuario)')
    object q_dadoscod_usuario: TFDAutoIncField
      FieldName = 'cod_usuario'
      Origin = 'cod_usuario'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_dadosnome_completo: TStringField
      FieldName = 'nome_completo'
      Origin = 'nome_completo'
      Required = True
      Size = 150
    end
    object q_dadoslogin: TStringField
      FieldName = 'login'
      Origin = 'login'
      Required = True
      Size = 50
    end
    object q_dadossenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
    end
    object q_dadosativo: TSmallintField
      FieldName = 'ativo'
      Origin = 'ativo'
      Required = True
    end
    object q_dadosadministrador: TSmallintField
      FieldName = 'administrador'
      Origin = 'administrador'
      Required = True
    end
    object q_dadoscod_usuario_1: TIntegerField
      FieldName = 'cod_usuario_1'
      Origin = 'cod_usuario'
    end
    object q_dadosmodulo: TStringField
      FieldName = 'modulo'
      Origin = 'modulo'
      Size = 100
    end
    object q_dadosnivel: TSmallintField
      FieldName = 'nivel'
      Origin = 'nivel'
    end
  end
end
