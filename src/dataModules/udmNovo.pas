unit udmNovo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  udmConexao;

type
  TdmNovo = class(TDataModule)
    queryNovo: TFDQuery;
    dspNovo: TDataSetProvider;
    cdsNovo: TClientDataSet;
    queryConsulta: TFDQuery;
    cdsNovoBDCODSERV: TIntegerField;
    cdsNovoBDDATASERV: TDateField;
    cdsNovoBDCODUSU: TIntegerField;
    cdsNovoBDQUANTIDADE: TIntegerField;
    cdsNovoBDCODSOFA: TIntegerField;
    cdsNovoBDSERVICO: TIntegerField;
    cdsNovoBDTOTALSERV: TFMTBCDField;
    cdsNovoBDNOMUSU: TStringField;
    cdsNovoBDDESCSOFA: TStringField;
    cdsNovoBDSERVICOPALAVRA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetChaveGenerator : Integer;
    procedure DecrementaGenerator(prID: Integer);
    function GetModelos: TStrings;
    function GetResponsavel: TStrings;
  end;

var
  dmNovo: TdmNovo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmNovo }

procedure TdmNovo.DecrementaGenerator(prID: Integer);
var
  SQLConsulta: TFDQuery;
  SQLCommand: TFDCommand;
begin
  //Ficou obsoleto pois � utilizado na trigger da tabela
  SQLConsulta := TFDQuery.Create(nil);
  try
    SQLConsulta.Connection := dmConexao.Conexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT first 1 BDCODSERV FROM TB_SERVICOS order by BDCODSERV desc');
    SQLConsulta.Open;

    if SQLConsulta.FieldByName('BDCODSERV').AsInteger = prID then
    begin
      SQLCommand  := TFDCommand.Create(nil);
      try
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

function TdmNovo.GetChaveGenerator: Integer;
var
  SQLConsulta: TFDQuery;
begin
  //Ficou obsoleto pois � utilizado na trigger da tabela
  SQLConsulta := TFDQuery.Create(nil);
  try
    SQLConsulta.Connection := dmConexao.Conexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('select GEN_ID(GEN_TB_SERVICOS_ID, 1) as ID_ATUAL from RDB$DATABASE');
    SQLConsulta.Open;

    Result := SQLConsulta.FieldByName('ID_ATUAL').AsInteger;
  finally
    SQLConsulta.Close;
    FreeAndNil(SQLConsulta);
  end;
end;

function TdmNovo.GetModelos: TStrings;
var
  SQLConsulta: TFDQuery;
begin

  SQLConsulta := TFDQuery.Create(nil);
  Result := TStringList.Create;
  try
    Result.BeginUpdate;
    SQLConsulta.Connection := dmConexao.Conexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT * FROM TB_SOFAS ORDER BY BDCODSOFA');
    SQLConsulta.Open;

    SQLConsulta.First;
    while not SQLConsulta.Eof do
    begin
      Result.Add(SQLConsulta.FieldByName('BDDESCSOFA').AsString);
      SQLConsulta.Next;
    end;

    Result.EndUpdate;

  finally
    SQLConsulta.Close;
    FreeAndNil(SQLConsulta);
  end;
end;

function TdmNovo.GetResponsavel: TStrings;
var
  SQLConsulta: TFDQuery;
begin
  SQLConsulta := TFDQuery.Create(nil);
  Result := TStringList.Create;
  try
    Result.BeginUpdate;
    SQLConsulta.Connection := dmConexao.Conexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT * FROM TB_USUARIOS ORDER BY BDCODUSU');
    SQLConsulta.Open;

    SQLConsulta.First;
    while not SQLConsulta.Eof do
    begin
      Result.Add(SQLConsulta.FieldByName('BDNOMUSU').AsString);
      SQLConsulta.Next;
    end;

    Result.EndUpdate;

  finally
    SQLConsulta.Close;
    FreeAndNil(SQLConsulta);
  end;
end;

end.
