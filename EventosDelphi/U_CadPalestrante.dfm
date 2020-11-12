object F_Palestrante: TF_Palestrante
  Left = 356
  Top = 148
  Caption = 'Palestrante'
  ClientHeight = 467
  ClientWidth = 806
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
  object lblIdPalestrante: TLabel
    Left = 76
    Top = 243
    Width = 70
    Height = 13
    Caption = 'PalestranteID:'
  end
  object lblNomePalestrante: TLabel
    Left = 115
    Top = 283
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object lblTelefone: TLabel
    Left = 100
    Top = 323
    Width = 46
    Height = 13
    Caption = 'Telefone:'
  end
  object lblEmailPalestrante: TLabel
    Left = 446
    Top = 243
    Width = 28
    Height = 13
    Caption = 'Email:'
  end
  object lblImagemPalestrante: TLabel
    Left = 432
    Top = 283
    Width = 42
    Height = 13
    Caption = 'Imagem:'
  end
  object lblMinicurriculoPalestrante: TLabel
    Left = 412
    Top = 323
    Width = 62
    Height = 13
    Caption = 'Minicurriculo:'
  end
  object SpeedButton1: TSpeedButton
    Left = 687
    Top = 319
    Width = 23
    Height = 22
    OnClick = SpeedButton1Click
  end
  object suiDBGrid1: TsuiDBGrid
    Left = 8
    Top = 8
    Width = 790
    Height = 201
    BorderStyle = bsNone
    Color = 14609391
    DataSource = ds_Palestrante
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
        FieldName = 'PalestranteId'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ImagemUrl'
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefone'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Minicurriculo'
        Width = 168
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Email'
        Visible = True
      end>
  end
  object edtIdPalestrante: TEdit
    Tag = 1
    Left = 152
    Top = 240
    Width = 201
    Height = 21
    Hint = 'PalestranteID'
    TabOrder = 1
  end
  object edtNomePalestrante: TEdit
    Tag = 1
    Left = 152
    Top = 280
    Width = 201
    Height = 21
    Hint = 'Nome'
    TabOrder = 2
  end
  object edtTelefonePalestrante: TEdit
    Tag = 1
    Left = 152
    Top = 320
    Width = 201
    Height = 21
    Hint = 'Telefone'
    TabOrder = 3
  end
  object edtEmailPalestrante: TEdit
    Tag = 1
    Left = 480
    Top = 240
    Width = 201
    Height = 21
    Hint = 'Email'
    TabOrder = 4
  end
  object edtImagemPalestrante: TEdit
    Tag = 1
    Left = 480
    Top = 279
    Width = 202
    Height = 21
    Hint = 'Imagem'
    ReadOnly = True
    TabOrder = 5
  end
  object btnSalvarPalestrante: TButton
    Left = 28
    Top = 388
    Width = 227
    Height = 43
    Caption = 'Salvar palestrante'
    TabOrder = 6
    OnClick = btnSalvarPalestranteClick
  end
  object btnLimpar: TButton
    Left = 284
    Top = 388
    Width = 227
    Height = 43
    Caption = 'Limpar'
    TabOrder = 7
    OnClick = btnLimparClick
  end
  object btnBuscarImagem: TButton
    Left = 544
    Top = 388
    Width = 227
    Height = 43
    Caption = 'Carregar imagem'
    TabOrder = 8
    OnClick = btnBuscarImagemClick
  end
  object edtMinicurriculoPalestrante: TFilenameEdit
    Tag = 1
    Left = 480
    Top = 320
    Width = 201
    Height = 21
    Hint = 'Minicurriculo'
    AcceptFiles = True
    Filter = 
      'All(*.doc;*.docx;*.pdf)|*.doc;*.docx;*.pdf;|Doc(*.doc)|*.doc|Doc' +
      'x(*.docx)|*.docx|Pdf(*.pdf)|*.pdf'
    NumGlyphs = 1
    TabOrder = 9
  end
  object Qry_Palestrante: TQuery
    DatabaseName = 'Db'
    SQL.Strings = (
      'SELECT * FROM Palestrante (NOLOCK)')
    Left = 320
    Top = 72
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
  object Qry_CrudPalestrante: TQuery
    DatabaseName = 'Db'
    Left = 480
    Top = 72
  end
  object ds_Palestrante: TDataSource
    DataSet = Qry_Palestrante
    Left = 320
    Top = 136
  end
  object opdBuscarImagem: TOpenPictureDialog
    Left = 631
    Top = 71
  end
  object PopupActionBar1: TPopupActionBar
    OnPopup = PopupActionBar1Popup
    Left = 168
    Top = 80
    object popExcluirPalestrante: TMenuItem
      Caption = 'Excluir registro'
      OnClick = popExcluirPalestranteClick
    end
    object popMinicurriculo: TMenuItem
      Caption = 'Exibir minicurriculo'
      OnClick = popMinicurriculoClick
    end
  end
end
