inherited frPesquisaSofas: TfrPesquisaSofas
  Caption = 'Pesquisa Sof'#225's'
  OnCreate = FormCreate
  TextHeight = 13
  inherited pnPrincipal: TPanel
    inherited pnBarraSuperior: TPanel
      inherited pnNomeDaTela: TPanel
        inherited lbNomeDaTela: TLabel
          Caption = 'Pesquisa sof'#225's'
          Font.Name = 'Tahoma'
          ExplicitLeft = 55
          ExplicitTop = -6
          ExplicitWidth = 150
          ExplicitHeight = 41
        end
        inherited imgTela: TImage
          Picture.Data = {
            07544269746D6170A2070000424DA20700000000000036000000280000001900
            00001900000001001800000000006C070000C40E0000C40E0000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E93434343D3D3DFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E92C2C2C00000034
            3434FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEA
            EAEA2D2D2D000000282828E6E6E6FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFEAEAEA2D2D2D000000282828E6E6E6FFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAABABAB5B5B5B2828280C0C0C0B0B0B24
            24245C5C5CA9A9A9FBFBFBFFFFFFFFFFFFE9E9E92C2C2C0000002C2C2CE9E9E9
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFAFAFAF24242400000000
            0000000000000000000000000000000000000000202020B2B2B2E9E9E92C2C2C
            0000002C2C2CE9E9E9FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFDFDFD76
            76760000000000002B2B2B8E8E8ED3D3D3F3F3F3F3F3F3D3D3D38D8D8D2A2A2A
            0000000000001515150000002C2C2CE9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFF767676000000060606929292FCFCFCFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFBFBFB909090050505000000151515E9E9E9FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFAEAEAE000000060606BCBCBCFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBB0505
            05000000B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00F9F9F9232323
            000000939393FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF909090000000202020FBFBFBFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00A9A9A90000002B2B2BFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFC2A2A2A000000A9
            A9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF005A5A5A0000008F8F8FFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF8C8C8C0000005C5C5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF002626
            26000000D5D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D3D3000000242424FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF000C0C0C000000F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1
            0000000C0C0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000C0C0C000000F3F3F3FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFF2F2F20000000C0C0CFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00262626000000D5D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D3D3000000272727FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00585858000000919191FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF8E8E8E0000005B5B5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A9A9A9000000
            2C2C2CFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFCFCFC2B2B2B000000ABABABFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00F9F9F9222222000000959595FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF929292000000242424FA
            FAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFADADAD000000060606BDBD
            BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC
            BCBC060606000000AFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFF757575000000060606959595FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFCFCFC939393060606000000767676FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFDFDFD7575750000000000002C2C2C90
            9090D4D4D4F4F4F4F4F4F4D4D4D49090902C2C2C000000000000767676FDFDFD
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFADADAD222222000000000000000000000000000000000000000000000000
            232323AEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9A9A9A95959592727270B0B0B
            0B0B0B272727595959A9A9A9F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00}
          ExplicitLeft = 4
          ExplicitTop = -6
        end
      end
    end
    inherited pnPesquisa: TPanel
      Margins.Top = 50
      BevelOuter = bvNone
      Padding.Left = 20
      Padding.Top = 20
      Padding.Right = 50
      object lbPesquisa: TLabel
        Left = 20
        Top = 20
        Width = 71
        Height = 30
        Align = alLeft
        Caption = 'Pesquisa:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 18
      end
      object edPesquisa: TGD_Edit
        Left = 91
        Top = 20
        Width = 413
        Height = 30
        Align = alClient
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = edPesquisaChange
        MudarCor = 13828095
        ExplicitHeight = 29
      end
    end
    inherited pnGrid: TPanel
      inherited dbGrid: TDBGrid
        OnDblClick = dbGridDblClick
        OnKeyDown = dbGridKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'BDCODSOFA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Caption = 'C'#243'digo'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BDDESCSOFA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Caption = 'Nome'
            Width = 59
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BDVALCOSTURA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Caption = 'Valor da Costura'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BDVALCORTE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Caption = 'Valor do Corte'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BDHORAS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Caption = 'Quantidade de minutos'
            Width = 96
            Visible = True
          end>
      end
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = dmPesquisaSofas.cdsPesquisaSofas
  end
end
