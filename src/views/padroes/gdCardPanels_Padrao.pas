unit gdCardPanels_Padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gdSimples, System.ImageList,
  Vcl.ImgList, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXPanels, gdFuncoes, GD_Edit;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frCardPanels_Padrao: TfrCardPanels_Padrao;
  fFuncoes: TFuncoes;

implementation

{$R *.dfm}

procedure TfrCardPanels_Padrao.FormResize(Sender: TObject);
begin
  inherited;
  fFuncoes.SetCentralizaControles(TControl(pnEditsCadastro), TControl(pnCentralCadastros));
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
