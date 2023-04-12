program GDFinanceiro;

uses
  Vcl.Forms,
  gdMain in 'src\views\gdMain.pas' {frMain},
  gdLogin in 'src\views\telas\gdLogin.pas' {frLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrMain, frMain);
  Application.Run;
end.
