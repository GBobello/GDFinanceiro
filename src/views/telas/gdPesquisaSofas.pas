/////////////////////////////////////////////////////////////////////////////
{
    Unit PesquisaSofas
    Criação: Gabriel Bobello
}
/////////////////////////////////////////////////////////////////////////////

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
    procedure edPesquisaChange(Sender: TObject);
  private
    FSQLTela: String;
    procedure SetaSQL;
    procedure SetSQLTela(const Value: String);
    { Private declarations }
    property SQLTela: String read FSQLTela write SetSQLTela;
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
  if not Assigned(frNovo) then
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
    dbGridDblClick(Self);
//    gdClasses_GD.SetValorSofa(dmPesquisaSofas.cdsPesquisaSofasBDCODSOFA.Value);
//    spMinimiza.Click;
//    Application.CreateForm(TfrNovo, frNovo);
//    frNovo.Parent := frPesquisaSofas.Parent;
//    frNovo.Show;
//    frNovo.SetFocus;
  end;
end;

procedure TfrPesquisaSofas.edPesquisaChange(Sender: TObject);
begin
  inherited;
  SetaSQL;
end;

procedure TfrPesquisaSofas.FormCreate(Sender: TObject);
begin
  inherited;
  SetaSQL;
end;

procedure TfrPesquisaSofas.SetaSQL;
var
  wWhere: String;
begin
  wWhere := '';
  if Trim(edPesquisa.Text) <> '' then
  begin
    wWhere := ' WHERE BDDESCSOFA LIKE ' + QuotedStr('%' + edPesquisa.Text + '%');
    FSQLTela := 'select * from TB_SOFAS' + wWhere;
  end
  else
    FSQLTela := 'select * from TB_SOFAS';


  dmPesquisaSofas.cdsPesquisaSofas.Close;
  dmPesquisaSofas.cdsPesquisaSofas.CommandText := FSQLTela + ' order by BDCODSOFA';
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

procedure TfrPesquisaSofas.SetSQLTela(const Value: String);
begin
  FSQLTela := Value;
end;

end.

