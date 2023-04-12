unit gdMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfrMain = class(TForm)
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frMain: TfrMain;

implementation

{$R *.dfm}

uses gdLogin;

procedure TfrMain.FormActivate(Sender: TObject);
begin
  try
    Application.CreateForm(TfrLogin, frLogin);
    frLogin.ShowModal;
  finally
    FreeAndNil(frLogin);
  end;
end;

procedure TfrMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    if Application.MessageBox('Deseja realmente sair do GD Financeiro?', 'Confirmação!', MB_ICONQUESTION + MB_DEFBUTTON2 + MB_YESNO) = mrYes then
      application.Terminate;
  end;
end;

end.
