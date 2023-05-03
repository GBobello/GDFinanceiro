unit gdUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.WinXPanels, Data.DB,
  Vcl.Grids, Vcl.DBGrids, GD_Edit, GD_CheckBox, Vcl.Imaging.pngimage, gdFuncoes,
  Datasnap.DBClient, Datasnap.Provider, udmUsuarios, gdCardPanels_Padrao, StrUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  gdClasses_GD, System.Actions, Vcl.ActnList, gdUsuarioLogado, gdLogSistema;

type
  TfrUsuarios = class(TfrCardPanels_Padrao)
    dsUsuarios: TDataSource;
    imgGrid: TImageList;
    edNome: TGD_Edit;
    edLogin: TGD_Edit;
    edSenha: TGD_Edit;
    chkIsAdministrador: TGD_CheckBox;
    lbNome: TLabel;
    lbLogin: TLabel;
    lbSenha: TLabel;
    cardTrocaSenha: TCard;
    pnCentralTrocaSenha: TPanel;
    edSenhaAnterior: TGD_Edit;
    edNovaSenha: TGD_Edit;
    edConfirmaSenha: TGD_Edit;
    lbSenhaAnterior: TLabel;
    lbNovaSenha: TLabel;
    lbConfirmacaoSenha: TLabel;
    pnConfirmar: TPanel;
    spConfirmar: TSpeedButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    lbAlterarSenha: TLabel;
    spVoltar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure dbGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure spEditarClick(Sender: TObject);
    procedure spSalvarClick(Sender: TObject);
    procedure spNovoItemClick(Sender: TObject);
    procedure spCancelarClick(Sender: TObject);
    procedure spConsultarClick(Sender: TObject);
    procedure spExcluirClick(Sender: TObject);
    procedure spConfirmarMouseEnter(Sender: TObject);
    procedure spConfirmarMouseLeave(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lbAlterarSenhaClick(Sender: TObject);
    procedure spVoltarClick(Sender: TObject);
    procedure spConfirmarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    procedure SetaSQLs;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frUsuarios: TfrUsuarios;
  fFuncoes: TFuncoes;

implementation

{$R *.dfm}

procedure TfrUsuarios.dbGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  wMarcar: word;
  wRetangulo: TRect;
begin
  inherited;
  if UpperCase(Column.FieldName) = 'BDISADM' then
  begin
    dbGrid.Canvas.FillRect(Rect);

    if Column.Field.AsBoolean = True then
      wMarcar := DFCS_CHECKED
    else
      wMarcar := DFCS_BUTTONCHECK;

    wRetangulo := Rect;
    InflateRect(wRetangulo, -2, -2);

    DrawFrameControl(dbGrid.Canvas.Handle, wRetangulo, DFC_BUTTON, wMarcar);
  end;
end;

procedure TfrUsuarios.FormCreate(Sender: TObject);
begin
  inherited;
  cdPanel.ActiveCard := cardCadastroUsuarios;
  SetaSQLs;
end;

procedure TfrUsuarios.FormResize(Sender: TObject);
begin
  inherited;
  fFuncoes.SetCentralizaControles(TControl(pnPrincipal), TControl(pnCentralTrocaSenha));
end;

procedure TfrUsuarios.FormShow(Sender: TObject);
begin
  inherited;
  dmUsuarios.cdsUsuarios.Insert;
end;

procedure TfrUsuarios.lbAlterarSenhaClick(Sender: TObject);
begin
  inherited;
  cardTrocaSenha.Enabled := True;
  cdPanel.ActiveCard := cardTrocaSenha;
  fFuncoes.SetCentralizaControles(TControl(pnPrincipal), TControl(pnCentralTrocaSenha));
end;

procedure TfrUsuarios.spCancelarClick(Sender: TObject);
begin
  inherited;
  dmUsuarios.cdsUsuarios.Cancel;
  lbAlterarSenha.Visible := False;
end;

procedure TfrUsuarios.spConsultarClick(Sender: TObject);
begin
  inherited;
  dmUsuarios.cdsUsuarios.Cancel;
end;

procedure TfrUsuarios.spEditarClick(Sender: TObject);
begin
  inherited;
  dmUsuarios.cdsUsuarios.Edit;
  lbAlterarSenha.Visible := True;

  edNome.Text                 := dmUsuarios.cdsUsuariosBDNOMUSU.AsString;
  edLogin.Text                := dmUsuarios.cdsUsuariosBDLOGINUSU.AsString;
  edSenha.Text                := dmUsuarios.cdsUsuariosBDSENHAUSU.AsString;
  chkIsAdministrador.Checked  := dmUsuarios.cdsUsuariosBDISADM.AsBoolean;
end;

procedure TfrUsuarios.spConfirmarClick(Sender: TObject);
var
  wSenhaCrypt: String;
begin
  if Trim(edSenhaAnterior.Text) = '' then
  begin
    edSenhaAnterior.SetFocus;
    Application.MessageBox('O campo de senha anterior n�o pode ser vazio!', 'Aten��o!', MB_OK + MB_ICONWARNING);
    Abort;
  end;
  if Trim(edNovaSenha.Text) = '' then
  begin
    edNovaSenha.SetFocus;
    Application.MessageBox('O campo de nova senha n�o pode ser vazio!', 'Aten��o!', MB_OK + MB_ICONWARNING);
    Abort;
  end;
  if Trim(edConfirmaSenha.Text) = '' then
  begin
    edConfirmaSenha.SetFocus;
    Application.MessageBox('O campo de confirma��o de senha n�o pode ser vazio!', 'Aten��o!', MB_OK + MB_ICONWARNING);
    Abort;
  end;
  if not dmUsuarios.SenhaAnteriorIgual(dmUsuarios.cdsUsuariosBDCODUSU.AsString, dmUsuarios.cdsUsuariosBDSENHAUSU.AsString) then
  begin
    edSenhaAnterior.SetFocus;
    Application.MessageBox('A senha anterior n�o est� correta!', 'Aten��o!', MB_OK + MB_ICONWARNING);
    Abort;
  end;
  if Trim(edNovaSenha.Text) <> Trim(edConfirmaSenha.Text) then
  begin
    edNovaSenha.SetFocus;
    Application.MessageBox('As senhas n�o conferem!', 'Aten��o!', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  dmUsuarios.cdsUsuariosBDNOMUSU.AsString   := Trim(edNome.Text);
  dmUsuarios.cdsUsuariosBDLOGINUSU.AsString := Trim(edLogin.Text);
  wSenhaCrypt := gdFuncoes.MD5(Trim(edNovaSenha.Text));
  dmUsuarios.cdsUsuariosBDSENHAUSU.AsString := wSenhaCrypt;
  dmUsuarios.cdsUsuariosBDISADM.AsBoolean   := chkIsAdministrador.Checked;

  dmUsuarios.cdsUsuarios.Post;
  dmUsuarios.cdsUsuarios.ApplyUpdates(0);
  Application.MessageBox('Senha alterada com sucesso!', 'Confirma��o!', MB_OK + MB_ICONINFORMATION);

  SetaSQLs;
  dbGrid.Refresh;
  cdPanel.ActiveCard := cardConsultaUsuarios;
  cardTrocaSenha.Enabled := False;
  AjustaTamanhoCelulas;
  inherited;
end;

procedure TfrUsuarios.spConfirmarMouseEnter(Sender: TObject);
begin
  inherited;
  pnConfirmar.Color := $006FFF6F;
  spConfirmar.Font.Color := clWhite;
end;

procedure TfrUsuarios.spConfirmarMouseLeave(Sender: TObject);
begin
  inherited;
  pnConfirmar.Color := clWhite;
  spConfirmar.Font.Color := clBlack;
end;

procedure TfrUsuarios.spExcluirClick(Sender: TObject);
begin
  inherited;
  if gdClasses_GD.fUsuarioLogado.ID = dmUsuarios.cdsUsuariosBDCODUSU.AsInteger then
  begin
    Application.MessageBox('Voc� n�o pode excluir seu pr�prio usu�rio!', 'Aten��o!', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if dmUsuarios.cdsUsuariosBDISADM.AsBoolean then
  begin
    Application.MessageBox('Voc� n�o pode excluir usu�rios administradores!', 'Aten��o!', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;

  if Application.MessageBox('Deseja realmente excluir esse registro?', 'Pergunta!', MB_YESNO + MB_ICONQUESTION) <> mrYes then
    Exit;

  try
    dmUsuarios.cdsUsuarios.Delete;
    dmUsuarios.cdsUsuarios.ApplyUpdates(0);
    gdLogSistema.AdicionarLog('Tela: Novo', 'Excluindo registro! C�digo: ' +
      dmUsuarios.cdsUsuariosBDCODUSU.AsString + ', Descri��o: ' +
      dmUsuarios.cdsUsuariosBDNOMUSU.AsString, Now,
      gdClasses_GD.fUsuarioLogado.ID);
    Application.MessageBox('Registro exclu�do com sucesso!', 'Confirma��o!', MB_OK + MB_ICONINFORMATION);
  except on E: Exception do
    Application.MessageBox(PWideChar(E.Message), 'Erro ao excluir registro!', MB_OK + MB_ICONERROR);
  end;
end;

procedure TfrUsuarios.SetaSQLs;
begin
  dmUsuarios.cdsUsuarios.Close;
  dmUsuarios.cdsUsuarios.CommandText := 'SELECT * FROM TB_USUARIOS order by BDCODUSU';
  dmUsuarios.cdsUsuarios.Open;
end;

procedure TfrUsuarios.spNovoItemClick(Sender: TObject);
begin
  inherited;
  LimparCampos;
  dmUsuarios.cdsUsuarios.Insert;
end;

procedure TfrUsuarios.spSalvarClick(Sender: TObject);
var
  wMsg: String;
  wSenhaCrypt: String;
  wLog: String;
  wChave: Integer;
begin
  if Trim(edNome.Text) = '' then
  begin
    edNome.SetFocus;
    Application.MessageBox('O campo de nome n�o pode ser vazio!', 'Aten��o!', MB_OK + MB_ICONWARNING);
    Abort;
  end;
  if Trim(edLogin.Text) = '' then
  begin
    edLogin.SetFocus;
    Application.MessageBox('O campo de login n�o pode ser vazio!', 'Aten��o!', MB_OK + MB_ICONWARNING);
    Abort;
  end;
  if Trim(edSenha.Text) = '' then
  begin
    edSenha.SetFocus;
    Application.MessageBox('O campo de senha n�o pode ser vazio!', 'Aten��o!', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if dmUsuarios.TemLoginCadastrado(Trim(edLogin.Text), dmUsuarios.cdsUsuariosBDCODUSU.AsString) then
  begin
    edLogin.SetFocus;
    Application.MessageBox(PWideChar(Format('O login %s j� se encontra cadastrado!', [edLogin.Text])), 'Aten��o!', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  wMsg := 'Registro alterado com sucesso!';
  wLog := 'Editando registro: C�digo: ' + dmUsuarios.cdsUsuariosBDCODUSU.
    AsString + ', Descri��o: ' + dmUsuarios.cdsUsuariosBDNOMUSU.AsString;

  if dmUsuarios.cdsUsuarios.State in [dsInsert] then
  begin
    // Vai pegar o c�digo direto da generator na trigger before insert
    dmUsuarios.cdsUsuariosBDCODUSU.AsInteger := 0;
    wChave := dmUsuarios.GetUltimaChave + 1;
    wMsg := 'Registro inclu�do com sucesso!';
    wLog := 'Adicionando novo registro: C�digo: ' + IntToStr(wChave);
  end;

  gdLogSistema.AdicionarLog('Tela: Usu�rio', wLog, Now,
    gdClasses_GD.fUsuarioLogado.ID);

  dmUsuarios.cdsUsuariosBDNOMUSU.AsString   := Trim(edNome.Text);
  dmUsuarios.cdsUsuariosBDLOGINUSU.AsString := Trim(edLogin.Text);
  wSenhaCrypt := gdFuncoes.MD5(Trim(edSenha.Text));
  dmUsuarios.cdsUsuariosBDSENHAUSU.AsString := wSenhaCrypt;
  dmUsuarios.cdsUsuariosBDISADM.AsBoolean   := chkIsAdministrador.Checked;

  dmUsuarios.cdsUsuarios.Post;
  dmUsuarios.cdsUsuarios.ApplyUpdates(0);
  Application.MessageBox(PWideChar(wMsg), 'Confirma��o!', MB_OK + MB_ICONINFORMATION);

  SetaSQLs;
  dbGrid.Refresh;

  inherited;
end;

procedure TfrUsuarios.spVoltarClick(Sender: TObject);
begin
  inherited;
  cdPanel.ActiveCard := cardCadastroUsuarios;
  cardTrocaSenha.Enabled := False;
end;

end.
