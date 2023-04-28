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
    procedure spSalvarClick(Sender: TObject);
    procedure spExcluirClick(Sender: TObject);
    procedure cbServicoEnter(Sender: TObject);
    procedure cbServicoExit(Sender: TObject);
    procedure dbcbModeloEnter(Sender: TObject);
    procedure dsModeloDataChange(Sender: TObject; Field: TField);
    procedure spedQuantidadeExit(Sender: TObject);
    procedure spedQuantidadeChange(Sender: TObject);
    procedure dbGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    procedure SetaValor;
    procedure SetaSQLs;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frNovo: TfrNovo;
  fFuncoes: TFuncoes;
  wTotal: Currency;

implementation

{$R *.dfm}

procedure TfrNovo.cbServicoChange(Sender: TObject);
begin
  inherited;
  SetaValor;
end;

procedure TfrNovo.cbServicoEnter(Sender: TObject);
begin
  inherited;
  SetaValor;
end;

procedure TfrNovo.cbServicoExit(Sender: TObject);
begin
  inherited;
  SetaValor;
end;

procedure TfrNovo.dbcbModeloEnter(Sender: TObject);
begin
  inherited;
  SetaValor;
end;

procedure TfrNovo.dbcbModeloExit(Sender: TObject);
begin
  inherited;
  SetaValor
end;

procedure TfrNovo.dbGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  wLinha: Integer;
begin
  inherited;
//  wLinha := dbGrid.DataSource.DataSet.RecNo;
//
//  if Odd(wLinha) then
//    dbGrid.Canvas.Brush.Color := clMenu
//  else
//    dbGrid.Canvas.Brush.Color := clRed;
//
//  dbGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrNovo.dsModeloDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if dbcbModelo.KeyValue = null then
    dbcbModelo.KeyValue := 1;
  SetaValor;
end;

procedure TfrNovo.SetaValor;
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
  wTotal := wTotal * spedQuantidade.Value;
  lbTotal.Caption := 'Total: R$ ' + CurrTostr(wTotal);
end;

procedure TfrNovo.SetaSQLs;
begin
  if gdClasses_GD.fUsuarioLogado.IsAdm then
  begin
    lbTotal.Visible := True;
    dmNovo.cdsNovo.Close;
    dmNovo.cdsNovo.CommandText := 'select SERV.*, USU.BDNOMUSU, MOL.BDDESCSOFA, ' +
                                  'case SERV.BDSERVICO ' +
                                  'when ' + QuotedStr('0') + ' then ' + QuotedStr('Corte') + ' ' +
                                  'when ' + QuotedStr('1') + ' then ' + QuotedStr('Costura') + ' ' + 
                                  'when ' + QuotedStr('2') + ' then ' + QuotedStr('Corte + Costura') + ' ' +
                                  'end as BDSERVICOPALAVRA ' +
                                  'from TB_SERVICOS SERV ' +
                                  'inner join TB_USUARIOS USU on (SERV.BDCODUSU = USU.BDCODUSU) ' +
                                  'inner join TB_SOFAS MOL on (SERV.BDCODSOFA = MOL.BDCODSOFA)';
    dmNovo.cdsNovo.Open;
    dbGrid.Columns[6].Visible := True;
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
    lbTotal.Visible := False;
    dmNovo.cdsNovo.Close;
    dmNovo.cdsNovo.CommandText := 'select SERV.*, USU.BDNOMUSU, MOL.BDDESCSOFA, ' +
                                  'case SERV.BDSERVICO ' +
                                  'when ' + QuotedStr('0') + ' then ' + QuotedStr('Corte') + ' ' +
                                  'when ' + QuotedStr('1') + ' then ' + QuotedStr('Costura') + ' ' +
                                  'when ' + QuotedStr('2') + ' then ' + QuotedStr('Corte + Costura') + ' ' +
                                  'end as BDSERVICOPALAVRA ' +
                                  'from TB_SERVICOS SERV ' +
                                  'inner join TB_USUARIOS USU on (SERV.BDCODUSU = USU.BDCODUSU) ' +
                                  'inner join TB_SOFAS MOL on (SERV.BDCODSOFA = MOL.BDCODSOFA)';
    dmNovo.cdsNovo.Open;
    dbGrid.Columns[6].Visible := False;
    dmNovo.queryUsuarios.SQL.Clear;
    dmNovo.queryUsuarios.SQL.Add('SELECT * FROM TB_USUARIOS WHERE BDCODUSU = :ID');
    dmNovo.queryUsuarios.ParamByName('ID').AsInteger := gdClasses_GD.fUsuarioLogado.ID;
    dmNovo.queryUsuarios.Open;
    dmNovo.queryModelo.Close;
    dmNovo.queryModelo.SQL.Clear;
    dmNovo.queryModelo.SQL.Add('SELECT * FROM TB_SOFAS');
    dmNovo.queryModelo.Open;
  end;
  dmNovo.queryModelo.Active := True;
  dmNovo.queryUsuarios.Active := True;
  dbcbModelo.KeyValue := dmNovo.queryModelo.FieldByName('BDCODSOFA').AsInteger;
  dbcbResponsavel.KeyValue := dmNovo.queryUsuarios.FieldByName('BDCODUSU').AsInteger;
end;

procedure TfrNovo.FormCreate(Sender: TObject);
begin
  inherited;
  SetaSQLs;
end;

procedure TfrNovo.FormShow(Sender: TObject);
begin
  inherited;
  cdPanel.ActiveCard := cardCadastroUsuarios;
  fFuncoes.SetCentralizaControles(TControl(pnEditsCadastro), TControl(pnCentralCadastros));
end;

procedure TfrNovo.spNovoItemClick(Sender: TObject);
begin
  inherited;
  LimparCampos;
  spedQuantidade.Value := 1;
  cbServico.ItemIndex := 0;
  dmNovo.cdsNovo.Insert;
end;

procedure TfrNovo.spSalvarClick(Sender: TObject);
var
  wMsg: String;
begin
  if spedQuantidade.Value = 0 then
  begin
    spedQuantidade.SetFocus;
    Application.MessageBox('A quantidade não pode ser menor que 1!', 'Atenção!',
      MB_OK + MB_ICONWARNING);
    Abort;
  end;
  
  try
    StrToDate(mskDataDoItem.Text);
  except on E: EConvertError do
    begin
      mskDataDoItem.SetFocus;
      Application.MessageBox('Data inválida!', 'Atenção!',
        MB_OK + MB_ICONWARNING);
      Abort;
    end;
  end;
  
  if (mskDataDoItem.Text = '') then
  begin
    mskDataDoItem.SetFocus;
    Application.MessageBox('A data não pode ser vazia!', 'Atenção!',
      MB_OK + MB_ICONWARNING);
    Abort;
  end
  else if StrToDate(mskDataDoItem.Text) > Now then
  begin
    mskDataDoItem.SetFocus;
    Application.MessageBox('A data não pode ser maior que a atual!',
      'Atenção!', MB_OK + MB_ICONWARNING);
    Abort;
  end
  else if StrToDate(mskDataDoItem.Text) < StrToDate('01/01/1998')  then
  begin
    mskDataDoItem.SetFocus;
    Application.MessageBox('A data não pode ser menor que 01/01/1998!',
      'Atenção!', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  wMsg := 'Registro alterado com sucesso!';

  if dmNovo.cdsNovo.State in [dsInsert] then
  begin
    // Vai pegar o código direto da generator na trigger before insert
    dmNovo.cdsNovoBDCODSERV.AsInteger := 0;
    wMsg := 'Registro inserido com sucesso!';
  end;

  dmNovo.cdsNovoBDDATASERV.AsString := mskDataDoItem.Text;
  dmNovo.cdsNovoBDCODUSU.AsInteger := dbcbResponsavel.KeyValue;
  dmNovo.cdsNovoBDQUANTIDADE.AsInteger := spedQuantidade.Value;
  dmNovo.cdsNovoBDCODSOFA.AsInteger := dbcbModelo.KeyValue;
  dmNovo.cdsNovoBDSERVICO.AsInteger := cbServico.ItemIndex;
  dmNovo.cdsNovoBDTOTALSERV.AsCurrency := wTotal;

  dmNovo.cdsNovo.Post;
  dmNovo.cdsNovo.ApplyUpdates(0);
  Application.MessageBox(PWideChar(wMsg), 'Confirmação!',
    MB_OK + MB_ICONINFORMATION);

  SetaSQLs;
  dbGrid.Refresh;

  inherited;
end;

procedure TfrNovo.spEditarClick(Sender: TObject);
begin
  inherited;
  dmNovo.cdsNovo.Edit;

  dbcbModelo.KeyValue := dmNovo.cdsNovoBDCODSOFA.AsInteger;
  mskDataDoItem.Text  := dmNovo.cdsNovoBDDATASERV.AsString;
  spedQuantidade.Value := dmNovo.cdsNovoBDQUANTIDADE.AsInteger;
  dbcbResponsavel.KeyValue := dmNovo.cdsNovoBDCODUSU.AsInteger;
  cbServico.ItemIndex := dmNovo.cdsNovoBDSERVICO.AsInteger;
end;

procedure TfrNovo.spedQuantidadeChange(Sender: TObject);
begin
  inherited;
  SetaValor;
end;

procedure TfrNovo.spedQuantidadeExit(Sender: TObject);
begin
  inherited;
  SetaValor;
end;

procedure TfrNovo.spExcluirClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja realmente excluir esse registro?', 'Pergunta!', MB_YESNO + MB_ICONQUESTION) <> mrYes then
    Exit;

  try
    dmNovo.cdsNovo.Delete;
    dmNovo.cdsNovo.ApplyUpdates(0);
    Application.MessageBox('Registro excluído com sucesso!', 'Confirmação!', MB_OK + MB_ICONINFORMATION);
  except on E: Exception do
    Application.MessageBox(PWideChar(E.Message), 'Erro ao excluir registro!', MB_OK + MB_ICONERROR);
  end;
end;

procedure TfrNovo.spCancelarClick(Sender: TObject);
begin
  inherited;
  dmNovo.cdsNovo.Cancel;
end;

procedure TfrNovo.spConsultarClick(Sender: TObject);
begin
  inherited;
  dmNovo.cdsNovo.Cancel;
end;


end.
