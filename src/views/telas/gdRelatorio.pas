unit gdRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gdSimples, System.ImageList,
  Vcl.ImgList, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, GD_ComboBox, Vcl.Mask,
  GD_MaskEdit_Data, GD_Edit, udmRelatorio, gdFuncoes, StrUtils,
  gdRelatorioPreview, System.Actions, Vcl.ActnList, gdLogSistema, gdClasses_GD;

type
  TfrRelatorio = class(TfrSimples)
    pnCentral: TPanel;
    mskDataInicial: TGD_MaskEdit_Data;
    mskDataFinal: TGD_MaskEdit_Data;
    cbServicos: TGD_ComboBox;
    cbUsuarios: TGD_ComboBox;
    cbSofas: TGD_ComboBox;
    lbModelo: TLabel;
    lbDataInicial: TLabel;
    lbDataFinal: TLabel;
    lbResponsavel: TLabel;
    lbServico: TLabel;
    pnBotoesCadastro: TPanel;
    pnLeftBotoesCadastro: TPanel;
    pnSalvar: TPanel;
    spSalvar: TSpeedButton;
    pnCimaCancelar: TPanel;
    pnBaixoCancelar: TPanel;
    pnDireitaCancelar: TPanel;
    pnEsquerdaCancelar: TPanel;
    pnGerarRelatorio: TPanel;
    spGerarRelatorio: TSpeedButton;
    pnCimaSalvar: TPanel;
    pnBaixoSalvar: TPanel;
    pnDireitaSalvar: TPanel;
    pnEsquerdaSalvar: TPanel;
    ImageList: TImageList;
    actionListRelatorio: TActionList;
    aclSalvar: TAction;
    aclVisualizar: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spGerarRelatorioClick(Sender: TObject);
    procedure spSalvarClick(Sender: TObject);
  private
    { Private declarations }
    function GetSqlRelatorio: String;
  public
    { Public declarations }
  end;

var
  frRelatorio: TfrRelatorio;
  fFuncoes: TFuncoes;

implementation

{$R *.dfm}

procedure TfrRelatorio.FormCreate(Sender: TObject);
begin
  inherited;
  cbSofas.Items := dmRelatorios.GetSofas;
  cbUsuarios.Items := dmRelatorios.GetUsuarios;
  cbSofas.ItemIndex := 0;
  cbUsuarios.ItemIndex := 0;
  cbServicos.ItemIndex := 0;
end;

procedure TfrRelatorio.FormResize(Sender: TObject);
begin
  inherited;
  fFuncoes.SetCentralizaControles(TControl(pnPrincipal), TControl(pnCentral));
end;

procedure TfrRelatorio.FormShow(Sender: TObject);
begin
  inherited;
  fFuncoes.SetCentralizaControles(TControl(pnPrincipal), TControl(pnCentral));
end;

function TfrRelatorio.GetSqlRelatorio: String;
var
  wSql: String;
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
  inherited;
  wSql := 'SELECT SERV.*, USU.*, SOFA.*, ' +
          'CASE SERV.BDSERVICO ' +
                   'WHEN ' + QuotedStr('1') + ' THEN ' + QuotedStr('Corte') + ' ' +
                   'WHEN ' + QuotedStr('2') + ' THEN ' + QuotedStr('Costura') + ' ' +
                   'WHEN ' + QuotedStr('3') + ' THEN ' + QuotedStr('Corte e Costura') + ' ' +
                 'END AS BDSERVICOPALAVRA ' +
          'FROM TB_SERVICOS SERV ' +
          'INNER JOIN TB_USUARIOS USU ON (SERV.BDCODUSU = USU.BDCODUSU) ' +
          'INNER JOIN TB_SOFAS SOFA ON (SERV.BDCODSOFA = SOFA.BDCODSOFA)';
  wWhere := '';
  // Gerar o SQL do relatório

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
      except on E: EConvertError do
        begin
          mskDataInicial.SetFocus;
          Application.MessageBox('Data inválida!', 'Atenção!',
            MB_OK + MB_ICONWARNING);
          Abort;
        end;
      end;

      try
        StrToDate(mskDataFinal.Text);
      except on E: EConvertError do
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
        Application.MessageBox('A data inicial não pode ser maior que a final!',
          'Atenção!', MB_OK + MB_ICONWARNING);
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

    wSql := wSql + wWhere;
  end;

  wSql := wSql + ' order by SERV.BDDATASERV';
  Result := wSql;
end;

procedure TfrRelatorio.spGerarRelatorioClick(Sender: TObject);
begin
  if GetSqlRelatorio <> '' then
  begin

    dmRelatorios.queryRelatorios.SQL.Clear;
    dmRelatorios.queryRelatorios.SQL.Add(GetSqlRelatorio);
    dmRelatorios.queryRelatorios.Open;

    if dmRelatorios.queryRelatorios.IsEmpty then
    begin
      Application.MessageBox('Não há dados para gerar um relatório!',
        'Atenção!', MB_OK + MB_ICONWARNING);
      Abort;
    end;

    Application.CreateForm(TfrRelatorioPreview, frRelatorioPreview);
    frRelatorioPreview.Parent := frRelatorio.Parent;
    dmRelatorios.frxRelatorio.Preview := frRelatorioPreview.frxPreview1;
    frRelatorioPreview.Show;

    frRelatorioPreview.frxPreview1.SetFocus;

    dmRelatorios.frxRelatorio.ShowReport(True);

    gdLogSistema.AdicionarLog('Tela: Geração de relatórios',
      'Gerando relatório!', Now, gdClasses_GD.fUsuarioLogado.ID);
  end;

end;

procedure TfrRelatorio.spSalvarClick(Sender: TObject);
begin
  inherited;
  if GetSqlRelatorio <> '' then
  begin

    dmRelatorios.queryRelatorios.SQL.Clear;
    dmRelatorios.queryRelatorios.SQL.Add(GetSqlRelatorio);
    dmRelatorios.queryRelatorios.Open;

    if dmRelatorios.queryRelatorios.IsEmpty then
    begin
      Application.MessageBox('Não há dados para gerar um relatório!',
        'Atenção!', MB_OK + MB_ICONWARNING);
      Abort;
    end;

    dmRelatorios.frxRelatorio.PrepareReport();
    dmRelatorios.frxRelatorio.Export(dmRelatorios.frxPDFExport);
    gdLogSistema.AdicionarLog('Tela: Geração de relatórios',
      'Salvando relatório!', Now, gdClasses_GD.fUsuarioLogado.ID);
  end;
end;

end.
