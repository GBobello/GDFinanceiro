inherited frPesquisa_Padrao: TfrPesquisa_Padrao
  Caption = ''
  ClientHeight = 448
  ClientWidth = 554
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  ExplicitWidth = 554
  ExplicitHeight = 448
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnPrincipal: TPanel
    Width = 554
    Height = 448
    ExplicitWidth = 554
    ExplicitHeight = 448
    inherited pnBarraSuperior: TPanel
      Width = 554
      ExplicitWidth = 554
      DesignSize = (
        554
        41)
      inherited spFecha: TSpeedButton
        Left = 527
        ExplicitLeft = 527
      end
      inherited spMinimiza: TSpeedButton
        Left = 498
        ExplicitLeft = 498
      end
    end
    object pnPesquisa: TPanel
      Left = 0
      Top = 41
      Width = 554
      Height = 50
      Align = alTop
      Caption = 'pesquisa'
      TabOrder = 1
      ExplicitTop = 35
    end
    object pnGrid: TPanel
      Left = 0
      Top = 91
      Width = 554
      Height = 357
      Align = alClient
      BevelOuter = bvNone
      Padding.Left = 25
      Padding.Top = 20
      Padding.Right = 25
      Padding.Bottom = 25
      TabOrder = 2
      object dbGrid: TDBGrid
        Left = 25
        Top = 20
        Width = 504
        Height = 312
        Align = alClient
        BorderStyle = bsNone
        Color = clWhite
        Ctl3D = False
        DataSource = dsPesquisa
        DrawingStyle = gdsClassic
        FixedColor = 7165253
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7165253
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = dbGridDrawColumnCell
      end
    end
  end
  inherited imgList: TImageList
    Left = 640
    Top = 80
  end
  object dsPesquisa: TDataSource
    Left = 272
    Top = 235
  end
end
