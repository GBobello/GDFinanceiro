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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmNovo: TdmNovo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
