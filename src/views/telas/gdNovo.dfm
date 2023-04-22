inherited frNovo: TfrNovo
  Caption = 'Novo'
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnPrincipal: TPanel
    object cdPanel: TCardPanel [0]
      Left = 0
      Top = 41
      Width = 1164
      Height = 688
      Align = alClient
      ActiveCard = cardCadastro
      BevelOuter = bvNone
      TabOrder = 0
      object cardConsulta: TCard
        Left = 0
        Top = 0
        Width = 1164
        Height = 688
        Caption = 'cardConsulta'
        CardIndex = 0
        TabOrder = 0
        object pnBotoesConsulta: TPanel
          Left = 0
          Top = 616
          Width = 1164
          Height = 72
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object pnLeftBotoes: TPanel
            Left = 624
            Top = 0
            Width = 540
            Height = 72
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object pnExcluir: TPanel
              Left = 40
              Top = 21
              Width = 145
              Height = 30
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object spExcluir: TSpeedButton
                Left = 1
                Top = 1
                Width = 143
                Height = 28
                Align = alClient
                DisabledImageIndex = 8
                Caption = 'Excluir'
                ImageIndex = 6
                Images = imageList
                HotImageIndex = 7
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'JejuGothic'
                Font.Style = []
                ParentFont = False
                ExplicitLeft = -4
                ExplicitTop = -4
                ExplicitWidth = 141
                ExplicitHeight = 26
              end
              object pnCimaExcluir: TPanel
                Left = 0
                Top = 0
                Width = 145
                Height = 1
                Align = alTop
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 0
              end
              object pnBaixoExcluir: TPanel
                Left = 0
                Top = 29
                Width = 145
                Height = 1
                Align = alBottom
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 1
              end
              object pnDireitaExcluir: TPanel
                Left = 144
                Top = 1
                Width = 1
                Height = 28
                Align = alRight
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 2
              end
              object pnEsquerdaExcluir: TPanel
                Left = 0
                Top = 1
                Width = 1
                Height = 28
                Align = alLeft
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 3
              end
            end
            object pnEditar: TPanel
              Left = 199
              Top = 21
              Width = 145
              Height = 30
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 1
              object spEditar: TSpeedButton
                Left = 1
                Top = 1
                Width = 143
                Height = 28
                Align = alClient
                DisabledImageIndex = 5
                Caption = 'Editar'
                ImageIndex = 3
                Images = imageList
                HotImageIndex = 4
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'JejuGothic'
                Font.Style = []
                ParentFont = False
                OnClick = spEditarClick
                ExplicitLeft = -5
                ExplicitTop = -5
              end
              object pnCimaEditar: TPanel
                Left = 0
                Top = 0
                Width = 145
                Height = 1
                Align = alTop
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 0
              end
              object pnBaixoEditar: TPanel
                Left = 0
                Top = 29
                Width = 145
                Height = 1
                Align = alBottom
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 1
              end
              object pnDireitaEditar: TPanel
                Left = 144
                Top = 1
                Width = 1
                Height = 28
                Align = alRight
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 2
              end
              object pnEsquerdaEditar: TPanel
                Left = 0
                Top = 1
                Width = 1
                Height = 28
                Align = alLeft
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 3
              end
            end
            object pnNovoItem: TPanel
              Left = 359
              Top = 21
              Width = 161
              Height = 30
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 2
              object spNovoItem: TSpeedButton
                Left = 1
                Top = 1
                Width = 159
                Height = 28
                Align = alClient
                DisabledImageIndex = 17
                Caption = 'Novo Item'
                ImageIndex = 15
                Images = imageList
                HotImageIndex = 16
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'JejuGothic'
                Font.Style = []
                ParentFont = False
                OnClick = spNovoItemClick
                ExplicitLeft = 64
                ExplicitTop = 8
                ExplicitWidth = 23
                ExplicitHeight = 22
              end
              object pnCimaNovoItem: TPanel
                Left = 0
                Top = 0
                Width = 161
                Height = 1
                Align = alTop
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 0
              end
              object pnBaixoNovoItem: TPanel
                Left = 0
                Top = 29
                Width = 161
                Height = 1
                Align = alBottom
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 1
              end
              object pnDireitaNovoItem: TPanel
                Left = 160
                Top = 1
                Width = 1
                Height = 28
                Align = alRight
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 2
              end
              object pnEsquerdaNovoItem: TPanel
                Left = 0
                Top = 1
                Width = 1
                Height = 28
                Align = alLeft
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 3
              end
            end
          end
        end
        object pnCentralPesquisa: TPanel
          Left = 0
          Top = 105
          Width = 1164
          Height = 511
          Align = alClient
          BevelOuter = bvNone
          Padding.Left = 50
          Padding.Right = 50
          Padding.Bottom = 50
          TabOrder = 1
          object DBGrid1: TDBGrid
            Left = 50
            Top = 0
            Width = 1064
            Height = 461
            Align = alClient
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
        object pnPesquisa: TPanel
          Left = 0
          Top = 0
          Width = 1164
          Height = 105
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Pesquisa'
          TabOrder = 2
        end
      end
      object cardCadastro: TCard
        Left = 0
        Top = 0
        Width = 1164
        Height = 688
        Caption = 'cardCadastro'
        CardIndex = 1
        TabOrder = 1
        object pnBotoesCadastro: TPanel
          Left = 0
          Top = 616
          Width = 1164
          Height = 72
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object pnLeftBotoesCadastro: TPanel
            Left = 624
            Top = 0
            Width = 540
            Height = 72
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object pnCancelar: TPanel
              Left = 40
              Top = 21
              Width = 145
              Height = 30
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object spCancelar: TSpeedButton
                Left = 1
                Top = 1
                Width = 143
                Height = 28
                Align = alClient
                DisabledImageIndex = 2
                Caption = 'Cancelar'
                ImageIndex = 0
                Images = imageList
                HotImageIndex = 1
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'JejuGothic'
                Font.Style = []
                ParentFont = False
                OnClick = spCancelarClick
                ExplicitLeft = -4
                ExplicitTop = -4
                ExplicitWidth = 141
                ExplicitHeight = 26
              end
              object pnCimaCancelar: TPanel
                Left = 0
                Top = 0
                Width = 145
                Height = 1
                Align = alTop
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 0
              end
              object pnBaixoCancelar: TPanel
                Left = 0
                Top = 29
                Width = 145
                Height = 1
                Align = alBottom
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 1
              end
              object pnDireitaCancelar: TPanel
                Left = 144
                Top = 1
                Width = 1
                Height = 28
                Align = alRight
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 2
              end
              object pnEsquerdaCancelar: TPanel
                Left = 0
                Top = 1
                Width = 1
                Height = 28
                Align = alLeft
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 3
              end
            end
            object pnConsultar: TPanel
              Left = 208
              Top = 21
              Width = 145
              Height = 30
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 1
              object spConsultar: TSpeedButton
                Left = 1
                Top = 1
                Width = 143
                Height = 28
                Align = alClient
                DisabledImageIndex = 14
                Caption = 'Consultar (F9)'
                ImageIndex = 12
                Images = imageList
                HotImageIndex = 13
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'JejuGothic'
                Font.Style = []
                ParentFont = False
                OnClick = spConsultarClick
                ExplicitLeft = 72
                ExplicitTop = 8
                ExplicitWidth = 23
                ExplicitHeight = 22
              end
              object pnCimaConsultar: TPanel
                Left = 0
                Top = 0
                Width = 145
                Height = 1
                Align = alTop
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 0
              end
              object pnBaixoConsultar: TPanel
                Left = 0
                Top = 29
                Width = 145
                Height = 1
                Align = alBottom
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 1
              end
              object pnDireitaConsultar: TPanel
                Left = 144
                Top = 1
                Width = 1
                Height = 28
                Align = alRight
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 2
              end
              object pnEsquerdaConsultar: TPanel
                Left = 0
                Top = 1
                Width = 1
                Height = 28
                Align = alLeft
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 3
              end
            end
            object pnSalvar: TPanel
              Left = 375
              Top = 21
              Width = 145
              Height = 30
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 2
              object spSalvar: TSpeedButton
                Left = 1
                Top = 1
                Width = 143
                Height = 28
                Align = alClient
                DisabledImageIndex = 11
                Caption = 'Salvar'
                ImageIndex = 9
                Images = imageList
                HotImageIndex = 10
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -15
                Font.Name = 'JejuGothic'
                Font.Style = []
                ParentFont = False
                ExplicitLeft = -5
                ExplicitTop = -5
              end
              object pnCimaSalvar: TPanel
                Left = 0
                Top = 0
                Width = 145
                Height = 1
                Align = alTop
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 0
              end
              object pnBaixoSalvar: TPanel
                Left = 0
                Top = 29
                Width = 145
                Height = 1
                Align = alBottom
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 1
              end
              object pnDireitaSalvar: TPanel
                Left = 144
                Top = 1
                Width = 1
                Height = 28
                Align = alRight
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 2
              end
              object pnEsquerdaSalvar: TPanel
                Left = 0
                Top = 1
                Width = 1
                Height = 28
                Align = alLeft
                BevelOuter = bvNone
                Color = clBlack
                ParentBackground = False
                TabOrder = 3
              end
            end
          end
        end
        object pnEditsCadastro: TPanel
          Left = 0
          Top = 0
          Width = 1164
          Height = 616
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitTop = -6
          object pnCentralCadastro: TPanel
            Left = 278
            Top = 209
            Width = 609
            Height = 200
            BevelOuter = bvNone
            TabOrder = 0
            object lbCodigo: TLabel
              Left = 32
              Top = 6
              Width = 48
              Height = 18
              Caption = 'C'#243'digo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbDataDoItem: TLabel
              Left = 164
              Top = 6
              Width = 90
              Height = 18
              Caption = 'Data do item:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbResponsavel: TLabel
              Left = 272
              Top = 7
              Width = 86
              Height = 18
              Caption = 'Respons'#225'vel:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbQuantidade: TLabel
              Left = 32
              Top = 70
              Width = 79
              Height = 18
              Caption = 'Quantidade:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbModelo: TLabel
              Left = 164
              Top = 70
              Width = 51
              Height = 18
              Caption = 'Modelo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbTotal: TLabel
              Left = 489
              Top = 163
              Width = 94
              Height = 18
              Caption = 'Total: R$ 0,00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object lbServico: TLabel
              Left = 32
              Top = 135
              Width = 51
              Height = 18
              Caption = 'Servi'#231'o:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edCodigo: TGD_Edit
              Left = 32
              Top = 30
              Width = 121
              Height = 27
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              MudarCor = 13828095
            end
            object mskDataDoItem: TGD_MaskEdit_Data
              Left = 164
              Top = 30
              Width = 98
              Height = 27
              Alignment = taCenter
              EditMask = '99/99/9999;1; '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 10
              ParentFont = False
              TabOrder = 1
              Text = '  /  /    '
              MudarCor = 13828095
            end
            object spedQuantidade: TGD_SpinEdit
              Left = 32
              Top = 94
              Width = 121
              Height = 29
              Ctl3D = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxValue = 0
              MinValue = 0
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 3
              Value = 0
              MudarCor = 13828095
            end
            object dbcbModelo: TGD_DBLookupComboBox
              Left = 159
              Top = 94
              Width = 419
              Height = 27
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'BDCODSOFA'
              ListField = 'BDDESCSOFA'
              ListSource = dsModelo
              ParentFont = False
              TabOrder = 4
              MudarCor = 13828095
            end
            object dbcbResponsavel: TGD_DBLookupComboBox
              Left = 268
              Top = 31
              Width = 311
              Height = 27
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'BDCODUSU'
              ListField = 'BDNOMUSU'
              ListSource = dsResponsavel
              ParentFont = False
              TabOrder = 2
              MudarCor = 13828095
            end
            object cbServico: TGD_ComboBox
              Left = 32
              Top = 160
              Width = 436
              Height = 26
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              Text = 'Corte'
              OnChange = cbServicoChange
              OnEnter = cbServicoEnter
              Items.Strings = (
                'Corte'
                'Costura'
                'Corte + Costura')
              MudarCor = 13828095
            end
          end
        end
      end
    end
    inherited pnBarraSuperior: TPanel
      TabOrder = 1
      inherited pnNomeDaTela: TPanel
        inherited Label1: TLabel
          Caption = 'Novo'
          ExplicitLeft = 49
          ExplicitTop = -6
          ExplicitWidth = 160
          ExplicitHeight = 41
        end
        inherited Image1: TImage
          Center = True
          Picture.Data = {
            07544269746D6170FE0A0000424DFE0A00000000000036000000280000001E00
            00001E0000000100180000000000C80A0000C40E0000C40E0000000000000000
            0000FFFFFFA1A1A1252525010101000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000E0E0E5959
            59E9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000A0A0
            A00000000303032A2A2A33333333333333333333333333333333333333333333
            33333333333333333333333333333333333333333333331212120000002F2F2F
            F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000232323030303
            C2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7454545000000ACACACFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000010101272727FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F0000007E7E7EFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000002D2D2DFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFF5F5F58383830000005C5C5CEDEDEDFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF00000000002D2D2DFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFDFDFDF5D5D5D070707000000000000000000010101474747C7C7C7FFFFFFFF
            FFFFFFFFFFFFFFFF00000000002D2D2DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1B1B10C0C0C
            0000001010104E4E4E7070705C5C5C1D1D1D000000030303868686FFFFFFFFFF
            FFFFFFFF00000000002D2D2DFFFFFFFFFFFFF4F4F48282827777777777777777
            77777777777777909090FFFFFFFFFFFFFFFFFFC1C1C10505050202027F7F7FF2
            F2F2FFFFFFFFFFFFFFFFFFFDFDFD9E9E9E0D0D0D0000008F8F8FFFFFFFFFFFFF
            00000000002D2D2DFFFFFFFFFFFFBCBCBC000000000000000000000000000000
            000000010101EAEAEAFFFFFFF9F9F9202020000000A1A1A1FFFFFFFFFFFFEEEE
            EE818181DDDDDDFFFFFFFFFFFFCACACA090909060606DBDBDBFFFFFF00000000
            002D2D2DFFFFFFFFFFFFFCFCFCB2B2B2AAAAAAAAAAAAAAAAAAAAAAAAAAAAAABE
            BEBEFFFFFFFFFFFFA0A0A0000000515151FFFFFFFFFFFFFFFFFFA8A8A8000000
            7B7B7BFFFFFFFFFFFFFFFFFF868686000000686868FFFFFF00000000002D2D2D
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF535353000000BFBFBFFFFFFFFFFFFFFFFFFFA5A5A5000000787878FF
            FFFFFFFFFFFFFFFFEDEDED0404041B1B1BFFFFFF00000000002D2D2DFFFFFFFF
            FFFFE5E5E54B4B4B444444444444444444444444444444575757FBFBFBFFFFFF
            2C2C2C030303F7F7F7FBFBFB5757574444442C2C2C0000002020204444444B4B
            4BE6E6E6FFFFFF292929000000F2F2F200000000002D2D2DFFFFFFFFFFFFC8C8
            C8010101000000000000000000000000000000090909EEEEEEFFFFFF25252501
            0101FDFDFDEEEEEE090909000000000000000000000000000000010101C9C9C9
            FFFFFF2E2E2E000000EAEAEA00000000002D2D2DFFFFFFFFFFFFFFFFFFE8E8E8
            DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDEEEEEEFFFFFFFFFFFF404040000000DCDC
            DCFFFFFFEEEEEEDDDDDD8F8F8F000000686868DDDDDDE8E8E8FFFFFFFDFDFD0A
            0A0A090909FDFDFD00000000002D2D2DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF818181000000848484FFFFFF
            FFFFFFFFFFFFA5A5A5000000787878FFFFFFFFFFFFFFFFFFABABAB0000004848
            48FFFFFF00000000002D2D2DFFFFFFFFFFFFD2D2D20B0B0B0000000000000000
            00000000000000191919F2F2F2FFFFFFE2E2E20606060D0D0DDADADAFFFFFFFF
            FFFFD1D1D1272727B0B0B0FFFFFFFFFFFFEFEFEF282828000000B1B1B1FFFFFF
            00000000002D2D2DFFFFFFFFFFFFDBDBDB2A2A2A222222222222222222222222
            222222373737F7F7F7FFFFFFFFFFFF818181000000242424CFCFCFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFE4E4E43C3C3C0000004A4A4AFEFEFEFFFFFF00000000
            002D2D2DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFCFCFC5C5C5C0000000808085E5E5EAFAFAFC5C5C5
            B4B4B47272720D0D0D000000353535EDEDEDFFFFFFFFFFFF00000000002D2D2D
            FFFFFFFFFFFFFFFFFFCBCBCBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
            BBBBBBBBBBBBBBE8E8E8FDFDFD8F8F8F0E0E0E00000000000000000000000000
            00000505056C6C6CF4F4F4FFFFFFFFFFFFFFFFFF00000000002D2D2DFFFFFFFF
            FFFFC0C0C0000000000000000000000000000000000000000000000000000000
            0000002C2C2CFFFFFFFFFFFFF2F2F2A0A0A0474747000000313131919191E4E4
            E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000002D2D2DFFFFFFFFFFFFEDED
            ED62626255555555555555555555555555555555555555555555555555555597
            9797FFFFFFFFFFFFFFFFFFFFFFFFA5A5A5000000787878FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF00000000002D2D2DFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFA5A5A5000000787878FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF00000000002D2D2DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEBEBE888888888888888888
            888888888888585858000000787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF00000000002D2D2DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1B1B1B00000000000000000000000000
            0000000000000000818181FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            00000000002D2D2DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF0F0F0F0909099999999999996C6C6C0000000000
            003D3D3DEEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
            002D2D2DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF0F0F0F0F0F0FFFFFFFBBBBBB0F0F0F000000555555F6F6F6
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000010101272727
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF0F0F0F0F0F0F9898980404040101017F7F7FFEFEFEFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000232323030303C3C3C3FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            0F0F0F010101000000070707A3A3A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00009E9E9E0000000303032A2A2A3333
            3333333333333333333333333333333333333333333333333333333303030300
            0000131313C1C1C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF9E9E9E242424000000000000000000
            0000000000000000000000000000000000000000000000000000002A2A2ADADA
            DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF0000}
        end
      end
    end
  end
  object imageList: TImageList
    Left = 1120
    Top = 129
    Bitmap = {
      494C010112001800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFF0E700FFCDAF00FFB58800FFAA7600FFAA7600FFB58800FFCEAF00FFF0
      E700000000000000000000000000000000000000000000000000000000000000
      0000EFEFEF00CCCCCC00B3B3B300A7A7A700A7A7A700B3B3B300CCCCCC00F0F0
      F000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFDFC00FFCC
      AD00FFAE7C00FFD3B800FFEEE300FFFBF800FFFAF800FFEEE300FFD3B800FFAE
      7C00FFCDAE00FFFDFC0000000000000000000000000000000000FDFDFD00CACA
      CA00ABABAB00D2D2D200EDEDED00FBFBFB00FAFAFA00EDEDED00D2D2D200ABAB
      AB00CBCBCB00FDFDFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFDFC00FFBD9500FFC3
      9D00FFFAF700000000000000000000000000000000000000000000000000FFFA
      F700FFC29D00FFBE9500FFFDFC000000000000000000FDFDFD00BBBBBB00C1C1
      C100FAFAFA00000000000000000000000000000000000000000000000000FAFA
      FA00C0C0C000BCBCBC00FDFDFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFCCAC00FFC39D00FFFE
      FE00000000000000000000000000FFF2EA00FFF2EA0000000000000000000000
      0000FFFEFE00FFC29C00FFCDAE000000000000000000CACACA00C1C1C100FEFE
      FE00000000000000000000000000F2F2F200F2F2F20000000000000000000000
      0000FEFEFE00C0C0C000CBCBCB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFF0E700FFAE7D00FFFAF7000000
      0000000000000000000000000000FFD3B700FFD3B70000000000000000000000
      000000000000FFFAF700FFAE7C00FFF0E700EFEFEF00ADADAD00FAFAFA000000
      0000000000000000000000000000D1D1D100D1D1D10000000000000000000000
      000000000000FAFAFA00ABABAB00F0F0F0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFCDAE00FFD3B800000000000000
      0000000000000000000000000000FFD2B700FFD2B70000000000000000000000
      00000000000000000000FFD3B700FFCEAF00CBCBCB00D2D2D200000000000000
      0000000000000000000000000000D1D1D100D1D1D10000000000000000000000
      00000000000000000000D1D1D100CCCCCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFB58700FFEEE400000000000000
      0000000000000000000000000000FFD2B700FFD2B70000000000000000000000
      00000000000000000000FFEEE300FFB58800B2B2B200EEEEEE00000000000000
      0000000000000000000000000000D1D1D100D1D1D10000000000000000000000
      00000000000000000000EDEDED00B3B3B3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFAB7600FFFAF80000000000FFF2
      EA00FFD0B300FFD0B200FFD0B200FFBB9000FFBB9000FFD0B200FFD0B200FFD0
      B300FFF2EA0000000000FFFAF700FFAB7600A8A8A800FAFAFA0000000000F2F2
      F200CECECE00CECECE00CECECE00B8B8B800B8B8B800CECECE00CECECE00CECE
      CE00F2F2F20000000000FAFAFA00A8A8A8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFAB7600FFFAF80000000000FFF2
      EA00FFD5BC00FFD5BC00FFD5BC00FFBE9500FFBE9500FFD5BC00FFD5BC00FFD5
      BC00FFF2EA0000000000FFFAF800FFAB7600A8A8A800FAFAFA0000000000F1F1
      F100D4D4D400D4D4D400D4D4D400BCBCBC00BCBCBC00D4D4D400D4D4D400D4D4
      D400F2F2F20000000000FAFAFA00A8A8A8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFB58700FFEFE400000000000000
      0000000000000000000000000000FFD2B700FFD2B70000000000000000000000
      00000000000000000000FFEEE300FFB58800B2B2B200EEEEEE00000000000000
      0000000000000000000000000000D1D1D100D1D1D10000000000000000000000
      00000000000000000000EDEDED00B3B3B3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFCDAE00FFD4B900000000000000
      0000000000000000000000000000FFD2B700FFD2B70000000000000000000000
      00000000000000000000FFD3B800FFCDAF00CBCBCB00D2D2D200000000000000
      0000000000000000000000000000D1D1D100D1D1D10000000000000000000000
      00000000000000000000D2D2D200CCCCCC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFF0E600FFAF7D00FFFAF8000000
      0000000000000000000000000000FFD3B700FFD3B70000000000000000000000
      000000000000FFFAF700FFAE7D00FFF0E700EFEFEF00ACACAC00FAFAFA000000
      0000000000000000000000000000D1D1D100D1D1D10000000000000000000000
      000000000000FAFAFA00ADADAD00EFEFEF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFCBAB00FFC39E00FFFF
      FE00000000000000000000000000FFF2EA00FFF2EA0000000000000000000000
      0000FFFEFE00FFC39D00FFCCAD000000000000000000C9C9C900C1C1C1000000
      0000000000000000000000000000F1F1F100F2F2F20000000000000000000000
      0000FEFEFE00C1C1C100CACACA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFDFC00FFBD9400FFC3
      9E00FFFAF800000000000000000000000000000000000000000000000000FFFA
      F700FFC39D00FFBD9500FFFDFC000000000000000000FDFDFD00BBBBBB00C1C1
      C100FAFAFA00000000000000000000000000000000000000000000000000FAFA
      FA00C1C1C100BBBBBB00FDFDFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFDFC00FFCB
      AB00FFAE7D00FFD4B900FFEEE400FFFBF900FFFBF900FFEEE300FFD4B900FFAE
      7D00FFCCAC00FFFDFC0000000000000000000000000000000000FDFDFD00C9C9
      C900ADADAD00D2D2D200EEEEEE00FBFBFB00FBFBFB00EDEDED00D2D2D200ADAD
      AD00CACACA00FDFDFD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFF0E600FFCDAE00FFB58700FFAA7500FFAA7500FFB58700FFCDAE00FFF0
      E600000000000000000000000000000000000000000000000000000000000000
      0000EFEFEF00CBCBCB00B3B3B300A7A7A700A7A7A700B3B3B300CBCBCB00EFEF
      EF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D4D4D400717171002C2C2C000C0C0C000C0C0C002C2C2C0072727200D5D5
      D500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F9F9F9006D6D
      6D001717170081818100CDCDCD00F3F3F300F2F2F200CDCDCD00818181001717
      17006F6F6F00FAFAFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F9F900434343005252
      5200F0F0F000000000000000000000000000000000000000000000000000F0F0
      F0005151510044444400FAFAFA00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000313131000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C1E7
      E70033B1B1000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E8E8
      E800B5B5B500000000000000000000000000000000006C6C6C0052525200FDFD
      FD00000000000000000000000000DADADA00DADADA0000000000000000000000
      0000FDFDFD00505050006F6F6F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C3C3C3001717
      1700BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C4E8E8001BA7
      A800BEE6E6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E9E9E900ABAB
      AB00E7E7E700000000000000000000000000D4D4D40018181800F1F1F1000000
      0000000000000000000000000000808080008080800000000000000000000000
      000000000000F0F0F00017171700D5D5D500000000000000000000000000B3B3
      B300424242000C0C0C000C0C0C0043434300C1C1C100BFBFBF0016161600C0C0
      C00000000000000000000000000000000000000000000000000000000000B4E2
      E20045B7B80010A4A40010A4A40046B7B800C2E7E800C0E7E7001AA6A700C1E7
      E70000000000000000000000000000000000000000000000000000000000E4E4
      E400BBBBBB00A7A7A700A7A7A700BBBBBB00E9E9E900E8E8E800ABABAB00E8E8
      E800000000000000000000000000000000007070700082828200000000000000
      00000000000000000000000000007F7F7F007F7F7F0000000000000000000000
      00000000000000000000808080007272720000000000000000007B7B7B001C1C
      1C00AAAAAA00F1F1F100F1F1F100ACACAC00252525000B0B0B00BFBFBF000000
      00000000000000000000000000000000000000000000000000007DCDCD0020AA
      AA00ABDFDF00F1FAFA00F1FAFA00ADDFE00028ACAD000FA2A300C0E7E7000000
      0000000000000000000000000000000000000000000000000000CFCFCF00ADAD
      AD00E0E0E000FAFAFA00FAFAFA00E1E1E100B0B0B000A7A7A700E8E8E8000000
      0000000000000000000000000000000000002A2A2A00CFCFCF00000000000000
      00000000000000000000000000007F7F7F007F7F7F0000000000000000000000
      00000000000000000000CDCDCD002C2C2C0000000000B3B3B30027272700EDED
      ED0000000000000000000000000000000000EDEDED0025252500B4B4B4000000
      00000000000000000000000000000000000000000000B4E2E2002AADAE00EDF8
      F80000000000000000000000000000000000EDF8F80028ACAD00B5E2E3000000
      00000000000000000000000000000000000000000000E4E4E400B1B1B100F9F9
      F90000000000000000000000000000000000F9F9F900B0B0B000E4E4E4000000
      0000000000000000000000000000000000000D0D0D00F2F2F20000000000DADA
      DA007878780077777700777777003B3B3B003B3B3B0077777700777777007878
      7800DADADA0000000000F1F1F1000D0D0D000000000041414100AEAEAE000000
      00000000000000000000000000000000000000000000ACACAC00474747000000
      0000000000000000000000000000000000000000000044B7B700AFE0E1000000
      00000000000000000000000000000000000000000000ADDFE0004AB9BA000000
      00000000000000000000000000000000000000000000BABABA00E2E2E2000000
      00000000000000000000000000000000000000000000E1E1E100BDBDBD000000
      0000000000000000000000000000000000000D0D0D00F2F2F20000000000D9D9
      D900888888008888880088888800444444004444440088888800888888008888
      8800DADADA0000000000F2F2F2000D0D0D00000000000C0C0C00F2F2F2000000
      00000000000000000000000000000000000000000000F0F0F000161616000000
      0000000000000000000000000000000000000000000010A4A400F2FAFA000000
      00000000000000000000000000000000000000000000F0F9F9001AA6A7000000
      00000000000000000000000000000000000000000000A7A7A700FAFAFA000000
      00000000000000000000000000000000000000000000FAFAFA00ABABAB000000
      0000000000000000000000000000000000002A2A2A00D0D0D000000000000000
      00000000000000000000000000007F7F7F007F7F7F0000000000000000000000
      00000000000000000000CECECE002C2C2C00000000000C0C0C00F2F2F2000000
      00000000000000000000000000000000000000000000F1F1F1000D0D0D000000
      0000000000000000000000000000000000000000000010A4A400F2FAFA000000
      00000000000000000000000000000000000000000000F1FAFA0011A3A4000000
      00000000000000000000000000000000000000000000A7A7A700FAFAFA000000
      00000000000000000000000000000000000000000000FAFAFA00A8A8A8000000
      0000000000000000000000000000000000006F6F6F0083838300000000000000
      00000000000000000000000000007F7F7F007F7F7F0000000000000000000000
      0000000000000000000081818100717171000000000040404000ACACAC000000
      00000000000000000000000000000000000000000000AAAAAA00424242000000
      0000000000000000000000000000000000000000000043B6B700ADDFE0000000
      00000000000000000000000000000000000000000000ABDFDF0045B7B8000000
      00000000000000000000000000000000000000000000BABABA00E1E1E1000000
      00000000000000000000000000000000000000000000E0E0E000BBBBBB000000
      000000000000000000000000000000000000D3D3D30019191900F2F2F2000000
      0000000000000000000000000000808080008080800000000000000000000000
      000000000000F0F0F00018181800D4D4D40000000000B2B2B2001D1D1D00EDED
      ED0000000000000000000000000000000000EDEDED001C1C1C00B3B3B3000000
      00000000000000000000000000000000000000000000B3E2E20021A9AA00EDF8
      F80000000000000000000000000000000000EDF8F80020AAAA00B4E2E2000000
      00000000000000000000000000000000000000000000E3E3E300ADADAD00F9F9
      F90000000000000000000000000000000000F9F9F900ADADAD00E4E4E4000000
      000000000000000000000000000000000000000000006A6A6A0054545400FEFE
      FE00000000000000000000000000D9D9D900DADADA0000000000000000000000
      0000FDFDFD00525252006D6D6D00000000000000000000000000797979001D1D
      1D00ACACAC00F2F2F200F2F2F200AEAEAE00272727007B7B7B00000000000000
      00000000000000000000000000000000000000000000000000007BCCCD0021A9
      AA00ADDFE000F2FAFA00F2FAFA00AFE0E1002AADAE007DCDCD00000000000000
      0000000000000000000000000000000000000000000000000000CFCFCF00ADAD
      AD00E1E1E100FAFAFA00FAFAFA00E2E2E200B1B1B100CFCFCF00000000000000
      00000000000000000000000000000000000000000000F9F9F900424242005454
      5400F2F2F200000000000000000000000000000000000000000000000000F1F1
      F1005252520043434300F9F9F90000000000000000000000000000000000B2B2
      B200404040000B0B0B000B0B0B0041414100B3B3B30000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B3E2
      E20043B6B7000FA2A3000FA2A30044B7B700B4E2E20000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E3E3
      E300BABABA00A7A7A700A7A7A700BABABA00E4E4E40000000000000000000000
      0000000000000000000000000000000000000000000000000000F9F9F9006A6A
      6A001818180083838300CFCFCF00F4F4F400F4F4F400CECECE00838383001818
      18006C6C6C00F9F9F90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D3D3D3006F6F6F002B2B2B000B0B0B000B0B0B002B2B2B006F6F6F00D3D3
      D300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009797970014141400111111000101
      0100111111001111110011111100111111001111110011111100111111001111
      110001010100111111001414140098989800B3D1AD005498460050964200468F
      3700509642005096420050964200509642005096420050964200509642005096
      4200468F37005096420054984600B4D2AE00D9D9D900AAAAAA00A9A9A900A3A3
      A300A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900A9A9
      A900A3A3A300A9A9A900AAAAAA00DADADA00000000000000000000000000F6F6
      F600BCBCBC00AFAFAF00AFAFAF00AFAFAF00AFAFAF00AFAFAF00AFAFAF00BDBD
      BD00F7F7F70000000000000000000000000013131300E7E7E700000000001010
      1000000000000000000000000000000000000000000000000000000000000000
      00001010100000000000E6E6E6001414140053974500EDF4EC00000000005196
      4300000000000000000000000000000000000000000000000000000000000000
      00005196430000000000EDF4EB0054984600AAAAAA00F6F6F60000000000A9A9
      A900000000000000000000000000000000000000000000000000000000000000
      0000A9A9A90000000000F6F6F600AAAAAA00000000000000000000000000CECE
      CE00BEBEBE00EDEDED00EDEDED00EDEDED00EDEDED00EDEDED00ECECEC00BDBD
      BD00D0D0D0000000000000000000000000001010100000000000000000001010
      1000000000000000000000000000000000000000000000000000000000000000
      0000101010000000000000000000101010005196430000000000000000005196
      4300000000000000000000000000000000000000000000000000000000000000
      000051964300000000000000000051964300A9A9A9000000000000000000A9A9
      A900000000000000000000000000000000000000000000000000000000000000
      0000A9A9A9000000000000000000A9A9A900000000000000000000000000C2C2
      C200D6D6D600E8E8E800E1E1E100E4E4E400E5E5E500E0E0E000E9E9E900D4D4
      D400C4C4C4000000000000000000000000001010100000000000000000001010
      1000000000000000000000000000000000000000000000000000000000000000
      0000101010000000000000000000101010005196430000000000000000005196
      4300000000000000000000000000000000000000000000000000000000000000
      000051964300000000000000000051964300A9A9A9000000000000000000A9A9
      A900000000000000000000000000000000000000000000000000000000000000
      0000A9A9A9000000000000000000A9A9A900000000000000000000000000B8B8
      B800E0E0E000CCCCCC00CCCCCC00CBCBCB00CDCDCD00CACACA00CECECE00DDDD
      DD00BABABA000000000000000000000000001010100000000000000000001010
      1000000000000000000000000000000000000000000000000000000000000000
      0000101010000000000000000000101010005196430000000000000000005196
      4300000000000000000000000000000000000000000000000000000000000000
      000051964300000000000000000051964300A9A9A9000000000000000000A9A9
      A900000000000000000000000000000000000000000000000000000000000000
      0000A9A9A9000000000000000000A9A9A900000000000000000000000000AFAF
      AF00E9E9E900C4C4C400D4D4D400CBCBCB00CDCDCD00D2D2D200C6C6C600E6E6
      E600B1B1B1000000000000000000000000001010100000000000000000000F0F
      0F00FEFEFE00000000000000000000000000000000000000000000000000FEFE
      FE000F0F0F000000000000000000101010005196430000000000000000005096
      4200FEFFFE00000000000000000000000000000000000000000000000000FEFF
      FE0050964200000000000000000051964300A9A9A9000000000000000000A8A8
      A800000000000000000000000000000000000000000000000000000000000000
      0000A8A8A8000000000000000000A9A9A900000000000000000000000000A6A6
      A600F2F2F200BCBCBC00DCDCDC00CBCBCB00CDCDCD00DADADA00BDBDBD00F0F0
      F000A8A8A8000000000000000000000000001010100000000000000000003E3E
      3E00646464008888880088888800888888008888880088888800888888006363
      63004040400000000000000000001010100051964300000000000000000071AA
      67008EBB8500A8CBA100A8CBA100A8CBA100A8CBA100A8CBA100A8CBA1008DBA
      840074AB6800000000000000000051964300A9A9A9000000000000000000B9B9
      B900C7C7C700D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400C7C7
      C700BABABA000000000000000000A9A9A9000000000000000000F9F9F900A3A3
      A300FBFBFB00B3B3B300E5E5E500CBCBCB00CDCDCD00E2E2E200B5B5B500F9F9
      F900A3A3A300FBFBFB000000000000000000101010000000000000000000EFEF
      EF00969696008888880088888800888888008888880088888800888888009696
      9600F0F0F000000000000000000010101000519643000000000000000000F3F8
      F200B2D1AC00A8CBA100A8CBA100A8CBA100A8CBA100A8CBA100A8CBA100B2D1
      AC00F4F8F300000000000000000051964300A9A9A9000000000000000000F9F9
      F900D9D9D900D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400D9D9
      D900FAFAFA000000000000000000A9A9A9000000000000000000F0F0F000A8A8
      A80000000000ABABAB00EDEDED00CBCBCB00CDCDCD00EBEBEB00ADADAD000000
      0000A6A6A600F2F2F20000000000000000001010100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000101010005196430000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000051964300A9A9A90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A9A9A9000000000000000000E6E6E600B1B1
      B100FEFEFE00A4A4A400F6F6F600CBCBCB00CDCDCD00F4F4F400A5A5A5000000
      0000AFAFAF00E9E9E9000000000000000000101010000000000000000000F0F0
      F00098989800888888008888880088888800888888008888880098989800F1F1
      F10000000000000000000000000010101000519643000000000000000000F4F8
      F300B4D2AE00A8CBA100A8CBA100A8CBA100A8CBA100A8CBA100B4D2AE00F5F9
      F40000000000000000000000000051964300A9A9A9000000000000000000FAFA
      FA00DADADA00D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400DADADA00FAFA
      FA00000000000000000000000000A9A9A9000000000000000000DDDDDD00BBBB
      BB0000000000DDDDDD0000000000EEEEEE00EFEFEF0000000000DDDDDD000000
      0000B9B9B900E0E0E00000000000000000001010100000000000000000004040
      4000626262008888880088888800888888008888880088888800616161004242
      42000000000000000000000000001010100051964300000000000000000074AB
      68008CBA8300A8CBA100A8CBA100A8CBA100A8CBA100A8CBA1008CBA820075AC
      6A0000000000000000000000000051964300A9A9A9000000000000000000BABA
      BA00C6C6C600D4D4D400D4D4D400D4D4D400D4D4D400D4D4D400C6C6C600BBBB
      BB00000000000000000000000000A9A9A90000000000E5E5E500C0C0C000AEAE
      AE00C4C4C400B9B9B900B6B6B600B6B6B600B6B6B600B6B6B600B9B9B900C4C4
      C400ADADAD00C1C1C100E6E6E600000000001010100000000000000000000F0F
      0F00FEFEFE0000000000000000000000000000000000B4B4B400FEFEFE000F0F
      0F00000000000000000000000000101010005196430000000000000000005096
      4200FEFFFE0000000000000000000000000000000000C8DEC400FEFFFE005096
      420000000000000000000000000051964300A9A9A9000000000000000000A8A8
      A8000000000000000000000000000000000000000000E4E4E40000000000A8A8
      A800000000000000000000000000A9A9A90000000000CECECE00BABABA00ADAD
      AD00ACACAC00A3A3A300A6A6A600A6A6A600A6A6A600A6A6A600A3A3A300ACAC
      AC00ADADAD00BABABA00D0D0D000000000001010100000000000000000001010
      1000000000000000000000000000000000000000000010101000000000001010
      10000000000000000000CFCFCF00131313005196430000000000000000005196
      4300000000000000000000000000000000000000000051964300000000005196
      43000000000000000000DCEAD90053974500A9A9A9000000000000000000A9A9
      A9000000000000000000000000000000000000000000A9A9A90000000000A9A9
      A9000000000000000000EEEEEE00AAAAAA000000000000000000000000000000
      0000FBFBFB00A3A3A300E8E8E800EDEDED00EDEDED00E7E7E700A3A3A300FDFD
      FD00000000000000000000000000000000001010100000000000000000001010
      1000000000000000000000000000000000000000000032323200000000001010
      100000000000D0D0D0001D1D1D00BCBCBC005196430000000000000000005196
      4300000000000000000000000000000000000000000069A55D00000000005196
      430000000000DDEADA005A9C4D00CEE2CA00A9A9A9000000000000000000A9A9
      A9000000000000000000000000000000000000000000B5B5B50000000000A9A9
      A90000000000EEEEEE00ADADAD00E7E7E7000000000000000000000000000000
      0000FDFDFD00B0B0B000A9A9A900A9A9A900A9A9A900A9A9A900B1B1B100FEFE
      FE000000000000000000000000000000000013131300E7E7E700000000001010
      1000000000000000000000000000000000000000000000000000000000001010
      1000CFCFCF001D1D1D00BEBEBE000000000053974500EDF4EC00000000005196
      4300000000000000000000000000000000000000000000000000000000005196
      4300DCEAD9005A9C4D00D0E2CC0000000000AAAAAA00F6F6F60000000000A9A9
      A90000000000000000000000000000000000000000000000000000000000A9A9
      A900EEEEEE00ADADAD00E8E8E800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009696960013131300111111000101
      0100111111001111110011111100111111001111110011111100111111000101
      010014141400BEBEBE000000000000000000B2D1AC005397450050964200468F
      370050964200509642005096420050964200509642005096420050964200468F
      370054984600D0E2CC000000000000000000D9D9D900AAAAAA00A9A9A900A3A3
      A300A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900A9A9A900A3A3
      A300AAAAAA00E8E8E8000000000000000000FFFEFE00FEE2BF00FDC78400FDBE
      7100FDBE7100FDBE7100FDBE7100FDBE7100FDBE7100FDBE7100FDBE7100FDC1
      7400FDCE9100FFF0DF000000000000000000FEFEFE00D6D6D600B0B0B000A3A3
      A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A5A5
      A500B8B8B800EAEAEA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEE2C000FDBF7300FEDAAF00FEE5
      C600FEE5C600FEE5C600FEE5C600FEE5C600FEE5C600FEE5C600FEE5C600FEE4
      C400FECF9500FDC17700FFF6EC0000000000D6D6D600A4A4A400CBCBCB00DADA
      DA00DADADA00DADADA00DADADA00DADADA00DADADA00DADADA00DADADA00D9D9
      D900BABABA00A7A7A700F3F3F30000000000000000000000000000000000E5E5
      E500444444002222220022222200222222002222220022222200222222004747
      4700E8E8E800000000000000000000000000000000000000000000000000F1F1
      FF009797FE008484FD008484FD008484FD008484FD008484FD008484FD009999
      FE00F2F2FF00000000000000000000000000FDC88800FED9AD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFDFB00FDC47F00FEDFB90000000000B2B2B200CACACA00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFC00ACACAC00D2D2D200000000000000000000000000000000007777
      77004C4C4C00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CBCBCB004848
      48007D7D7D00000000000000000000000000000000000000000000000000B3B3
      FE009B9BFE00E3E3FF00E3E3FF00E3E3FF00E3E3FF00E3E3FF00E2E2FF009999
      FE00B7B7FE00000000000000000000000000FDC07600FEE4C500000000000000
      0000FFF6EC00FEE6C800FFFBF600000000000000000000000000000000000000
      000000000000FDCF9400FED7A70000000000A6A6A600D9D9D900000000000000
      0000F3F3F300DBDBDB00F9F9F900000000000000000000000000000000000000
      000000000000B9B9B900C6C6C600000000000000000000000000000000005555
      55008E8E8E00BFBFBF00ADADAD00B4B4B400B8B8B800AAAAAA00C3C3C3008888
      88005B5B5B00000000000000000000000000000000000000000000000000A0A0
      FE00C0C0FE00DBDBFE00D1D1FE00D5D5FE00D7D7FE00D0D0FE00DEDEFF00BDBD
      FE00A4A4FE00000000000000000000000000FDC07600FEE4C500000000000000
      0000FED7A700FDBE7100FDC17800FEDAAD00FFF9F20000000000000000000000
      000000000000FDCE9400FED7A70000000000A6A6A600D9D9D900000000000000
      0000C6C6C600A3A3A300A7A7A700CACACA00F6F6F60000000000000000000000
      000000000000BABABA00C6C6C600000000000000000000000000000000003B3B
      3B00A8A8A800737373007171710070707000757575006B6B6B0078787800A2A2
      A200414141000000000000000000000000000000000000000000000000009292
      FD00CFCFFE00B1B1FE00B0B0FE00AFAFFE00B2B2FE00ADADFE00B4B4FE00CBCB
      FE009595FE00000000000000000000000000FDC07600FEE4C500000000000000
      0000FEE6C800FDBE7100FEDBAF00FDC57D00FDC88700FFFAF400000000000000
      000000000000FDCE9400FED7A70000000000A6A6A600D9D9D900000000000000
      0000DBDBDB00A3A3A300CBCBCB00ABABAB00B1B1B100F8F8F800000000000000
      000000000000BABABA00C6C6C600000000000000000000000000000000002222
      2200C1C1C1005B5B5B008888880070707000757575008282820061616100BBBB
      BB00282828000000000000000000000000000000000000000000000000008484
      FD00DCDCFF00A4A4FE00BDBDFE00AFAFFE00B2B2FE00B9B9FE00A7A7FE00D9D9
      FE008787FD00000000000000000000000000FDC07600FEE4C500000000000000
      0000FFFAF400FDBF7400FED7A800FDC27900FDBE7200FDCD8F00FFFCF8000000
      000000000000FDCE9400FED7A70000000000A6A6A600D9D9D900000000000000
      0000F8F8F800A5A5A500C7C7C700A8A8A800A3A3A300B6B6B600FBFBFB000000
      000000000000BABABA00C6C6C600000000000000000000000000000000000909
      0900DBDBDB00444444009F9F9F0070707000757575009999990049494900D5D5
      D5000E0E0E000000000000000000000000000000000000000000000000007676
      FD00EBEBFF009797FE00CACAFE00AFAFFE00B2B2FE00C6C6FE009A9AFE00E8E8
      FF007979FD00000000000000000000000000FDC07600FEE4C500000000000000
      000000000000FED6A500FDBE7100FDCE9300FFF0DF00FDC27A00FED09800FFFD
      FC0000000000FDCE9400FED7A70000000000A6A6A600D9D9D900000000000000
      000000000000C5C5C500A3A3A300B9B9B900EAEAEA00A9A9A900BCBCBC00FDFD
      FD0000000000BABABA00C6C6C600000000000000000000000000EEEEEE000000
      0000F4F4F4002D2D2D00B6B6B6007070700075757500B0B0B00032323200EFEF
      EF0000000000F3F3F30000000000000000000000000000000000F6F6FF007171
      FD00F9F9FF008A8AFD00D6D6FE00AFAFFE00B2B2FE00D3D3FE008D8DFD00F6F6
      FF007171FD00F8F8FF000000000000000000FDC07600FEE4C500000000000000
      000000000000FFFDFC00FED09700FDC37C00FFF5E800FFF1E000FDC17700FED4
      A200FFFEFE00FDCE9400FED7A70000000000A6A6A600D9D9D900000000000000
      000000000000FDFDFD00BCBCBC00AAAAAA00F0F0F000EBEBEB00A7A7A700C3C3
      C300FEFEFE00BABABA00C6C6C600000000000000000000000000D5D5D5000F0F
      0F000000000015151500CECECE007070700075757500C8C8C8001B1B1B000000
      000009090900DBDBDB0000000000000000000000000000000000E8E8FF007979
      FD00000000007D7DFD00E4E4FF00AFAFFE00B2B2FE00E0E0FF008080FD000000
      00007676FD00EBEBFF000000000000000000FDC07600FEE4C500000000000000
      00000000000000000000FFFBF700FDCC8D00FDC58000FFF7EE00FEEBD400FDBF
      7300FED9AC00FEE8CC00FEEED90000000000A6A6A600D9D9D900000000000000
      00000000000000000000FAFAFA00B5B5B500ADADAD00F4F4F400E3E3E300A4A4
      A400C9C9C900DEDEDE00E6E6E600000000000000000000000000BBBBBB002828
      2800FCFCFC0002020200E5E5E5007070700075757500E0E0E00005050500FEFE
      FE0022222200C1C1C10000000000000000000000000000000000D9D9FE008787
      FD00FDFDFF007272FD00F1F1FF00AFAFFE00B2B2FE00EEEEFF007474FD00FEFE
      FF008484FD00DCDCFF000000000000000000FDC07600FEE4C500000000000000
      0000000000000000000000000000FFFAF300FDC88700FDC78600FFF9F300FEE8
      CC00FDBE7200FEE0BB000000000000000000A6A6A600D9D9D900000000000000
      0000000000000000000000000000F7F7F700B1B1B100B0B0B000F7F7F700DEDE
      DE00A3A3A300D3D3D30000000000000000000000000000000000A2A2A2004242
      420000000000A1A1A100FEFEFE00CFCFCF00D2D2D200FEFEFE00A2A2A2000000
      00003C3C3C00A8A8A80000000000000000000000000000000000CBCBFE009696
      FE0000000000CBCBFE00FEFEFF00E4E4FF00E6E6FF00FEFEFF00CBCBFE000000
      00009292FD00CFCFFE000000000000000000FDC47B00FEE2C000000000000000
      000000000000000000000000000000000000FFF6EC00FDC47F00FDCD8F00FFFC
      F800FEE1BD00FDBE7100FEE3C20000000000A9A9A900D6D6D600000000000000
      000000000000000000000000000000000000F3F3F300ACACAC00B6B6B600FBFB
      FB00D4D4D400A3A3A300D8D8D8000000000000000000B7B7B700525252001F1F
      1F005C5C5C003D3D3D00373737003737370037373700373737003E3E3E005C5C
      5C001D1D1D0055555500BABABA000000000000000000D7D7FE009E9EFE008282
      FD00A4A4FE009393FD008F8FFD008F8FFD008F8FFD008F8FFD009494FD00A4A4
      FE008181FC00A0A0FD00D9D9FE0000000000FED19A00FDCA8C00FFFAF5000000
      00000000000000000000000000000000000000000000FFF3E500FDC27900FED0
      9900FFFEFC00FEDBB100FDBF7300FEEBD400BEBEBE00B4B4B400F9F9F9000000
      00000000000000000000000000000000000000000000EEEEEE00A8A8A800BDBD
      BD00FDFDFD00CCCCCC00A4A4A400E3E3E30000000000787878003E3E3E001C1C
      1C001B1B1B000000000009090900090909000909090009090900000000001B1B
      1B001C1C1C003F3F3F007C7C7C000000000000000000B4B4FE009393FE008080
      FD007F7FFD007171FD007676FE007575FD007575FD007676FE007171FD007F7F
      FD008080FD009494FE00B6B6FE0000000000FFF5E900FDC47E00FDC07400FDC8
      8400FDC88400FDC88400FDC88400FDC88400FDC88400FED7A800FFEFDC00FDC0
      7400FED5A300FFFEFD00FED39E00FDC98600F1F1F100ADADAD00A6A6A600AFAF
      AF00AFAFAF00AFAFAF00AFAFAF00AFAFAF00AFAFAF00C7C7C700E9E9E900A6A6
      A600C3C3C300FEFEFE00C0C0C000B1B1B1000000000000000000000000000000
      0000F4F4F40000000000C0C0C000CCCCCC00CCCCCC00BCBCBC0000000000F9F9
      F900000000000000000000000000000000000000000000000000000000000000
      0000F9F9FF007171FD00DCDCFF00E3E3FF00E3E3FF00DADAFE007171FD00FCFC
      FF000000000000000000000000000000000000000000FFFAF500FEE6C800FEDD
      B400FEDCB300FEDCB300FEDCB300FEDCB300FEDCB300FEEAD00000000000FEEB
      D300FDBF7300FED5A300FECE9500FDC9860000000000F9F9F900DBDBDB00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00E1E1E10000000000E2E2
      E200A4A4A400C3C3C300BABABA00B1B1B1000000000000000000000000000000
      0000FAFAFA00252525001111110011111100111111001111110028282800FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      0000FCFCFF008686FD007A7AFD007A7AFD007A7AFD007A7AFD008787FD00FEFE
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEE9CF00FDC47F00FDC68300FEEEDB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E0E0E000ACACAC00AFAFAF00E8E8E8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D4D4D4006F6F6F002B2B2B0015151500151515002C2C2C0070707000D5D5
      D500000000000000000000000000000000000000000000000000000000000000
      0000E7E7FF00AFAFFE008989FD007D7DFD007D7DFD008989FD00AFAFFE00E8E8
      FF00000000000000000000000000000000000000000000000000000000000000
      0000EFEFEF00CBCBCB00B3B3B300ABABAB00ABABAB00B3B3B300CBCBCB00F0F0
      F00000000000000000000000000000000000FDFDFD008C8C8C00232323000000
      0000000000000000000000000000000000000000000000000000000000000606
      06003A3A3A00C6C6C60000000000000000000000000000000000F9F9F9006B6B
      6B00292929009B9B9B00E8E8E8000000000000000000E7E7E7009B9B9B002929
      29006D6D6D00F9F9F90000000000000000000000000000000000FCFCFF00ADAD
      FE008888FD00C7C7FE00F2F2FF000000000000000000F2F2FF00C7C7FE008888
      FD00AEAEFE00FCFCFF0000000000000000000000000000000000FDFDFD00CACA
      CA00B2B2B200DBDBDB00F7F7F7000000000000000000F6F6F600DBDBDB00B2B2
      B200CACACA00FDFDFD0000000000000000008E8E8E00040404006F6F6F009999
      9900999999009999990099999900999999009999990099999900999999009595
      9500414141000B0B0B00DDDDDD000000000000000000F9F9F900434343006F6F
      6F00FBFBFB00000000000000000000000000000000000000000000000000FAFA
      FA006E6E6E0043434300F9F9F9000000000000000000FCFCFF009696FE00AFAF
      FE00FDFDFF00000000000000000000000000000000000000000000000000FCFC
      FF00AEAEFE009696FE00FCFCFF000000000000000000FDFDFD00BBBBBB00CBCB
      CB00FEFEFE00000000000000000000000000000000000000000000000000FDFD
      FD00CBCBCB00BBBBBB00FDFDFD0000000000292929006B6B6B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8F8F800191919008282820000000000000000006B6B6B006E6E6E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006C6C6C006D6D6D000000000000000000ADADFE00AEAEFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ADADFE00AEAEFE000000000000000000CACACA00CBCBCB000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CACACA00CACACA00000000000909090096969600000000000000
      0000DDDDDD009C9C9C00EFEFEF00000000000000000000000000000000000000
      0000000000003E3E3E006161610000000000D3D3D30029292900FBFBFB000000
      0000A4A4A400CCCCCC0000000000000000000000000000000000CBCBCB00A5A5
      A50000000000FAFAFA0027272700D5D5D500E6E6FF008888FD00FDFDFF000000
      0000CCCCFE00E3E3FF0000000000000000000000000000000000E2E2FF00CDCD
      FE0000000000FCFCFF008787FD00E8E8FF00EFEFEF00B2B2B200FEFEFE000000
      0000DEDEDE00EDEDED0000000000000000000000000000000000ECECEC00DFDF
      DF0000000000FDFDFD00B1B1B100F0F0F0000909090096969600000000000000
      000061616100000000000C0C0C006C6C6C00E7E7E70000000000000000000000
      0000000000003F3F3F0061616100000000006E6E6E009A9A9A00000000000000
      0000CCCCCC0021212100CBCBCB000000000000000000CACACA0021212100CCCC
      CC0000000000000000009898980070707000AEAEFE00C7C7FE00000000000000
      0000E3E3FF008383FD00E2E2FF000000000000000000E1E1FF008383FD00E3E3
      FF000000000000000000C6C6FE00AFAFFE00CBCBCB00DBDBDB00000000000000
      0000EDEDED00AFAFAF00ECECEC000000000000000000ECECEC00AFAFAF00EDED
      ED000000000000000000DADADA00CBCBCB000909090096969600000000000000
      00009C9C9C0000000000707070001616160028282800EBEBEB00000000000000
      0000000000003F3F3F00616161000000000029292900E6E6E600000000000000
      000000000000CECECE0021212100C9C9C900CDCDCD0021212100C9C9C9000000
      00000000000000000000E4E4E4002B2B2B008888FD00F1F1FF00000000000000
      000000000000E4E4FF008383FD00E1E1FF00E3E3FF008383FD00E1E1FF000000
      00000000000000000000F0F0FF008989FD00B2B2B200F6F6F600000000000000
      000000000000EDEDED00AFAFAF00ECECEC00EDEDED00AFAFAF00ECECEC000000
      00000000000000000000F5F5F500B3B3B3000909090096969600000000000000
      0000ECECEC0005050500636363000F0F0F000101010036363600F3F3F3000000
      0000000000003F3F3F0061616100000000001515150000000000000000000000
      00000000000000000000CACACA002020200020202000CACACA00000000000000
      0000000000000000000000000000171717007D7DFD0000000000000000000000
      00000000000000000000E1E1FF008383FD008383FD00E1E1FF00000000000000
      00000000000000000000000000007E7EFD00ABABAB0000000000000000000000
      00000000000000000000ECECEC00AFAFAF00AFAFAF00ECECEC00000000000000
      0000000000000000000000000000ABABAB000909090096969600000000000000
      0000000000005E5E5E00000000003D3D3D00C6C6C6001010100046464600F9F9
      F900000000003F3F3F0061616100000000001515150000000000000000000000
      00000000000000000000CACACA002020200020202000CACACA00000000000000
      0000000000000000000000000000161616007D7DFD0000000000000000000000
      00000000000000000000E1E1FF008383FD008383FD00E1E1FF00000000000000
      00000000000000000000000000007D7DFD00ABABAB0000000000000000000000
      00000000000000000000ECECEC00AFAFAF00AFAFAF00ECECEC00000000000000
      0000000000000000000000000000ABABAB000909090096969600000000000000
      000000000000F9F9F9004545450013131300D6D6D600C7C7C7000B0B0B005858
      5800FDFDFD003F3F3F00616161000000000029292900E7E7E700000000000000
      000000000000CECECE0021212100C8C8C800CDCDCD0021212100C9C9C9000000
      00000000000000000000E5E5E5002A2A2A008888FD00F2F2FF00000000000000
      000000000000E4E4FF008383FD00E0E0FF00E3E3FF008383FD00E1E1FF000000
      00000000000000000000F1F1FF008888FD00B2B2B200F6F6F600000000000000
      000000000000EDEDED00AFAFAF00EBEBEB00EDEDED00AFAFAF00ECECEC000000
      00000000000000000000F6F6F600B2B2B2000909090096969600000000000000
      00000000000000000000F1F1F100323232001B1B1B00E0E0E000B2B2B2000404
      04006A6A6A00A4A4A400BBBBBB00000000006D6D6D009B9B9B00000000000000
      0000CCCCCC0021212100CACACA000000000000000000CACACA0021212100CCCC
      CC000000000000000000999999006F6F6F00AEAEFE00C7C7FE00000000000000
      0000E3E3FF008383FD00E1E1FF000000000000000000E1E1FF008383FD00E3E3
      FF000000000000000000C6C6FE00AFAFFE00CACACA00DBDBDB00000000000000
      0000EDEDED00AFAFAF00ECECEC000000000000000000ECECEC00AFAFAF00EDED
      ED000000000000000000DADADA00CBCBCB000909090096969600000000000000
      0000000000000000000000000000EAEAEA002727270025252500E9E9E900A3A3
      A30001010100848484000000000000000000D2D2D20029292900FBFBFB000000
      0000A4A4A400CCCCCC0000000000000000000000000000000000CCCCCC00A4A4
      A40000000000FAFAFA0028282800D4D4D400E6E6FF008888FD00FDFDFF000000
      0000CCCCFE00E3E3FF0000000000000000000000000000000000E3E3FF00CCCC
      FE0000000000FCFCFF008787FD00E7E7FF00EFEFEF00B2B2B200FEFEFE000000
      0000DEDEDE00EDEDED0000000000000000000000000000000000EDEDED00DEDE
      DE0000000000FDFDFD00B1B1B100EFEFEF00121212008D8D8D00000000000000
      000000000000000000000000000000000000DDDDDD001919190036363600F3F3
      F3008888880000000000929292000000000000000000696969006F6F6F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006E6E6E006B6B6B000000000000000000ABABFE00AFAFFE000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AEAEFE00ADADFE000000000000000000C9C9C900CBCBCB000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CBCBCB00CACACA00000000004A4A4A0030303000EDEDED000000
      00000000000000000000000000000000000000000000D0D0D0000F0F0F004848
      4800FAFAFA007373730003030300B2B2B20000000000F9F9F900424242006F6F
      6F00FBFBFB00000000000000000000000000000000000000000000000000FBFB
      FB006E6E6E0043434300F9F9F9000000000000000000FCFCFF009696FE00AFAF
      FE00FDFDFF00000000000000000000000000000000000000000000000000FDFD
      FF00AEAEFE009696FE00FCFCFF000000000000000000FDFDFD00BBBBBB00CBCB
      CB00FEFEFE00000000000000000000000000000000000000000000000000FEFE
      FE00CBCBCB00BBBBBB00FDFDFD0000000000D7D7D70018181800080808002222
      2200222222002222220022222200222222002222220063636300C1C1C1000808
      08005A5A5A00FCFCFC0051515100262626000000000000000000F9F9F9006A6A
      6A00292929009C9C9C00E8E8E8000000000000000000E8E8E8009B9B9B002929
      29006B6B6B00F9F9F90000000000000000000000000000000000FCFCFF00ACAC
      FE008888FD00C8C8FE00F2F2FF000000000000000000F2F2FF00C7C7FE008888
      FD00ADADFE00FCFCFF0000000000000000000000000000000000FDFDFD00C9C9
      C900B2B2B200DBDBDB00F7F7F7000000000000000000F7F7F700DBDBDB00B2B2
      B200CACACA00FDFDFD00000000000000000000000000EDEDED009C9C9C007878
      78007777770077777700777777007777770077777700ABABAB0000000000B0B0
      B000030303005959590040404000262626000000000000000000000000000000
      0000D2D2D2006D6D6D002A2A2A0015151500151515002A2A2A006E6E6E00D3D3
      D300000000000000000000000000000000000000000000000000000000000000
      0000E6E6FF00AEAEFE008888FD007D7DFD007D7DFD008888FD00AEAEFE00E6E6
      FF00000000000000000000000000000000000000000000000000000000000000
      0000EFEFEF00CACACA00B2B2B200ABABAB00ABABAB00B2B2B200CBCBCB00EFEF
      EF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A9A9A9001919190020202000BEBEBE00424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF00F00FF00F00000000C003C00300000000
      87E187E1000000008E718E71000000001E781E78000000003E7C3E7C00000000
      3E7C3E7C00000000200420040000000020042004000000003E7C3E7C00000000
      3E7C3E7C000000001E781E78000000008E719E710000000087E187E100000000
      C003C00300000000F00FF00F00000000FFFFFFFFFFFFF00FFFFFFFFFFFFFC003
      FFFFFFFFFFFF87E1FFE7FFE7FFE78E71FFC7FFC7FFC71E78E00FE00FE00F3E7C
      C01FC01FC01F3E7C8F1F8F1F8F1F20049F9F9F9F9F9F20049F9F9F9F9F9F3E7C
      9F9F9F9F9F9F3E7C9F9F9F9F9F9F1E788F1F8F1F8F1F8E71C03FC03FC03F87E1
      E07FE07FE07FC003FFFFFFFFFFFFF00FFFFF000000000000E0072FF42FF42FF4
      E0076FF66FF66FF6E0076FF66FF66FF6E0076FF66FF66FF6E00767E667E66FF6
      E007600660066006C003600660066006C8137FFE7FFE7FFEC013600E600E600E
      CA53600E600E600E8001678E678E6FAE80016FAC6FAC6FACF00F6FA86FA86FA8
      F00F2FE12FE12FE1FFFF00030003000300030003FFFFFFFF00010001E007E007
      3FF13FF1E007E00731F931F9E007E00730793079E007E00730393039E007E007
      30193019E007E00738093809C003C00338013801C813C8133C013C01C003C003
      3E033E03C813C8133F013F01800180011F801F808001800100000000F00FF00F
      80208020F00FF00FFFF0FFF0FFFFFFFFF00FF00FF00F0003C183C183C1830001
      87E187E187E13FF19FF99FF99FF931F913C813C813C83079318C318C318C3039
      381C381C381C30197C3E7C3E7C3E38097C3E7C3E7C3E3801381C381C381C3C01
      318C318C318C3E0313C813C813C83F019FF99FF99FF91F8087E187E187E10000
      C183C183C1838020F00FF00FF00FFFF000000000000000000000000000000000
      000000000000}
  end
  object dsResponsavel: TDataSource
    DataSet = queryUsuarios
    Left = 1064
    Top = 264
  end
  object dsModelo: TDataSource
    DataSet = queryModelo
    OnUpdateData = dsModeloUpdateData
    Left = 1064
    Top = 355
  end
  object queryModelo: TFDQuery
    Connection = dmConexao.Conexao
    SQL.Strings = (
      'select * from TB_SOFAS;')
    Left = 1064
    Top = 402
  end
  object queryUsuarios: TFDQuery
    Connection = dmConexao.Conexao
    SQL.Strings = (
      'SELECT * FROM TB_USUARIOS')
    Left = 1064
    Top = 311
  end
  object queryConsulta: TFDQuery
    Connection = dmConexao.Conexao
    Left = 1064
    Top = 472
  end
end
