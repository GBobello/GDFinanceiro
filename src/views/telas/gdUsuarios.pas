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
  gdClasses_GD;

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
    imgOlhoAberto: TImage;
    imgOlhoFechado: TImage;
    procedure imgOlhoAbertoClick(Sender: TObject);
    procedure imgOlhoFechadoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure spEditarClick(Sender: TObject);
    procedure spSalvarClick(Sender: TObject);
    procedure spNovoItemClick(Sender: TObject);
    procedure spCancelarClick(Sender: TObject);
    procedure spConsultarClick(Sender: TObject);
    procedure spExcluirClick(Sender: TObject);
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
  cdPanel.ActiveCard := cardConsultaUsuarios;
  SetaSQLs;
end;

procedure TfrUsuarios.imgOlhoAbertoClick(Sender: TObject);
begin
  inherited;
  imgOlhoAberto.Visible := False;
  imgOlhoFechado.Visible := True;
  edSenha.PasswordChar := #0;
end;

procedure TfrUsuarios.imgOlhoFechadoClick(Sender: TObject);
begin
  inherited;
  imgOlhoAberto.Visible := True;
  imgOlhoFechado.Visible := False;
  edSenha.PasswordChar := '*';
end;

procedure TfrUsuarios.spCancelarClick(Sender: TObject);
begin
  inherited;
  dmUsuarios.cdsUsuarios.Cancel;
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

  edNome.Text                 := dmUsuarios.cdsUsuariosBDNOMUSU.AsString;
  edLogin.Text                := dmUsuarios.cdsUsuariosBDLOGINUSU.AsString;
  edSenha.Text                := dmUsuarios.cdsUsuariosBDSENHAUSU.AsString;
  chkIsAdministrador.Checked  := dmUsuarios.cdsUsuariosBDISADM.AsBoolean;
end;

procedure TfrUsuarios.spExcluirClick(Sender: TObject);
begin
  inherited;
  if gdClasses_GD.fUsuarioLogado.ID = dmUsuarios.cdsUsuariosBDCODUSU.AsInteger then
  begin
    Application.MessageBox('Você não pode excluir seu próprio usuário!', 'Atenção!', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;

  if Application.MessageBox('Deseja realmente excluir esse registro?', 'Pergunta!', MB_YESNO + MB_ICONQUESTION) <> mrYes then
    Exit;

  try
    dmUsuarios.DecrementaGenerator(dmUsuarios.cdsUsuariosBDCODUSU.AsInteger);
    dmUsuarios.cdsUsuarios.Delete;
    dmUsuarios.cdsUsuarios.ApplyUpdates(0);
    Application.MessageBox('Registro excluído com sucesso!', 'Confirmação!', MB_OK + MB_ICONINFORMATION);
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
begin
  if Trim(edNome.Text) = '' then
  begin
    edNome.SetFocus;
    Application.MessageBox('O campo nome não pode ser vazio!', 'Atenção!', MB_OK + MB_ICONWARNING);
    Abort;
  end;
  if Trim(edLogin.Text) = '' then
  begin
    edLogin.SetFocus;
    Application.MessageBox('O campo login não pode ser vazio!', 'Atenção!', MB_OK + MB_ICONWARNING);
    Abort;
  end;
  if Trim(edSenha.Text) = '' then
  begin
    edSenha.SetFocus;
    Application.MessageBox('O campo senha não pode ser vazio!', 'Atenção!', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if dmUsuarios.TemLoginCadastrado(Trim(edLogin.Text), dmUsuarios.cdsUsuariosBDCODUSU.AsString) then
  begin
    edLogin.SetFocus;
    Application.MessageBox(PWideChar(Format('O login %s já se encontra cadastrado!', [edLogin.Text])), 'Atenção!', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  wMsg := 'Registro alterado com sucesso!';

  if dmUsuarios.cdsUsuarios.State in [dsInsert] then
  begin
    dmUsuarios.cdsUsuariosBDCODUSU.AsInteger := dmUsuarios.GetChaveGenerator;
    wMsg := 'Registro incluído com sucesso!'
  end;

  dmUsuarios.cdsUsuariosBDNOMUSU.AsString   := Trim(edNome.Text);
  dmUsuarios.cdsUsuariosBDLOGINUSU.AsString := Trim(edLogin.Text);
  dmUsuarios.cdsUsuariosBDSENHAUSU.AsString := Trim(edSenha.Text);
  dmUsuarios.cdsUsuariosBDISADM.AsBoolean   := chkIsAdministrador.Checked;

  dmUsuarios.cdsUsuarios.Post;
  dmUsuarios.cdsUsuarios.ApplyUpdates(0);
  Application.MessageBox(PWideChar(wMsg), 'Confirmação!', MB_OK + MB_ICONINFORMATION);

  SetaSQLs;
  dbGrid.Refresh;

  inherited;
end;

end.
