unit gdUsuarioLogado;

interface

uses
  System.Classes;

type
  TUsuarioLogado = class
    private
      FID: Integer;
      FIsAdm: Boolean;
      FNome: String;
      procedure SetID(const Value: Integer);
      procedure SetIsAdm(const Value: Boolean);
      procedure SetNome(const Value: String);
    public
      constructor Create(prID: Integer; prNome: String; prIsAdm: Boolean);
      destructor Destroy;

      property ID: Integer read FID write SetID;
      property Nome: String read FNome write SetNome;
      property IsAdm: Boolean read FIsAdm write SetIsAdm;
  end;

implementation

{ TUsuarioLogado }

constructor TUsuarioLogado.Create(prID: Integer; prNome: String;
  prIsAdm: Boolean);
begin
  FID     := prID;
  FNome   := prNome;
  FIsAdm  := prIsAdm;
end;

destructor TUsuarioLogado.Destroy;
begin
  FID     := 0;
  FNome   := '';
  FIsAdm  := False;
end;

procedure TUsuarioLogado.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TUsuarioLogado.SetIsAdm(const Value: Boolean);
begin
  FIsAdm := Value;
end;

procedure TUsuarioLogado.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
