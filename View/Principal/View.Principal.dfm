object unPrincipal: TunPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  TextHeight = 15
  object pnlBase: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 576
    Top = 16
    object miCadastro: TMenuItem
      Caption = 'Cadastro'
      object miMarca: TMenuItem
        Caption = 'Marca'
        OnClick = miMarcaClick
      end
      object miModelo: TMenuItem
        Caption = 'Modelo'
        OnClick = miModeloClick
      end
      object miCliente: TMenuItem
        Caption = 'Cliente'
        OnClick = miClienteClick
      end
    end
    object miMovimentao: TMenuItem
      Caption = 'Movimenta'#231#227'o'
      object miVenda: TMenuItem
        Caption = 'Venda'
        OnClick = miVendaClick
      end
    end
    object miConsulta: TMenuItem
      Caption = 'Consulta'
      object miConsultas: TMenuItem
        Caption = 'Consultas'
        OnClick = miConsultasClick
      end
    end
  end
end