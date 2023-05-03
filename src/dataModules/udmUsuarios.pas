unit udmUsuarios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  udmConexao;

type
  TdmUsuarios = class(TDataModule)
    queryUsuarios: TFDQuery;
    dspUsuarios: TDataSetProvider;
    cdsUsuarios: TClientDataSet;
    cdsUsuariosBDCODUSU: TIntegerField;
    cdsUsuariosBDNOMUSU: TStringField;
    cdsUsuariosBDLOGINUSU: TStringField;
    cdsUsuariosBDSENHAUSU: TStringField;
    cdsUsuariosBDISADM: TBooleanField;
    procedure cdsUsuariosBDISADMGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    function TemLoginCadastrado(prLogin: String; prID: String) : Boolean;
    function SenhaAnteriorIgual(prID: String; prSenhaAnterior: String): Boolean;
    function GetChaveGenerator : Integer;
    function GetUltimaChave: Integer;
    procedure DecrementaGenerator(prID: Integer);
  end;

var
  dmUsuarios: TdmUsuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmUsuarios }

procedure TdmUsuarios.cdsUsuariosBDISADMGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := '';
end;

procedure TdmUsuarios.DecrementaGenerator(prID: Integer);
var
  SQLConsulta: TFDQuery;
  SQLCommand: TFDCommand;
begin
  //Ficou obsoleto pois é utilizado na trigger da tabela
  SQLConsulta := TFDQuery.Create(nil);
  try
    SQLConsulta.Connection := dmConexao.Conexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT first 1 BDCODUSU FROM TB_USUARIOS order by BDCODUSU desc');
    SQLConsulta.Open;

    if SQLConsulta.FieldByName('BDCODUSU').AsInteger = prID then
    begin
      try
        SQLCommand := TFDCommand.Create(nil);
        SQLCommand.Connection := dmConexao.Conexao;
        SQLCommand.CommandText.Add('SET GENERATOR GEN_TB_USUARIOS_ID TO ' + IntToStr(prID - 1));
        SQLCommand.Open;
      finally
        SQLCommand.Close;
        FreeAndNil(SQLCommand);
      end;
    end;
  finally
    SQLConsulta.Close;
    FreeAndNil(SQLConsulta);
  end;
end;

function TdmUsuarios.GetChaveGenerator: Integer;
var
  SQLConsulta: TFDQuery;
begin
  //Ficou obsoleto pois é utilizado na trigger da tabela
  SQLConsulta := TFDQuery.Create(nil);
  try
    SQLConsulta.Connection := dmConexao.Conexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('select GEN_ID(GEN_TB_USUARIOS_ID, 1) as ID_ATUAL from RDB$DATABASE');
    SQLConsulta.Open;

    Result := SQLConsulta.FieldByName('ID_ATUAL').AsInteger;
  finally
    SQLConsulta.Close;
    FreeAndNil(SQLConsulta);
  end;
end;

function TdmUsuarios.GetUltimaChave: Integer;
var
  SQLConsulta: TFDQuery;
begin
  //Ficou obsoleto pois é utilizado na trigger da tabela
  SQLConsulta := TFDQuery.Create(nil);
  try
    SQLConsulta.Connection := dmConexao.Conexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('select first 1 BDCODUSU from TB_USUARIOS order by BDCODUSU desc');
    SQLConsulta.Open;

    Result := SQLConsulta.FieldByName('BDCODUSU').AsInteger;
  finally
    SQLConsulta.Close;
    FreeAndNil(SQLConsulta);
  end;
end;

function TdmUsuarios.SenhaAnteriorIgual(prID, prSenhaAnterior: String): Boolean;
var
  SQLConsulta: TFDQuery;
begin
  Result := False;
  SQLConsulta := TFDQuery.Create(nil);
  try
    SQLConsulta.Connection := dmConexao.Conexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT BDSENHAUSU FROM TB_USUARIOS WHERE BDCODUSU = :ID');
    SQLConsulta.ParamByName('ID').AsString := prID;
    SQLConsulta.Open;

    Result := (SQLConsulta.FieldByName('BDSENHAUSU').AsString = prSenhaAnterior);

  finally
    SQLConsulta.Close;
    FreeAndNil(SQLConsulta);
  end;
end;

function TdmUsuarios.TemLoginCadastrado(prLogin, prID: String): Boolean;
var
  SQLConsulta: TFDQuery;
begin
  Result := False;
  SQLConsulta := TFDQuery.Create(nil);
  try
    SQLConsulta.Connection := dmConexao.Conexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT BDCODUSU FROM TB_USUARIOS WHERE BDLOGINUSU = :LOGIN');
    SQLConsulta.ParamByName('LOGIN').AsString := prLogin;
    SQLConsulta.Open;

    if not SQLConsulta.IsEmpty then
      Result := SQLConsulta.FieldByName('BDCODUSU').AsString <> prID;

  finally
    SQLConsulta.Close;
    FreeAndNil(SQLConsulta);
  end;
end;

end.
