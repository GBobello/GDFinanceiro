unit gdSimples;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  System.ImageList, Vcl.ImgList;

type
  TfrSimples = class(TForm)
    pnPrincipal: TPanel;
    spFecha: TSpeedButton;
    spMinimiza: TSpeedButton;
    imgList: TImageList;
    pnBarraSuperior: TPanel;
    procedure spFechaClick(Sender: TObject);
    procedure spMinimizaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frSimples: TfrSimples;

implementation

{$R *.dfm}

procedure TfrSimples.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrSimples.spFechaClick(Sender: TObject);
begin
  Close;
end;

procedure TfrSimples.spMinimizaClick(Sender: TObject);
begin
  WindowState := TWindowState.wsMinimized;
end;

end.
