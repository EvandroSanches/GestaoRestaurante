object f_ingredientes: Tf_ingredientes
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro de Ingredientes'
  ClientHeight = 481
  ClientWidth = 978
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 23
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 978
    Height = 89
    Align = alTop
    TabOrder = 0
    object Bevel1: TBevel
      Left = 3
      Top = 3
      Width = 970
      Height = 83
    end
    object Label1: TLabel
      Left = 16
      Top = 11
      Width = 72
      Height = 23
      Caption = 'Pesquisa'
    end
    object edit_pesquisa: TEdit
      Left = 16
      Top = 40
      Width = 945
      Height = 31
      TabOrder = 0
      OnChange = edit_pesquisaChange
    end
  end
  object b_fechar: TBitBtn
    Left = 832
    Top = 424
    Width = 129
    Height = 41
    Caption = 'Fechar'
    TabOrder = 1
    OnClick = b_fecharClick
  end
  object b_excluir: TBitBtn
    Left = 697
    Top = 424
    Width = 129
    Height = 41
    Caption = 'Excluir'
    TabOrder = 2
    OnClick = b_excluirClick
  end
  object b_alterar: TBitBtn
    Left = 562
    Top = 424
    Width = 129
    Height = 41
    Caption = 'Alterar'
    TabOrder = 3
    OnClick = b_alterarClick
  end
  object b_incluir: TBitBtn
    Left = 427
    Top = 424
    Width = 129
    Height = 41
    Caption = 'Incluir'
    TabOrder = 4
    OnClick = b_incluirClick
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 91
    Width = 977
    Height = 327
    DataSource = DS_ingredientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cod_ingrediente'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 560
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unidade'
        Title.Caption = 'Unidade'
        Width = 226
        Visible = True
      end>
  end
  object Q_ingredientes: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select i.*, u.descricao as unidade'
      'from ingredientes i left outer '
      '     join unidades u on (u.cod_unidade = i.cod_unidade)'
      ''
      'order by descricao'
      '')
    Left = 736
    Top = 192
    object Q_ingredientescod_ingrediente: TFDAutoIncField
      FieldName = 'cod_ingrediente'
      Origin = 'cod_ingrediente'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object Q_ingredientesdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 100
    end
    object Q_ingredientesvalor_unitario: TFloatField
      FieldName = 'valor_unitario'
      Origin = 'valor_unitario'
    end
    object Q_ingredientescod_unidade: TIntegerField
      FieldName = 'cod_unidade'
      Origin = 'cod_unidade'
      Required = True
    end
    object Q_ingredientesunidade: TStringField
      FieldName = 'unidade'
      Origin = 'unidade'
      Size = 100
    end
  end
  object DS_ingredientes: TDataSource
    DataSet = Q_ingredientes
    Left = 736
    Top = 272
  end
end
