object ViewRegisterWrite: TViewRegisterWrite
  Left = 0
  Top = 0
  Caption = 'Heran'#231'a base'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 15
  object pnlBackGround: TPanel
    Left = 0
    Top = 58
    Width = 624
    Height = 383
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
  end
  object pnlToolbar: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 58
    Align = alTop
    TabOrder = 1
    object btnInserir: TButton
      AlignWithMargins = True
      Left = 6
      Top = 4
      Width = 75
      Height = 50
      Margins.Left = 5
      Margins.Right = 5
      Align = alLeft
      Caption = 'Inserir'
      TabOrder = 0
      OnClick = btnInserirClick
    end
    object btnEditar: TButton
      AlignWithMargins = True
      Left = 91
      Top = 4
      Width = 75
      Height = 50
      Margins.Left = 5
      Margins.Right = 5
      Align = alLeft
      Caption = 'Editar'
      TabOrder = 1
      OnClick = btnEditarClick
    end
    object btnExcluir: TButton
      AlignWithMargins = True
      Left = 176
      Top = 4
      Width = 75
      Height = 50
      Margins.Left = 5
      Margins.Right = 5
      Align = alLeft
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
  end
end
