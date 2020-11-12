object F_Teste: TF_Teste
  Left = 0
  Top = 0
  Caption = 'Teste'
  ClientHeight = 480
  ClientWidth = 708
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object suiDBGrid1: TsuiDBGrid
    Left = 8
    Top = 8
    Width = 692
    Height = 201
    BorderStyle = bsNone
    Color = 14609391
    DataSource = ds_Teste
    FixedColor = 15717318
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
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
        FieldName = 'EventoId'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Endereco'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataEvento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tema'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QtdPessoas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ImagemUrl'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PalestranteId'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMGPALESTRANTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MINICURRICULO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELPALESTRANTE'
        Visible = True
      end>
  end
  object datada: TsuiDBGrid
    Left = 8
    Top = 256
    Width = 692
    Height = 201
    BorderStyle = bsNone
    Color = 14609391
    DataSource = ds_cdsteste
    FixedColor = 15717318
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = datadaCellClick
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EnderecoEvento'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataEvento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TemaEvento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QtdPessoasEvento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PalestranteId'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomePalestrante'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EmailPalestrante'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 625
    Top = 215
    Width = 75
    Height = 25
    Caption = 'Carregar Grid'
    TabOrder = 2
    OnClick = Button1Click
  end
  object dt_Filtro: TDateEdit
    Left = 24
    Top = 215
    Width = 185
    Height = 21
    NumGlyphs = 2
    TabOrder = 3
  end
  object btnFiltro: TButton
    Left = 215
    Top = 215
    Width = 75
    Height = 25
    Caption = 'Filtrar'
    TabOrder = 4
    OnClick = btnFiltroClick
  end
  object edtAlterar: TEdit
    Left = 312
    Top = 215
    Width = 161
    Height = 21
    TabOrder = 5
  end
  object btnSalvar: TButton
    Left = 479
    Top = 215
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 6
    OnClick = btnSalvarClick
  end
  object Qry_Teste: TQuery
    DatabaseName = 'Db'
    SQL.Strings = (
      'SELECT * FROM VWDETALHE')
    Left = 456
    Top = 144
    object Qry_TesteEventoId: TIntegerField
      FieldName = 'EventoId'
      Origin = 'DB."dbo.VWDETALHE".EventoId'
    end
    object Qry_TesteEndereco: TStringField
      FieldName = 'Endereco'
      Origin = 'DB."dbo.VWDETALHE".Endereco'
      Size = 200
    end
    object Qry_TesteDataEvento: TDateTimeField
      FieldName = 'DataEvento'
      Origin = 'DB."dbo.VWDETALHE".DataEvento'
    end
    object Qry_TesteTema: TStringField
      FieldName = 'Tema'
      Origin = 'DB."dbo.VWDETALHE".Tema'
      Size = 15
    end
    object Qry_TesteQtdPessoas: TIntegerField
      FieldName = 'QtdPessoas'
      Origin = 'DB."dbo.VWDETALHE".QtdPessoas'
    end
    object Qry_TesteImagemUrl: TMemoField
      FieldName = 'ImagemUrl'
      Origin = 'DB."dbo.VWDETALHE".ImagemUrl'
      BlobType = ftMemo
      Size = 1
    end
    object Qry_TesteTelefone: TStringField
      FieldName = 'Telefone'
      Origin = 'DB."dbo.VWDETALHE".Telefone'
      Size = 15
    end
    object Qry_TestePalestranteId: TIntegerField
      FieldName = 'PalestranteId'
      Origin = 'DB."dbo.VWDETALHE".PalestranteId'
    end
    object Qry_TesteNOME: TStringField
      FieldName = 'NOME'
      Origin = 'DB."dbo.VWDETALHE".NOME'
      Size = 15
    end
    object Qry_TesteEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'DB."dbo.VWDETALHE".EMAIL'
      Size = 30
    end
    object Qry_TesteIMGPALESTRANTE: TStringField
      FieldName = 'IMGPALESTRANTE'
      Origin = 'DB."dbo.VWDETALHE".IMGPALESTRANTE'
      Size = 100
    end
    object Qry_TesteMINICURRICULO: TStringField
      FieldName = 'MINICURRICULO'
      Origin = 'DB."dbo.VWDETALHE".MINICURRICULO'
      Size = 100
    end
    object Qry_TesteTELPALESTRANTE: TIntegerField
      FieldName = 'TELPALESTRANTE'
      Origin = 'DB."dbo.VWDETALHE".TELPALESTRANTE'
    end
  end
  object ds_Teste: TDataSource
    DataSet = Qry_Teste
    Left = 520
    Top = 144
  end
  object cds_teste: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 144
    object cds_testeEventoId: TIntegerField
      FieldName = 'EventoId'
    end
    object cds_testeEnderecoEvento: TStringField
      FieldName = 'EnderecoEvento'
      Size = 200
    end
    object cds_testeDataEvento: TDateTimeField
      FieldName = 'DataEvento'
    end
    object cds_testeTemaEvento: TStringField
      FieldName = 'TemaEvento'
      Size = 15
    end
    object cds_testeQtdPessoasEvento: TIntegerField
      FieldName = 'QtdPessoasEvento'
    end
    object cds_testePalestranteId: TIntegerField
      FieldName = 'PalestranteId'
    end
    object cds_testeNomePalestrante: TStringField
      FieldName = 'NomePalestrante'
      Size = 15
    end
    object cds_testeEmailPalestrante: TStringField
      FieldName = 'EmailPalestrante'
      Size = 30
    end
  end
  object ds_cdsteste: TDataSource
    DataSet = cds_teste
    Left = 376
    Top = 144
  end
end
