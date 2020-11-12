object frmCrudEvento: TfrmCrudEvento
  Left = 413
  Top = 103
  Caption = 'Tela evento'
  ClientHeight = 432
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblEnderecoEvento: TLabel
    Left = 86
    Top = 224
    Width = 49
    Height = 13
    Caption = 'Endere'#231'o:'
  end
  object lblTemaEvento: TLabel
    Left = 103
    Top = 264
    Width = 30
    Height = 13
    Caption = 'Tema:'
  end
  object lblQtdPessoasEvento: TLabel
    Left = 67
    Top = 304
    Width = 68
    Height = 13
    Caption = 'Qtd. Pessoas:'
  end
  object lblTelefoneEvento: TLabel
    Left = 417
    Top = 224
    Width = 46
    Height = 13
    Caption = 'Telefone:'
  end
  object lblDataEvento: TLabel
    Left = 436
    Top = 264
    Width = 27
    Height = 13
    Caption = 'Data:'
  end
  object lblImagemEvento: TLabel
    Left = 421
    Top = 306
    Width = 42
    Height = 13
    Caption = 'Imagem:'
  end
  object btnCadastrarEvento: TButton
    Left = 21
    Top = 362
    Width = 227
    Height = 43
    Caption = 'Salvar evento'
    TabOrder = 0
    OnClick = btnCadastrarEventoClick
  end
  object edtEnderecoEvento: TEdit
    Tag = 1
    Left = 141
    Top = 221
    Width = 217
    Height = 21
    Hint = 'Endere'#231'o'
    TabOrder = 1
  end
  object edtTemaEvento: TEdit
    Tag = 1
    Left = 141
    Top = 261
    Width = 217
    Height = 21
    Hint = 'Tema'
    TabOrder = 2
  end
  object edtQtdPessoasEvento: TEdit
    Tag = 1
    Left = 141
    Top = 301
    Width = 217
    Height = 21
    Hint = 'Qtd. Pessoas'
    TabOrder = 3
  end
  object edtTelefoneEvento: TEdit
    Tag = 1
    Left = 469
    Top = 221
    Width = 217
    Height = 21
    Hint = 'Telefone'
    TabOrder = 4
  end
  object edtImagemEvento: TEdit
    Tag = 1
    Left = 469
    Top = 301
    Width = 217
    Height = 21
    Hint = 'Imagem'
    Enabled = False
    ReadOnly = True
    TabOrder = 5
  end
  object edtDataEvento: TDateEdit
    Tag = 1
    Left = 469
    Top = 261
    Width = 217
    Height = 21
    Hint = 'Data'
    NumGlyphs = 2
    TabOrder = 6
  end
  object suiDBGrid1: TsuiDBGrid
    Left = 8
    Top = 8
    Width = 784
    Height = 177
    BorderStyle = bsNone
    Color = 14609391
    DataSource = dsEvento
    FixedColor = 15717318
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
    ParentFont = False
    PopupMenu = PopupActionBar1
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = suiDBGrid1CellClick
    OnDrawColumnCell = suiDBGrid1DrawColumnCell
    UIStyle = WinXP
    BorderColor = 6842472
    FocusedColor = clGreen
    SelectedColor = clYellow
    FontColor = clBlack
    TitleFontColor = clBlack
    FixedBGColor = 15717318
    BGColor = 14609391
    Columns = <
      item
        Expanded = False
        FieldName = 'EventoId'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Endereco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Endere'#231'o'
        Title.Color = clGray
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'Century Gothic'
        Title.Font.Style = [fsBold]
        Width = 200
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DataEvento'
        Title.Alignment = taCenter
        Title.Caption = 'Data'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tema'
        Title.Alignment = taCenter
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QtdPessoas'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Pessoas'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ImagemUrl'
        Title.Alignment = taCenter
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefone'
        Title.Alignment = taCenter
        Width = 100
        Visible = True
      end>
  end
  object btnLimpar: TButton
    Left = 285
    Top = 362
    Width = 227
    Height = 43
    Caption = 'Limpar'
    TabOrder = 8
    OnClick = btnLimparClick
  end
  object btnBuscarImagemEvento: TButton
    Left = 549
    Top = 362
    Width = 227
    Height = 43
    Caption = 'Carregar imagem'
    TabOrder = 9
    OnClick = btnBuscarImagemEventoClick
  end
  object suiSideChannel1: TsuiSideChannel
    Left = 0
    Top = 0
    Width = 193
    Height = 432
    UIStyle = DeepBlue
    BorderColor = clBlack
    CaptionFontColor = clWhite
    ShowButton = True
    SideBarColor = 15263976
    Caption = 'Palestrantes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Align = suiLeft
    StayOn = False
    Color = clWhite
    ParentFont = False
    PopupMode = suiMouseOn
    QuickMove = False
    SideBarWidth = 10
    object suiTreeView1: TsuiTreeView
      Left = 21
      Top = 45
      Width = 156
      Height = 210
      UIStyle = DeepBlue
      BorderColor = clBlack
      BorderStyle = bsNone
      BorderWidth = 2
      Indent = 19
      TabOrder = 0
      Items.NodeData = {
        0103000000330000000000000000000000FFFFFFFFFFFFFFFF00000000030000
        000D500061006C00650073007400720061006E0074006500200031001F000000
        0000000000000000FFFFFFFFFFFFFFFF00000000000000000352007500610029
        0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000854006500
        6C00650066006F006E0065002B0000000000000000000000FFFFFFFFFFFFFFFF
        00000000000000000943007500720072006900630075006C006F003100000000
        00000000000000FFFFFFFFFFFFFFFF00000000040000000C500061006C006500
        73007400610074006E006500200032001F0000000000000000000000FFFFFFFF
        FFFFFFFF0000000000000000035200750061002B0000000000000000000000FF
        FFFFFFFFFFFFFF00000000000000000943007500720072006900630075006C00
        6F00290000000000000000000000FFFFFFFFFFFFFFFF00000000000000000854
        0065006C00650066006F006E006500190000000000000000000000FFFFFFFFFF
        FFFFFF000000000000000000190000000000000000000000FFFFFFFFFFFFFFFF
        000000000000000000}
    end
  end
  object Qry_CrudEvento: TQuery
    DatabaseName = 'Db'
    Left = 488
    Top = 80
  end
  object dsEvento: TDataSource
    DataSet = Qry_Evento
    Left = 288
    Top = 120
  end
  object Qry_Evento: TQuery
    DatabaseName = 'Db'
    SQL.Strings = (
      'SELECT * FROM EVENTO (NOLOCK)')
    Left = 288
    Top = 56
    object Qry_EventoEventoId: TIntegerField
      FieldName = 'EventoId'
      Origin = 'DB."dbo.Evento".EventoId'
    end
    object Qry_EventoEndereco: TStringField
      FieldName = 'Endereco'
      Origin = 'DB."dbo.Evento".Endereco'
      Size = 30
    end
    object Qry_EventoDataEvento: TDateTimeField
      FieldName = 'DataEvento'
      Origin = 'DB."dbo.Evento".DataEvento'
    end
    object Qry_EventoTema: TStringField
      FieldName = 'Tema'
      Origin = 'DB."dbo.Evento".Tema'
      Size = 15
    end
    object Qry_EventoQtdPessoas: TIntegerField
      FieldName = 'QtdPessoas'
      Origin = 'DB."dbo.Evento".QtdPessoas'
    end
    object Qry_EventoTelefone: TStringField
      FieldName = 'Telefone'
      Origin = 'DB."dbo.Evento".Telefone'
      Size = 15
    end
    object Qry_EventoImagemUrl: TMemoField
      FieldName = 'ImagemUrl'
      Origin = 'DB."dbo.Evento".ImagemUrl'
      BlobType = ftMemo
      Size = 1
    end
  end
  object opdBuscarImagemEvento: TOpenPictureDialog
    Left = 664
    Top = 80
  end
  object PopupActionBar1: TPopupActionBar
    OnPopup = PopupActionBar1Popup
    Left = 40
    Top = 88
    object popExcluirEvento: TMenuItem
      Caption = 'Excluir registro'
      OnClick = popExcluirEventoClick
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Qry_Evento
    Left = 200
    Top = 48
  end
  object cds_Evento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 168
    Top = 120
    object cds_EventoEventoId: TIntegerField
      FieldName = 'EventoId'
    end
    object cds_EventoEndereco: TStringField
      FieldName = 'Endereco'
      Size = 30
    end
    object cds_EventoDataEvento: TDateTimeField
      FieldName = 'DataEvento'
    end
    object cds_EventoTema: TStringField
      FieldName = 'Tema'
      Size = 15
    end
    object cds_EventoQtdPessoas: TIntegerField
      FieldName = 'QtdPessoas'
    end
    object cds_EventoTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object cds_EventoImagemUrl: TMemoField
      FieldName = 'ImagemUrl'
      BlobType = ftMemo
      Size = 1
    end
  end
end
