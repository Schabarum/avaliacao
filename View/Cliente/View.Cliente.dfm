inherited Cliente: TCliente
  Caption = 'Cadastro de cliente'
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  TextHeight = 15
  inherited pnlBackGround: TPanel
    StyleElements = [seFont, seClient, seBorder]
    object lblCodigo: TLabel
      Left = 16
      Top = 11
      Width = 39
      Height = 15
      Caption = 'C'#243'digo'
    end
    object lblNome: TLabel
      Left = 143
      Top = 11
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object lblCPF: TLabel
      Left = 472
      Top = 11
      Width = 21
      Height = 15
      Caption = 'CPF'
    end
    object grdCliente: TDBGrid
      Left = 0
      Top = 104
      Width = 624
      Height = 279
      Align = alBottom
      DataSource = dsCliente
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object edtCodigo: TDBEdit
      Left = 16
      Top = 32
      Width = 121
      Height = 23
      DataField = 'ID_CLIENTE'
      DataSource = dsCliente
      TabOrder = 1
    end
    object edtNome: TDBEdit
      Left = 143
      Top = 32
      Width = 323
      Height = 23
      DataField = 'NOME'
      DataSource = dsCliente
      TabOrder = 2
    end
    object edtCPF: TDBEdit
      Left = 472
      Top = 32
      Width = 121
      Height = 23
      DataField = 'CPF'
      DataSource = dsCliente
      TabOrder = 3
    end
    object btnClientes: TButton
      Left = 16
      Top = 65
      Width = 97
      Height = 25
      Caption = 'Inserir 5 Clientes'
      TabOrder = 4
      OnClick = btnClientesClick
    end
  end
  inherited pnlToolbar: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
  object dsCliente: TDataSource
    DataSet = cdsCliente
    Left = 496
    Top = 266
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 432
    Top = 266
  end
end
