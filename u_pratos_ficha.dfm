object f_pratos_ficha: Tf_pratos_ficha
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro de Pratos'
  ClientHeight = 352
  ClientWidth = 727
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
  PixelsPerInch = 96
  TextHeight = 23
  object b_gravar: TBitBtn
    Left = 446
    Top = 303
    Width = 129
    Height = 41
    Caption = 'OK'
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
    TabOrder = 0
    OnClick = b_gravarClick
  end
  object BitBtn1: TBitBtn
    Left = 581
    Top = 303
    Width = 129
    Height = 41
    Caption = 'Cancel'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 727
    Height = 297
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 728
    object Bevel1: TBevel
      Left = 3
      Top = 4
      Width = 720
      Height = 288
    end
    object Label1: TLabel
      Left = 8
      Top = 18
      Width = 133
      Height = 23
      Caption = 'Nome do Prato'
    end
    object Label2: TLabel
      Left = 10
      Top = 90
      Width = 179
      Height = 23
      Caption = 'Descri'#231#227'o Detalhada'
    end
    object Label3: TLabel
      Left = 535
      Top = 18
      Width = 118
      Height = 23
      Caption = 'Valor do Prato'
    end
    object edit_nome: TEdit
      Left = 8
      Top = 47
      Width = 521
      Height = 31
      MaxLength = 100
      TabOrder = 0
    end
    object edit_descricao_detalhada: TMemo
      Left = 10
      Top = 119
      Width = 707
      Height = 167
      TabOrder = 1
    end
    object edit_valor: TEdit
      Left = 535
      Top = 47
      Width = 182
      Height = 31
      MaxLength = 100
      TabOrder = 2
    end
  end
end