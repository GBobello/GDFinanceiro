/////////////////////////////////////////////////////////////////////////////
{
    Unit Login
    Criação: Gabriel Bobello
}
/////////////////////////////////////////////////////////////////////////////

unit gdLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, udmConexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, gdClasses_GD, gdLoginClass,
  gdFuncoes;

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
    procedure edSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FDaoLogin: TLoginClass;
    procedure SetDaoLogin(const Value: TLoginClass);
    { Private declarations }
  public
    { Public declarations }
    property DaoLogin: TLoginClass read FDaoLogin write SetDaoLogin;
  end;

var
  frLogin: TfrLogin;

implementation

{$R *.dfm}

procedure TfrLogin.edSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    spEntrar.Click;
end;

procedure TfrLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FDaoLogin) then
    FreeAndNil(FDaoLogin);
end;

procedure TfrLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin                                      { TODO : Descomentar depois }
  if ModalResult <> mrOk then
    if Application.MessageBox('Deseja realmente sair do GD Financeiro?', 'Confirmação!', MB_ICONQUESTION + MB_YESNO) = mrYes then
    begin
      CanClose := True;
    end
  else
    CanClose := False;
end;

procedure TfrLogin.FormCreate(Sender: TObject);
begin
  FDaoLogin := TLoginClass.Create;
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

procedure TfrLogin.SetDaoLogin(const Value: TLoginClass);
begin
  FDaoLogin := Value;
end;

procedure TfrLogin.spEntrarClick(Sender: TObject);
var
  wSenhaCrypt: String;
begin
  if Trim(edUsuario.Text) = '' then
  begin
    edUsuario.SetFocus;
    Application.MessageBox('Informe o seu usuário!', 'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if Trim(edSenha.Text) = '' then
  begin
    edSenha.SetFocus;
    Application.MessageBox('Informe a sua senha!', 'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;


  try
    wSenhaCrypt := gdFuncoes.MD5(Trim(edSenha.Text));
    FDaoLogin.EfetuarLogin(Trim(edUsuario.Text), wSenhaCrypt);
    ModalResult := mrOk;
  except on E: Exception do 
    begin                         
      Application.MessageBox(PWideChar(E.Message), 'Atenção!', + MB_OK + MB_ICONWARNING);
      edUsuario.SetFocus;
    end;
  end;

end;

procedure TfrLogin.spEntrarMouseEnter(Sender: TObject);
begin
  pnEntrar.Color := $006FFF6F;
  spEntrar.Font.Color := clWhite;
end;

procedure TfrLogin.spEntrarMouseLeave(Sender: TObject);
begin
  pnEntrar.Color := clWhite;
  spEntrar.Font.Color := clBlack;
end;

end.
