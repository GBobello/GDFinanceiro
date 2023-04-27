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
    queryModelo: TFDQuery;
    queryUsuarios: TFDQuery;
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

end.
