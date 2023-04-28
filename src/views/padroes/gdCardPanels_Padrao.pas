unit gdCardPanels_Padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gdSimples, System.ImageList,
  Vcl.ImgList, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXPanels, gdFuncoes, GD_Edit, System.Actions, Vcl.ActnList;

type
  TfrCardPanels_Padrao = class(TfrSimples)
    cdPanel: TCardPanel;
    cardConsultaUsuarios: TCard;
    pnBotoesConsulta: TPanel;
    pnLeftBotoesConsulta: TPanel;
    pnExcluir: TPanel;
    spExcluir: TSpeedButton;
    pnCimaExcluir: TPanel;
    pnBaixoExcluir: TPanel;
    pnDireitaExcluir: TPanel;
    pnEsquerdaExcluir: TPanel;
    pnEditar: TPanel;
    spEditar: TSpeedButton;
    pnCimaEditar: TPanel;
    pnBaixoEditar: TPanel;
    pnDireitaEditar: TPanel;
    pnEsquerdaEditar: TPanel;
    pnNovoItem: TPanel;
    spNovoItem: TSpeedButton;
    pnCimaNovoItem: TPanel;
    pnBaixoNovoItem: TPanel;
    pnDireitaNovoItem: TPanel;
    pnEsquerdaNovoItem: TPanel;
    pnPesquisa: TPanel;
    pnCentralPesquisa: TPanel;
    dbGrid: TDBGrid;
    cardCadastroUsuarios: TCard;
    pnBotoesCadastro: TPanel;
    pnLeftBotoesCadastro: TPanel;
    pnCancelar: TPanel;
    spCancelar: TSpeedButton;
    pnCimaCancelar: TPanel;
    pnBaixoCancelar: TPanel;
    pnDireitaCancelar: TPanel;
    pnEsquerdaCancelar: TPanel;
    pnConsultar: TPanel;
    spConsultar: TSpeedButton;
    pnCimaConsultar: TPanel;
    pnBaixoConsultar: TPanel;
    pnDireitaConsultar: TPanel;
    pnEsquerdaConsultar: TPanel;
    pnSalvar: TPanel;
    spSalvar: TSpeedButton;
    pnCimaSalvar: TPanel;
    pnBaixoSalvar: TPanel;
    pnDireitaSalvar: TPanel;
    pnEsquerdaSalvar: TPanel;
    pnEditsCadastro: TPanel;
    pnCentralCadastros: TPanel;
    imageList: TImageList;
    GD_Edit1: TGD_Edit;
    Label1: TLabel;
    procedure spConsultarClick(Sender: TObject);
    procedure spEditarClick(Sender: TObject);
    procedure spCancelarClick(Sender: TObject);
    procedure spNovoItemClick(Sender: TObject);
    procedure spSalvarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure dbGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbGridDblClick(Sender: TObject);
  private
    procedure AjustaTamanhoCelulas;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frCardPanels_Padrao: TfrCardPanels_Padrao;
  fFuncoes: TFuncoes;

implementation

{$R *.dfm}

procedure TfrCardPanels_Padrao.dbGridDblClick(Sender: TObject);
begin
  inherited;
  spEditar.Click;
end;

procedure TfrCardPanels_Padrao.dbGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
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

procedure TfrCardPanels_Padrao.FormCreate(Sender: TObject);
var
  wI: Integer;
begin
  inherited;
  for wI := 0 to Pred(dbGrid.Columns.Count) do
  begin
    dbGrid.Columns[wI].Title.Color := $006D5545;
    dbGrid.Columns[wI].Title.Font.Color := clWhite;
    dbGrid.Columns[wI].Title.Font.Size := 8;
    dbGrid.Columns[wI].Title.Font.Style := [TFontStyle.fsBold];
  end;
end;

procedure TfrCardPanels_Padrao.AjustaTamanhoCelulas;
var
  wTotalWidth: Integer;
  wI: Integer;
  wColWidth: Integer;
begin
  wTotalWidth := 0;
  for wI := 0 to Pred(dbGrid.Columns.Count) do
    wTotalWidth := wTotalWidth + dbGrid.Columns[wI].Width;
  wColWidth := ((dbGrid.ClientWidth - 20) - wTotalWidth) div dbGrid.Columns.Count;
  for wI := 0 to Pred(dbGrid.Columns.Count) do
    dbGrid.Columns[wI].Width := dbGrid.Columns[wI].Width + wColWidth;
end;

procedure TfrCardPanels_Padrao.FormResize(Sender: TObject);
begin
  inherited;
  fFuncoes.SetCentralizaControles(TControl(pnEditsCadastro), TControl(pnCentralCadastros));
  AjustaTamanhoCelulas;
end;

procedure TfrCardPanels_Padrao.FormShow(Sender: TObject);
begin
  inherited;
  AjustaTamanhoCelulas;
end;

procedure TfrCardPanels_Padrao.spCancelarClick(Sender: TObject);
begin
  inherited;
  cdPanel.ActiveCard := cardConsultaUsuarios;
end;

procedure TfrCardPanels_Padrao.spConsultarClick(Sender: TObject);
begin
  inherited;
  cdPanel.ActiveCard := cardConsultaUsuarios;
  AjustaTamanhoCelulas;
end;

procedure TfrCardPanels_Padrao.spEditarClick(Sender: TObject);
begin
  inherited;
  cdPanel.ActiveCard := cardCadastroUsuarios;
  fFuncoes.SetCentralizaControles(TControl(pnEditsCadastro), TControl(pnCentralCadastros));
end;

procedure TfrCardPanels_Padrao.spNovoItemClick(Sender: TObject);
begin
  inherited;
  cdPanel.ActiveCard := cardCadastroUsuarios;
  fFuncoes.SetCentralizaControles(TControl(pnEditsCadastro), TControl(pnCentralCadastros));
end;

procedure TfrCardPanels_Padrao.spSalvarClick(Sender: TObject);
begin
  inherited;
  cdPanel.ActiveCard := cardConsultaUsuarios;
end;

end.
