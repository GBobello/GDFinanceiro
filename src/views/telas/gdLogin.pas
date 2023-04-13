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
    procedure imgOlhoAbertoClick(Sender: TObject);
    procedure imgOlhoFechadoClick(Sender: TObject);
    procedure spEntrarMouseEnter(Sender: TObject);
    procedure spEntrarMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frLogin: TfrLogin;

implementation

{$R *.dfm}

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
