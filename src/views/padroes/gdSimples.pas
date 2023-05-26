/////////////////////////////////////////////////////////////////////////////
{
    Unit Simple
    Criação: Gabriel Bobello
}
/////////////////////////////////////////////////////////////////////////////

unit gdSimples;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls;

type
  TfrSimples = class(TForm)
    pnPrincipal: TPanel;
    spFecha: TSpeedButton;
    spMinimiza: TSpeedButton;
    imgList: TImageList;
    pnBarraSuperior: TPanel;
    pnNomeDaTela: TPanel;
    lbNomeDaTela: TLabel;
    imgTela: TImage;
    pnSeparadorNome: TPanel;
    procedure spFechaClick(Sender: TObject);
    procedure spMinimizaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimparCampos;
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

procedure TfrSimples.LimparCampos;
var
  wI: Integer;
begin
  for wI := 0 to Pred(ComponentCount) do
  begin
    if Components[wI] is TCustomEdit then
      TCustomEdit(Components[wI]).Clear;
    if Components[wI] is TCheckBox then
      TCheckBox(Components[wI]).Checked := False;
  end;
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
