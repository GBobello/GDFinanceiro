unit gdFuncoes;

interface

uses
  Windows, Vcl.Graphics, Vcl.Controls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFuncoes = record
    public
      constructor Create(AOwner: TObject);
      procedure SetaFoco(prPainel: TPanel; prSpeedButton: TSpeedButton; prPainelButton: TPanel; prFocar: Boolean);
  end;


implementation


{ TFuncoes }

constructor TFuncoes.Create;
begin
  //
end;

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

end.
