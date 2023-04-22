unit gdMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, System.ImageList, Vcl.ImgList, gdFuncoes,
  Vcl.Imaging.pngimage, gdSimples, gdUsuarios, Vcl.Mask, GD_MaskEdit_Data,
  gdNovo, Vcl.Menus, System.Actions, Vcl.ActnList, gdClasses_GD;

type
  TfrMain = class(TForm)
    cbEstilos: TComboBox;
    pnPrincipal: TPanel;
    pnMenu: TPanel;
    pnLogo: TPanel;
    pnPesquisa: TPanel;
    pnProdutos: TPanel;
    pnRelatorio: TPanel;
    pnUsuario: TPanel;
    spUsuario: TSpeedButton;
    spProdutos: TSpeedButton;
    spPesquisa: TSpeedButton;
    spRelatorio: TSpeedButton;
    imgListMenu: TImageList;
    pnFoco: TPanel;
    lbLogo: TLabel;
    pnSeparador3: TPanel;
    pnSeparador2: TPanel;
    pnSeparador1: TPanel;
    pnSeparador4: TPanel;
    imgLogo: TImage;
    pnSeparador5: TPanel;
    pnLateral: TPanel;
    pnCentral: TPanel;
    pnLogoCentral: TPanel;
    imgLogoCentral: TImage;
    lbGD: TLabel;
    lbSistemas: TLabel;
    aclBotoes: TActionList;
    alNovoShortCut: TAction;
    aclPesquisaShortCut: TAction;
    aclRelatoriosShortCut: TAction;
    aclUsuarios: TAction;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbEstilosChange(Sender: TObject);
    procedure SetaFoco(Sender: TObject);
    procedure TiraFoco(Sender: TObject);
    procedure spProdutosClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure spPesquisaClick(Sender: TObject);
    procedure spRelatorioClick(Sender: TObject);
    procedure spUsuarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frMain: TfrMain;
  fFuncoes: TFuncoes;

implementation

{$R *.dfm}

uses gdLogin, gdSplashScreen, Themes;

procedure TfrMain.cbEstilosChange(Sender: TObject);
begin
  TStyleManager.TrySetStyle(cbEstilos.Text);
end;

procedure TfrMain.SetaFoco(Sender: TObject);
begin
  fFuncoes.SetaFoco(pnFoco, TComponent(Sender) as TSpeedButton, TComponent(Sender).GetParentComponent as TPanel, True);
end;

procedure TfrMain.spPesquisaClick(Sender: TObject);
begin
  ShowMessage('Abrir Pesquisa');
end;

procedure TfrMain.spProdutosClick(Sender: TObject);
begin
  Application.CreateForm(TfrNovo, frNovo);
  frNovo.Parent := pnCentral;
  frNovo.Show;
  frNovo.SetFocus;
end;

procedure TfrMain.spRelatorioClick(Sender: TObject);
begin
  ShowMessage('Abrir Relatórios');
end;

procedure TfrMain.spUsuarioClick(Sender: TObject);
begin
  ShowMessage('Abrir Usuários');
end;

procedure TfrMain.TiraFoco(Sender: TObject);
begin
  fFuncoes.SetaFoco(pnFoco, TComponent(Sender) as TSpeedButton, TComponent(Sender).GetParentComponent as TPanel, False);
end;

procedure TfrMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Application.MessageBox('Deseja realmente sair do GD Financeiro?', 'Confirmação!', MB_ICONQUESTION + MB_YESNO) = mrYes then
  begin
    CanClose := True;
    Application.Terminate;
  end
  else
    CanClose := False;
end;

procedure TfrMain.FormCreate(Sender: TObject);
begin
//    Descomentar depois
//  try
//    Application.CreateForm(TfrSplashScreen, frSplashScreen);
//    frSplashScreen.ShowModal;
//  finally
//    FreeAndNil(frSplashScreen);
//  end;

  try
    Application.CreateForm(TfrLogin, frLogin);
    frLogin.ShowModal;
    if frLogin.ModalResult <> mrOk then
    begin
      Application.Terminate;
      Abort;
    end;
    spUsuario.Caption := gdClasses_GD.fUsuarioLogado.Nome;
  finally
    FreeAndNil(frLogin);
  end;
end;

procedure TfrMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    CloseQuery;
  end;


end;

procedure TfrMain.FormResize(Sender: TObject);
begin
  fFuncoes.SetCentralizaControles(TControl(pnCentral), TControl(pnLogoCentral));
end;

procedure TfrMain.FormShow(Sender: TObject);
var
  s: String;
begin
  fFuncoes.SetCentralizaControles(TControl(pnCentral), TControl(pnLogoCentral));
  {$REGION 'ComboBox de Estilos do Windows'}
//  ComboBox1.items.BeginUpdate;
//  try
//    ComboBox1.Items.Clear;
//    for s in TStyleManager.StyleNames do
//      ComboBox1.Items.Add(s);
//    ComboBox1.Sorted := True;
//    ComboBox1.ItemIndex := ComboBox1.items.IndexOf(TStyleManager.ActiveStyle.Name);
//  finally
//    ComboBox1.Items.EndUpdate;
//  end;
  {$ENDREGION}
end;



end.
