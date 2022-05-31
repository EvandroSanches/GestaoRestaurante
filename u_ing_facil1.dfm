object f_cad_ing_facil1: Tf_cad_ing_facil1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro de Ingredientes - F'#225'cil 1'
  ClientHeight = 499
  ClientWidth = 631
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 92
    Height = 23
    Caption = 'Descri'#231#227'o'
    FocusControl = edit_descricao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 83
    Width = 133
    Height = 23
    Caption = 'Valor Unit'#225'rio'
    FocusControl = edit_valor_unitario
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 208
    Top = 83
    Width = 182
    Height = 23
    Caption = 'Unidade de Medida'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 178
    Width = 61
    Height = 19
    Caption = 'Pesquisa'
    FocusControl = edit_valor_unitario
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 244
    Width = 617
    Height = 197
    DataSource = ds_ing
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cod_ingrediente'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 255
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor_unitario'
        Title.Alignment = taCenter
        Title.Caption = 'Vl.Unit'#225'rio'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao_unidade'
        Title.Caption = 'Unidade'
        Width = 122
        Visible = True
      end>
  end
  object edit_descricao: TDBEdit
    Left = 8
    Top = 40
    Width = 597
    Height = 31
    DataField = 'descricao'
    DataSource = ds_ing
    TabOrder = 1
  end
  object edit_valor_unitario: TDBEdit
    Left = 8
    Top = 112
    Width = 182
    Height = 31
    DataField = 'valor_unitario'
    DataSource = ds_ing
    TabOrder = 2
  end
  object combo_cod_unidade: TDBLookupComboBox
    Left = 208
    Top = 112
    Width = 345
    Height = 31
    DataField = 'cod_unidade'
    DataSource = ds_ing
    KeyField = 'cod_unidade'
    ListField = 'descricao'
    ListSource = ds_unidades
    TabOrder = 3
  end
  object b_fechar: TBitBtn
    Left = 530
    Top = 447
    Width = 94
    Height = 37
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = b_fecharClick
  end
  object b_excluir: TBitBtn
    Left = 230
    Top = 447
    Width = 94
    Height = 37
    Caption = 'Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = b_excluirClick
  end
  object b_alterar: TBitBtn
    Left = 130
    Top = 447
    Width = 94
    Height = 37
    Caption = 'Alterar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = b_alterarClick
  end
  object b_incluir: TBitBtn
    Left = 30
    Top = 447
    Width = 94
    Height = 37
    Caption = 'Incluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = b_incluirClick
  end
  object b_gravar: TBitBtn
    Left = 330
    Top = 447
    Width = 94
    Height = 37
    Caption = 'Gravar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = b_gravarClick
  end
  object b_cancelar: TBitBtn
    Left = 430
    Top = 447
    Width = 94
    Height = 37
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = b_cancelarClick
  end
  object edit_pesquisa: TEdit
    Left = 8
    Top = 207
    Width = 597
    Height = 31
    TabOrder = 10
    OnChange = edit_pesquisaChange
  end
  object q_ing: TFDQuery
    AfterOpen = q_ingAfterOpen
    AfterInsert = q_ingAfterInsert
    AfterEdit = q_ingAfterEdit
    AfterPost = q_ingAfterPost
    AfterCancel = q_ingAfterCancel
    AfterDelete = q_ingAfterDelete
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select *'
      'from ingredientes'
      'order by descricao')
    Left = 384
    Top = 120
    object q_ingcod_ingrediente: TFDAutoIncField
      FieldName = 'cod_ingrediente'
      Origin = 'cod_ingrediente'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_ingdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 100
    end
    object q_ingvalor_unitario: TFloatField
      FieldName = 'valor_unitario'
      Origin = 'valor_unitario'
      DisplayFormat = '###,##0.00'
      EditFormat = '###,##0.00'
    end
    object q_ingcod_unidade: TIntegerField
      FieldName = 'cod_unidade'
      Origin = 'cod_unidade'
      Required = True
    end
    object q_ingdescricao_unidade: TStringField
      FieldKind = fkLookup
      FieldName = 'descricao_unidade'
      LookupDataSet = q_unidades
      LookupKeyFields = 'cod_unidade'
      LookupResultField = 'descricao'
      KeyFields = 'cod_unidade'
      Size = 100
      Lookup = True
    end
  end
  object ds_ing: TDataSource
    DataSet = q_ing
    Left = 432
    Top = 120
  end
  object q_unidades: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select *'
      'from unidades'
      'order by descricao')
    Left = 264
    Top = 200
  end
  object ds_unidades: TDataSource
    DataSet = q_unidades
    Left = 320
    Top = 200
  end
end
