inherited frNovo: TfrNovo
  Caption = 'gde'
  OnResize = FormResize
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
      end
      object cardCadastro: TCard
        Left = 0
        Top = 0
        Width = 1164
        Height = 688
        Caption = 'cardCadastro'
        CardIndex = 1
        TabOrder = 1
        object pnBotoes: TPanel
          Left = 0
          Top = 576
          Width = 1164
          Height = 112
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
        end
        object pnEdits: TPanel
          Left = 0
          Top = 0
          Width = 1164
          Height = 576
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitTop = -6
          object pnCentralCadastro: TPanel
            Left = 278
            Top = 215
            Width = 609
            Height = 146
            BevelOuter = bvNone
            TabOrder = 0
            object Label1: TLabel
              Left = 32
              Top = 7
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
            object Label2: TLabel
              Left = 164
              Top = 7
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
            object Label3: TLabel
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
            object Label4: TLabel
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
            object Label5: TLabel
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
            object GD_Edit1: TGD_Edit
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
              Text = 'GD_Edit1'
              MudarCor = 13828095
            end
            object GD_MaskEdit_Data1: TGD_MaskEdit_Data
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
            object GD_SpinEdit1: TGD_SpinEdit
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
            object GD_DBLookupComboBox1: TGD_DBLookupComboBox
              Left = 164
              Top = 95
              Width = 419
              Height = 27
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              MudarCor = 13828095
            end
            object GD_DBLookupComboBox2: TGD_DBLookupComboBox
              Left = 272
              Top = 31
              Width = 311
              Height = 27
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              MudarCor = 13828095
            end
          end
        end
      end
    end
    inherited pnBarraSuperior: TPanel
      TabOrder = 1
    end
  end
end
