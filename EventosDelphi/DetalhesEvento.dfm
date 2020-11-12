object F_DetalhesEvento: TF_DetalhesEvento
  Left = 0
  Top = 0
  Width = 1232
  Height = 725
  AutoScroll = True
  Caption = 'Detalhes do evento'
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
  object lblListaLotes: TLabel
    Left = 607
    Top = 531
    Width = 144
    Height = 13
    Caption = 'Lista de lotes dispon'#237'veis:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblListaPalestrante: TLabel
    Left = 8
    Top = 531
    Width = 200
    Height = 13
    Caption = 'Lista de palestrantes participantes:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object gpbPalestrante: TGroupBox
    Left = 8
    Top = 8
    Width = 593
    Height = 338
    Caption = 'Informa'#231#245'es do palestrante:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object lblNomePalestrante: TLabel
      Left = 24
      Top = 227
      Width = 35
      Height = 13
      Caption = 'Nome:'
    end
    object lblEmailPalestrante: TLabel
      Left = 304
      Top = 83
      Width = 33
      Height = 13
      Caption = 'Email:'
    end
    object lblTelefonePalestrante: TLabel
      Left = 304
      Top = 139
      Width = 52
      Height = 13
      Caption = 'Telefone:'
    end
    object lblMinicurriculoPalestrante: TLabel
      Left = 24
      Top = 283
      Width = 75
      Height = 13
      Caption = 'Minicurriculo:'
    end
    object lbl: TLabel
      Left = 304
      Top = 29
      Width = 15
      Height = 13
      Hint = 'lblIdPalestrante'
      Caption = 'Id:'
    end
    object imgPalestrante: TImage
      Left = 64
      Top = 32
      Width = 180
      Height = 180
      Center = True
      Stretch = True
    end
    object lblRedeSocialPalestrante: TLabel
      Left = 304
      Top = 195
      Width = 67
      Height = 13
      Caption = 'Rede social:'
    end
    object edtNomePalestrante: TEdit
      Left = 24
      Top = 246
      Width = 273
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtEmailPalestrante: TEdit
      Left = 304
      Top = 102
      Width = 273
      Height = 21
      Cursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      OnClick = edtEmailPalestranteClick
    end
    object edtTelefonePalestrante: TEdit
      Left = 304
      Top = 158
      Width = 273
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtMinicurriculoPalestrante: TEdit
      Left = 24
      Top = 302
      Width = 553
      Height = 21
      Cursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      OnClick = edtMinicurriculoPalestranteClick
    end
    object edtIdPalestrante: TEdit
      Left = 304
      Top = 48
      Width = 273
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 4
    end
    object edtRedeSocialPalestrante: TEdit
      Left = 303
      Top = 246
      Width = 273
      Height = 21
      Cursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      OnClick = edtRedeSocialPalestranteClick
    end
    object cbbPalestrante: TsuiDBLookupComboBox
      Left = 304
      Top = 214
      Width = 273
      Height = 21
      KeyField = 'RedeSocialId'
      ListField = 'nome'
      ListSource = ds_RedeSocialPalestrante
      TabOrder = 6
      OnClick = cbbPalestranteClick
      UIStyle = WinXP
      BorderColor = 6842472
      ArrowColor = clBlack
      ButtonColor = 14609391
    end
  end
  object GroupBox2: TGroupBox
    Left = 607
    Top = 8
    Width = 594
    Height = 338
    Caption = 'Evento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object lblTemaEvento: TLabel
      Left = 16
      Top = 237
      Width = 35
      Height = 13
      Caption = 'Tema:'
    end
    object lblConvidadosEvento: TLabel
      Left = 304
      Top = 61
      Width = 131
      Height = 13
      Caption = 'N'#250'mero de convidados:'
    end
    object lblDataEvento: TLabel
      Left = 303
      Top = 109
      Width = 90
      Height = 13
      Caption = 'Data do evento:'
    end
    object lblEnderecoEvento: TLabel
      Left = 15
      Top = 283
      Width = 55
      Height = 13
      Caption = 'Endere'#231'o:'
    end
    object lblCodigoEvento: TLabel
      Left = 304
      Top = 13
      Width = 101
      Height = 13
      Caption = 'C'#243'digo do evento:'
    end
    object lblContatoEvento: TLabel
      Left = 303
      Top = 157
      Width = 105
      Height = 13
      Caption = 'Contato do evento'
    end
    object imgEvento: TImage
      Left = 64
      Top = 32
      Width = 180
      Height = 180
      Stretch = True
    end
    object lblRedeSocialEvento: TLabel
      Left = 304
      Top = 207
      Width = 67
      Height = 13
      Caption = 'Rede social:'
    end
    object edtTemaEvento: TEdit
      Left = 16
      Top = 256
      Width = 273
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtConvidadosEvento: TEdit
      Left = 304
      Top = 80
      Width = 273
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtDataEvento: TEdit
      Left = 303
      Top = 128
      Width = 273
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtEnderecoEvento: TEdit
      Left = 15
      Top = 302
      Width = 562
      Height = 21
      Cursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      OnClick = edtEnderecoEventoClick
    end
    object edtIdEvento: TEdit
      Left = 304
      Top = 32
      Width = 273
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 4
    end
    object edtContatoEvento: TEdit
      Left = 303
      Top = 176
      Width = 273
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 5
    end
    object edtRedeSocialEvento: TEdit
      Left = 304
      Top = 256
      Width = 273
      Height = 21
      Cursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object cbbEvento: TsuiDBLookupComboBox
      Left = 304
      Top = 226
      Width = 273
      Height = 21
      KeyField = 'RedeSocialId'
      ListField = 'nome'
      ListSource = ds_RedeSocialEvento
      TabOrder = 7
      OnClick = cbbEventoClick
      UIStyle = WinXP
      BorderColor = 6842472
      ArrowColor = clBlack
      ButtonColor = 14609391
    end
  end
  object suiDBGrid1: TsuiDBGrid
    Left = 607
    Top = 558
    Width = 594
    Height = 120
    BorderStyle = bsNone
    Color = 14609391
    DataSource = ds_Lote
    FixedColor = 15717318
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = suiDBGrid1CellClick
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
        FieldName = 'LoteId'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeEvento'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataInicio'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataFim'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Preco'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EventoId'
        Visible = False
      end>
  end
  object gpbLote: TGroupBox
    Left = 88
    Top = 352
    Width = 1049
    Height = 161
    Caption = 'Informa'#231#245'es de lote:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object lblIdLote: TLabel
      Left = 51
      Top = 29
      Width = 15
      Height = 13
      Caption = 'Id:'
    end
    object lblNomeLote: TLabel
      Left = 51
      Top = 85
      Width = 77
      Height = 13
      Caption = 'Nome do lote:'
    end
    object lblPrecoLote: TLabel
      Left = 392
      Top = 29
      Width = 35
      Height = 13
      Caption = 'Pre'#231'o:'
    end
    object lblQuantidadeLote: TLabel
      Left = 392
      Top = 85
      Width = 68
      Height = 13
      Caption = 'Quantidade:'
    end
    object lblDataInicioLote: TLabel
      Left = 728
      Top = 29
      Width = 62
      Height = 13
      Caption = 'Data inicio:'
    end
    object lblDataFimLote: TLabel
      Left = 728
      Top = 85
      Width = 57
      Height = 13
      Caption = 'Data final:'
    end
    object edtIdLote: TEdit
      Left = 51
      Top = 48
      Width = 270
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtNomeLote: TEdit
      Left = 51
      Top = 104
      Width = 270
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtPrecoLote: TEdit
      Left = 392
      Top = 48
      Width = 270
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtQuantidadeLote: TEdit
      Left = 392
      Top = 104
      Width = 270
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 3
    end
    object edtDataInicioLote: TEdit
      Left = 728
      Top = 48
      Width = 270
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 4
    end
    object edtDataFimLote: TEdit
      Left = 728
      Top = 104
      Width = 270
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 5
    end
  end
  object suiDBGrid2: TsuiDBGrid
    Left = 8
    Top = 558
    Width = 593
    Height = 120
    BorderStyle = bsNone
    Color = 14609391
    DataSource = ds_Palestrante
    FixedColor = 15717318
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgCancelOnExit]
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = suiDBGrid2CellClick
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
        FieldName = 'PalestranteId'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefone'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Email'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ImagemUrl'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Minicurriculo'
        Width = 300
        Visible = True
      end>
  end
  object Qry_Detalhes: TQuery
    DatabaseName = 'Db'
    SQL.Strings = (
      'SELECT L.* FROM LOTE AS L '
      'WHERE L.EVENTOID = :EVENTOID')
    Left = 544
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'EVENTOID'
        ParamType = ptUnknown
      end>
  end
  object ds_Lote: TDataSource
    DataSet = Qry_lotes
    Left = 840
    Top = 483
  end
  object Qry_lotes: TQuery
    OnCalcFields = Qry_lotesCalcFields
    DatabaseName = 'Db'
    SQL.Strings = (
      'SELECT L.* FROM LOTE AS L '
      'WHERE L.EVENTOID = :EVENTOID')
    Left = 768
    Top = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'EVENTOID'
        ParamType = ptUnknown
      end>
    object Qry_lotesLoteId: TIntegerField
      FieldName = 'LoteId'
      Origin = 'DB."dbo.Lote".LoteId'
    end
    object Qry_lotesNome: TStringField
      FieldName = 'Nome'
      Origin = 'DB."dbo.Lote".Nome'
      Size = 15
    end
    object Qry_lotesPreco: TIntegerField
      FieldName = 'Preco'
      Origin = 'DB."dbo.Lote".Preco'
    end
    object Qry_lotesDataInicio: TDateTimeField
      FieldName = 'DataInicio'
      Origin = 'DB."dbo.Lote".DataInicio'
    end
    object Qry_lotesDataFim: TDateTimeField
      FieldName = 'DataFim'
      Origin = 'DB."dbo.Lote".DataFim'
    end
    object Qry_lotesQuantidade: TIntegerField
      FieldName = 'Quantidade'
      Origin = 'DB."dbo.Lote".Quantidade'
    end
    object Qry_lotesEventoId: TIntegerField
      FieldName = 'EventoId'
      Origin = 'DB."dbo.Lote".EventoId'
    end
    object Qry_lotesNomeEvento: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeEvento'
      Calculated = True
    end
  end
  object Qry_CrudLotes: TQuery
    DatabaseName = 'Db'
    SQL.Strings = (
      'SELECT * FROM LOTES WHERE LOTEID = :LOTEID')
    Left = 680
    Top = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'LOTEID'
        ParamType = ptUnknown
      end>
  end
  object Qry_CrudPalestrante: TQuery
    DatabaseName = 'Db'
    Left = 216
    Top = 488
  end
  object Qry_Palestrante: TQuery
    DatabaseName = 'Db'
    SQL.Strings = (
      'SELECT P.* FROM Palestrante as P'
      'INNER JOIN VWDETALHE AS VWD '
      'ON P.PalestranteId = VWD.PalestranteId'
      'WHERE VWD.EventoId = :EventoId')
    Left = 344
    Top = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'EventoId'
        ParamType = ptUnknown
      end>
    object Qry_PalestrantePalestranteId: TIntegerField
      FieldName = 'PalestranteId'
      Origin = 'DB."dbo.Palestrante".PalestranteId'
    end
    object Qry_PalestranteNome: TStringField
      FieldName = 'Nome'
      Origin = 'DB."dbo.Palestrante".Nome'
      Size = 15
    end
    object Qry_PalestranteImagemUrl: TStringField
      FieldName = 'ImagemUrl'
      Origin = 'DB."dbo.Palestrante".ImagemUrl'
      Size = 100
    end
    object Qry_PalestranteTelefone: TIntegerField
      FieldName = 'Telefone'
      Origin = 'DB."dbo.Palestrante".Telefone'
    end
    object Qry_PalestranteMinicurriculo: TStringField
      FieldName = 'Minicurriculo'
      Origin = 'DB."dbo.Palestrante".Minicurriculo'
      Size = 100
    end
    object Qry_PalestranteEmail: TStringField
      FieldName = 'Email'
      Origin = 'DB."dbo.Palestrante".Email'
      Size = 30
    end
  end
  object ds_Palestrante: TDataSource
    DataSet = Qry_Palestrante
    Left = 440
    Top = 488
  end
  object Qry_RedeSocialPalestrante: TQuery
    DatabaseName = 'Db'
    SQL.Strings = (
      'SELECT * FROM REDESOCIAL'
      'WHERE PALESTRANTEID = :ID')
    Left = 160
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object Qry_RedeSocialPalestranteRedeSocialId: TIntegerField
      FieldName = 'RedeSocialId'
      Origin = 'DB."dbo.RedeSocial".RedeSocialId'
    end
    object Qry_RedeSocialPalestrantenome: TStringField
      FieldName = 'nome'
      Origin = 'DB."dbo.RedeSocial".nome'
      Size = 200
    end
    object Qry_RedeSocialPalestranteUrl: TStringField
      FieldName = 'Url'
      Origin = 'DB."dbo.RedeSocial".Url'
      Size = 100
    end
    object Qry_RedeSocialPalestranteEventoId: TIntegerField
      FieldName = 'EventoId'
      Origin = 'DB."dbo.RedeSocial".EventoId'
    end
    object Qry_RedeSocialPalestrantePalestranteId: TIntegerField
      FieldName = 'PalestranteId'
      Origin = 'DB."dbo.RedeSocial".PalestranteId'
    end
  end
  object ds_RedeSocialPalestrante: TDataSource
    DataSet = Qry_RedeSocialPalestrante
    Left = 160
    Top = 136
  end
  object Qry_RedeSocialEvento: TQuery
    DatabaseName = 'Db'
    SQL.Strings = (
      'SELECT * FROM REDESOCIAL'
      'WHERE EVENTOID = :IDEVENTO')
    Left = 744
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDEVENTO'
        ParamType = ptUnknown
      end>
    object Qry_RedeSocialEventoRedeSocialId: TIntegerField
      FieldName = 'RedeSocialId'
      Origin = 'DB."dbo.RedeSocial".RedeSocialId'
    end
    object Qry_RedeSocialEventonome: TStringField
      FieldName = 'nome'
      Origin = 'DB."dbo.RedeSocial".nome'
      Size = 200
    end
    object Qry_RedeSocialEventoUrl: TStringField
      FieldName = 'Url'
      Origin = 'DB."dbo.RedeSocial".Url'
      Size = 100
    end
    object Qry_RedeSocialEventoEventoId: TIntegerField
      FieldName = 'EventoId'
      Origin = 'DB."dbo.RedeSocial".EventoId'
    end
    object Qry_RedeSocialEventoPalestranteId: TIntegerField
      FieldName = 'PalestranteId'
      Origin = 'DB."dbo.RedeSocial".PalestranteId'
    end
  end
  object ds_RedeSocialEvento: TDataSource
    DataSet = Qry_RedeSocialEvento
    Left = 744
    Top = 144
  end
end
