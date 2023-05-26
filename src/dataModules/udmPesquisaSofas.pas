/////////////////////////////////////////////////////////////////////////////
{
    Unit PesquisaSofas
    Criação: Gabriel Bobello
}
/////////////////////////////////////////////////////////////////////////////

unit udmPesquisaSofas;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  udmConexao;

type
  TdmPesquisaSofas = class(TDataModule)
    queryPesquisaSofas: TFDQuery;
    dspPesquisaSofas: TDataSetProvider;
    cdsPesquisaSofas: TClientDataSet;
    cdsPesquisaSofasBDCODSOFA: TIntegerField;
    cdsPesquisaSofasBDDESCSOFA: TStringField;
    cdsPesquisaSofasBDVALCOSTURA: TFMTBCDField;
    cdsPesquisaSofasBDVALCORTE: TFMTBCDField;
    cdsPesquisaSofasBDHORAS: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPesquisaSofas: TdmPesquisaSofas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
