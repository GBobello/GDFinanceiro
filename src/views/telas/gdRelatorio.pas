unit gdRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gdSimples, System.ImageList,
  Vcl.ImgList, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, GD_ComboBox, Vcl.Mask,
  GD_MaskEdit_Data, GD_Edit, udmRelatorio, gdFuncoes, StrUtils;

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
    pnCancelar: TPanel;
    spCancelar: TSpeedButton;
    pnCimaCancelar: TPanel;
    pnBaixoCancelar: TPanel;
    pnDireitaCancelar: TPanel;
    pnEsquerdaCancelar: TPanel;
    pnSalvar: TPanel;
    spSalvar: TSpeedButton;
    pnCimaSalvar: TPanel;
    pnBaixoSalvar: TPanel;
    pnDireitaSalvar: TPanel;
    pnEsquerdaSalvar: TPanel;
    ImageList: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spCancelarClick(Sender: TObject);
    procedure spSalvarClick(Sender: TObject);
  private
    { Private declarations }
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

procedure TfrRelatorio.spCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrRelatorio.spSalvarClick(Sender: TObject);
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
  wSql := 'SELECT * FROM TB_SERVICOS ';
  wWhere := '';
  // Gerar o SQL do relatório

  if (cbSofas.ItemIndex <> 0) or (cbUsuarios.ItemIndex <> 0) or
    (cbServicos.ItemIndex <> 0) or (Trim(mskDataInicial.Text) <> '/  /') or
    (Trim(mskDataFinal.Text) <> '/  /') then
  begin

    if cbSofas.ItemIndex <> 0 then
    begin
      AddWhere('(BDCODSOFA = ' + IntToStr(cbSofas.ItemIndex) + ')');
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

      AddWhere('((BDDATASERV >= ' + QuotedStr(AnsiReplaceStr(Trim(mskDataInicial.Text), '/', '.')) +
        ') and (BDDATASERV <= ' + QuotedStr(AnsiReplaceStr(Trim(mskDataFinal.Text), '/', '.')) + '))');
    end
    else
    begin
      Application.MessageBox
        ('Não é possível filtrar por data caso as duas não estejam preenchidas!',
        'Atenção!', MB_OK + MB_ICONWARNING);
      Abort;
    end;

    if cbUsuarios.ItemIndex <> 0 then
    begin
      AddWhere('(BDCODUSU = ' + IntToStr(cbUsuarios.ItemIndex) + ')');
    end;

    if cbServicos.ItemIndex <> 0 then
    begin
      AddWhere('(BDSERVICO = ' + IntToStr(cbServicos.ItemIndex) + ')');
    end;

    wSql := wSql + wWhere;
  end;

end;

end.
