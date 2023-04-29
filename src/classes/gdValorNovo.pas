unit gdValorNovo;

interface

uses
  System.Classes;

type
  TValorNovo = class
  private
    FCodSofa: Integer;
    procedure SetCodSofa(const Value: Integer);
  public
    constructor Create(prIDSofa: Integer);
    destructor Destroy;

    property CodSofa: Integer read FCodSofa write SetCodSofa;
  end;

implementation

{ TValorNovo }

constructor TValorNovo.Create(prIDSofa: Integer);
begin
  FCodSofa := prIDSofa;
end;

destructor TValorNovo.Destroy;
begin
  FCodSofa := 0;
end;

procedure TValorNovo.SetCodSofa(const Value: Integer);
begin
  FCodSofa := Value;
end;

end.
