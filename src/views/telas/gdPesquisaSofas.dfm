inherited frPesquisaSofas: TfrPesquisaSofas
  Caption = 'Pesquisa Sof'#225's'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnPrincipal: TPanel
    inherited pnGrid: TPanel
      inherited dbGrid: TDBGrid
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
            Width = 64
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
            Title.Caption = 'Quantidade de horas'
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
