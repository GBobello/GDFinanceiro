unit gdUsuarioClass;

interface

uses
  System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase, FireDAC.Comp.UI, udmConexao, gdClasses_GD,
  System.SysUtils;

type
  TUsuarioClass = class
    private
      FBDCODUSU: Integer;
      FBDLOGINUSU: String;
      FBDISADM: Boolean;
      FBDNOMUSU: String;
      FBDSENHAUSU: String;
      FQueryConsulta: TFDQuery;
      FConexao: TFDConnection;
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

      procedure GetUsuarios;

      property Conexao: TFDConnection read FConexao write SetConexao;
      property QueryConsulta: TFDQuery read FQueryConsulta write SetQueryConsulta;
      property BDCODUSU: Integer read FBDCODUSU write SetBDCODUSU;
      property BDNOMUSU: String read FBDNOMUSU write SetBDNOMUSU;
      property BDLOGINUSU: String read FBDLOGINUSU write SetBDLOGINUSU;
      property BDSENHAUSU: String read FBDSENHAUSU write SetBDSENHAUSU;
      property BDISADM: Boolean read FBDISADM write SetBDISADM;
  end;

implementation

{ TUsuarioClass }


constructor TUsuarioClass.Create;
begin
  FConexao                  := dmConexao.Conexao;
  FQueryConsulta            := TFDQuery.Create(nil);
  FQueryConsulta.Connection := FConexao;
end;

destructor TUsuarioClass.Destroy;
begin
  FConexao.Close;
  FConexao.Free;
  FQueryConsulta.Close;
  FQueryConsulta.Free;
end;


procedure TUsuarioClass.GetUsuarios;
begin
  FQueryConsulta.SQL.Clear;
  FQueryConsulta.SQL.Add('SELECT * FROM TB_USUARIOS');
  FQueryConsulta.Open;
end;

procedure TUsuarioClass.SetBDCODUSU(const Value: Integer);
begin
  FBDCODUSU := Value;
end;

procedure TUsuarioClass.SetBDISADM(const Value: Boolean);
begin
  FBDISADM := Value;
end;

procedure TUsuarioClass.SetBDLOGINUSU(const Value: String);
begin
  FBDLOGINUSU := Value;
end;

procedure TUsuarioClass.SetBDNOMUSU(const Value: String);
begin
  FBDNOMUSU := Value;
end;

procedure TUsuarioClass.SetBDSENHAUSU(const Value: String);
begin
  FBDSENHAUSU := Value;
end;

procedure TUsuarioClass.SetConexao(const Value: TFDConnection);
begin
  FConexao := Value;
end;

procedure TUsuarioClass.SetQueryConsulta(const Value: TFDQuery);
begin
  FQueryConsulta := Value;
end;

end.
