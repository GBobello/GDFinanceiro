unit gdSimples;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrSimples = class(TForm)
    pnPrincipal: TPanel;
    spFecha: TSpeedButton;
    spMinimiza: TSpeedButton;
    procedure spFechaClick(Sender: TObject);
    procedure spMinimizaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frSimples: TfrSimples;

implementation

{$R *.dfm}

procedure TfrSimples.spFechaClick(Sender: TObject);
begin
  Close;
end;

procedure TfrSimples.spMinimizaClick(Sender: TObject);
begin
  WindowState := TWindowState.wsMinimized;
end;

end.
