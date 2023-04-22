unit gdFuncoes;

interface

uses
  Windows, Vcl.Graphics, Vcl.Controls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFuncoes = record
    public
      procedure SetaFoco(prPainel: TPanel; prSpeedButton: TSpeedButton; prPainelButton: TPanel; prFocar: Boolean);
      procedure SetaFocoBotoes(prSpeedButton: TSpeedButton; prPainelButton: TPanel; prFocar: Boolean; prColor: TColor);
      procedure SetCentralizaControles(prControlePai: TControl; prControleFilho: TControl);

  end;


implementation


{ TFuncoes }

procedure TFuncoes.SetaFoco(prPainel: TPanel; prSpeedButton: TSpeedButton;
  prPainelButton: TPanel; prFocar: Boolean);
begin
  if prFocar then
  begin
    prPainel.Parent := prPainelButton;
    prPainel.Align  := alLeft;
    prPainel.Visible := True;
    prSpeedButton.Font.Color := $00B7B900;
    prSpeedButton.Font.Style := [TFontStyle.fsBold];
  end
  else
  begin
    prPainel.Parent := nil;
    prPainel.Align  := alNone;
    prPainel.Visible := False;
    prSpeedButton.Font.Color := clWindowText;
    prSpeedButton.Font.Style := [];
  end;
end;

procedure TFuncoes.SetaFocoBotoes(prSpeedButton: TSpeedButton;
  prPainelButton: TPanel; prFocar: Boolean; prColor: TColor);
begin
  if prFocar then
  begin
    prSpeedButton.Font.Color := prColor;
//    prSpeedButton.Font.Style := [TFontStyle.fsBold];
  end
  else
  begin
    prSpeedButton.Font.Color := clWindowText;
//    prSpeedButton.Font.Style := [];
  end;
end;

procedure TFuncoes.SetCentralizaControles(prControlePai,
  prControleFilho: TControl);
begin
  if (prControleFilho <> nil) and (prControlePai <> nil) then
  begin
    prControleFilho.Left := (prControlePai.Width div 2) - (prControleFilho.Width div 2);
    prControleFilho.Top  := (prControlePai.Height div 2) - (prControleFilho.Height div 2);
  end;
end;

end.
