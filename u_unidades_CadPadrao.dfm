inherited F_unidades_CadPadrao: TF_unidades_CadPadrao
  Caption = 'Cadastro de Unidades - Herdado'
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [3]
    Left = 26
    Top = 32
    Width = 63
    Height = 16
    Caption = 'Descri'#231#227'o'
    FocusControl = DBEdit1
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
        FieldName = 'cod_unidade'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Unidade'
        Width = 425
        Visible = True
      end>
  end
  object DBEdit1: TDBEdit [12]
    Left = 26
    Top = 64
    Width = 247
    Height = 21
    DataField = 'descricao'
    DataSource = ds_dados
    TabOrder = 8
  end
  inherited q_dados: TFDQuery
    SQL.Strings = (
      'select *'
      'from unidades'
      'order by descricao')
    object q_dadoscod_unidade: TFDAutoIncField
      FieldName = 'cod_unidade'
      Origin = 'cod_unidade'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_dadosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 100
    end
  end
end
