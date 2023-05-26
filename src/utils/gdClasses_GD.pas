/////////////////////////////////////////////////////////////////////////////
{
    Unit Classes_GD
    Criação: Gabriel Bobello
}
/////////////////////////////////////////////////////////////////////////////

unit gdClasses_GD;

interface

uses
  System.Classes, gdUsuarioLogado, gdValorNovo;

procedure SetUsuarioLogado(prID: Integer; prNome: String; prIsAdm: Boolean);
procedure SetDeletaClasseUsuarioLogado;

procedure SetValorSofa(prID: Integer);
procedure SetDeletaValorSofa;

var
  fUsuarioLogado: TUsuarioLogado;
  fValorSofa: TValorNovo;

implementation

procedure SetUsuarioLogado(prID: Integer; prNome: String; prIsAdm: Boolean);
begin
  fUsuarioLogado := TUsuarioLogado.Create(prID, prNome, prIsAdm);
end;

procedure SetDeletaClasseUsuarioLogado;
begin
  fUsuarioLogado.Destroy;
end;

procedure SetValorSofa(prID: Integer);
begin
  fValorSofa := TValorNovo.Create(prID);
end;

procedure SetDeletaValorSofa;
begin
  fValorSofa := nil;
end;

end.
