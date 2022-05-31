object f_CadPadrao: Tf_CadPadrao
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro Padr'#227'o'
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
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 615
    Height = 145
    Hint = '527'
  end
  object Bevel2: TBevel
    Left = -3
    Top = 207
    Width = 633
    Height = 295
  end
  object Label1: TLabel
    Left = 8
    Top = 216
    Width = 63
    Height = 16
    Caption = 'Pesquisar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object b_gravar: TButton
    Left = 8
    Top = 176
    Width = 91
    Height = 25
    Caption = 'Gravar'
    TabOrder = 0
    OnClick = b_gravarClick
  end
  object b_excluir: TButton
    Left = 531
    Top = 361
    Width = 84
    Height = 29
    Caption = 'Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = b_excluirClick
  end
  object b_alterar: TButton
    Left = 531
    Top = 321
    Width = 84
    Height = 29
    Caption = 'Alterar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = b_alterarClick
  end
  object b_cancelar: TButton
    Left = 128
    Top = 176
    Width = 91
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = b_cancelarClick
  end
  object b_incluir: TButton
    Left = 531
    Top = 281
    Width = 84
    Height = 29
    Caption = 'Incluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = b_incluirClick
  end
  object b_fechar: TButton
    Left = 531
    Top = 401
    Width = 84
    Height = 29
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = b_fecharClick
  end
  object Grid_dados: TDBGrid
    Left = 8
    Top = 283
    Width = 517
    Height = 208
    DataSource = ds_dados
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edit_pesquisa: TEdit
    Left = 8
    Top = 248
    Width = 517
    Height = 21
    TabOrder = 7
    OnChange = edit_pesquisaChange
  end
  object q_dados: TFDQuery
    AfterOpen = q_dadosAfterOpen
    AfterClose = q_dadosAfterClose
    AfterInsert = q_dadosAfterInsert
    AfterEdit = q_dadosAfterEdit
    AfterPost = q_dadosAfterPost
    AfterCancel = q_dadosAfterCancel
    AfterDelete = q_dadosAfterDelete
    Connection = DM.FDConnection1
    Left = 408
    Top = 344
  end
  object ds_dados: TDataSource
    DataSet = q_dados
    Left = 200
    Top = 352
  end
end
