object f_composicao: Tf_composicao
  Left = 123
  Top = 103
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Composi'#231#227'o'
  ClientHeight = 494
  ClientWidth = 775
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 20
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 775
    Height = 121
    Align = alTop
    TabOrder = 0
    object Bevel1: TBevel
      Left = 4
      Top = 3
      Width = 767
      Height = 113
    end
    object Label1: TLabel
      Left = 13
      Top = 16
      Width = 160
      Height = 20
      Caption = 'Composi'#231#227'o do Prato: '
    end
    object l_prato: TLabel
      Left = 175
      Top = 16
      Width = 182
      Height = 20
      Caption = 'Composi'#231#227'o do Prato: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 14
      Top = 49
      Width = 81
      Height = 20
      Caption = 'Ingrediente'
    end
    object b_ingrediente: TSpeedButton
      Left = 107
      Top = 76
      Width = 25
      Height = 25
      Caption = '?'
      OnClick = b_ingredienteClick
    end
    object Label2: TLabel
      Left = 470
      Top = 49
      Width = 83
      Height = 20
      Caption = 'Quantidade'
    end
    object edit_cod_ingrediente: TEdit
      Left = 14
      Top = 73
      Width = 86
      Height = 28
      TabOrder = 0
      OnChange = edit_cod_ingredienteChange
      OnKeyDown = edit_cod_ingredienteKeyDown
    end
    object edit_descricao_ingrediente: TEdit
      Left = 142
      Top = 73
      Width = 318
      Height = 28
      TabStop = False
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 100
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edit_qde: TEdit
      Left = 470
      Top = 73
      Width = 158
      Height = 28
      TabOrder = 2
      OnKeyDown = edit_qdeKeyDown
    end
    object b_incluir: TBitBtn
      Left = 656
      Top = 68
      Width = 105
      Height = 33
      Caption = 'Incluir'
      TabOrder = 3
      OnClick = b_incluirClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 775
    Height = 320
    Align = alTop
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 4
      Top = 4
      Width = 766
      Height = 311
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'ingrediente'
          Title.Caption = 'Ingrediente'
          Width = 444
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Alignment = taRightJustify
          Title.Caption = 'Quantidade'
          Width = 131
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'unidade'
          Title.Alignment = taCenter
          Title.Caption = 'Unidade'
          Width = 127
          Visible = True
        end>
    end
  end
  object BitBtn4: TBitBtn
    Left = 542
    Top = 449
    Width = 105
    Height = 33
    Caption = 'Excluir'
    TabOrder = 2
    OnClick = BitBtn4Click
  end
  object BitBtn1: TBitBtn
    Left = 657
    Top = 449
    Width = 105
    Height = 33
    Caption = 'Fechar'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object DataSource1: TDataSource
    DataSet = q_dados
    Left = 360
    Top = 193
  end
  object q_dados: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select'#9'c.*, '
      #9#9'i.descricao as ingrediente, '
      #9#9'u.descricao as unidade'
      ''
      'from'#9'composicao c '
      
        #9#9'inner join ingredientes i on (c.cod_ingrediente = i.cod_ingred' +
        'iente)'
      #9#9'left outer join unidades u on (i.cod_unidade = u.cod_unidade)'
      ''
      'order by ingrediente'
      '')
    Left = 488
    Top = 256
    object q_dadoscod_prato: TIntegerField
      FieldName = 'cod_prato'
      Origin = 'cod_prato'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object q_dadoscod_ingrediente: TIntegerField
      FieldName = 'cod_ingrediente'
      Origin = 'cod_ingrediente'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object q_dadosquantidade: TFloatField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Required = True
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object q_dadosingrediente: TStringField
      FieldName = 'ingrediente'
      Origin = 'ingrediente'
      Required = True
      Size = 100
    end
    object q_dadosunidade: TStringField
      FieldName = 'unidade'
      Origin = 'unidade'
      Size = 100
    end
  end
end
