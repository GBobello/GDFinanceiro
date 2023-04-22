unit gdClasses_GD;

interface

uses
  System.Classes, gdUsuarioLogado;

procedure SetUsuarioLogado(prID: Integer; prNome: String; prIsAdm: Boolean);
procedure SetDeletaClasseUsuarioLogado;

var
  fUsuarioLogado: TUsuarioLogado;

implementation

procedure SetUsuarioLogado(prID: Integer; prNome: String; prIsAdm: Boolean);
begin
  fUsuarioLogado := TUsuarioLogado.Create(prID, prNome, prIsAdm);
end;

procedure SetDeletaClasseUsuarioLogado;
begin
  fUsuarioLogado.Destroy;
end;

end.
