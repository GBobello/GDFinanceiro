unit gdLoginClass;

interface

uses
  System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase, FireDAC.Comp.UI, udmConexao, gdClasses_GD,
  System.SysUtils, gdFuncoes;

type
  TLoginClass = class
    private
      FBDCODUSU: Integer;
      FBDLOGINUSU: String;
      FBDISADM: Boolean;
      FBDNOMUSU: String;
      FBDSENHAUSU: String;
      FConexao: TFDConnection;
      FQueryConsulta: TFDQuery;
      procedure SetBDCODUSU(const Value: Integer);
      procedure SetBDISADM(const Value: Boolean);
      procedure SetBDLOGINUSU(const Value: String);
      procedure SetBDNOMUSU(const Value: String);
      procedure SetBDSENHAUSU(const Value: String);
      procedure SetConexao(const Value: TFDConnection);
      procedure SetQueryConsulta(const Value: TFDQuery);
    public
      constructor Create;
      destructor Destroy;
      procedure EfetuarLogin(prLogin: String; prSenha: String);

      property Conexao: TFDConnection read FConexao write SetConexao;
      property QueryConsulta: TFDQuery read FQueryConsulta write SetQueryConsulta;
      property BDCODUSU: Integer read FBDCODUSU write SetBDCODUSU;
      property BDNOMUSU: String read FBDNOMUSU write SetBDNOMUSU;
      property BDLOGINUSU: String read FBDLOGINUSU write SetBDLOGINUSU;
      property BDSENHAUSU: String read FBDSENHAUSU write SetBDSENHAUSU;
      property BDISADM: Boolean read FBDISADM write SetBDISADM;
  end;

var
  fFuncoes: TFuncoes;

implementation

{ TLoginClas }

constructor TLoginClass.Create;
begin
  FConexao                  := dmConexao.Conexao;
  FQueryConsulta            := TFDQuery.Create(nil);
  FQueryConsulta.Connection := FConexao;
end;

destructor TLoginClass.Destroy;
begin
  FConexao.Close;
  FConexao.Free;
  FQueryConsulta.Close;
  FQueryConsulta.Free;
end;

procedure TLoginClass.EfetuarLogin(prLogin, prSenha: String);
begin
  try
    FQueryConsulta.SQL.Clear;
    FQueryConsulta.SQL.Add('SELECT * FROM TB_USUARIOS WHERE BDLOGINUSU = :LOGIN AND BDSENHAUSU = :SENHA');
    FQueryConsulta.ParamByName('LOGIN').AsString := prLogin;
    FQueryConsulta.ParamByName('SENHA').AsString := prSenha;
    FQueryConsulta.Open;

    if FQueryConsulta.IsEmpty then
      raise Exception.Create('Usuário e/ou senha inválidos!');

    gdClasses_GD.SetUsuarioLogado(FQueryConsulta.FieldByName('BDCODUSU').AsInteger,
                                  FQueryConsulta.FieldByName('BDNOMUSU').AsString,
                                  FQueryConsulta.FieldByName('BDISADM').AsBoolean);
  finally
    FQueryConsulta.Close;
  end;
end;

procedure TLoginClass.SetBDCODUSU(const Value: Integer);
begin
  FBDCODUSU := Value;
end;

procedure TLoginClass.SetBDISADM(const Value: Boolean);
begin
  FBDISADM := Value;
end;

procedure TLoginClass.SetBDLOGINUSU(const Value: String);
begin
  FBDLOGINUSU := Value;
end;

procedure TLoginClass.SetBDNOMUSU(const Value: String);
begin
  FBDNOMUSU := Value;
end;

procedure TLoginClass.SetBDSENHAUSU(const Value: String);
begin
  FBDSENHAUSU := Value;
end;

procedure TLoginClass.SetConexao(const Value: TFDConnection);
begin
  FConexao := Value;
end;

procedure TLoginClass.SetQueryConsulta(const Value: TFDQuery);
begin
  FQueryConsulta := Value;
end;

end.
