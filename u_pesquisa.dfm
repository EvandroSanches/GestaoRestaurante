object f_pesquisa: Tf_pesquisa
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Pesquisa'
  ClientHeight = 371
  ClientWidth = 717
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 717
    Height = 83
    Align = alTop
    TabOrder = 0
    object Bevel1: TBevel
      Left = 2
      Top = 4
      Width = 709
      Height = 75
    end
    object Label1: TLabel
      Left = 13
      Top = 14
      Width = 79
      Height = 23
      Caption = 'Pesquisa:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edit_pesq: TEdit
      Left = 13
      Top = 43
      Width = 684
      Height = 27
      TabOrder = 0
      OnChange = edit_pesqChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 83
    Width = 717
    Height = 238
    Align = alTop
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 6
      Top = 2
      Width = 711
      Height = 231
      DataSource = ds_dados
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnDblClick = DBGrid1DblClick
    end
  end
  object b_ok: TBitBtn
    Left = 429
    Top = 327
    Width = 137
    Height = 41
    Caption = 'OK'
    Default = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 2
    OnClick = b_okClick
  end
  object b_cancelar: TBitBtn
    Left = 572
    Top = 327
    Width = 137
    Height = 41
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
  object q_dados: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select * from cidades')
    Left = 328
    Top = 139
  end
  object ds_dados: TDataSource
    DataSet = q_dados
    Left = 240
    Top = 139
  end
end
