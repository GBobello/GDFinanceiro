/////////////////////////////////////////////////////////////////////////////
{
    Unit UsuarioClass
    Criação: Gabriel Bobello
}
/////////////////////////////////////////////////////////////////////////////

unit gdUsuarioClass;

interface

uses
  FireDAC.Comp.Client, System.SysUtils;

type
  TUsuario = class
  private
    FNOMUSU: String;
    FSENHAUSU: String;
    FCODUSU: Integer;
    FLOGINUSU: String;
    FISADM: Boolean;
    FConexao: TFDConnection;
  public
    constructor Create(prConexao: TFDConnection);
    destructor Destroy; override;

    function Insere_Edita(prTipoOperacao: String; out prErro: String): Boolean;
    procedure Deleta(prId: Integer);
    function Select : TFDQuery;

    property Conexao: TFDConnection read FConexao write FConexao;
    property CODUSU: Integer read FCODUSU write FCODUSU;
    property NOMUSU: String read FNOMUSU write FNOMUSU;
    property LOGINUSU: String read FLOGINUSU write FLOGINUSU;
    property SENHAUSU: String read FSENHAUSU write FSENHAUSU;
    property ISADM: Boolean read FISADM write FISADM;
  end;

implementation

uses
  Vcl.Forms, Winapi.Windows, System.UITypes;

var
  wQueryConsulta: TFDQuery;

{ TUsuario }

constructor TUsuario.Create(prConexao: TFDConnection);
begin
  FConexao := prConexao;
  wQueryConsulta := TFDQuery.Create(nil);
  wQueryConsulta.Connection := FConexao;
end;

procedure TUsuario.Deleta(prId: Integer);
begin
  if Application.MessageBox('Deseja realmente excluir esse registro?',
                            'Pergunta!',
                            MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
    try
      FConexao.Connected := False;
      FConexao.Connected := True;

      FConexao.ExecSQL('delete from TB_USUARIOS where BDCODUSU = :ID', [prId]);
      Application.MessageBox('Registro excluído com sucesso!', 'Confirmação!',
                             MB_OK + MB_ICONINFORMATION);
    except
      on E: Exception do
      begin
        Application.MessageBox(PWideChar(E.Message),
                               'Erro ao excluir registro!', 
                               MB_OK + MB_ICONERROR);
      end;
    end;
  end;

end;

destructor TUsuario.Destroy;
begin
  wQueryConsulta.Destroy;
  inherited;
end;

function TUsuario.Insere_Edita(prTipoOperacao: String;
  out prErro: String): Boolean;
var
  wQueryInserir: TFDQuery;
begin
  FConexao.Connected := False;
  FConexao.Connected := True;

  wQueryInserir := TFDQuery.Create(nil);
  try
    try
      wQueryInserir.Connection := FConexao;
      wQueryInserir.Close;
      wQueryInserir.SQL.Clear;

      if prTipoOperacao = 'INSERIR' then
      begin
        wQueryInserir.SQL.Add('insert into TB_USUARIOS(BDCODUSU, BDNOMUSU, ');
        wQueryInserir.SQL.Add('BDLOGINUSU, BDSENHAUSU, BDISADM) values(:ID, ');
        wQueryInserir.SQL.Add(':NOME, :LOGIN, :SENHA, :ISADM)');

        wQueryInserir.ParamByName('ID').AsInteger := 0;
      end
      else
      begin
        wQueryInserir.SQL.Add('update TB_USUARIOS set ');
        wQueryInserir.SQL.Add('BDCODUSU = :ID, ');
        wQueryInserir.SQL.Add('BDNOMUSU = :NOME, ');
        wQueryInserir.SQL.Add('BDLOGINUSU = :LOGIN, ');
        wQueryInserir.SQL.Add('BDSENHAUSU = :SENHA, ');
        wQueryInserir.SQL.Add('BDISADM = :ISADM ');
        wQueryInserir.SQL.Add('where BDCODUSU = :ID');

        wQueryInserir.ParamByName('ID').AsInteger := FCODUSU;
      end;

      wQueryInserir.ParamByName('NOME').AsString    := FNOMUSU;
      wQueryInserir.ParamByName('LOGIN').AsString   := FLOGINUSU;
      wQueryInserir.ParamByName('SENHA').AsString   := FSENHAUSU;
      wQueryInserir.ParamByName('ISADM').AsBoolean  := FISADM;
      wQueryInserir.ExecSQL;

      Result := True;

    except
      on E: Exception do
      begin
        prErro := e.Message;
        Result := False;
      end;
    end;
  finally
    wQueryInserir.Destroy;
  end;
end;

function TUsuario.Select: TFDQuery;
var
  wQuery: TFDQuery;
begin
  FConexao.Connected := False;
  FConexao.Connected := True;
  try
    wQueryConsulta.Close;
    wQueryConsulta.SQL.Clear;

    wQueryConsulta.SQL.Add('SELECT * FROM TB_USUARIOS order by BDCODUSU');
    wQueryConsulta.Open;
  finally
    Result := wQuery;
  end;
end;

end.
