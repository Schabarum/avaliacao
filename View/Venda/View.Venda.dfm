inherited Venda: TVenda
  Caption = 'Registro de vendas'
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  TextHeight = 15
  inherited pnlBackGround: TPanel
    StyleElements = [seFont, seClient, seBorder]
    object pcPrincipal: TPageControl
      Left = 0
      Top = 0
      Width = 624
      Height = 383
      ActivePage = tsVenda
      Align = alClient
      TabOrder = 0
      OnChange = pcPrincipalChange
      object tsVenda: TTabSheet
        Caption = 'Venda'
        object lblCodigo: TLabel
          Left = 24
          Top = 11
          Width = 39
          Height = 15
          Caption = 'C'#243'digo'
        end
        object lblTotal: TLabel
          Left = 160
          Top = 11
          Width = 41
          Height = 15
          Caption = 'Vl. Total'
        end
        object lblVenda: TLabel
          Left = 296
          Top = 11
          Width = 75
          Height = 15
          Caption = 'Data da venda'
        end
        object lblCliente: TLabel
          Left = 423
          Top = 11
          Width = 37
          Height = 15
          Caption = 'Cliente'
        end
        object grdVenda: TDBGrid
          Left = 0
          Top = 104
          Width = 616
          Height = 249
          Align = alBottom
          DataSource = dsVenda
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
        end
        object edtCodigo: TDBEdit
          Left = 24
          Top = 32
          Width = 121
          Height = 23
          DataField = 'ID_VENDA'
          DataSource = dsVenda
          TabOrder = 1
        end
        object edtValor: TDBEdit
          Left = 160
          Top = 32
          Width = 121
          Height = 23
          DataField = 'VL_TOTAL'
          DataSource = dsVenda
          TabOrder = 2
        end
        object edtData: TDBEdit
          Left = 296
          Top = 32
          Width = 121
          Height = 23
          DataField = 'DATA_VENDA'
          DataSource = dsVenda
          TabOrder = 3
        end
        object edtCliente: TDBEdit
          Left = 423
          Top = 32
          Width = 121
          Height = 23
          DataField = 'ID_CLIENTE'
          DataSource = dsVenda
          TabOrder = 4
        end
        object btnInserirVenda: TButton
          Left = 24
          Top = 67
          Width = 121
          Height = 25
          Caption = 'Inserir 5 Vendas'
          TabOrder = 5
          OnClick = btnInserirVendaClick
        end
      end
      object tsItem: TTabSheet
        Caption = 'Item'
        ImageIndex = 1
        object lblItemCodigo: TLabel
          Left = 16
          Top = 11
          Width = 24
          Height = 15
          Caption = 'Item'
        end
        object lblVlItem: TLabel
          Left = 144
          Top = 11
          Width = 40
          Height = 15
          Caption = 'Vl. Item'
        end
        object lblQuantidade: TLabel
          Left = 271
          Top = 11
          Width = 62
          Height = 15
          Caption = 'Quantidade'
        end
        object lblModelo: TLabel
          Left = 398
          Top = 11
          Width = 41
          Height = 15
          Caption = 'Modelo'
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 72
          Width = 616
          Height = 281
          Align = alBottom
          DataSource = dsItem
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
        end
        object edtItemCodigo: TDBEdit
          Left = 17
          Top = 32
          Width = 121
          Height = 23
          DataField = 'ID_ITEM'
          DataSource = dsItem
          TabOrder = 1
        end
        object edtVlItem: TDBEdit
          Left = 144
          Top = 32
          Width = 121
          Height = 23
          DataField = 'VL_ITEM'
          DataSource = dsItem
          TabOrder = 2
        end
        object edtQuantidade: TDBEdit
          Left = 271
          Top = 32
          Width = 121
          Height = 23
          DataField = 'QUANTIDADE'
          DataSource = dsItem
          TabOrder = 3
        end
        object edtModelo: TDBEdit
          Left = 398
          Top = 32
          Width = 121
          Height = 23
          DataField = 'ID_MODELO'
          DataSource = dsItem
          TabOrder = 4
        end
      end
    end
  end
  inherited pnlToolbar: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
  object cdsVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 436
    Top = 236
  end
  object dsVenda: TDataSource
    DataSet = cdsVenda
    Left = 492
    Top = 236
  end
  object dsItem: TDataSource
    DataSet = cdsItem
    Left = 492
    Top = 300
  end
  object cdsItem: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 436
    Top = 300
  end
end