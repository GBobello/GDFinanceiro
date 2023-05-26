/////////////////////////////////////////////////////////////////////////////
{
    Unit DmNovoSofa
    Criação: Gabriel Bobello
}
/////////////////////////////////////////////////////////////////////////////

unit udmNovoSofa;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmNovoSofa = class(TDataModule)
    queryNovoSofa: TFDQuery;
    dspNovoSofa: TDataSetProvider;
    cdsNovoSofa: TClientDataSet;
    cdsNovoSofaBDCODSOFA: TIntegerField;
    cdsNovoSofaBDDESCSOFA: TStringField;
    cdsNovoSofaBDVALCOSTURA: TFMTBCDField;
    cdsNovoSofaBDVALCORTE: TFMTBCDField;
    cdsNovoSofaBDHORAS: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetUltimaChave: Integer;
  end;

var
  dmNovoSofa: TdmNovoSofa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses udmConexao;

{$R *.dfm}

{ TdmNovoSofa }

function TdmNovoSofa.GetUltimaChave: Integer;
var
  SQLConsulta: TFDQuery;
begin
  SQLConsulta := TFDQuery.Create(nil);
  try
    SQLConsulta.Connection := dmConexao.Conexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('select first 1 BDCODSOFA from TB_SOFAS ' +
                        'order by BDCODSOFA desc');
    SQLConsulta.Open;

    Result := SQLConsulta.FieldByName('BDCODSOFA').AsInteger;
  finally
    SQLConsulta.Close;
    FreeAndNil(SQLConsulta);
  end;
end;

end.
