object dmNovoSofa: TdmNovoSofa
  Height = 145
  Width = 640
  object queryNovoSofa: TFDQuery
    Connection = dmConexao.Conexao
    SQL.Strings = (
      'select * from TB_SOFAS')
    Left = 80
    Top = 56
  end
  object dspNovoSofa: TDataSetProvider
    DataSet = queryNovoSofa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 280
    Top = 56
  end
  object cdsNovoSofa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNovoSofa'
    Left = 440
    Top = 56
    object cdsNovoSofaBDCODSOFA: TIntegerField
      FieldName = 'BDCODSOFA'
      Required = True
    end
    object cdsNovoSofaBDDESCSOFA: TStringField
      FieldName = 'BDDESCSOFA'
      Required = True
      Size = 255
    end
    object cdsNovoSofaBDVALCOSTURA: TFMTBCDField
      FieldName = 'BDVALCOSTURA'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNovoSofaBDVALCORTE: TFMTBCDField
      FieldName = 'BDVALCORTE'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNovoSofaBDHORAS: TFMTBCDField
      FieldName = 'BDHORAS'
      Required = True
      Precision = 18
      Size = 2
    end
  end
end
