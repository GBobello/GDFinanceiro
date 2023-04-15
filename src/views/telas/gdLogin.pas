unit gdLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons;

type
  TfrLogin = class(TForm)
    pnPrincipal: TPanel;
    pnUsuario: TPanel;
    lbUsuario: TLabel;
    pnLinhaUsuario: TPanel;
    edUsuario: TEdit;
    pnSenha: TPanel;
    lbSenha: TLabel;
    pnLinhaSenha: TPanel;
    edSenha: TEdit;
    imgOlhoAberto: TImage;
    imgOlhoFechado: TImage;
    imgLogo: TImage;
    pnEntrar: TPanel;
    spEntrar: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    procedure imgOlhoAbertoClick(Sender: TObject);
    procedure imgOlhoFechadoClick(Sender: TObject);
    procedure spEntrarMouseEnter(Sender: TObject);
    procedure spEntrarMouseLeave(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure spEntrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frLogin: TfrLogin;

implementation

{$R *.dfm}

procedure TfrLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin                                      { TODO : Descomentar depois }
//  if Application.MessageBox('Deseja realmente sair do GD Financeiro?', 'Confirmação!', MB_ICONQUESTION + MB_YESNO) = mrYes then
//  begin
    CanClose := True;
//    Application.Terminate;
//  end
//  else
//    CanClose := False;
end;

procedure TfrLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    Close;
  end;
end;

procedure TfrLogin.imgOlhoAbertoClick(Sender: TObject);
begin
  imgOlhoAberto.Visible := False;
  imgOlhoFechado.Visible := True;
  edSenha.PasswordChar := #0;
end;

procedure TfrLogin.imgOlhoFechadoClick(Sender: TObject);
begin
  imgOlhoAberto.Visible := True;
  imgOlhoFechado.Visible := False;
  edSenha.PasswordChar := '*';
end;

procedure TfrLogin.spEntrarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrLogin.spEntrarMouseEnter(Sender: TObject);
begin
  pnEntrar.Color := $006FFF6F;
  spEntrar.Font.Color := clWhite;
end;

procedure TfrLogin.spEntrarMouseLeave(Sender: TObject);
begin
  pnEntrar.Color := clWhite;
  spEntrar.Font.Color := clGray;
end;

end.
