inherited F_pratos_CadPadrao: TF_pratos_CadPadrao
  Caption = 'Cadastro de Pratos - Hedado'
  ExplicitWidth = 637
  ExplicitHeight = 528
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [3]
    Left = 24
    Top = 18
    Width = 43
    Height = 18
    Caption = 'Nome'
    FocusControl = DBEdit1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [4]
    Left = 312
    Top = 16
    Width = 74
    Height = 18
    Caption = 'Descri'#231#227'o'
    FocusControl = DBMemo1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel [5]
    Left = 24
    Top = 83
    Width = 40
    Height = 18
    Caption = 'Valor'
    FocusControl = DBEdit2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited b_cancelar: TButton
    Left = 126
    ExplicitLeft = 126
  end
  inherited Grid_dados: TDBGrid
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cod_prato'
        Title.Caption = 'C'#243'digo'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Prato'
        Width = 256
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor'
        Title.Caption = 'Valor'
        Width = 95
        Visible = True
      end>
  end
  object DBEdit1: TDBEdit [14]
    Left = 24
    Top = 42
    Width = 241
    Height = 21
    DataField = 'nome'
    DataSource = ds_dados
    TabOrder = 8
  end
  object DBMemo1: TDBMemo [15]
    Left = 312
    Top = 37
    Width = 289
    Height = 89
    DataField = 'descricao_detalhada'
    DataSource = ds_dados
    TabOrder = 9
  end
  object DBEdit2: TDBEdit [16]
    Left = 24
    Top = 107
    Width = 134
    Height = 21
    DataField = 'valor'
    DataSource = ds_dados
    TabOrder = 10
  end
  inherited q_dados: TFDQuery
    SQL.Strings = (
      'select *'
      'from pratos'
      'order by nome')
    object q_dadoscod_prato: TFDAutoIncField
      FieldName = 'cod_prato'
      Origin = 'cod_prato'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_dadosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 100
    end
    object q_dadosdescricao_detalhada: TMemoField
      FieldName = 'descricao_detalhada'
      Origin = 'descricao_detalhada'
      BlobType = ftMemo
    end
    object q_dadosvalor: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
  end
end
