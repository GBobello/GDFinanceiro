unit gdNovo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gdCardPanels_Padrao, System.ImageList,
  Vcl.ImgList, Vcl.Buttons, Vcl.ExtCtrls, Vcl.WinXPanels, Vcl.StdCtrls, GD_Edit,
  Vcl.Mask, GD_MaskEdit_Data, Vcl.DBCtrls, Vcl.Samples.Spin, GD_SpinEdit,
  GD_DBLookupComboBox, gdFuncoes, Data.DB, Vcl.Grids, Vcl.DBGrids, udmConexao,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  GD_ComboBox, gdClasses_GD, gdSimples, udmNovo;

type
  TfrNovo = class(TfrCardPanels_Padrao)
    dsUsuarios: TDataSource;
    dsModelo: TDataSource;
    cbServico: TGD_ComboBox;
    dbcbModelo: TGD_DBLookupComboBox;
    dbcbResponsavel: TGD_DBLookupComboBox;
    lbDataDoItem: TLabel;
    lbModelo: TLabel;
    lbQuantidade: TLabel;
    lbResponsavel: TLabel;
    lbServico: TLabel;
    lbTotal: TLabel;
    mskDataDoItem: TGD_MaskEdit_Data;
    spedQuantidade: TGD_SpinEdit;
    dsNovo: TDataSource;
    procedure spNovoItemClick(Sender: TObject);
    procedure spEditarClick(Sender: TObject);
    procedure spConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spCancelarClick(Sender: TObject);
    procedure cbServicoChange(Sender: TObject);
    procedure dbcbModeloExit(Sender: TObject);
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

procedure TfrNovo.cbServicoChange(Sender: TObject);
begin
  inherited;
  SetaValor;
end;

procedure TfrNovo.dbcbModeloExit(Sender: TObject);
begin
  inherited;
  SetaValor
end;

procedure TfrNovo.SetaValor;
var
  wTotal: Currency;
begin
  dmNovo.queryConsulta.SQL.Clear;
  dmNovo.queryConsulta.SQL.Add('SELECT * FROM TB_SOFAS WHERE BDCODSOFA = :ID');
  dmNovo.queryConsulta.ParamByName('ID').AsInteger := dbcbModelo.KeyValue;
  dmNovo.queryConsulta.Open;
  if cbServico.ItemIndex = 0 then
  begin
    wTotal := dmNovo.queryConsulta.FieldByName('BDVALCORTE').AsCurrency;
  end
  else if cbServico.ItemIndex = 1 then
    wTotal := dmNovo.queryConsulta.FieldByName('BDVALCOSTURA').AsCurrency
  else
    wTotal := dmNovo.queryConsulta.FieldByName('BDVALCOSTURA').AsCurrency + dmNovo.queryConsulta.FieldByName('BDVALCORTE').AsCurrency;
  lbTotal.Caption := 'Total: R$ ' + CurrTostr(wTotal);
end;

procedure TfrNovo.FormCreate(Sender: TObject);
begin
  inherited;
  if gdClasses_GD.fUsuarioLogado.IsAdm then
  begin
    lbTotal.Visible := True;

    dmNovo.cdsNovo.Close;
    dmNovo.cdsNovo.CommandText := 'select SERV.*, USU.BDNOMUSU, MOL.BDDESCSOFA ' +
                                  'from TB_SERVICOS SERV ' +
                                  'inner join TB_USUARIOS USU on (SERV.BDCODUSU = USU.BDCODUSU) ' +
                                  'inner join TB_SOFAS MOL on (SERV.BDCODSOFA = MOL.BDCODSOFA)';

    dmNovo.cdsNovo.Open;

    dmNovo.queryUsuarios.Close;
    dmNovo.queryUsuarios.SQL.Clear;
    dmNovo.queryUsuarios.SQL.Add('SELECT * FROM TB_USUARIOS');
    dmNovo.queryUsuarios.Open;

    dmNovo.queryModelo.Close;
    dmNovo.queryModelo.SQL.Clear;
    dmNovo.queryModelo.SQL.Add('SELECT * FROM TB_SOFAS');
    dmNovo.queryModelo.Open;
  end
  else
  begin
    dmNovo.queryUsuarios.SQL.Clear;
    dmNovo.queryUsuarios.SQL.Add('SELECT * FROM TB_USUARIOS WHERE BDCODUSU = :ID');
    dmNovo.queryUsuarios.ParamByName('ID').AsInteger := gdClasses_GD.fUsuarioLogado.ID;
    dmNovo.queryUsuarios.Open;

    dmNovo.queryModelo.Close;
    dmNovo.queryModelo.SQL.Clear;
    dmNovo.queryModelo.SQL.Add('SELECT * FROM TB_SOFAS');
    dmNovo.queryModelo.Open;
  end;
  dmNovo.queryModelo.Active   := True;
  dmNovo.queryUsuarios.Active := True;

  dbcbModelo.KeyValue := dmNovo.queryModelo.FieldByName('BDCODSOFA').AsInteger;
  dbcbResponsavel.KeyValue := dmNovo.queryUsuarios.FieldByName('BDCODUSU').AsInteger;
end;

procedure TfrNovo.spNovoItemClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrNovo.spEditarClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrNovo.spCancelarClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrNovo.spConsultarClick(Sender: TObject);
begin
  inherited;
  //
end;


end.
