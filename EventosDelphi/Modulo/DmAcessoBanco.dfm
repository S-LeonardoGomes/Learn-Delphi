object dmBanco: TdmBanco
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 303
  Width = 606
  object dbConexao: TDatabase
    AliasName = 'lbanco'
    DatabaseName = 'Db'
    KeepConnection = False
    LoginPrompt = False
    SessionName = 'Default'
    Left = 24
    Top = 8
  end
end
