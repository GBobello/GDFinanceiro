object dmUsuarios: TdmUsuarios
  OldCreateOrder = False
  Height = 189
  Width = 312
  object queryUsuarios: TFDQuery
    Connection = dmConexao.Conexao
    Left = 40
    Top = 72
  end
  object dspUsuarios: TDataSetProvider
    DataSet = queryUsuarios
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 136
    Top = 72
  end
  object cdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuarios'
    Left = 232
    Top = 72
    object cdsUsuariosBDCODUSU: TIntegerField
      FieldName = 'BDCODUSU'
      Required = True
    end
    object cdsUsuariosBDNOMUSU: TStringField
      FieldName = 'BDNOMUSU'
      Required = True
      Size = 255
    end
    object cdsUsuariosBDLOGINUSU: TStringField
      FieldName = 'BDLOGINUSU'
      Size = 100
    end
    object cdsUsuariosBDSENHAUSU: TStringField
      FieldName = 'BDSENHAUSU'
      Size = 100
    end
    object cdsUsuariosBDISADM: TBooleanField
      FieldName = 'BDISADM'
      Required = True
      OnGetText = cdsUsuariosBDISADMGetText
    end
  end
end
