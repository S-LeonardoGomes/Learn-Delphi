object F_sucesso: TF_sucesso
  Left = 0
  Top = 0
  Caption = 'F_sucesso'
  ClientHeight = 201
  ClientWidth = 447
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
  object lblUsuario: TLabel
    Left = 56
    Top = 40
    Width = 60
    Height = 19
    Caption = 'Usu'#225'rio:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblSenha: TLabel
    Left = 56
    Top = 88
    Width = 49
    Height = 19
    Caption = 'Senha:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblUsuarioResultado: TLabel
    Left = 122
    Top = 40
    Width = 150
    Height = 19
    Caption = 'Clique para visualizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblSenhaResultado: TLabel
    Left = 111
    Top = 88
    Width = 150
    Height = 19
    Caption = 'Clique para visualizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Qry_Resultado: TQuery
    DatabaseName = 'Db'
    Left = 304
    Top = 152
  end
end
