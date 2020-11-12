object F_PalestranteEvento: TF_PalestranteEvento
  Left = 0
  Top = 0
  Caption = 'Palestrante Evento'
  ClientHeight = 268
  ClientWidth = 440
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
  object lblAcao: TLabel
    Left = 24
    Top = 20
    Width = 177
    Height = 14
    Caption = 'Selecione o que deseja fazer:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblAcaoPalestrante: TLabel
    Left = 24
    Top = 116
    Width = 147
    Height = 14
    Caption = 'Selecione o palestrante:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblAcaoEvento: TLabel
    Left = 24
    Top = 188
    Width = 120
    Height = 14
    Caption = 'Selecione o evento:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object rb_Adicionar: TRadioButton
    Left = 24
    Top = 48
    Width = 201
    Height = 17
    Hint = 'Sele'#231#227'o'
    Caption = 'Adicionar palestrante em um evento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object rb_Remover: TRadioButton
    Left = 24
    Top = 71
    Width = 201
    Height = 17
    Hint = 'Sele'#231#227'o'
    Caption = 'Remover palestrante de um evento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object btnConfirmarAcao: TButton
    Left = 280
    Top = 98
    Width = 121
    Height = 53
    Caption = 'Confirmar a'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnConfirmarAcaoClick
  end
  object cbb_Palestrante: TsuiDBLookupComboBox
    Tag = 1
    Left = 24
    Top = 136
    Width = 201
    Height = 21
    Hint = 'Palestrante'
    KeyField = 'PalestranteId'
    ListField = 'Nome'
    ListSource = ds_AcaoPalestrante
    TabOrder = 3
    UIStyle = WinXP
    BorderColor = 6842472
    ArrowColor = clBlack
    ButtonColor = 14609391
  end
  object cbb_Evento: TsuiDBLookupComboBox
    Tag = 1
    Left = 26
    Top = 216
    Width = 199
    Height = 21
    Hint = 'Evento'
    KeyField = 'EventoId'
    ListField = 'Tema'
    ListSource = ds_AcaoEvento
    TabOrder = 4
    UIStyle = WinXP
    BorderColor = 6842472
    ArrowColor = clBlack
    ButtonColor = 14609391
  end
  object Qry_AcaoPalestrante: TQuery
    DatabaseName = 'Db'
    SQL.Strings = (
      'SELECT * FROM PALESTRANTE')
    Left = 272
    Top = 24
    object Qry_AcaoPalestrantePalestranteId: TIntegerField
      FieldName = 'PalestranteId'
      Origin = 'DB."dbo.Palestrante".PalestranteId'
    end
    object Qry_AcaoPalestranteNome: TStringField
      FieldName = 'Nome'
      Origin = 'DB."dbo.Palestrante".Nome'
      Size = 15
    end
    object Qry_AcaoPalestranteImagemUrl: TStringField
      FieldName = 'ImagemUrl'
      Origin = 'DB."dbo.Palestrante".ImagemUrl'
      Size = 100
    end
    object Qry_AcaoPalestranteTelefone: TIntegerField
      FieldName = 'Telefone'
      Origin = 'DB."dbo.Palestrante".Telefone'
    end
    object Qry_AcaoPalestranteMinicurriculo: TStringField
      FieldName = 'Minicurriculo'
      Origin = 'DB."dbo.Palestrante".Minicurriculo'
      Size = 100
    end
    object Qry_AcaoPalestranteEmail: TStringField
      FieldName = 'Email'
      Origin = 'DB."dbo.Palestrante".Email'
      Size = 30
    end
  end
  object ds_AcaoPalestrante: TDataSource
    DataSet = Qry_AcaoPalestrante
    Left = 360
    Top = 40
  end
  object Qry_AcaoEvento: TQuery
    DatabaseName = 'Db'
    SQL.Strings = (
      'SELECT * FROM EVENTO')
    Left = 280
    Top = 208
    object Qry_AcaoEventoEventoId: TIntegerField
      FieldName = 'EventoId'
      Origin = 'DB."dbo.Evento".EventoId'
    end
    object Qry_AcaoEventoEndereco: TStringField
      FieldName = 'Endereco'
      Origin = 'DB."dbo.Evento".Endereco'
      Size = 200
    end
    object Qry_AcaoEventoDataEvento: TDateTimeField
      FieldName = 'DataEvento'
      Origin = 'DB."dbo.Evento".DataEvento'
    end
    object Qry_AcaoEventoTema: TStringField
      FieldName = 'Tema'
      Origin = 'DB."dbo.Evento".Tema'
      Size = 15
    end
    object Qry_AcaoEventoQtdPessoas: TIntegerField
      FieldName = 'QtdPessoas'
      Origin = 'DB."dbo.Evento".QtdPessoas'
    end
    object Qry_AcaoEventoImagemUrl: TMemoField
      FieldName = 'ImagemUrl'
      Origin = 'DB."dbo.Evento".ImagemUrl'
      BlobType = ftMemo
      Size = 1
    end
    object Qry_AcaoEventoTelefone: TStringField
      FieldName = 'Telefone'
      Origin = 'DB."dbo.Evento".Telefone'
      Size = 15
    end
  end
  object ds_AcaoEvento: TDataSource
    DataSet = Qry_AcaoEvento
    Left = 376
    Top = 208
  end
  object Qry_CrudAcao: TQuery
    DatabaseName = 'Db'
    Left = 328
    Top = 160
  end
end
