object F_RedeSocial: TF_RedeSocial
  Left = 0
  Top = 0
  Caption = 'Rede Social'
  ClientHeight = 454
  ClientWidth = 765
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
  object lblNome: TLabel
    Left = 77
    Top = 331
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object lblUrlRedeSocial: TLabel
    Left = 394
    Top = 331
    Width = 23
    Height = 13
    Caption = 'URL:'
  end
  object suiDBGrid1: TsuiDBGrid
    Left = 8
    Top = 8
    Width = 749
    Height = 185
    BorderStyle = bsNone
    Color = 14609391
    DataSource = dsRedeSocial
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
        FieldName = 'RedeSocialId'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Url'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EventoId'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PalestranteId'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NomeEvento'
        Title.Caption = 'Evento'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomePalestrante'
        Title.Caption = 'Palestrante'
        Visible = True
      end>
  end
  object edtNomeRedeSocial: TEdit
    Tag = 1
    Left = 114
    Top = 328
    Width = 225
    Height = 21
    Hint = 'Nome'
    TabOrder = 1
  end
  object edtUrlRedeSocial: TEdit
    Tag = 1
    Left = 421
    Top = 328
    Width = 227
    Height = 21
    Hint = 'URL'
    TabOrder = 2
  end
  object btnSalvarRedeSocial: TButton
    Left = 112
    Top = 390
    Width = 227
    Height = 43
    Caption = 'Salvar rede social'
    TabOrder = 3
    OnClick = btnSalvarRedeSocialClick
  end
  object cbbEventos: TsuiDBLookupComboBox
    Left = 352
    Top = 252
    Width = 174
    Height = 21
    Hint = 'Evento'
    Enabled = False
    KeyField = 'EventoId'
    ListField = 'Tema'
    ListSource = ds_Eventos
    ReadOnly = True
    TabOrder = 4
    Visible = False
    UIStyle = WinXP
    BorderColor = 6842472
    ArrowColor = clBlack
    ButtonColor = 14609391
  end
  object cbbPalestrante: TsuiDBLookupComboBox
    Left = 352
    Top = 213
    Width = 174
    Height = 21
    Hint = 'Palestrante'
    Enabled = False
    KeyField = 'PalestranteId'
    ListField = 'Nome'
    ListSource = ds_Palestrante
    ReadOnly = True
    TabOrder = 5
    Visible = False
    UIStyle = WinXP
    BorderColor = 6842472
    ArrowColor = clBlack
    ButtonColor = 14609391
  end
  object btnLimpar: TButton
    Left = 421
    Top = 390
    Width = 227
    Height = 43
    Caption = 'Limpar'
    TabOrder = 6
    OnClick = btnLimparClick
  end
  object rbPalestrante: TRadioButton
    Left = 114
    Top = 217
    Width = 201
    Height = 17
    Caption = 'Cadastrar rede social de palestrante'
    TabOrder = 7
    OnClick = rbPalestranteClick
  end
  object rbEvento: TRadioButton
    Left = 114
    Top = 256
    Width = 180
    Height = 17
    Caption = 'Cadastrar rede social de evento'
    TabOrder = 8
    OnClick = rbEventoClick
  end
  object dsRedeSocial: TDataSource
    DataSet = Qry_RedeSocial
    Left = 456
    Top = 96
  end
  object Qry_RedeSocial: TQuery
    OnCalcFields = Qry_RedeSocialCalcFields
    DatabaseName = 'Db'
    SQL.Strings = (
      'SELECT * FROM RedeSocial (NOLOCK)')
    Left = 456
    Top = 40
    object Qry_RedeSocialRedeSocialId: TIntegerField
      FieldName = 'RedeSocialId'
      Origin = 'DB."dbo.RedeSocial".RedeSocialId'
    end
    object Qry_RedeSocialnome: TStringField
      FieldName = 'nome'
      Origin = 'DB."dbo.RedeSocial".nome'
      Size = 15
    end
    object Qry_RedeSocialUrl: TStringField
      FieldName = 'Url'
      Origin = 'DB."dbo.RedeSocial".Url'
      Size = 100
    end
    object Qry_RedeSocialEventoId: TIntegerField
      FieldName = 'EventoId'
      Origin = 'DB."dbo.RedeSocial".EventoId'
    end
    object Qry_RedeSocialPalestranteId: TIntegerField
      FieldName = 'PalestranteId'
      Origin = 'DB."dbo.RedeSocial".PalestranteId'
    end
    object Qry_RedeSocialNomeEvento: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeEvento'
      Calculated = True
    end
    object Qry_RedeSocialNomePalestrante: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomePalestrante'
      Calculated = True
    end
  end
  object Qry_CrudRedeSocial: TQuery
    DatabaseName = 'Db'
    Left = 592
    Top = 56
  end
  object ds_Eventos: TDataSource
    DataSet = Qry_Eventos
    Left = 184
    Top = 96
  end
  object Qry_Eventos: TQuery
    DatabaseName = 'Db'
    SQL.Strings = (
      'SELECT * FROM Evento')
    Left = 184
    Top = 40
    object Qry_EventosEventoId: TIntegerField
      FieldName = 'EventoId'
      Origin = 'DB."dbo.Evento".EventoId'
    end
    object Qry_EventosEndereco: TStringField
      FieldName = 'Endereco'
      Origin = 'DB."dbo.Evento".Endereco'
      Size = 30
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
    object Qry_EventosTelefone: TStringField
      FieldName = 'Telefone'
      Origin = 'DB."dbo.Evento".Telefone'
      Size = 15
    end
  end
  object Qry_Palestrante: TQuery
    DatabaseName = 'Db'
    SQL.Strings = (
      'SELECT * FROM Palestrante')
    Left = 312
    Top = 40
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
    Left = 312
    Top = 96
  end
  object PopupActionBar1: TPopupActionBar
    OnPopup = PopupActionBar1Popup
    Left = 64
    Top = 56
    object popUrl: TMenuItem
      Caption = 'Abrir url'
      OnClick = popUrlClick
    end
    object popExcluir: TMenuItem
      Caption = 'Excluir registro'
      OnClick = popExcluirClick
    end
  end
end
