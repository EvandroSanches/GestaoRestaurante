object f_cad_pratos_facil: Tf_cad_pratos_facil
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro Facil de Pratos'
  ClientHeight = 499
  ClientWidth = 631
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 49
    Height = 23
    Caption = 'Nome'
    FocusControl = edit_nome
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 64
    Width = 80
    Height = 23
    Caption = 'Descri'#231#227'o'
    FocusControl = edit_descricao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 472
    Top = 69
    Width = 42
    Height = 23
    Caption = 'Valor'
    FocusControl = edit_valor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 188
    Width = 61
    Height = 19
    Caption = 'Pesquisa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edit_nome: TDBEdit
    Left = 8
    Top = 37
    Width = 615
    Height = 26
    DataField = 'nome'
    DataSource = ds_pratos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edit_descricao: TDBMemo
    Left = 8
    Top = 93
    Width = 441
    Height = 89
    DataField = 'descricao_detalhada'
    DataSource = ds_pratos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object edit_valor: TDBEdit
    Left = 472
    Top = 98
    Width = 151
    Height = 26
    DataField = 'valor'
    DataSource = ds_pratos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 251
    Width = 615
    Height = 182
    DataSource = ds_pratos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cod_prato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = 'Nome'
        Width = 165
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao_detalhada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = 'Descri'#231#227'o'
        Width = 281
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor'
        Width = 69
        Visible = True
      end>
  end
  object edit_pesquisa: TEdit
    Left = 8
    Top = 213
    Width = 615
    Height = 32
    TabOrder = 4
    OnChange = edit_pesquisaChange
  end
  object b_fechar: TBitBtn
    Left = 529
    Top = 439
    Width = 94
    Height = 37
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = b_fecharClick
  end
  object b_excluir: TBitBtn
    Left = 229
    Top = 439
    Width = 94
    Height = 37
    Caption = 'Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = b_excluirClick
  end
  object b_alterar: TBitBtn
    Left = 129
    Top = 439
    Width = 94
    Height = 37
    Caption = 'Alterar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = b_alterarClick
  end
  object b_incluir: TBitBtn
    Left = 29
    Top = 439
    Width = 94
    Height = 37
    Caption = 'Incluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = b_incluirClick
  end
  object b_gravar: TBitBtn
    Left = 329
    Top = 439
    Width = 94
    Height = 37
    Caption = 'Gravar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = b_gravarClick
  end
  object b_cancelar: TBitBtn
    Left = 429
    Top = 439
    Width = 94
    Height = 37
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = b_cancelarClick
  end
  object q_pratos: TFDQuery
    AfterOpen = q_pratosAfterOpen
    AfterInsert = q_pratosAfterInsert
    AfterEdit = q_pratosAfterEdit
    AfterPost = q_pratosAfterPost
    AfterCancel = q_pratosAfterCancel
    AfterDelete = q_pratosAfterDelete
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select * from pratos'
      'order by nome'
      '')
    Left = 584
    Top = 152
    object q_pratoscod_prato: TFDAutoIncField
      FieldName = 'cod_prato'
      Origin = 'cod_prato'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_pratosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 100
    end
    object q_pratosdescricao_detalhada: TMemoField
      FieldName = 'descricao_detalhada'
      Origin = 'descricao_detalhada'
      BlobType = ftMemo
    end
    object q_pratosvalor: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
  end
  object ds_pratos: TDataSource
    DataSet = q_pratos
    Left = 536
    Top = 152
  end
end
