object F_Principal: TF_Principal
  Left = 0
  Top = 0
  Caption = 'Sistema de Gest'#227'o Comercial'
  ClientHeight = 362
  ClientWidth = 703
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 343
    Width = 703
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 500
      end>
  end
  object MainMenu1: TMainMenu
    Left = 192
    Top = 64
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Cidades1: TMenuItem
        Caption = 'Cidades'
        OnClick = Cidades1Click
      end
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
      object Pratos1: TMenuItem
        Caption = 'Pratos'
        OnClick = Pratos1Click
      end
      object UnidadesdeMedida1: TMenuItem
        Caption = 'Unidades de Medida'
        Enabled = False
      end
      object Ingredientes1: TMenuItem
        Caption = 'Ingredientes'
        OnClick = Ingredientes1Click
      end
      object Fornecedores1: TMenuItem
        Caption = 'Fornecedores'
        Enabled = False
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
      end
    end
    object CadastrosFaceis1: TMenuItem
      Caption = 'Cadastros Faceis'
      object Ingredientes2: TMenuItem
        Caption = 'Ingredientes'
        OnClick = Ingredientes2Click
      end
      object Pratos2: TMenuItem
        Caption = 'Pratos'
        OnClick = Pratos2Click
      end
    end
    object CadastrosHerdados1: TMenuItem
      Caption = 'Cadastros Herdados'
      object Cidades2: TMenuItem
        Caption = 'Cidades'
        OnClick = Cidades2Click
      end
      object Unidades1: TMenuItem
        Caption = 'Unidades'
        OnClick = Unidades1Click
      end
      object Ingredientes3: TMenuItem
        Caption = 'Ingredientes'
        OnClick = Ingredientes3Click
      end
      object Compras2: TMenuItem
        Caption = 'Compras'
        OnClick = Compras2Click
      end
      object Encomendas2: TMenuItem
        Caption = 'Encomendas'
        OnClick = Encomendas2Click
      end
      object Pratos3: TMenuItem
        Caption = 'Pratos'
        OnClick = Pratos3Click
      end
      object Fornecedores2: TMenuItem
        Caption = 'Fornecedores'
        OnClick = Fornecedores2Click
      end
      object Clientes2: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes2Click
      end
      object Usurios2: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = Usurios2Click
      end
    end
    object Movimentao1: TMenuItem
      Caption = 'Movimenta'#231#227'o'
      object Compras1: TMenuItem
        Caption = 'Compras'
      end
      object Encomendas1: TMenuItem
        Caption = 'Encomendas'
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object QuickReport1: TMenuItem
        Caption = 'QuickReport'
        object RelatriosRaiz1: TMenuItem
          Caption = 'Relat'#243'rios Raiz'
          object abuada1: TMenuItem
            Caption = 'Tabuada'
            OnClick = abuada1Click
          end
        end
        object Cidades3: TMenuItem
          Caption = 'Cidades'
          OnClick = Cidades3Click
        end
        object Compras3: TMenuItem
          Caption = 'Compras'
          OnClick = Compras3Click
        end
        object Composio1: TMenuItem
          Caption = 'Composi'#231#227'o'
          OnClick = Composio1Click
        end
      end
      object FastReport1: TMenuItem
        Caption = 'FastReport'
        object Cidades4: TMenuItem
          Caption = 'Cidades'
          OnClick = Cidades4Click
        end
        object Unidades2: TMenuItem
          Caption = 'Unidades'
          OnClick = Unidades2Click
        end
        object Ingredientes4: TMenuItem
          Caption = 'Ingredientes'
          OnClick = Ingredientes4Click
        end
        object Pratos4: TMenuItem
          Caption = 'Pratos'
          OnClick = Pratos4Click
        end
        object Clientes3: TMenuItem
          Caption = 'Clientes'
          OnClick = Clientes3Click
        end
        object Usurios1: TMenuItem
          Caption = 'Usu'#225'rios'
          OnClick = Usurios1Click
        end
      end
    end
    object Ajuda1: TMenuItem
      Caption = 'Ajuda'
      object Sobre1: TMenuItem
        Caption = 'Sobre'
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 304
    Top = 64
  end
end
