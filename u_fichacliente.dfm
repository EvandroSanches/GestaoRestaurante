object f_fichacliente: Tf_fichacliente
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro de Clientes : Ficha Cadastral'
  ClientHeight = 533
  ClientWidth = 886
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 23
  object b_gravar: TBitBtn
    Left = 598
    Top = 484
    Width = 137
    Height = 41
    Caption = 'Gravar'
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
  object b_cancelar: TBitBtn
    Left = 741
    Top = 484
    Width = 137
    Height = 41
    Caption = 'Cancelar'
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
    NumGlyphs = 2
    TabOrder = 1
    OnClick = b_cancelarClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 886
    Height = 478
    Align = alTop
    TabOrder = 2
    object Bevel1: TBevel
      Left = 2
      Top = 0
      Width = 876
      Height = 89
    end
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 49
      Height = 23
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edit_nome: TEdit
      Left = 16
      Top = 45
      Width = 849
      Height = 31
      MaxLength = 100
      TabOrder = 0
      OnKeyDown = edit_nomeKeyDown
    end
    object PageControl1: TPageControl
      Left = 3
      Top = 92
      Width = 880
      Height = 382
      ActivePage = ts_documentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object ts_documentos: TTabSheet
        Caption = 'Documentos'
        object Label9: TLabel
          Left = 3
          Top = 107
          Width = 31
          Height = 23
          Caption = 'CPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 231
          Top = 107
          Width = 25
          Height = 23
          Caption = 'RG'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 458
          Top = 107
          Width = 169
          Height = 23
          Caption = 'Data de Nascimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edit_rg: TEdit
          Left = 231
          Top = 136
          Width = 222
          Height = 27
          MaxLength = 18
          TabOrder = 2
        end
        object edit_data_nascimento: TMaskEdit
          Left = 459
          Top = 136
          Width = 173
          Height = 27
          EditMask = '99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 3
          Text = '  /  /    '
          OnKeyDown = edit_data_nascimentoKeyDown
        end
        object rad_sexo: TRadioGroup
          Left = 3
          Top = 16
          Width = 450
          Height = 73
          Caption = 'Sexo'
          Columns = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          Items.Strings = (
            'Masculino'
            'Feminino')
          ParentFont = False
          TabOrder = 0
        end
        object edit_cpf: TMaskEdit
          Left = 3
          Top = 136
          Width = 220
          Height = 27
          EditMask = '999.999.999-99;0;_'
          MaxLength = 14
          TabOrder = 1
          Text = ''
        end
      end
      object ts_contato: TTabSheet
        Caption = 'Contato'
        ImageIndex = 1
        object Label2: TLabel
          Left = 3
          Top = 11
          Width = 79
          Height = 23
          Caption = 'Endere'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 3
          Top = 147
          Width = 57
          Height = 23
          Caption = 'Cidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object b_pesquisa_cidade: TSpeedButton
          Left = 119
          Top = 176
          Width = 42
          Height = 25
          Hint = 'Pesquisa de Cidades pelo Nome'
          Caption = '?'
          ParentShowHint = False
          ShowHint = True
          OnClick = b_pesquisa_cidadeClick
        end
        object Label4: TLabel
          Left = 3
          Top = 76
          Width = 49
          Height = 23
          Caption = 'Bairro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 684
          Top = 147
          Width = 32
          Height = 23
          Caption = 'Cep'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 3
          Top = 220
          Width = 72
          Height = 23
          Caption = 'Telefone'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 231
          Top = 220
          Width = 57
          Height = 23
          Caption = 'Celular'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 3
          Top = 283
          Width = 52
          Height = 23
          Caption = 'E-mail'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edit_endereco: TEdit
          Left = 3
          Top = 40
          Width = 859
          Height = 27
          MaxLength = 100
          TabOrder = 0
        end
        object edit_cod_cidade: TEdit
          Left = 3
          Top = 176
          Width = 110
          Height = 27
          MaxLength = 100
          NumbersOnly = True
          TabOrder = 2
          OnChange = edit_cod_cidadeChange
          OnKeyDown = edit_cod_cidadeKeyDown
        end
        object edit_nome_cidade: TEdit
          Left = 167
          Top = 176
          Width = 512
          Height = 27
          Color = clSilver
          MaxLength = 100
          NumbersOnly = True
          ReadOnly = True
          TabOrder = 7
        end
        object edit_bairro: TEdit
          Left = 3
          Top = 105
          Width = 859
          Height = 27
          MaxLength = 100
          TabOrder = 1
        end
        object edit_cep: TMaskEdit
          Left = 685
          Top = 176
          Width = 175
          Height = 27
          EditMask = '99999-999;0;_'
          MaxLength = 9
          TabOrder = 3
          Text = ''
        end
        object edit_telefone: TEdit
          Left = 3
          Top = 249
          Width = 222
          Height = 27
          MaxLength = 15
          TabOrder = 4
        end
        object edit_celular: TEdit
          Left = 231
          Top = 249
          Width = 222
          Height = 27
          MaxLength = 15
          TabOrder = 5
        end
        object edit_email: TEdit
          Left = 3
          Top = 312
          Width = 857
          Height = 27
          MaxLength = 150
          TabOrder = 6
          OnKeyDown = edit_emailKeyDown
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Outras Informa'#231#245'es'
        ImageIndex = 2
        object Label12: TLabel
          Left = 9
          Top = 180
          Width = 189
          Height = 23
          Caption = 'Renda Familiar Mensal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object GroupBox1: TGroupBox
          Left = 9
          Top = 24
          Width = 408
          Height = 130
          Caption = 'Como Conheceu a Empresa'
          TabOrder = 0
          object ck_conheceu_por_jornais: TCheckBox
            Left = 16
            Top = 32
            Width = 313
            Height = 17
            Caption = 'Por Jornais Impressos'
            TabOrder = 0
          end
          object ck_conheceu_por_internet: TCheckBox
            Left = 16
            Top = 63
            Width = 97
            Height = 17
            Caption = 'Internet'
            TabOrder = 1
          end
          object ck_conheceu_por_outro: TCheckBox
            Left = 16
            Top = 95
            Width = 233
            Height = 17
            Caption = 'Outros Meios'
            TabOrder = 2
          end
        end
        object edit_renda_familiar: TEdit
          Left = 9
          Top = 209
          Width = 222
          Height = 27
          MaxLength = 100
          TabOrder = 1
        end
      end
    end
  end
end
