unit gdUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gdSimples, Vcl.Buttons, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList;

type
  TfrUsuarios = class(TfrSimples)
    pnCentral: TPanel;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frUsuarios: TfrUsuarios;

implementation

{$R *.dfm}

procedure TfrUsuarios.FormResize(Sender: TObject);
begin
  inherited;
  pnCentral.Left := (pnPrincipal.Width div 2) - (pnCentral.Width div 2);
  pnCentral.Top  := (pnPrincipal.Height div 2) - (pnCentral.Height div 2);
end;

end.
