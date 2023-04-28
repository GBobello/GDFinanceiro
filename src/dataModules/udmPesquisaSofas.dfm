object dmPesquisaSofas: TdmPesquisaSofas
  OldCreateOrder = False
  Height = 141
  Width = 334
  object queryPesquisaSofas: TFDQuery
    Connection = dmConexao.Conexao
    Left = 40
    Top = 48
  end
  object dspPesquisaSofas: TDataSetProvider
    DataSet = queryPesquisaSofas
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 160
    Top = 48
  end
  object cdsPesquisaSofas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesquisaSofas'
    Left = 256
    Top = 48
    object cdsPesquisaSofasBDCODSOFA: TIntegerField
      FieldName = 'BDCODSOFA'
      Required = True
    end
    object cdsPesquisaSofasBDDESCSOFA: TStringField
      FieldName = 'BDDESCSOFA'
      Required = True
      Size = 255
    end
    object cdsPesquisaSofasBDVALCOSTURA: TFMTBCDField
      FieldName = 'BDVALCOSTURA'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsPesquisaSofasBDVALCORTE: TFMTBCDField
      FieldName = 'BDVALCORTE'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsPesquisaSofasBDHORAS: TFMTBCDField
      FieldName = 'BDHORAS'
      Required = True
      Precision = 18
      Size = 2
    end
  end
end
