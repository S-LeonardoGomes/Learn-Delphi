object F_Convidado: TF_Convidado
  Left = 0
  Top = 0
  Caption = 'Tela de convidados'
  ClientHeight = 694
  ClientWidth = 864
  Color = clBtnFace
  Constraints.MinHeight = 50
  Constraints.MinWidth = 150
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblFiltro: TLabel
    Left = 251
    Top = 182
    Width = 103
    Height = 13
    Caption = 'Selecione um evento:'
  end
  object lblResultado: TLabel
    Left = 32
    Top = 181
    Width = 55
    Height = 13
    Caption = 'Resultado: '
  end
  object lblLimiteAtingido: TLabel
    Left = 320
    Top = 216
    Width = 248
    Height = 16
    Caption = 'Limite m'#225'ximo de convidados atingido!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object lblLimite: TLabel
    Left = 32
    Top = 200
    Width = 34
    Height = 13
    Caption = 'Limite: '
  end
  object suiDBGrid1: TsuiDBGrid
    Left = 8
    Top = 8
    Width = 848
    Height = 153
    BorderStyle = bsNone
    Color = 14609391
    DataSource = ds_Convidado
    FixedColor = 15717318
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopupActionBar1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
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
        FieldName = 'ConvidadoId'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EventoId'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NomeConvidado'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EmailConvidado'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TelefoneConvidado'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EnderecoConvidado'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tema'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataEvento'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Endereco'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QtdPessoas'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ImagemUrl'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Telefone'
        Width = 100
        Visible = True
      end>
  end
  object cbbFiltro: TsuiDBLookupComboBox
    Left = 360
    Top = 176
    Width = 217
    Height = 21
    KeyField = 'EventoId'
    ListField = 'Tema'
    ListSource = ds_Filtro
    TabOrder = 1
    UIStyle = WinXP
    BorderColor = 6842472
    ArrowColor = clBlack
    ButtonColor = 14609391
  end
  object btnFiltro: TButton
    Left = 597
    Top = 176
    Width = 100
    Height = 26
    Caption = 'Carregar'
    TabOrder = 2
    OnClick = btnFiltroClick
  end
  object GroupBox1: TGroupBox
    Left = 32
    Top = 248
    Width = 394
    Height = 433
    Caption = 'Detalhes do evento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object lblIdEvento: TLabel
      Left = 32
      Top = 37
      Width = 54
      Height = 13
      Caption = 'EventoId:'
    end
    object lblTemaEvento: TLabel
      Left = 32
      Top = 93
      Width = 35
      Height = 13
      Caption = 'Tema:'
    end
    object lblDataEvento: TLabel
      Left = 32
      Top = 149
      Width = 90
      Height = 13
      Caption = 'Data do evento:'
    end
    object lblEnderecoEvento: TLabel
      Left = 32
      Top = 205
      Width = 55
      Height = 13
      Caption = 'Endere'#231'o:'
    end
    object lblTelefoneEvento: TLabel
      Left = 32
      Top = 261
      Width = 52
      Height = 13
      Caption = 'Telefone:'
    end
    object lblRedeSocialEvento: TLabel
      Left = 32
      Top = 317
      Width = 127
      Height = 13
      Caption = 'Rede social do evento:'
    end
    object edtIdEvento: TEdit
      Left = 32
      Top = 56
      Width = 329
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtTemaEvento: TEdit
      Left = 32
      Top = 112
      Width = 329
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtDataEvento: TEdit
      Left = 32
      Top = 168
      Width = 329
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtEnderecoEvento: TEdit
      Left = 32
      Top = 224
      Width = 329
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
    end
    object edtTelefoneEvento: TEdit
      Left = 32
      Top = 280
      Width = 329
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 4
    end
    object cbbRedeSocialEvento: TsuiDBLookupComboBox
      Left = 32
      Top = 336
      Width = 169
      Height = 21
      KeyField = 'RedeSocialId'
      ListField = 'nome'
      ListSource = ds_RedeSocialEvento
      TabOrder = 5
      OnClick = cbbRedeSocialEventoClick
      UIStyle = WinXP
      BorderColor = 6842472
      ArrowColor = clBlack
      ButtonColor = 14609391
    end
    object edtRedeSocialEvento: TEdit
      Left = 32
      Top = 363
      Width = 329
      Height = 21
      Cursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      OnClick = edtRedeSocialEventoClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 440
    Top = 248
    Width = 389
    Height = 433
    Caption = 'Cadastrar novo convidado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object lblNomeConvidado: TLabel
      Left = 32
      Top = 120
      Width = 35
      Height = 13
      Caption = 'Nome:'
    end
    object lblEmailConvidado: TLabel
      Left = 32
      Top = 176
      Width = 33
      Height = 13
      Caption = 'Email:'
    end
    object lblEnderecoConvidado: TLabel
      Left = 32
      Top = 232
      Width = 55
      Height = 13
      Caption = 'Endere'#231'o:'
    end
    object lblTelefoneConvidado: TLabel
      Left = 32
      Top = 288
      Width = 52
      Height = 13
      Caption = 'Telefone:'
    end
    object lblDisponibilidadeLote: TLabel
      Left = 32
      Top = 83
      Width = 123
      Height = 13
      Caption = 'lblDisponibilidadeLote'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblIdLote: TLabel
      Left = 32
      Top = 37
      Width = 41
      Height = 13
      Caption = 'LoteID:'
    end
    object edtNomeConvidado: TEdit
      Tag = 1
      Left = 32
      Top = 139
      Width = 329
      Height = 21
      Hint = 'Nome'
      TabOrder = 1
    end
    object edtEmailConvidado: TEdit
      Tag = 1
      Left = 32
      Top = 195
      Width = 329
      Height = 21
      Hint = 'Email'
      TabOrder = 2
    end
    object edtEnderecoConvidado: TEdit
      Tag = 1
      Left = 32
      Top = 251
      Width = 329
      Height = 21
      Hint = 'Endere'#231'o'
      TabOrder = 3
    end
    object btnSalvarConvidado: TButton
      Left = 32
      Top = 368
      Width = 153
      Height = 41
      Caption = 'Salvar'
      TabOrder = 5
      OnClick = btnSalvarConvidadoClick
    end
    object edtTelefoneConvidado: TEdit
      Tag = 1
      Left = 32
      Top = 307
      Width = 329
      Height = 21
      Hint = 'Telefone'
      TabOrder = 4
    end
    object btnLimparConvidado: TButton
      Left = 208
      Top = 368
      Width = 153
      Height = 41
      Caption = 'Limpar'
      TabOrder = 6
      OnClick = btnLimparConvidadoClick
    end
    object cbbLote: TsuiDBLookupComboBox
      Tag = 1
      Left = 32
      Top = 56
      Width = 169
      Height = 21
      Hint = 'LoteID'
      KeyField = 'LoteId'
      ListField = 'Nome'
      ListSource = ds_Lote
      TabOrder = 0
      OnClick = cbbLoteClick
      UIStyle = WinXP
      BorderColor = 6842472
      ArrowColor = clBlack
      ButtonColor = 14609391
    end
  end
  object btnLimparFiltro: TButton
    Left = 720
    Top = 176
    Width = 109
    Height = 26
    Caption = 'Limpar'
    TabOrder = 5
    OnClick = btnLimparFiltroClick
  end
  object Qry_Convidado: TQuery
    DatabaseName = 'Db'
    SQL.Strings = (
      'SELECT * FROM CONVIDADO AS C'
      'INNER JOIN EVENTO AS E'
      'ON C.EVENTOID = E.EVENTOID'
      'ORDER BY E.TEMA')
    Left = 72
    Top = 56
    object Qry_ConvidadoConvidadoId: TIntegerField
      FieldName = 'ConvidadoId'
      Origin = 'DB."dbo.Convidado".ConvidadoId'
    end
    object Qry_ConvidadoEventoId: TIntegerField
      FieldName = 'EventoId'
      Origin = 'DB."dbo.Convidado".EventoId'
    end
    object Qry_ConvidadoNomeConvidado: TStringField
      FieldName = 'NomeConvidado'
      Origin = 'DB."dbo.Convidado".NomeConvidado'
      Size = 50
    end
    object Qry_ConvidadoEmailConvidado: TStringField
      FieldName = 'EmailConvidado'
      Origin = 'DB."dbo.Convidado".EmailConvidado'
      Size = 100
    end
    object Qry_ConvidadoTelefoneConvidado: TIntegerField
      FieldName = 'TelefoneConvidado'
      Origin = 'DB."dbo.Convidado".TelefoneConvidado'
    end
    object Qry_ConvidadoEnderecoConvidado: TStringField
      FieldName = 'EnderecoConvidado'
      Origin = 'DB."dbo.Convidado".EnderecoConvidado'
      Size = 200
    end
    object Qry_ConvidadoEndereco: TStringField
      FieldName = 'Endereco'
      Origin = 'DB."dbo.Convidado".EnderecoConvidado'
      Size = 200
    end
    object Qry_ConvidadoDataEvento: TDateTimeField
      FieldName = 'DataEvento'
      Origin = 'DB."dbo.Convidado".EnderecoConvidado'
    end
    object Qry_ConvidadoTema: TStringField
      FieldName = 'Tema'
      Origin = 'DB."dbo.Convidado".EnderecoConvidado'
      Size = 15
    end
    object Qry_ConvidadoQtdPessoas: TIntegerField
      FieldName = 'QtdPessoas'
      Origin = 'DB."dbo.Convidado".EnderecoConvidado'
    end
    object Qry_ConvidadoImagemUrl: TMemoField
      FieldName = 'ImagemUrl'
      Origin = 'DB."dbo.Convidado".EnderecoConvidado'
      BlobType = ftMemo
      Size = 1
    end
    object Qry_ConvidadoTelefone: TStringField
      FieldName = 'Telefone'
      Origin = 'DB."dbo.Convidado".EnderecoConvidado'
      Size = 15
    end
    object Qry_ConvidadoLoteId: TIntegerField
      FieldName = 'LoteId'
      Origin = 'DB."dbo.Convidado".LoteId'
    end
  end
  object ds_Convidado: TDataSource
    DataSet = Qry_Convidado
    Left = 72
    Top = 112
  end
  object Qry_CrudConvidado: TQuery
    DatabaseName = 'Db'
    Left = 184
    Top = 56
  end
  object Qry_Filtro: TQuery
    DatabaseName = 'Db'
    SQL.Strings = (
      'SELECT * FROM EVENTO')
    Left = 304
    Top = 56
  end
  object ds_Filtro: TDataSource
    DataSet = Qry_Filtro
    Left = 304
    Top = 112
  end
  object Qry_RedeSocialEvento: TQuery
    DatabaseName = 'Db'
    SQL.Strings = (
      'SELECT * FROM REDESOCIAL'
      'WHERE EVENTOID = :EVENTOID')
    Left = 424
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'EVENTOID'
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
    Left = 424
    Top = 112
  end
  object Qry_Evento: TQuery
    DatabaseName = 'Db'
    SQL.Strings = (
      'SELECT * FROM EVENTO'
      'WHERE EVENTOID = :EVENTOID')
    Left = 184
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'EVENTOID'
        ParamType = ptUnknown
      end>
    object Qry_EventoEventoId: TIntegerField
      FieldName = 'EventoId'
      Origin = 'DB."dbo.Evento".EventoId'
    end
    object Qry_EventoEndereco: TStringField
      FieldName = 'Endereco'
      Origin = 'DB."dbo.Evento".Endereco'
      Size = 200
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
    object Qry_EventoImagemUrl: TMemoField
      FieldName = 'ImagemUrl'
      Origin = 'DB."dbo.Evento".ImagemUrl'
      BlobType = ftMemo
      Size = 1
    end
    object Qry_EventoTelefone: TStringField
      FieldName = 'Telefone'
      Origin = 'DB."dbo.Evento".Telefone'
      Size = 15
    end
  end
  object Qry_Lote: TQuery
    DatabaseName = 'Db'
    SQL.Strings = (
      'SELECT * FROM LOTE'
      'WHERE EVENTOID = :EVENTOID')
    Left = 560
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'EVENTOID'
        ParamType = ptUnknown
      end>
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
  end
  object ds_Lote: TDataSource
    DataSet = Qry_Lote
    Left = 560
    Top = 112
  end
  object Qry_CrudLote: TQuery
    DatabaseName = 'Db'
    Left = 664
    Top = 56
  end
  object PopupActionBar1: TPopupActionBar
    Left = 768
    Top = 56
    object Enviaremail1: TMenuItem
      Caption = 'Enviar email para o convidado'
      OnClick = Enviaremail1Click
    end
    object Abrirendereodoconvidado1: TMenuItem
      Caption = 'Abrir endere'#231'o do convidado'
      OnClick = Abrirendereodoconvidado1Click
    end
    object Abrirendereodoevento1: TMenuItem
      Caption = 'Abrir endere'#231'o do evento'
      OnClick = Abrirendereodoevento1Click
    end
    object Excluirconvidadodoevento1: TMenuItem
      Caption = 'Excluir convidado'
      OnClick = Excluirconvidadodoevento1Click
    end
  end
end
