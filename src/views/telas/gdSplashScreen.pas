unit gdSplashScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TfrSplashScreen = class(TForm)
    pnPrincipal: TPanel;
    imgLogo: TImage;
    lbGD: TLabel;
    lbSistemas: TLabel;
    lbVersao: TLabel;
    pnProgressBar: TPanel;
    pnProgressao: TPanel;
    Timer: TTimer;
    Label1: TLabel;
    imgPreparacao: TImage;
    imgBancoDeDados: TImage;
    imgConfiguracao: TImage;
    imgFoguete: TImage;
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frSplashScreen: TfrSplashScreen;
  FStep: Integer;
  FStepUnit: Integer;

implementation

{$R *.dfm}

procedure TfrSplashScreen.FormCreate(Sender: TObject);
begin
  pnProgressao.Width := 0;
  FStep := 0;
  FStepUnit := (pnProgressBar.Width div 100);
end;

procedure TfrSplashScreen.TimerTimer(Sender: TObject);
begin
  if pnProgressao.Width >= pnProgressBar.Width then
  begin
    Timer.Enabled := False;
    Close;
  end;

  fStep := fStep + fStepUnit;
  pnProgressao.Width := fStep;
  Label1.Caption := Format('%1d', [Trunc((fStep / pnProgressBar.Width) * 100)]) + '%';

  if Trunc((fStep / pnProgressBar.Width) * 100) = 25 then
    imgPreparacao.Visible := True
  else if Trunc((fStep / pnProgressBar.Width) * 100) = 45 then
    imgBancoDeDados.Visible := True
  else if Trunc((fStep / pnProgressBar.Width) * 100) = 70 then
    imgConfiguracao.Visible := True
  else if Trunc((fStep / pnProgressBar.Width) * 100) = 90 then
    imgFoguete.Visible := True;
end;

end.
