object f_clientes: Tf_clientes
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro de Clientes'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 23
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 72
    Height = 23
    Caption = 'Pesquisa'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 74
    Width = 962
    Height = 352
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'cod_cliente'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 576
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'celular'
        Title.Alignment = taCenter
        Title.Caption = 'Celular'
        Width = 201
        Visible = True
      end>
  end
  object b_incluir: TBitBtn
    Left = 404
    Top = 432
    Width = 137
    Height = 41
    Caption = 'Incluir'
    TabOrder = 1
    OnClick = b_incluirClick
  end
  object b_alterar: TBitBtn
    Left = 547
    Top = 432
    Width = 137
    Height = 41
    Caption = 'Alterar'
    TabOrder = 2
    OnClick = b_alterarClick
  end
  object b_excluir: TBitBtn
    Left = 690
    Top = 432
    Width = 137
    Height = 41
    Caption = 'Excluir'
    TabOrder = 3
    OnClick = b_excluirClick
  end
  object b_fechar: TBitBtn
    Left = 833
    Top = 432
    Width = 137
    Height = 41
    Caption = 'Fechar'
    TabOrder = 4
    OnClick = b_fecharClick
  end
  object edit_pesq: TEdit
    Left = 8
    Top = 37
    Width = 962
    Height = 31
    TabOrder = 5
    OnChange = edit_pesqChange
  end
  object ds_dados: TDataSource
    DataSet = q_dados
    Left = 248
    Top = 176
  end
  object q_dados: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select *'
      'from clientes'
      'order by nome')
    Left = 360
    Top = 168
  end
end
