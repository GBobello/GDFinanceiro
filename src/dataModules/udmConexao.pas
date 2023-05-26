/////////////////////////////////////////////////////////////////////////////
{
    Unit DmConexao
    Criação: Gabriel Bobello
}
/////////////////////////////////////////////////////////////////////////////

unit udmConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase, FireDAC.Comp.UI, gdUsuarioClass;

type
  TdmConexao = class(TDataModule)
    Conexao: TFDConnection;
    conectionWaitCursor: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FUsuario: TUsuario;
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmConexao.DataModuleCreate(Sender: TObject);
begin
  Conexao.Params.Values['Database'] := System.SysUtils.GetCurrentDir + '\db\BANCO.FDB';
  Conexao.Params.Values['User_Name'] := 'SYSDBA';
  Conexao.Params.Values['Password'] := 'masterkey';
  Conexao.Connected := True;
end;

end.
