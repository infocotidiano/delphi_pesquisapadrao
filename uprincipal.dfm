object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Exemplo de Pesquisa com parametros'
  ClientHeight = 267
  ClientWidth = 701
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 328
    Top = 77
    Width = 39
    Height = 13
    Caption = 'Retorno'
  end
  object edtRetornoPesquisa: TEdit
    Left = 328
    Top = 96
    Width = 257
    Height = 21
    TabOrder = 0
  end
  object btnCliente: TButton
    Left = 80
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Cliente'
    TabOrder = 1
    OnClick = btnClienteClick
  end
  object btnFornecedor: TButton
    Left = 80
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Fornecedor'
    TabOrder = 2
    OnClick = btnFornecedorClick
  end
end
