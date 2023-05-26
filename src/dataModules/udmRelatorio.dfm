object dmRelatorios: TdmRelatorios
  Height = 272
  Width = 370
  object queryRelatorios: TFDQuery
    Active = True
    Connection = dmConexao.Conexao
    SQL.Strings = (
      'SELECT * FROM TB_SERVICOS')
    Left = 40
    Top = 48
  end
  object frxRelatorio: TfrxReport
    Version = '6.9.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    OldStyleProgress = True
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45045.685673159700000000
    ReportOptions.LastChange = 45048.891764768520000000
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
      
        '    frxDsRelatorioBDQUANTIDADE.Color := $00EBEBEB;              ' +
        '                                 '
      '  end'
      '  else'
      '  begin'
      '    frxDsRelatorioBDDATASERV.Color := clWhite;'
      '    frxDsRelatorioBDDESCSOFA.Color := clWhite;'
      '    frxDsRelatorioBDNOMUSU.Color := clWhite;'
      '    frxDsRelatorioBDSERVICO.Color := clWhite;'
      '    frxDsRelatorioBDTOTALSERV.Color := clWhite;'
      '    frxDsRelatorioBDDATASERV.Color := clWhite;'
      '    frxDsRelatorioBDQUANTIDADE.Color := clWhite;        '
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
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
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
          DataField = 'BDDATASERV'
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
            '[frxDsRelatorio."BDDATASERV"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsRelatorioBDNOMUSU: TfrxMemoView
          IndexTag = 1
          Align = baWidth
          AllowVectorExport = True
          Left = 270.329967310000000000
          Width = 159.880007418110100000
          Height = 41.574830000000000000
          DataField = 'BDNOMUSU'
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
            '[frxDsRelatorio."BDNOMUSU"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsRelatorioBDDESCSOFA: TfrxMemoView
          IndexTag = 1
          Align = baLeft
          AllowVectorExport = True
          Width = 189.971113160000000000
          Height = 41.574830000000000000
          DataField = 'BDDESCSOFA'
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
            '[frxDsRelatorio."BDDESCSOFA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsRelatorioBDTOTALSERV: TfrxMemoView
          IndexTag = 1
          Align = baRight
          AllowVectorExport = True
          Left = 629.669755118110200000
          Width = 88.440944881889800000
          Height = 41.574830000000000000
          DataField = 'BDTOTALSERV'
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
            '[frxDsRelatorio."BDTOTALSERV"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsRelatorioBDSERVICO: TfrxMemoView
          IndexTag = 1
          Align = baRight
          AllowVectorExport = True
          Left = 430.209974728110100000
          Width = 114.798363070000000000
          Height = 41.574830000000000000
          DataField = 'BDSERVICOPALAVRA'
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
            '[frxDsRelatorio."BDSERVICOPALAVRA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDsRelatorioBDQUANTIDADE: TfrxMemoView
          IndexTag = 1
          Align = baRight
          AllowVectorExport = True
          Left = 545.008337798110100000
          Width = 84.661417320000000000
          Height = 41.574830000000000000
          DataField = 'BDQUANTIDADE'
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
            '[frxDsRelatorio."BDQUANTIDADE"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object relTitle: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
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
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
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
          Left = 629.675659530000000000
          Width = 88.435040470000000000
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
          Left = 430.128398590000000000
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
          Width = 159.518350360000000000
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
        object mmQuantidade: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 545.020149060000000000
          Width = 84.655510470000000000
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
            'Quantidade')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 359.055350000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 603.213062200000000000
          Top = 18.897650000000000000
          Width = 114.897637800000000000
          Height = 22.677180000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[SUM(<frxDsRelatorio."BDTOTALSERV">,masterData)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 488.315424400000000000
          Top = 18.897650000000000000
          Width = 114.897637800000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total: ')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDsRelatorio: TfrxDBDataset
    UserName = 'frxDsRelatorio'
    CloseDataSource = False
    FieldAliases.Strings = (
      'BDCODSERV=BDCODSERV'
      'BDDATASERV=BDDATASERV'
      '-BDCODUSU=BDCODUSU'
      'BDQUANTIDADE=BDQUANTIDADE'
      'BDCODSOFA=BDCODSOFA'
      'BDSERVICO=BDSERVICO'
      'BDTOTALSERV=BDTOTALSERV'
      '-BDCODUSU_1=BDCODUSU_1'
      'BDNOMUSU=BDNOMUSU'
      '-BDLOGINUSU=BDLOGINUSU'
      '-BDSENHAUSU=BDSENHAUSU'
      '-BDISADM=BDISADM'
      '-BDCODSOFA_1=BDCODSOFA_1'
      'BDDESCSOFA=BDDESCSOFA'
      '-BDVALCOSTURA=BDVALCOSTURA'
      '-BDVALCORTE=BDVALCORTE'
      '-BDHORAS=BDHORAS'
      'BDSERVICOPALAVRA=BDSERVICOPALAVRA')
    DataSet = queryRelatorios
    BCDToCurrency = False
    Left = 136
    Top = 136
  end
  object cdsRelatorio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelatorio'
    Left = 200
    Top = 48
    object cdsRelatorioBDCODSERV: TIntegerField
      FieldName = 'BDCODSERV'
      Required = True
    end
    object cdsRelatorioBDDATASERV: TDateField
      FieldName = 'BDDATASERV'
      Required = True
    end
    object cdsRelatorioBDCODUSU: TIntegerField
      FieldName = 'BDCODUSU'
      Required = True
    end
    object cdsRelatorioBDQUANTIDADE: TIntegerField
      FieldName = 'BDQUANTIDADE'
      Required = True
    end
    object cdsRelatorioBDCODSOFA: TIntegerField
      FieldName = 'BDCODSOFA'
      Required = True
    end
    object cdsRelatorioBDSERVICO: TIntegerField
      FieldName = 'BDSERVICO'
      Required = True
    end
    object cdsRelatorioBDTOTALSERV: TFMTBCDField
      FieldName = 'BDTOTALSERV'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object dspRelatorio: TDataSetProvider
    DataSet = queryRelatorios
    Left = 120
    Top = 48
  end
  object frxPDFExport: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 56
    Top = 184
  end
end
