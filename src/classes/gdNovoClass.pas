unit gdNovoClass;

interface

uses
  System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase, FireDAC.Comp.UI, udmConexao, gdClasses_GD,
  System.SysUtils;

type
  TNovoClass = class
  private
    FQueryConsulta: TFDQuery;
    FBDCODUSU: Integer;
    FBDCODSERV: Integer;
    FBDQUANTIDADE: Integer;
    FBDDATASERV: TDateTime;
    FBDTOTALSERV: Currency;
    FBDSERVICO: Integer;
    FConexao: TFDConnection;
    FBDCODSOFA: Integer;
    procedure SetBDCODSERV(const Value: Integer);
    procedure SetBDCODSOFA(const Value: Integer);
    procedure SetBDCODUSU(const Value: Integer);
    procedure SetBDDATASERV(const Value: TDateTime);
    procedure SetBDQUANTIDADE(const Value: Integer);
    procedure SetBDSERVICO(const Value: Integer);
    procedure SetBDTOTALSERV(const Value: Currency);
    procedure SetConexao(const Value: TFDConnection);
    procedure SetQueryConsulta(const Value: TFDQuery);
  public
    constructor Create;
    destructor Destroy;

    property Conexao: TFDConnection read FConexao write SetConexao;
    property QueryConsulta: TFDQuery read FQueryConsulta write SetQueryConsulta;
    property BDCODSERV: Integer read FBDCODSERV write SetBDCODSERV;
    property BDDATASERV: TDateTime read FBDDATASERV write SetBDDATASERV;
    property BDCODUSU: Integer read FBDCODUSU write SetBDCODUSU;
    property BDQUANTIDADE: Integer read FBDQUANTIDADE write SetBDQUANTIDADE;
    property BDCODSOFA: Integer read FBDCODSOFA write SetBDCODSOFA;
    property BDSERVICO: Integer read FBDSERVICO write SetBDSERVICO;
    property BDTOTALSERV: Currency read FBDTOTALSERV write SetBDTOTALSERV;
  end;

implementation

{ TNovoClass }

constructor TNovoClass.Create;
begin
  FConexao                  := dmConexao.Conexao;
  FQueryConsulta            := TFDQuery.Create(nil);
  FQueryConsulta.Connection := FConexao;
end;

destructor TNovoClass.Destroy;
begin
  FConexao.Close;
  FConexao.Free;
  FQueryConsulta.Close;
  FQueryConsulta.Free;
end;

procedure TNovoClass.SetBDCODSERV(const Value: Integer);
begin
  FBDCODSERV := Value;
end;

procedure TNovoClass.SetBDCODSOFA(const Value: Integer);
begin
  FBDCODSOFA := Value;
end;

procedure TNovoClass.SetBDCODUSU(const Value: Integer);
begin
  FBDCODUSU := Value;
end;

procedure TNovoClass.SetBDDATASERV(const Value: TDateTime);
begin
  FBDDATASERV := Value;
end;

procedure TNovoClass.SetBDQUANTIDADE(const Value: Integer);
begin
  FBDQUANTIDADE := Value;
end;

procedure TNovoClass.SetBDSERVICO(const Value: Integer);
begin
  FBDSERVICO := Value;
end;

procedure TNovoClass.SetBDTOTALSERV(const Value: Currency);
begin
  FBDTOTALSERV := Value;
end;

procedure TNovoClass.SetConexao(const Value: TFDConnection);
begin
  FConexao := Value;
end;

procedure TNovoClass.SetQueryConsulta(const Value: TFDQuery);
begin
  FQueryConsulta := Value;
end;

end.
