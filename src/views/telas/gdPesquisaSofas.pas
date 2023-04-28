unit gdPesquisaSofas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gdPesquisa_Padrao, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, udmPesquisaSofas;

type
  TfrPesquisaSofas = class(TfrPesquisa_Padrao)
    procedure FormCreate(Sender: TObject);
  private
    procedure SetaSQL;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frPesquisaSofas: TfrPesquisaSofas;

implementation

{$R *.dfm}

procedure TfrPesquisaSofas.FormCreate(Sender: TObject);
begin
  inherited;
  SetaSQL;
end;

procedure TfrPesquisaSofas.SetaSQL;
begin
  dmPesquisaSofas.cdsPesquisaSofas.Close;
  dmPesquisaSofas.cdsPesquisaSofas.CommandText := 'select * from TB_SOFAS order by BDCODSOFA';
  dmPesquisaSofas.cdsPesquisaSofas.Open;
end;

end.
