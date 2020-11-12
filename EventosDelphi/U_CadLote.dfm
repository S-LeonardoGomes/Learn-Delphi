object F_Lote: TF_Lote
  Left = 441
  Top = 251
  Caption = 'Lote'
  ClientHeight = 461
  ClientWidth = 805
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
  object lblNomeLote: TLabel
    Left = 64
    Top = 299
    Width = 67
    Height = 13
    Caption = 'Nome do lote:'
  end
  object lblPrecoLote: TLabel
    Left = 63
    Top = 339
    Width = 67
    Height = 13
    Caption = 'Pre'#231'o do lote:'
  end
  object lblQuantidadeLote: TLabel
    Left = 411
    Top = 259
    Width = 60
    Height = 13
    Caption = 'Quantidade:'
  end
  object lblIdEvento: TLabel
    Left = 81
    Top = 259
    Width = 49
    Height = 13
    Caption = 'EventoID:'
  end
  object lblDataInicioLote: TLabel
    Left = 418
    Top = 299
    Width = 53
    Height = 13
    Caption = 'Data inicio:'
  end
  object lblDataFimLote: TLabel
    Left = 427
    Top = 339
    Width = 44
    Height = 13
    Caption = 'Data fim:'
  end
  object lblAvisoDisponibilidade: TLabel
    Left = 256
    Top = 208
    Width = 289
    Height = 16
    Caption = 'Este evento possui %s ingressos dispon'#237'veis'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object suiDBGrid2: TsuiDBGrid
    AlignWithMargins = True
    Left = 8
    Top = 8
    Width = 789
    Height = 177
    BorderStyle = bsNone
    Color = 14609391
    DataSource = dsLote
    FixedColor = 15717318
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopupActionBar1
    TabOrder = 0
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
        FieldName = 'LoteId'
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
        FieldName = 'Preco'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataInicio'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataFim'
        Width = 120
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
        Title.Caption = 'Evento'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NomeEvento'
        Title.Caption = 'Evento'
        Width = 120
        Visible = True
      end>
  end
  object edtNomeLote: TEdit
    Tag = 1
    Left = 137
    Top = 296
    Width = 201
    Height = 21
    Hint = 'Nome do lote'
    TabOrder = 1
  end
  object edtPrecoLote: TEdit
    Tag = 1
    Left = 136
    Top = 336
    Width = 201
    Height = 21
    Hint = 'Pre'#231'o do lote'
    TabOrder = 2
  end
  object edtQuantidadeLote: TEdit
    Tag = 1
    Left = 477
    Top = 256
    Width = 201
    Height = 21
    Hint = 'Quantidade'
    TabOrder = 3
  end
  object btnSalvarLote: TButton
    Left = 110
    Top = 401
    Width = 227
    Height = 43
    Caption = 'Salvar lote'
    TabOrder = 4
    OnClick = btnSalvarLoteClick
  end
  object btnLimpar: TButton
    Left = 452
    Top = 401
    Width = 227
    Height = 43
    Caption = 'Limpar'
    TabOrder = 5
    OnClick = btnLimparClick
  end
  object cbbEventos: TsuiDBLookupComboBox
    Tag = 1
    Left = 136
    Top = 256
    Width = 202
    Height = 21
    Hint = 'EventoID'
    KeyField = 'EventoId'
    ListField = 'Tema'
    ListSource = ds_Eventos
    TabOrder = 6
    OnClick = cbbEventosClick
    UIStyle = WinXP
    BorderColor = 6842472
    ArrowColor = clBlack
    ButtonColor = 14609391
  end
  object dtInicio: TDateEdit
    Tag = 1
    Left = 477
    Top = 296
    Width = 202
    Height = 21
    Hint = 'Data inicio'
    NumGlyphs = 2
    TabOrder = 7
  end
  object dtFim: TDateEdit
    Tag = 1
    Left = 477
    Top = 336
    Width = 202
    Height = 21
    Hint = 'Data fim'
    NumGlyphs = 2
    TabOrder = 8
  end
  object dsLote: TDataSource
    DataSet = Qry_Lote
    Left = 400
    Top = 128
  end
  object Qry_Lote: TQuery
    OnCalcFields = Qry_LoteCalcFields
    DatabaseName = 'Db'
    SQL.Strings = (
      'Select * from Lote (NOLOCK)')
    Left = 400
    Top = 64
    object Qry_LoteLoteId: TIntegerField
      FieldName = 'LoteId'
      Origin = 'DB."dbo.Lote".LoteId'
    end
    object Qry_LoteNome: TStringField
      FieldName = 'Nome'
      Origin = 'DB."dbo.Lote".Nome'
      Size = 15
    end
    object Qry_LotePreco: TIntegerField
      FieldName = 'Preco'
      Origin = 'DB."dbo.Lote".Preco'
    end
    object Qry_LoteDataInicio: TDateTimeField
      FieldName = 'DataInicio'
      Origin = 'DB."dbo.Lote".DataInicio'
    end
    object Qry_LoteDataFim: TDateTimeField
      FieldName = 'DataFim'
      Origin = 'DB."dbo.Lote".DataFim'
    end
    object Qry_LoteQuantidade: TIntegerField
      FieldName = 'Quantidade'
      Origin = 'DB."dbo.Lote".Quantidade'
    end
    object Qry_LoteEventoId: TIntegerField
      FieldName = 'EventoId'
      Origin = 'DB."dbo.Lote".EventoId'
    end
    object Qry_LoteNomeEvento: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeEvento'
      Size = 15
      Calculated = True
    end
  end
  object Qry_CrudLote: TQuery
    DatabaseName = 'Db'
    Left = 536
    Top = 96
  end
  object ds_Eventos: TDataSource
    DataSet = Qry_Eventos
    Left = 232
    Top = 128
  end
  object Qry_Eventos: TQuery
    DatabaseName = 'Db'
    SQL.Strings = (
      'SELECT * FROM Evento')
    Left = 232
    Top = 64
    object Qry_EventosEventoId: TIntegerField
      FieldName = 'EventoId'
      Origin = 'DB."dbo.Evento".EventoId'
    end
    object Qry_EventosEndereco: TStringField
      FieldName = 'Endereco'
      Origin = 'DB."dbo.Evento".Endereco'
      Size = 200
    end
    object Qry_EventosDataEvento: TDateTimeField
      FieldName = 'DataEvento'
      Origin = 'DB."dbo.Evento".DataEvento'
    end
    object Qry_EventosTema: TStringField
      FieldName = 'Tema'
      Origin = 'DB."dbo.Evento".Tema'
      Size = 15
    end
    object Qry_EventosQtdPessoas: TIntegerField
      FieldName = 'QtdPessoas'
      Origin = 'DB."dbo.Evento".QtdPessoas'
    end
    object Qry_EventosImagemUrl: TMemoField
      FieldName = 'ImagemUrl'
      Origin = 'DB."dbo.Evento".ImagemUrl'
      BlobType = ftMemo
      Size = 1
    end
    object Qry_EventosTelefone: TStringField
      FieldName = 'Telefone'
      Origin = 'DB."dbo.Evento".Telefone'
      Size = 15
    end
  end
  object PopupActionBar1: TPopupActionBar
    OnPopup = PopupActionBar1Popup
    Left = 88
    Top = 88
    object popExcluirLote: TMenuItem
      Caption = 'Excluir registro'
      OnClick = popExcluirLoteClick
    end
  end
end
