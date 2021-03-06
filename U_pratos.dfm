object f_pratos: Tf_pratos
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro de Pratos'
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
    DataSource = DS_pratos
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
        FieldName = 'cod_prato'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 660
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor'
        Title.Alignment = taCenter
        Title.Caption = 'Valor'
        Width = 165
        Visible = True
      end>
  end
  object b_composicao: TBitBtn
    Left = 16
    Top = 424
    Width = 129
    Height = 41
    Caption = 'Composi'#231#227'o'
    TabOrder = 6
    OnClick = b_composicaoClick
  end
  object b_imprimir: TBitBtn
    Left = 195
    Top = 424
    Width = 190
    Height = 41
    Caption = 'Imprimir Composi'#231#227'o'
    TabOrder = 7
    OnClick = b_imprimirClick
  end
  object Q_Pratos: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select *'
      'from pratos'
      'order by nome'
      '')
    Left = 736
    Top = 192
    object Q_Pratoscod_prato: TFDAutoIncField
      FieldName = 'cod_prato'
      Origin = 'cod_prato'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object Q_Pratosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 100
    end
    object Q_Pratosdescricao_detalhada: TMemoField
      FieldName = 'descricao_detalhada'
      Origin = 'descricao_detalhada'
      BlobType = ftMemo
    end
    object Q_Pratosvalor: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
  object DS_pratos: TDataSource
    DataSet = Q_Pratos
    Left = 736
    Top = 272
  end
end
