unit gdRelatorioPreview;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gdSimples, frxClass, frxPreview,
  System.ImageList, Vcl.ImgList, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  udmRelatorio, frxExportBaseDialog, frxExportPDF;

type
  TfrRelatorioPreview = class(TfrSimples)
    Panel1: TPanel;
    frxPreview1: TfrxPreview;
    pnBotoes: TPanel;
    SpeedButton1: TSpeedButton;
    PDFExport: TfrxPDFExport;
    imageList: TImageList;
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frRelatorioPreview: TfrRelatorioPreview;

implementation

{$R *.dfm}

procedure TfrRelatorioPreview.FormMouseWheel(Sender: TObject;
  Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);
begin
  inherited;
  frxPreview1.MouseWheelScroll(WheelDelta, Shift, MousePos);
end;

procedure TfrRelatorioPreview.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  //
  dmRelatorios.frxRelatorio.PrepareReport();
  dmRelatorios.frxRelatorio.Export(PDFExport);
end;

end.
