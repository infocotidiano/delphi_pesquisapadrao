object frmPesquisa: TfrmPesquisa
  Left = 0
  Top = 0
  Caption = 'Pesquisa'
  ClientHeight = 330
  ClientWidth = 715
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 98
    Height = 13
    Caption = 'Campos de Pesquisa'
  end
  object Label2: TLabel
    Left = 168
    Top = 16
    Width = 80
    Height = 13
    Caption = 'Tipo de Pesquisa'
  end
  object Label3: TLabel
    Left = 288
    Top = 16
    Width = 86
    Height = 13
    Caption = 'Texto a Pesquisar'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 80
    Width = 715
    Height = 250
    Align = alBottom
    DataSource = dsSQL
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object cbCAMPOS: TComboBox
    Left = 8
    Top = 37
    Width = 145
    Height = 21
    TabOrder = 1
    Text = 'cbCAMPOS'
  end
  object cbFiltro: TComboBox
    Left = 168
    Top = 37
    Width = 113
    Height = 21
    ItemIndex = 0
    TabOrder = 2
    Text = 'parte'
    Items.Strings = (
      'parte'
      'inicio'
      'igual')
  end
  object edtBusca: TEdit
    Left = 288
    Top = 37
    Width = 225
    Height = 21
    TabOrder = 3
  end
  object btnPesquisa: TButton
    Left = 519
    Top = 35
    Width = 75
    Height = 25
    Caption = 'Pesquisa'
    TabOrder = 4
    OnClick = btnPesquisaClick
  end
  object edtRetorno: TEdit
    Left = 568
    Top = 8
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 5
    Text = 'edtRetorno'
    Visible = False
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=aula_mysql'
      'User_Name=root'
      'Password=Info@3004'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 528
    Top = 8
  end
  object drvMysql: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Program Files (x86)\MySQL\MySQL Server 5.7\lib\libmysql.dll'
    Left = 664
    Top = 40
  end
  object qrSQL: TFDQuery
    Connection = Conexao
    Left = 544
    Top = 40
  end
  object dsSQL: TDataSource
    DataSet = qrSQL
    Left = 600
    Top = 40
  end
end
