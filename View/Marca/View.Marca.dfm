inherited Marca: TMarca
  Caption = 'Cadastro de marca'
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
    object lblDescricao: TLabel
      Left = 143
      Top = 11
      Width = 51
      Height = 15
      Caption = 'Descri'#231#227'o'
    end
    object grdMarca: TDBGrid
      Left = 0
      Top = 72
      Width = 624
      Height = 311
      Align = alBottom
      DataSource = dsMarca
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
      DataField = 'ID_MARCA'
      DataSource = dsMarca
      TabOrder = 1
    end
    object edtMarca: TDBEdit
      Left = 143
      Top = 32
      Width = 458
      Height = 23
      DataField = 'DESCRICAO'
      DataSource = dsMarca
      TabOrder = 2
    end
  end
  inherited pnlToolbar: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
  object dsMarca: TDataSource
    DataSet = cdsMarca
    Left = 440
    Top = 266
  end
  object cdsMarca: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 266
  end
end
