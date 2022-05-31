inherited F_Permissoes_CadPadrao: TF_Permissoes_CadPadrao
  Caption = 'Permissoes'
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [3]
    Left = 21
    Top = 24
    Width = 34
    Height = 13
    Caption = 'Modulo'
    FocusControl = DBEdit1
  end
  object Label3: TLabel [4]
    Left = 352
    Top = 24
    Width = 23
    Height = 13
    Caption = 'Nivel'
  end
  inherited Grid_dados: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'modulo'
        Title.Caption = 'Modulo'
        Width = 432
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nivel'
        Title.Caption = 'Nivel'
        Visible = True
      end>
  end
  object DBEdit1: TDBEdit [13]
    Left = 21
    Top = 43
    Width = 200
    Height = 21
    DataField = 'modulo'
    DataSource = ds_dados
    TabOrder = 8
  end
  object DBComboBox1: TDBComboBox [14]
    Left = 352
    Top = 43
    Width = 145
    Height = 21
    DataField = 'nivel'
    DataSource = ds_dados
    Items.Strings = (
      '1'
      '0')
    TabOrder = 9
  end
  inherited q_dados: TFDQuery
    SQL.Strings = (
      'select * from usuario_permissao')
    object q_dadoscod_usuario: TIntegerField
      FieldName = 'cod_usuario'
      Origin = 'cod_usuario'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object q_dadosmodulo: TStringField
      FieldName = 'modulo'
      Origin = 'modulo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 100
    end
    object q_dadosnivel: TSmallintField
      FieldName = 'nivel'
      Origin = 'nivel'
      Required = True
    end
  end
end
