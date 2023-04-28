unit gdPesquisa_Padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gdSimples, System.ImageList,
  Vcl.ImgList, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrPesquisa_Padrao = class(TfrSimples)
    pnPesquisa: TPanel;
    pnGrid: TPanel;
    dbGrid: TDBGrid;
    dsPesquisa: TDataSource;
    procedure dbGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frPesquisa_Padrao: TfrPesquisa_Padrao;

implementation

{$R *.dfm}

procedure TfrPesquisa_Padrao.dbGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
//
  if Odd(dbGrid.DataSource.DataSet.RecNo) then
    dbGrid.Canvas.Brush.Color := $00E9E9E9
  else
    dbGrid.Canvas.Brush.Color := clWhite;

  if (gdSelected in State) then
  begin
    dbGrid.Canvas.Brush.Color := clBlue;//$00FBCDAE;
    dbGrid.Canvas.Font.Color := clWhite;
    dbGrid.Canvas.Font.Style  := [TFontStyle.fsBold];
  end;

  dbGrid.Canvas.FillRect(Rect);
  dbGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
