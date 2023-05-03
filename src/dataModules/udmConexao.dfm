object dmConexao: TdmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 265
  Width = 383
  object Conexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\bobel\OneDrive - Storage\'#193'rea de Trabalho\dev\' +
        'GDFinanceiro\db\BANCO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 48
    Top = 32
  end
  object conectionWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 48
    Top = 88
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 48
    Top = 136
  end
end
