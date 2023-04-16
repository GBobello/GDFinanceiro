object frSimples: TfrSimples
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Simples'
  ClientHeight = 729
  ClientWidth = 1164
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 1164
    Height = 729
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 488
    ExplicitTop = 344
    ExplicitWidth = 185
    ExplicitHeight = 41
    DesignSize = (
      1164
      729)
    object spFecha: TSpeedButton
      Left = 1137
      Top = 4
      Width = 23
      Height = 22
      Anchors = [akTop, akRight]
      Caption = 'X'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'JejuGothic'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = spFechaClick
    end
    object spMinimiza: TSpeedButton
      Left = 1108
      Top = 4
      Width = 23
      Height = 22
      Anchors = [akTop, akRight]
      Caption = '-'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'JejuGothic'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = spMinimizaClick
    end
  end
end
