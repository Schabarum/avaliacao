object ViewConsulta: TViewConsulta
  Left = 0
  Top = 0
  Caption = 'Consulta'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object grdConsulta: TDBGrid
      Left = 0
      Top = 104
      Width = 624
      Height = 337
      Align = alBottom
      DataSource = dsConsulta
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object cbbVisualiza: TComboBox
      Left = 32
      Top = 32
      Width = 553
      Height = 23
      TabOrder = 1
      OnExit = cbbVisualizaExit
      Items.Strings = (
        'Quantidade de vendas do carro Marea'
        'Quantidade de vendas do carro Uno por cliente'
        'Quantidade de clientes que n'#227'o efetuaram venda'
        'Clientes sorteados')
    end
    object btnExcluirVendas: TButton
      Left = 32
      Top = 65
      Width = 145
      Height = 25
      Caption = 'Excluir n'#227'o sorteados'
      Enabled = False
      TabOrder = 2
      OnClick = btnExcluirVendasClick
    end
  end
  object FDConsulta: TFDQuery
    BeforeOpen = FDConsultaBeforeOpen
    Left = 480
    Top = 256
  end
  object dsConsulta: TDataSource
    DataSet = FDConsulta
    Left = 408
    Top = 256
  end
end