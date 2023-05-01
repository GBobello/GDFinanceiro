object dmRelatorios: TdmRelatorios
  OldCreateOrder = False
  Height = 272
  Width = 370
  object queryRelatorios: TFDQuery
    Connection = dmConexao.Conexao
    SQL.Strings = (
      'select SERV.*, USU.*, SOFA.*,'
      '       case SERV.BDSERVICO'
      '         when '#39'0'#39' then '#39'Corte'#39
      '         when '#39'1'#39' then '#39'Costura'#39
      '         when '#39'2'#39' then '#39'Corte e Costura'#39
      '       end as BDSERVICOPALAVRA'
      'from TB_SERVICOS SERV'
      'inner join TB_USUARIOS USU on (SERV.BDCODUSU = USU.BDCODUSU)'
      'inner join TB_SOFAS SOFA on (SERV.BDCODSOFA = SOFA.BDCODSOFA)'
      'where (SERV.BDDATASERV >= '#39'01.04.2023'#39' and'
      '      SERV.BDDATASERV <= '#39'30.04.2023'#39') and'
      '      (SERV.BDSERVICO = 2);')
    Left = 40
    Top = 48
  end
  object frxRelatorio: TfrxReport
    Version = '6.9.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45045.685673159700000000
    ReportOptions.LastChange = 45047.093800671300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure masterDataOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if Frac(<Line> / 2) = 0.5 then'
      '  begin'
      '    frxDsRelatorioBDDATASERV.Color := $00EBEBEB;'
      '    frxDsRelatorioBDDESCSOFA.Color := $00EBEBEB;'
      '    frxDsRelatorioBDNOMUSU.Color := $00EBEBEB;'
      '    frxDsRelatorioBDSERVICO.Color := $00EBEBEB;'
      '    frxDsRelatorioBDTOTALSERV.Color := $00EBEBEB;'
      '    frxDsRelatorioBDDATASERV.Color := $00EBEBEB;'
      '  end'
      '  else'
      '  begin'
      '    frxDsRelatorioBDDATASERV.Color := clWhite;'
      '    frxDsRelatorioBDDESCSOFA.Color := clWhite;'
      '    frxDsRelatorioBDNOMUSU.Color := clWhite;'
      '    frxDsRelatorioBDSERVICO.Color := clWhite;'
      '    frxDsRelatorioBDTOTALSERV.Color := clWhite;'
      '    frxDsRelatorioBDDATASERV.Color := clWhite;'
      '  end;'
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 40
    Top = 136
    Datasets = <
      item
        DataSet = frxDsRelatorio
        DataSetName = 'frxDsRelatorio'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object masterData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 294.803340000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'masterDataOnBeforePrint'
        DataSet = frxDsRelatorio
        DataSetName = 'frxDsRelatorio'
        RowCount = 0
        object frxDsRelatorioBDDATASERV: TfrxMemoView
          IndexTag = 1
          Align = baLeft
          AllowVectorExport = True
          Left = 189.971113160000000000
          Width = 80.358854150000000000
          Height = 41.574830000000000000
          DataField = 'DataServico'
          DataSet = frxDsRelatorio
          DataSetName = 'frxDsRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDsRelatorio."DataServico"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsRelatorioBDNOMUSU: TfrxMemoView
          IndexTag = 1
          Align = baWidth
          AllowVectorExport = True
          Left = 270.329967310000000000
          Width = 218.184006550000000000
          Height = 41.574830000000000000
          DataField = 'NomeResponsavel'
          DataSet = frxDsRelatorio
          DataSetName = 'frxDsRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDsRelatorio."NomeResponsavel"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsRelatorioBDDESCSOFA: TfrxMemoView
          IndexTag = 1
          Align = baLeft
          AllowVectorExport = True
          Width = 189.971113160000000000
          Height = 41.574830000000000000
          DataField = 'DescSofa'
          DataSet = frxDsRelatorio
          DataSetName = 'frxDsRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDsRelatorio."DescSofa"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsRelatorioBDTOTALSERV: TfrxMemoView
          IndexTag = 1
          Align = baRight
          AllowVectorExport = True
          Left = 603.312336930000000000
          Width = 114.798363070000000000
          Height = 41.574830000000000000
          DataField = 'ValServico'
          DataSet = frxDsRelatorio
          DataSetName = 'frxDsRelatorio'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDsRelatorio."ValServico"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsRelatorioBDSERVICO: TfrxMemoView
          IndexTag = 1
          Align = baRight
          AllowVectorExport = True
          Left = 488.513973860000000000
          Width = 114.798363070000000000
          Height = 41.574830000000000000
          DataField = 'DescServico'
          DataSet = frxDsRelatorio
          DataSetName = 'frxDsRelatorio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDsRelatorio."DescServico"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object relTitle: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 151.181200000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object mmNomeAplicacao: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'GD Financeiro')
        end
        object mmTitle: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 52.913420000000000000
          Width = 718.110700000000000000
          Height = 60.472480000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -40
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio')
          ParentFont = False
        end
      end
      object headerNomes: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 41.574803150000000000
        Top = 230.551330000000000000
        Width = 718.110700000000000000
        object mmNomeSofa: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 190.110236220000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 7165253
          HAlign = haCenter
          Memo.UTF8W = (
            'Descri'#231#227'o sof'#225)
          ParentFont = False
          VAlign = vaCenter
        end
        object mmData: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 190.110236220000000000
          Width = 80.499812010000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 7165253
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
          VAlign = vaCenter
        end
        object mmValor: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 603.218949530000000000
          Width = 114.891750470000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 7165253
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
          VAlign = vaCenter
        end
        object mmServico: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 488.327199060000000000
          Width = 114.891750470000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 7165253
          HAlign = haCenter
          Memo.UTF8W = (
            'Servi'#231'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object mmResponsavel: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Left = 270.610048230000000000
          Width = 217.717150830000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 7165253
          HAlign = haCenter
          Memo.UTF8W = (
            'Respons'#225'vel')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object childTotal: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 359.055350000000000000
        Width = 718.110700000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo1: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 488.315424404724000000
          Width = 114.897637800000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Total: ')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsRelatorioTotalServicos: TfrxMemoView
          IndexTag = 1
          Align = baRight
          AllowVectorExport = True
          Left = 603.213062204724000000
          Width = 114.897637795276000000
          Height = 22.677180000000000000
          DataField = 'TotalServicos'
          DataSet = frxDsRelatorio
          DataSetName = 'frxDsRelatorio'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDsRelatorio."TotalServicos"]')
        end
      end
    end
  end
  object frxDsRelatorio: TfrxDBDataset
    UserName = 'frxDsRelatorio'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DescSofa=DescSofa'
      'DataServico=DataServico'
      'NomeResponsavel=NomeResponsavel'
      'QuantidadeServico=QuantidadeServico'
      'DescServico=DescServico'
      'ValServico=ValServico'
      'TotalServicos=TotalServicos'
      'DataAtual=DataAtual'
      'NomeUsuario=NomeUsuario')
    DataSet = cdsRelatorio
    BCDToCurrency = False
    Left = 136
    Top = 136
  end
  object cdsRelatorio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelatorio'
    Left = 216
    Top = 56
    object cdsRelatorioDescSofa: TStringField
      FieldName = 'DescSofa'
      Size = 255
    end
    object cdsRelatorioDataServico: TDateField
      FieldName = 'DataServico'
    end
    object cdsRelatorioNomeResponsavel: TStringField
      FieldName = 'NomeResponsavel'
      Size = 255
    end
    object cdsRelatorioQuantidadeServico: TIntegerField
      FieldName = 'QuantidadeServico'
    end
    object cdsRelatorioDescServico: TStringField
      FieldName = 'DescServico'
      Size = 255
    end
    object cdsRelatorioValServico: TCurrencyField
      FieldName = 'ValServico'
    end
    object cdsRelatorioTotalServicos: TCurrencyField
      FieldName = 'TotalServicos'
    end
    object cdsRelatorioDataAtual: TDateField
      FieldName = 'DataAtual'
    end
    object cdsRelatorioNomeUsuario: TIntegerField
      FieldName = 'NomeUsuario'
    end
  end
  object dspRelatorio: TDataSetProvider
    DataSet = queryRelatorios
    Left = 144
    Top = 48
  end
end
