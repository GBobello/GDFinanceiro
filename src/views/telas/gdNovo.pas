unit gdNovo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gdSimples, System.ImageList,
  Vcl.ImgList, Vcl.Buttons, Vcl.ExtCtrls, Vcl.WinXPanels, Vcl.StdCtrls, GD_Edit,
  Vcl.Mask, GD_MaskEdit_Data, Vcl.DBCtrls, Vcl.Samples.Spin, GD_SpinEdit,
  GD_DBLookupComboBox, gdFuncoes, Data.DB, Vcl.Grids, Vcl.DBGrids, udmConexao,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  GD_ComboBox, gdClasses_GD;

type
  TfrNovo = class(TfrSimples)
    cdPanel: TCardPanel;
    cardConsulta: TCard;
    cardCadastro: TCard;
    pnBotoesCadastro: TPanel;
    pnEditsCadastro: TPanel;
    spedQuantidade: TGD_SpinEdit;
    mskDataDoItem: TGD_MaskEdit_Data;
    edCodigo: TGD_Edit;
    lbCodigo: TLabel;
    lbDataDoItem: TLabel;
    lbResponsavel: TLabel;
    lbQuantidade: TLabel;
    lbModelo: TLabel;
    pnCentralCadastro: TPanel;
    dbcbModelo: TGD_DBLookupComboBox;
    dbcbResponsavel: TGD_DBLookupComboBox;
    pnLeftBotoesCadastro: TPanel;
    pnCancelar: TPanel;
    pnConsultar: TPanel;
    pnSalvar: TPanel;
    spSalvar: TSpeedButton;
    spConsultar: TSpeedButton;
    spCancelar: TSpeedButton;
    pnCimaSalvar: TPanel;
    pnBaixoSalvar: TPanel;
    pnDireitaSalvar: TPanel;
    pnEsquerdaSalvar: TPanel;
    pnCimaConsultar: TPanel;
    pnBaixoConsultar: TPanel;
    pnDireitaConsultar: TPanel;
    pnEsquerdaConsultar: TPanel;
    pnCimaCancelar: TPanel;
    pnBaixoCancelar: TPanel;
    pnDireitaCancelar: TPanel;
    pnEsquerdaCancelar: TPanel;
    pnBotoesConsulta: TPanel;
    pnLeftBotoes: TPanel;
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
    imageList: TImageList;
    pnCentralPesquisa: TPanel;
    pnPesquisa: TPanel;
    DBGrid1: TDBGrid;
    dsResponsavel: TDataSource;
    dsModelo: TDataSource;
    queryModelo: TFDQuery;
    lbTotal: TLabel;
    cbServico: TGD_ComboBox;
    lbServico: TLabel;
    queryUsuarios: TFDQuery;
    queryConsulta: TFDQuery;
    procedure FormResize(Sender: TObject);
    procedure spNovoItemClick(Sender: TObject);
    procedure spEditarClick(Sender: TObject);
    procedure spConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spCancelarClick(Sender: TObject);
    procedure cbServicoChange(Sender: TObject);
    procedure cbServicoEnter(Sender: TObject);
    procedure dsModeloUpdateData(Sender: TObject);
    {$REGION 'Controla Foco dos Botões'}
//    procedure spSalvarMouseEnter(Sender: TObject);
//    procedure spSalvarMouseLeave(Sender: TObject);
//    procedure spConsultarMouseEnter(Sender: TObject);
//    procedure spConsultarMouseLeave(Sender: TObject);
//    procedure spCancelarMouseEnter(Sender: TObject);
//    procedure spCancelarMouseLeave(Sender: TObject);
//    procedure spNovoItemMouseEnter(Sender: TObject);
//    procedure spNovoItemMouseLeave(Sender: TObject);
//    procedure spEditarMouseEnter(Sender: TObject);
//    procedure spEditarMouseLeave(Sender: TObject);
//    procedure spExcluirMouseEnter(Sender: TObject);
//    procedure spExcluirMouseLeave(Sender: TObject);
    {$ENDREGION}
  private
    procedure SetaValor;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frNovo: TfrNovo;
  fFuncoes: TFuncoes;

implementation

{$R *.dfm}

procedure TfrNovo.FormShow(Sender: TObject);
begin
  inherited;
  cdPanel.ActiveCard := cardCadastro;
  fFuncoes.SetCentralizaControles(TControl(pnEditsCadastro), TControl(pnCentralCadastro));
end;

procedure TfrNovo.cbServicoChange(Sender: TObject);
begin
  inherited;
  SetaValor;
end;

procedure TfrNovo.SetaValor;
var
  wTotal: Currency;
begin
  queryConsulta.SQL.Clear;
  queryConsulta.SQL.Add('SELECT * FROM TB_SOFAS WHERE BDCODSOFA = :ID');
  queryConsulta.ParamByName('ID').AsInteger := dbcbModelo.KeyValue;
  queryConsulta.Open;
  if cbServico.ItemIndex = 0 then
  begin
    wTotal := queryConsulta.FieldByName('BDVALCORTE').AsCurrency;
  end
  else if cbServico.ItemIndex = 1 then
    wTotal := queryConsulta.FieldByName('BDVALCOSTURA').AsCurrency
  else
    wTotal := queryConsulta.FieldByName('BDVALCOSTURA').AsCurrency + queryConsulta.FieldByName('BDVALCORTE').AsCurrency;
  lbTotal.Caption := 'Total: R$ ' + CurrTostr(wTotal);
end;

procedure TfrNovo.cbServicoEnter(Sender: TObject);
begin
  inherited;
  SetaValor;
end;

procedure TfrNovo.dsModeloUpdateData(Sender: TObject);
begin
  inherited;
  SetaValor;
end;

procedure TfrNovo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  queryModelo.Active := False;
  queryUsuarios.Active := False;
end;

procedure TfrNovo.FormCreate(Sender: TObject);
begin
  inherited;
  if gdClasses_GD.fUsuarioLogado.IsAdm then
  begin
    lbTotal.Visible := True;
  end
  else
  begin
    queryUsuarios.SQL.Clear;
    queryUsuarios.SQL.Add('SELECT * FROM TB_USUARIOS WHERE BDCODUSU = :ID');
    queryUsuarios.ParamByName('ID').AsInteger := gdClasses_GD.fUsuarioLogado.ID;
    queryUsuarios.Open;
  end;

  queryModelo.Active       := True;
  queryUsuarios.Active     := True;
  dbcbModelo.KeyValue      := 1;
  dbcbResponsavel.KeyValue := 1;
  SetaValor;
end;

procedure TfrNovo.FormResize(Sender: TObject);
begin
  inherited;
  fFuncoes.SetCentralizaControles(TControl(pnEditsCadastro), TControl(pnCentralCadastro));
end;

procedure TfrNovo.spNovoItemClick(Sender: TObject);
begin
  inherited;
  cdPanel.ActiveCard := cardCadastro;
end;

procedure TfrNovo.spEditarClick(Sender: TObject);
begin
  inherited;
  cdPanel.ActiveCard := cardCadastro;
end;

procedure TfrNovo.spCancelarClick(Sender: TObject);
begin
  inherited;
  edCodigo.Clear;
  mskDataDoItem.Clear;
  spedQuantidade.Text := '0';
  cbServico.ItemIndex := 0;
  lbTotal.Caption := 'Total: R$ 0,00';
end;

procedure TfrNovo.spConsultarClick(Sender: TObject);
begin
  inherited;
  cdPanel.ActiveCard := cardConsulta;
end;


{$REGION 'Controla o Foco dos Botões'}
//procedure TfrNovo.spCancelarMouseEnter(Sender: TObject);
//begin
//  inherited;
//  fFuncoes.SetaFocoBotoes(TComponent(Sender) as TSpeedButton, TComponent(Sender).GetParentComponent as TPanel, True, $007171FD);
//end;
//
//procedure TfrNovo.spCancelarMouseLeave(Sender: TObject);
//begin
//  inherited;
//  fFuncoes.SetaFocoBotoes(TComponent(Sender) as TSpeedButton, TComponent(Sender).GetParentComponent as TPanel, False, $007171FD);
//end;
//
//procedure TfrNovo.spConsultarMouseEnter(Sender: TObject);
//begin
//  inherited;
//  fFuncoes.SetaFocoBotoes(TComponent(Sender) as TSpeedButton, TComponent(Sender).GetParentComponent as TPanel, True, $00049E9F);
//end;
//
//procedure TfrNovo.spConsultarMouseLeave(Sender: TObject);
//begin
//  inherited;
//  fFuncoes.SetaFocoBotoes(TComponent(Sender) as TSpeedButton, TComponent(Sender).GetParentComponent as TPanel, False, $00049E9F);
//end;
//
//procedure TfrNovo.spEditarMouseEnter(Sender: TObject);
//begin
//  inherited;
//  fFuncoes.SetaFocoBotoes(TComponent(Sender) as TSpeedButton, TComponent(Sender).GetParentComponent as TPanel, True, $00fdbe71);
//end;
//
//procedure TfrNovo.spEditarMouseLeave(Sender: TObject);
//begin
//  inherited;
//  fFuncoes.SetaFocoBotoes(TComponent(Sender) as TSpeedButton, TComponent(Sender).GetParentComponent as TPanel, False, $00fdbe71);
//end;
//
//procedure TfrNovo.spExcluirMouseEnter(Sender: TObject);
//begin
//  inherited;
//  fFuncoes.SetaFocoBotoes(TComponent(Sender) as TSpeedButton, TComponent(Sender).GetParentComponent as TPanel, True, $007171FD);
//end;
//
//procedure TfrNovo.spExcluirMouseLeave(Sender: TObject);
//begin
//  inherited;
//  fFuncoes.SetaFocoBotoes(TComponent(Sender) as TSpeedButton, TComponent(Sender).GetParentComponent as TPanel, False, $007171FD);
//end;
//
//procedure TfrNovo.spNovoItemMouseEnter(Sender: TObject);
//begin
//  inherited;
//  fFuncoes.SetaFocoBotoes(TComponent(Sender) as TSpeedButton, TComponent(Sender).GetParentComponent as TPanel, True, $00ffab76);
//end;
//
//procedure TfrNovo.spNovoItemMouseLeave(Sender: TObject);
//begin
//  inherited;
//  fFuncoes.SetaFocoBotoes(TComponent(Sender) as TSpeedButton, TComponent(Sender).GetParentComponent as TPanel, False, $00ffab76);
//end;
//
//procedure TfrNovo.spSalvarMouseEnter(Sender: TObject);
//begin
//  inherited;
//  fFuncoes.SetaFocoBotoes(TComponent(Sender) as TSpeedButton, TComponent(Sender).GetParentComponent as TPanel, True, $00458F36);
//end;
//
//procedure TfrNovo.spSalvarMouseLeave(Sender: TObject);
//begin
//  inherited;
//  fFuncoes.SetaFocoBotoes(TComponent(Sender) as TSpeedButton, TComponent(Sender).GetParentComponent as TPanel, False, $006FFF6F);
//end;
{$ENDREGION}

end.
