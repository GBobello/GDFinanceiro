/////////////////////////////////////////////////////////////////////////////
{
    Unit NovoSofa
    Criação: Gabriel Bobello
}
/////////////////////////////////////////////////////////////////////////////

unit gdNovoSofa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gdCardPanels_Padrao, Data.DB,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXPanels, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  udmNovoSofa, GD_Edit, Vcl.Mask, GD_MaskEdit_Valor, gdLogSistema,
  gdClasses_GD, System.StrUtils, gdFormat, GD_Edit_Formatado;

type
  TfrNovoSofa = class(TfrCardPanels_Padrao)
    dsNovoSofa: TDataSource;
    edDescricaoSofa: TGD_Edit;
    lbDescricaoSofa: TLabel;
    lbValorCorte: TLabel;
    lbValorCostura: TLabel;
    lbMinutos: TLabel;
    edValorCorte: TGD_Edit_Formatado;
    edValorCostura: TGD_Edit_Formatado;
    edQtdMinutos: TGD_Edit_Formatado;
    procedure FormCreate(Sender: TObject);
    procedure spConsultarClick(Sender: TObject);
    procedure spCancelarClick(Sender: TObject);
    procedure spExcluirClick(Sender: TObject);
    procedure spEditarClick(Sender: TObject);
    procedure spNovoItemClick(Sender: TObject);
    procedure spSalvarClick(Sender: TObject);
    procedure edQtdMinutosChange(Sender: TObject);
    procedure edValorCosturaChange(Sender: TObject);
    procedure edValorCorteChange(Sender: TObject);
  private
    procedure SetaSQLs;
    procedure SetaFormatacao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frNovoSofa: TfrNovoSofa;

implementation

{$R *.dfm}

procedure TfrNovoSofa.edQtdMinutosChange(Sender: TObject);
begin
  inherited;
  Formatar(edQtdMinutos, edQtdMinutos.Formato);
end;

procedure TfrNovoSofa.edValorCorteChange(Sender: TObject);
begin
  inherited;
  Formatar(edValorCorte, edValorCorte.Formato);
end;

procedure TfrNovoSofa.edValorCosturaChange(Sender: TObject);
begin
  inherited;
  Formatar(edValorCostura, edValorCostura.Formato);
end;

procedure TfrNovoSofa.FormCreate(Sender: TObject);
begin
  inherited;
  SetaSQLs;
  dmNovoSofa.cdsNovoSofa.Insert;
  SetaFormatacao;
end;

procedure TfrNovoSofa.spCancelarClick(Sender: TObject);
begin
  inherited;
  dmNovoSofa.cdsNovoSofa.Cancel;
end;

procedure TfrNovoSofa.spConsultarClick(Sender: TObject);
begin
  inherited;
  dmNovoSofa.cdsNovoSofa.Cancel;
end;

procedure TfrNovoSofa.spEditarClick(Sender: TObject);
begin
  inherited;
  dmNovoSofa.cdsNovoSofa.Edit;

  edDescricaoSofa.Text := dmNovoSofa.cdsNovoSofaBDDESCSOFA.AsString;
  edValorCorte.Text := CurrToStrF(dmNovoSofa.cdsNovoSofaBDVALCORTE.AsCurrency,
    ffCurrency, 2);
  edValorCostura.Text :=
    CurrToStrF(dmNovoSofa.cdsNovoSofaBDVALCOSTURA.AsCurrency, ffCurrency, 2);
  edQtdMinutos.Text := CurrToStrF(dmNovoSofa.cdsNovoSofaBDHORAS.AsCurrency,
    ffCurrency, 2);
end;

procedure TfrNovoSofa.spExcluirClick(Sender: TObject);
begin
  inherited;
  if cdPanel.ActiveCard.Name = 'cardConsultaUsuarios' then
  begin
    if dmNovoSofa.cdsNovoSofa.IsEmpty then
    begin
      Application.MessageBox('Não há registros a serem excluídos!',
        'Confirmação!', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    if Application.MessageBox('Deseja realmente excluir esse registro?',
      'Pergunta!', MB_YESNO + MB_ICONQUESTION) <> mrYes then
      Exit;

    try
      dmNovoSofa.cdsNovoSofa.Delete;
      dmNovoSofa.cdsNovoSofa.ApplyUpdates(0);
      gdLogSistema.AdicionarLog('Tela: Novo', 'Excluindo registro! Código: ' +
        dmNovoSofa.cdsNovoSofaBDCODSOFA.AsString + ', Descrição: ' +
        dmNovoSofa.cdsNovoSofaBDDESCSOFA.AsString, Now,
        gdClasses_GD.fUsuarioLogado.ID);
      Application.MessageBox('Registro excluído com sucesso!', 'Confirmação!',
        MB_OK + MB_ICONINFORMATION);
    except
      on E: Exception do
        Application.MessageBox(PWideChar(E.Message),
          'Erro ao excluir registro!', MB_OK + MB_ICONERROR);
    end;
  end;
end;

procedure TfrNovoSofa.spNovoItemClick(Sender: TObject);
begin
  inherited;
  LimparCampos;
  dmNovoSofa.cdsNovoSofa.Insert;
end;

procedure TfrNovoSofa.spSalvarClick(Sender: TObject);
var
  wMsg: String;
  wLog: String;
  wChave: Integer;
begin
  if Trim(edDescricaoSofa.Text) = '' then
  begin
    Application.MessageBox('O campo descrição não pode ser vazio!', 'Atenção!',
      MB_OK + MB_ICONWARNING);
    edDescricaoSofa.SetFocus;
    Abort;
  end;

  if Trim(edValorCorte.Text) = Trim('R$ 0,00') then
  begin
    Application.MessageBox('O campo de valor do corte não pode ser vazio!',
      'Atenção!', MB_OK + MB_ICONWARNING);
    edValorCorte.SetFocus;
    Abort;
  end;

  if Trim(edValorCostura.Text) = Trim('R$ 0,00') then
  begin
    Application.MessageBox('O campo de valor da costura não pode ser vazio!',
      'Atenção!', MB_OK + MB_ICONWARNING);
    edValorCostura.SetFocus;
    Abort;
  end;

  if Trim(edQtdMinutos.Text) = Trim('0,00') then
  begin
    Application.MessageBox('O campo de quantidade de minutos não ' +
      'pode ser vazio!', 'Atenção!', MB_OK + MB_ICONWARNING);
    edQtdMinutos.SetFocus;
    Abort;
  end;

  wMsg := 'Registro alterado com sucesso!';
  wLog := 'Editando registro: Código: ' + dmNovoSofa.cdsNovoSofaBDCODSOFA.
    AsString + ', Descrição: ' + dmNovoSofa.cdsNovoSofaBDDESCSOFA.AsString;

  if dmNovoSofa.cdsNovoSofa.State in [dsInsert] then
  begin
    dmNovoSofa.cdsNovoSofaBDCODSOFA.AsInteger := 0;
    wChave := dmNovoSofa.GetUltimaChave + 1;
    wMsg := 'Registro inserido com sucesso!';
    wLog := 'Adicionando novo registro: Código: ' + IntToStr(wChave);
  end;

  dmNovoSofa.cdsNovoSofaBDDESCSOFA.AsString := edDescricaoSofa.Text;
  dmNovoSofa.cdsNovoSofaBDVALCOSTURA.AsCurrency :=
    StrToCurr(Trim(AnsiReplaceStr(Trim(edValorCostura.Text), 'R$', '')));
  dmNovoSofa.cdsNovoSofaBDVALCORTE.AsCurrency :=
    StrToCurr(Trim(AnsiReplaceStr(Trim(edValorCorte.Text), 'R$', '')));
  dmNovoSofa.cdsNovoSofaBDHORAS.AsCurrency :=
    StrToCurr(Trim(edQtdMinutos.Text));

  dmNovoSofa.cdsNovoSofa.Post;
  dmNovoSofa.cdsNovoSofa.ApplyUpdates(0);
  Application.MessageBox(PWideChar(wMsg), 'Confirmação!',
    MB_OK + MB_ICONINFORMATION);

  SetaSQLs;
  dbGrid.Refresh;

  LimparCampos;
  dmNovoSofa.cdsNovoSofa.Insert;
  edDescricaoSofa.SetFocus;

  inherited;
end;

procedure TfrNovoSofa.SetaFormatacao;
begin
  Formatar(edValorCorte, edValorCorte.Formato);
  Formatar(edValorCostura, edValorCostura.Formato);
  Formatar(edQtdMinutos, edQtdMinutos.Formato);
end;

procedure TfrNovoSofa.SetaSQLs;
begin
  dmNovoSofa.cdsNovoSofa.Close;
  dmNovoSofa.cdsNovoSofa.CommandText :=
    'select * from TB_SOFAS order by BDCODSOFA';
  dmNovoSofa.cdsNovoSofa.Open;
end;

end.
