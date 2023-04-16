program GDFinanceiro;

uses
  Vcl.Forms,
  gdMain in 'src\views\gdMain.pas' {frMain},
  gdLogin in 'src\views\telas\gdLogin.pas' {frLogin},
  gdSplashScreen in 'src\views\telas\gdSplashScreen.pas' {frSplashScreen},
  Vcl.Themes,
  Vcl.Styles,
  gdFuncoes in 'src\utils\gdFuncoes.pas',
  gdSimples in 'src\views\padroes\gdSimples.pas' {frSimples};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrMain, frMain);
  Application.CreateForm(TfrSimples, frSimples);
  Application.Run;
end.
