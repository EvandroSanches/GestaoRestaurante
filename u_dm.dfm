object DM: TDM
  OldCreateOrder = False
  Height = 352
  Width = 467
  object FDConnection1: TFDConnection
    ConnectionName = 'MINHA_CONEXAO'
    Params.Strings = (
      'Server=LAPTOP-0QN01FTU'
      'Database=restaurante_LPV_2019'
      'User_Name=sa'
      'OSAuthent=Yes'
      'Password=unifai'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 40
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 48
    Top = 120
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 48
    Top = 200
  end
  object Q_Geral: TFDQuery
    Connection = FDConnection1
    Left = 152
    Top = 32
  end
  object Q_usuario: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from usuarios left join usuario_permissao on'
      '  (usuarios.cod_usuario = usuario_permissao.cod_usuario)'
      '  where usuarios.cod_usuario = 1')
    Left = 208
    Top = 160
  end
end
