unit gdRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gdSimples, System.ImageList,
  Vcl.ImgList, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, GD_ComboBox, Vcl.Mask,
  GD_MaskEdit_Data, GD_Edit, udmRelatorio, gdFuncoes;

type
  TfrRelatorio = class(TfrSimples)
    pnCentral: TPanel;
    mskDataInicial: TGD_MaskEdit_Data;
    mskDataFinal: TGD_MaskEdit_Data;
    cbServicos: TGD_ComboBox;
    cbUsuarios: TGD_ComboBox;
    cbSofas: TGD_ComboBox;
    lbModelo: TLabel;
    lbDataInicial: TLabel;
    lbDataFinal: TLabel;
    lbResponsavel: TLabel;
    lbServico: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frRelatorio: TfrRelatorio;
  fFuncoes: TFuncoes;

implementation

{$R *.dfm}

procedure TfrRelatorio.FormCreate(Sender: TObject);
begin
  inherited;
  cbSofas.Items := dmRelatorios.GetSofas;
  cbUsuarios.Items := dmRelatorios.GetUsuarios;
  cbSofas.ItemIndex := 0;
  cbUsuarios.ItemIndex := 0;
end;

procedure TfrRelatorio.FormResize(Sender: TObject);
begin
  inherited;
  fFuncoes.SetCentralizaControles(TControl(pnPrincipal), TControl(pnCentral));
end;

procedure TfrRelatorio.FormShow(Sender: TObject);
begin
  inherited;
  fFuncoes.SetCentralizaControles(TControl(pnPrincipal), TControl(pnCentral));
end;

end.
