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
  gdCardPanels_Padrao in 'src\views\padroes\gdCardPanels_Padrao.pas' {frCardPanels_Padrao},
  udmNovo in 'src\dataModules\udmNovo.pas' {dmNovo: TDataModule},
  gdPesquisa_Padrao in 'src\views\padroes\gdPesquisa_Padrao.pas' {frPesquisa_Padrao},
  udmPesquisaSofas in 'src\dataModules\udmPesquisaSofas.pas' {dmPesquisaSofas: TDataModule},
  gdPesquisaSofas in 'src\views\telas\gdPesquisaSofas.pas' {frPesquisaSofas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TdmUsuarios, dmUsuarios);
  Application.CreateForm(TfrMain, frMain);
  Application.CreateForm(TdmNovo, dmNovo);
  Application.CreateForm(TfrPesquisa_Padrao, frPesquisa_Padrao);
  Application.CreateForm(TdmPesquisaSofas, dmPesquisaSofas);
  Application.CreateForm(TfrPesquisaSofas, frPesquisaSofas);
  Application.Run;
end.
