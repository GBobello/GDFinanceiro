program GDFinanceiro;

uses
  Vcl.Forms,
  gdMain in 'src\views\gdMain.pas' {frMain},
  gdLogin in 'src\views\telas\gdLogin.pas' {frLogin},
  gdSplashScreen in 'src\views\telas\gdSplashScreen.pas' {frSplashScreen},
  Vcl.Themes,
  Vcl.Styles,
  gdFuncoes in 'src\utils\gdFuncoes.pas',
  gdSimples in 'src\views\padroes\gdSimples.pas' {frSimples},
  gdUsuarios in 'src\views\telas\gdUsuarios.pas' {frUsuarios},
  gdNovo in 'src\views\telas\gdNovo.pas' {frNovo},
  udmConexao in 'src\dataModules\udmConexao.pas' {dmConexao: TDataModule},
  gdClasses_GD in 'src\utils\gdClasses_GD.pas',
  gdUsuarioLogado in 'src\classes\gdUsuarioLogado.pas',
  gdLoginClass in 'src\classes\gdLoginClass.pas',
  gdNovoClass in 'src\classes\gdNovoClass.pas',
  gdUsuarioClass in 'src\classes\gdUsuarioClass.pas',
  udmUsuarios in 'src\dataModules\udmUsuarios.pas' {dmUsuarios: TDataModule},
  gdCardPanels_Padrao in 'src\views\padroes\gdCardPanels_Padrao.pas' {frCardPanels_Padrao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TdmUsuarios, dmUsuarios);
  Application.CreateForm(TfrMain, frMain);
  Application.Run;
end.
