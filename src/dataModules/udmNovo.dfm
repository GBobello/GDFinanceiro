object dmNovo: TdmNovo
  Height = 299
  Width = 415
  object queryNovo: TFDQuery
    Connection = dmConexao.Conexao
    Left = 32
    Top = 56
  end
  object dspNovo: TDataSetProvider
    DataSet = queryNovo
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 120
    Top = 56
  end
  object cdsNovo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNovo'
    Left = 192
    Top = 56
    object cdsNovoBDCODSERV: TIntegerField
      FieldName = 'BDCODSERV'
      Required = True
    end
    object cdsNovoBDDATASERV: TDateField
      FieldName = 'BDDATASERV'
      Required = True
    end
    object cdsNovoBDCODUSU: TIntegerField
      FieldName = 'BDCODUSU'
      Required = True
    end
    object cdsNovoBDQUANTIDADE: TIntegerField
      FieldName = 'BDQUANTIDADE'
      Required = True
    end
    object cdsNovoBDCODSOFA: TIntegerField
      FieldName = 'BDCODSOFA'
      Required = True
    end
    object cdsNovoBDSERVICO: TIntegerField
      FieldName = 'BDSERVICO'
      Required = True
    end
    object cdsNovoBDTOTALSERV: TFMTBCDField
      FieldName = 'BDTOTALSERV'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsNovoBDNOMUSU: TStringField
      FieldName = 'BDNOMUSU'
      ReadOnly = True
      Size = 255
    end
    object cdsNovoBDDESCSOFA: TStringField
      FieldName = 'BDDESCSOFA'
      ReadOnly = True
      Size = 255
    end
    object cdsNovoBDSERVICOPALAVRA: TStringField
      FieldName = 'BDSERVICOPALAVRA'
      ReadOnly = True
      FixedChar = True
      Size = 15
    end
  end
  object queryConsulta: TFDQuery
    Connection = dmConexao.Conexao
    Left = 304
    Top = 56
  end
end
