/////////////////////////////////////////////////////////////////////////////
{
    Unit DmRelatorio
    Criação: Gabriel Bobello
}
/////////////////////////////////////////////////////////////////////////////

unit udmRelatorio;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, udmConexao, frxClass, frxDBSet,
  Datasnap.DBClient, gdClasses_GD, Datasnap.Provider, frxExportBaseDialog,
  frxExportPDF, frxExportXLSX, frxExportCSV;

type
  TdmRelatorios = class(TDataModule)
    queryRelatorios: TFDQuery;
    frxRelatorio: TfrxReport;
    frxDsRelatorio: TfrxDBDataset;
    cdsRelatorio: TClientDataSet;
    dspRelatorio: TDataSetProvider;
    cdsRelatorioBDCODSERV: TIntegerField;
    cdsRelatorioBDDATASERV: TDateField;
    cdsRelatorioBDCODUSU: TIntegerField;
    cdsRelatorioBDQUANTIDADE: TIntegerField;
    cdsRelatorioBDCODSOFA: TIntegerField;
    cdsRelatorioBDSERVICO: TIntegerField;
    cdsRelatorioBDTOTALSERV: TFMTBCDField;
    frxPDFExport: TfrxPDFExport;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetUsuarios: TStrings;
    function GetSofas: TStrings;
  end;

var
  dmRelatorios: TdmRelatorios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

{ TdmRelatorios }

function TdmRelatorios.GetSofas: TStrings;
var
  SQLConsulta: TFDQuery;
begin

  SQLConsulta := TFDQuery.Create(nil);
  Result := TStringList.Create;
  try
    Result.BeginUpdate;
    Result.Add('Todos os modelos');
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

function TdmRelatorios.GetUsuarios: TStrings;
var
  SQLConsulta: TFDQuery;
begin
  SQLConsulta := TFDQuery.Create(nil);
  Result := TStringList.Create;
  try
    Result.BeginUpdate;
    Result.Add('Todos os responsáveis');
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
