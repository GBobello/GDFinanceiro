/////////////////////////////////////////////////////////////////////////////
{
    Unit Novo
    Criação: Gabriel Bobello
}
/////////////////////////////////////////////////////////////////////////////

unit gdNovo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gdCardPanels_Padrao, System.ImageList,
  Vcl.ImgList, Vcl.Buttons, Vcl.ExtCtrls, Vcl.WinXPanels, Vcl.StdCtrls, GD_Edit,
  Vcl.Mask, GD_MaskEdit_Data, Vcl.DBCtrls, Vcl.Samples.Spin, GD_SpinEdit,
  GD_DBLookupComboBox, gdFuncoes, Data.DB, Vcl.Grids, Vcl.DBGrids, udmConexao,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  GD_ComboBox, gdClasses_GD, gdSimples, udmNovo, System.Actions, Vcl.ActnList,
  gdLogSistema, gdUsuarioLogado, StrUtils;

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
    cardFiltro: TCard;
    pnFiltro: TPanel;
    pnCentral: TPanel;
    lbSofas: TLabel;
    lbDataInicial: TLabel;
    lbDataFinal: TLabel;
    lbResponsavelFiltro: TLabel;
    lbServicoFiltro: TLabel;
    mskDataInicial: TGD_MaskEdit_Data;
    mskDataFinal: TGD_MaskEdit_Data;
    cbServicos: TGD_ComboBox;
    cbUsuarios: TGD_ComboBox;
    cbSofas: TGD_ComboBox;
    spVoltar: TSpeedButton;
    pnBotoes: TPanel;
    pnBotoesRight: TPanel;
    pnbtnFiltrar: TPanel;
    spAplicaFiltro: TSpeedButton;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    imgListFiltro: TImageList;
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
    procedure spVoltarClick(Sender: TObject);
    procedure spAplicaFiltroClick(Sender: TObject);
    procedure spFiltrarClick(Sender: TObject);
    procedure spRetirarFiltroClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    FSQL: String;
    procedure SetaValor;
    procedure SetaSQLs;
    procedure SetSQL(const Value: String);
    procedure SetSQLTela(prFiltro: Boolean);
    { Private declarations }
  public
    { Public declarations }
    property SQL: String read FSQL write SetSQL;
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
    wTotal := dmNovo.queryConsulta.FieldByName('BDVALCOSTURA').AsCurrency +
      dmNovo.queryConsulta.FieldByName('BDVALCORTE').AsCurrency;
  wTotal := wTotal * spedQuantidade.Value;
  lbTotal.Caption := 'Total: ' + CurrToStrF(wTotal, ffCurrency, 2);
end;

procedure TfrNovo.SetSQL(const Value: String);
begin
  FSQL := Value;
end;

procedure TfrNovo.SetaSQLs;
begin
  if gdClasses_GD.fUsuarioLogado.IsAdm then
  begin
    lbTotal.Visible := True;
    dmNovo.cdsNovo.Close;
    dmNovo.cdsNovo.CommandText := FSQL;
    dmNovo.cdsNovo.Open;
    dbGrid.Columns[6].Visible := True;
  end
  else
  begin
    lbTotal.Visible := False;
    dmNovo.cdsNovo.Close;
    dmNovo.cdsNovo.CommandText := FSQL;
    dmNovo.cdsNovo.Open;
    dbGrid.Columns[6].Visible := False;
  end;
  if gdClasses_GD.fValorSofa <> nil then
  begin
    cbModelo.ItemIndex := gdClasses_GD.fValorSofa.CodSofa - 1;
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
  cbSofas.Items := dmNovo.GetSofas;
  cbUsuarios.Items := dmNovo.GetUsuarios;
  SetSQLTela(False);
  SetaSQLs;
  cbResponsavel.ItemIndex := 0;
  cbSofas.ItemIndex := 0;
  cbUsuarios.ItemIndex := 0;
  cbServicos.ItemIndex := 0;
end;

procedure TfrNovo.FormResize(Sender: TObject);
begin
  inherited;
  fFuncoes.SetCentralizaControles(TControl(pnFiltro), TControl(pnCentral));
end;

procedure TfrNovo.FormShow(Sender: TObject);
begin
  inherited;
  cdPanel.ActiveCard := cardCadastroUsuarios;
  dmNovo.cdsNovo.Insert;
  fFuncoes.SetCentralizaControles(TControl(pnEditsCadastro),
    TControl(pnCentralCadastros));
end;

procedure TfrNovo.SetSQLTela(prFiltro: Boolean);
var
  wWhere: String;

  procedure AddWhere(prCond: String);
  begin
    if prCond <> '' then
    begin
      if wWhere <> '' then
        wWhere := wWhere + ' and '
      else
        wWhere := wWhere + ' where ';

      wWhere := wWhere + prCond;
    end;
  end;

begin
  // Pegar o sql da pesquisa
  wWhere := '';

  if gdClasses_GD.fUsuarioLogado.IsAdm then
  begin
    FSQL := 'select SERV.*, USU.BDNOMUSU, MOL.BDDESCSOFA, ' +
      'case SERV.BDSERVICO ' + 'when ' + QuotedStr('1') + ' then ' +
      QuotedStr('Corte') + ' ' + 'when ' + QuotedStr('2') + ' then ' +
      QuotedStr('Costura') + ' ' + 'when ' + QuotedStr('3') + ' then ' +
      QuotedStr('Corte + Costura') + ' ' + 'end as BDSERVICOPALAVRA ' +
      'from TB_SERVICOS SERV ' +
      'inner join TB_USUARIOS USU on (SERV.BDCODUSU = USU.BDCODUSU) ' +
      'inner join TB_SOFAS MOL on (SERV.BDCODSOFA = MOL.BDCODSOFA) ';
  end
  else
  begin
    FSQL := 'select SERV.*, USU.BDNOMUSU, MOL.BDDESCSOFA, ' +
      'case SERV.BDSERVICO ' + 'when ' + QuotedStr('1') + ' then ' +
      QuotedStr('Corte') + ' ' + 'when ' + QuotedStr('2') + ' then ' +
      QuotedStr('Costura') + ' ' + 'when ' + QuotedStr('3') + ' then ' +
      QuotedStr('Corte + Costura') + ' ' + 'end as BDSERVICOPALAVRA ' +
      'from TB_SERVICOS SERV ' +
      'inner join TB_USUARIOS USU on (SERV.BDCODUSU = USU.BDCODUSU) ' +
      'inner join TB_SOFAS MOL on (SERV.BDCODSOFA = MOL.BDCODSOFA) ' +
      'where SERV.BDCODUSU = ' + IntToStr(gdClasses_GD.fUsuarioLogado.ID);
  end;

  if prFiltro then
  begin
    if (cbSofas.ItemIndex <> 0) or (cbUsuarios.ItemIndex <> 0) or
      (cbServicos.ItemIndex <> 0) or (Trim(mskDataInicial.Text) <> '/  /') or
      (Trim(mskDataFinal.Text) <> '/  /') then
    begin

      if cbSofas.ItemIndex <> 0 then
      begin
        AddWhere('(SERV.BDCODSOFA = ' + IntToStr(cbSofas.ItemIndex) + ')');
      end;

      if (Trim(mskDataInicial.Text) <> '/  /') and
        (Trim(mskDataFinal.Text) <> '/  /') then
      begin
        try
          StrToDate(mskDataInicial.Text);
        except
          on E: EConvertError do
          begin
            mskDataInicial.SetFocus;
            Application.MessageBox('Data inválida!', 'Atenção!',
              MB_OK + MB_ICONWARNING);
            Abort;
          end;
        end;

        try
          StrToDate(mskDataFinal.Text);
        except
          on E: EConvertError do
          begin
            mskDataFinal.SetFocus;
            Application.MessageBox('Data inválida!', 'Atenção!',
              MB_OK + MB_ICONWARNING);
            Abort;
          end;
        end;

        if StrToDate(Trim(mskDataInicial.Text)) >
          StrToDate(Trim(mskDataFinal.Text)) then
        begin
          Application.MessageBox
            ('A data inicial não pode ser maior que a final!', 'Atenção!',
            MB_OK + MB_ICONWARNING);
          Abort;
        end;

        AddWhere('((SERV.BDDATASERV >= ' +
          QuotedStr(AnsiReplaceStr(Trim(mskDataInicial.Text), '/', '.')) +
          ') and (SERV.BDDATASERV <= ' +
          QuotedStr(AnsiReplaceStr(Trim(mskDataFinal.Text), '/', '.')) + '))');
      end;

      if cbUsuarios.ItemIndex <> 0 then
      begin
        AddWhere('(SERV.BDCODUSU = ' + IntToStr(cbUsuarios.ItemIndex) + ')');
      end;

      if cbServicos.ItemIndex <> 0 then
      begin
        AddWhere('(SERV.BDSERVICO = ' + IntToStr(cbServicos.ItemIndex) + ')');
      end;

      FSQL := FSQL + wWhere;
    end;
  end;

  FSQL := FSQL + ' order by SERV.BDCODSERV';
end;

procedure TfrNovo.spNovoItemClick(Sender: TObject);
begin
  inherited;
  LimparCampos;
  spedQuantidade.Value := 1;
  cbServico.ItemIndex := 0;
  dmNovo.cdsNovo.Insert;
end;

procedure TfrNovo.spRetirarFiltroClick(Sender: TObject);
begin
  inherited;
  // Retira filtro
  SetSQLTela(False);
  SetaSQLs;
  dbGrid.Refresh;
end;

procedure TfrNovo.spSalvarClick(Sender: TObject);
var
  wMsg: String;
  wLog: String;
  wChave: Integer;
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
  except
    on E: EConvertError do
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
    Application.MessageBox('A data não pode ser maior que a atual!', 'Atenção!',
      MB_OK + MB_ICONWARNING);
    Abort;
  end
  else if StrToDate(mskDataDoItem.Text) < StrToDate('01/01/1998') then
  begin
    mskDataDoItem.SetFocus;
    Application.MessageBox('A data não pode ser menor que 01/01/1998!',
      'Atenção!', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  wMsg := 'Registro alterado com sucesso!';
  wLog := 'Editando registro: Código: ' + dmNovo.cdsNovoBDCODSERV.AsString +
    ', Descrição: ' + dmNovo.cdsNovoBDDESCSOFA.AsString;

  if dmNovo.cdsNovo.State in [dsInsert] then
  begin
    // Vai pegar o código direto da generator na trigger before insert
    dmNovo.cdsNovoBDCODSERV.AsInteger := 0;
    wChave := dmNovo.GetUltimaChave + 1;
    wMsg := 'Registro inserido com sucesso!';
    wLog := 'Adicionando novo registro: Código: ' + IntToStr(wChave);
  end;

  gdLogSistema.AdicionarLog('Tela: Novo', wLog, Now,
    gdClasses_GD.fUsuarioLogado.ID);

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

  LimparCampos;
  cbServico.ItemIndex := 0;
  spedQuantidade.Value    := 1;
  cbModelo.ItemIndex      := 0;
  cbModelo.SetFocus;
  dmNovo.cdsNovo.Insert;

  inherited;
end;

procedure TfrNovo.spEditarClick(Sender: TObject);
begin
  inherited;
  dmNovo.cdsNovo.Edit;

  cbModelo.ItemIndex := dmNovo.cdsNovoBDCODSOFA.AsInteger - 1;
  mskDataDoItem.Text := dmNovo.cdsNovoBDDATASERV.AsString;
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

procedure TfrNovo.spVoltarClick(Sender: TObject);
begin
  inherited;
  cdPanel.ActiveCard := cardConsultaUsuarios;
  cbSofas.ItemIndex := 0;
  cbUsuarios.ItemIndex := 0;
  cbServicos.ItemIndex := 0;
  mskDataInicial.Clear;
  mskDataFinal.Clear;
end;

procedure TfrNovo.spExcluirClick(Sender: TObject);
begin
  inherited;
  if cdPanel.ActiveCard.Name = 'cardConsultaUsuarios' then
  begin
    if dmNovo.cdsNovo.IsEmpty then
    begin
      Application.MessageBox('Não há registros a serem excluidos!',
        'Confirmação!', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    if Application.MessageBox('Deseja realmente excluir esse registro?',
      'Pergunta!', MB_YESNO + MB_ICONQUESTION) <> mrYes then
      Exit;

    try
      dmNovo.cdsNovo.Delete;
      dmNovo.cdsNovo.ApplyUpdates(0);
      gdLogSistema.AdicionarLog('Tela: Novo', 'Excluindo registro! Código: ' +
        dmNovo.cdsNovoBDCODSERV.AsString + ', Descrição: ' +
        dmNovo.cdsNovoBDDESCSOFA.AsString, Now, gdClasses_GD.fUsuarioLogado.ID);
      Application.MessageBox('Registro excluído com sucesso!', 'Confirmação!',
        MB_OK + MB_ICONINFORMATION);
    except
      on E: Exception do
        Application.MessageBox(PWideChar(E.Message),
          'Erro ao excluir registro!', MB_OK + MB_ICONERROR);
    end;
  end;
end;

procedure TfrNovo.spFiltrarClick(Sender: TObject);
begin
  inherited;
  cdPanel.ActiveCard := cardFiltro;
  fFuncoes.SetCentralizaControles(TControl(pnFiltro), TControl(pnCentral));
end;

procedure TfrNovo.spAplicaFiltroClick(Sender: TObject);
begin
  inherited;
  SetSQLTela(True);
  SetaSQLs;
  dbGrid.Refresh;
  cbSofas.ItemIndex := 0;
  cbUsuarios.ItemIndex := 0;
  cbServicos.ItemIndex := 0;
  mskDataInicial.Clear;
  mskDataFinal.Clear;
  cdPanel.ActiveCard := cardConsultaUsuarios;
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
