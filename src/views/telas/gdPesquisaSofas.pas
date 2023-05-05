unit gdPesquisaSofas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gdPesquisa_Padrao, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, udmPesquisaSofas, gdClasses_GD, gdNovo, GD_Edit;

type
  TfrPesquisaSofas = class(TfrPesquisa_Padrao)
    edPesquisa: TGD_Edit;
    procedure FormCreate(Sender: TObject);
    procedure dbGridDblClick(Sender: TObject);
    procedure dbGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TfrPesquisaSofas.dbGridDblClick(Sender: TObject);
begin
  inherited;
  gdClasses_GD.SetValorSofa(dmPesquisaSofas.cdsPesquisaSofasBDCODSOFA.Value);
  spMinimiza.Click;
  Application.CreateForm(TfrNovo, frNovo);
  frNovo.Parent := frPesquisaSofas.Parent;
  frNovo.Show;
  frNovo.SetFocus;
end;

procedure TfrPesquisaSofas.dbGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    gdClasses_GD.SetValorSofa(dmPesquisaSofas.cdsPesquisaSofasBDCODSOFA.Value);
    spMinimiza.Click;
    Application.CreateForm(TfrNovo, frNovo);
    frNovo.Parent := frPesquisaSofas.Parent;
    frNovo.Show;
    frNovo.SetFocus;
  end;
end;

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
  if gdClasses_GD.fUsuarioLogado.IsAdm then
  begin
    dbGrid.Columns[2].Visible := True;
    dbGrid.Columns[3].Visible := True;
    dbGrid.Columns[4].Visible := True;
  end
  else
  begin
    dbGrid.Columns[2].Visible := False;
    dbGrid.Columns[3].Visible := False;
    dbGrid.Columns[4].Visible := False;
  end;
end;

end.
