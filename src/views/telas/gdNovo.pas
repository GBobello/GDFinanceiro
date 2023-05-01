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
  GD_ComboBox, gdClasses_GD, gdSimples, udmNovo, System.Actions, Vcl.ActnList;

type
  TfrNovo = class(TfrCardPanels_Padrao)
    dsUsuarios: TDataSource;
    dsModelo: TDataSource;
    cbServico: TGD_ComboBox;
    lbDataDoItem: TLabel;
    lbModelo: TLabel;
    lbQuantidade: TLabel;
    lbResponsavel: TLabel;
    lbServico: TLabel;
    lbTotal: TLabel;
    mskDataDoItem: TGD_MaskEdit_Data;
    spedQuantidade: TGD_SpinEdit;
    dsNovo: TDataSource;
    cbModelo: TGD_ComboBox;
    cbResponsavel: TGD_ComboBox;
    procedure spNovoItemClick(Sender: TObject);
    procedure spEditarClick(Sender: TObject);
    procedure spConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spCancelarClick(Sender: TObject);
    procedure cbServicoChange(Sender: TObject);
    procedure spSalvarClick(Sender: TObject);
    procedure spExcluirClick(Sender: TObject);
    procedure cbServicoEnter(Sender: TObject);
    procedure cbServicoExit(Sender: TObject);
    procedure spedQuantidadeExit(Sender: TObject);
    procedure spedQuantidadeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbModeloChange(Sender: TObject);
    procedure cbModeloEnter(Sender: TObject);
    procedure cbModeloExit(Sender: TObject);
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

procedure TfrNovo.cbModeloChange(Sender: TObject);
begin
  inherited;
  SetaValor;
end;

procedure TfrNovo.cbModeloEnter(Sender: TObject);
begin
  inherited;
  SetaValor;
end;

procedure TfrNovo.cbModeloExit(Sender: TObject);
begin
  inherited;
  SetaValor;
end;

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


procedure TfrNovo.SetaValor;
begin
  dmNovo.queryConsulta.SQL.Clear;
  dmNovo.queryConsulta.SQL.Add('SELECT * FROM TB_SOFAS WHERE BDCODSOFA = :ID');
  dmNovo.queryConsulta.ParamByName('ID').AsInteger := cbModelo.ItemIndex + 1;
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
  lbTotal.Caption := 'Total: ' + CurrToStrF(wTotal, ffCurrency, 2);
end;

procedure TfrNovo.SetaSQLs;
begin
  if gdClasses_GD.fUsuarioLogado.IsAdm then
  begin
    lbTotal.Visible := True;
    dmNovo.cdsNovo.Close;
    dmNovo.cdsNovo.CommandText := 'select SERV.*, USU.BDNOMUSU, MOL.BDDESCSOFA, ' +
                                  'case SERV.BDSERVICO ' +
                                  'when ' + QuotedStr('1') + ' then ' + QuotedStr('Corte') + ' ' +
                                  'when ' + QuotedStr('2') + ' then ' + QuotedStr('Costura') + ' ' +
                                  'when ' + QuotedStr('3') + ' then ' + QuotedStr('Corte + Costura') + ' ' +
                                  'end as BDSERVICOPALAVRA ' +
                                  'from TB_SERVICOS SERV ' +
                                  'inner join TB_USUARIOS USU on (SERV.BDCODUSU = USU.BDCODUSU) ' +
                                  'inner join TB_SOFAS MOL on (SERV.BDCODSOFA = MOL.BDCODSOFA) ' +
                                  'order by SERV.BDCODSERV';
    dmNovo.cdsNovo.Open;
    dbGrid.Columns[6].Visible := True;
  end
  else
  begin
    lbTotal.Visible := False;
    dmNovo.cdsNovo.Close;
    dmNovo.cdsNovo.CommandText := 'select SERV.*, USU.BDNOMUSU, MOL.BDDESCSOFA, ' +
                                  'case SERV.BDSERVICO ' +
                                  'when ' + QuotedStr('1') + ' then ' + QuotedStr('Corte') + ' ' +
                                  'when ' + QuotedStr('2') + ' then ' + QuotedStr('Costura') + ' ' +
                                  'when ' + QuotedStr('3') + ' then ' + QuotedStr('Corte + Costura') + ' ' +
                                  'end as BDSERVICOPALAVRA ' +
                                  'from TB_SERVICOS SERV ' +
                                  'inner join TB_USUARIOS USU on (SERV.BDCODUSU = USU.BDCODUSU) ' +
                                  'inner join TB_SOFAS MOL on (SERV.BDCODSOFA = MOL.BDCODSOFA) ' +
                                  'where SERV.BDCODUSU = ' + IntToStr(gdClasses_GD.fUsuarioLogado.ID) +
                                  ' order by SERV.BDCODSERV';
    dmNovo.cdsNovo.Open;
    dbGrid.Columns[6].Visible := False;
  end;
  if gdClasses_GD.fValorSofa <> nil then
  begin
    cbModelo.ItemIndex  := gdClasses_GD.fValorSofa.CodSofa - 1;
    gdClasses_GD.SetDeletaValorSofa;
  end
  else
    cbModelo.ItemIndex := 0;
end;

procedure TfrNovo.FormCreate(Sender: TObject);
begin
  inherited;
  cbModelo.Items := dmNovo.GetModelos;
  cbResponsavel.Items := dmNovo.GetResponsavel;
  SetaSQLs;
  cbResponsavel.ItemIndex := 0;
end;

procedure TfrNovo.FormShow(Sender: TObject);
begin
  inherited;
  cdPanel.ActiveCard := cardCadastroUsuarios;
  dmNovo.cdsNovo.Insert;
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
  dmNovo.cdsNovoBDCODUSU.AsInteger := cbResponsavel.ItemIndex + 1;
  dmNovo.cdsNovoBDQUANTIDADE.AsInteger := spedQuantidade.Value;
  dmNovo.cdsNovoBDCODSOFA.AsInteger := cbModelo.ItemIndex + 1;
  dmNovo.cdsNovoBDSERVICO.AsInteger := cbServico.ItemIndex + 1;
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

  cbModelo.ItemIndex := dmNovo.cdsNovoBDCODSOFA.AsInteger - 1;
  mskDataDoItem.Text  := dmNovo.cdsNovoBDDATASERV.AsString;
  spedQuantidade.Value := dmNovo.cdsNovoBDQUANTIDADE.AsInteger;
  cbResponsavel.ItemIndex := dmNovo.cdsNovoBDCODUSU.AsInteger - 1;
  cbServico.ItemIndex := dmNovo.cdsNovoBDSERVICO.AsInteger - 1;
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
  if cdPanel.ActiveCard.Name = 'cardConsultaUsuarios' then
  begin
    if dmNovo.cdsNovo.IsEmpty then
    begin
      Application.MessageBox('Não há registros a serem excluidos!', 'Confirmação!', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

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
