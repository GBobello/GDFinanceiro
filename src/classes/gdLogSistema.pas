unit gdLogSistema;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase, FireDAC.Comp.UI, udmConexao;

  procedure AdicionarLog(prTela: String; prDescricao: String; prDataHora: TDateTime; prUsuario: Integer);

implementation

procedure AdicionarLog(prTela: String; prDescricao: String; prDataHora: TDateTime; prUsuario: Integer);
var
  SQLCommand: TFDCommand;
begin
  SQLCommand := TFDCommand.Create(nil);
  try
    SQLCommand.Connection := dmConexao.Conexao;
    SQLCommand.CommandText.Clear;
    SQLCommand.CommandText.Add
      ('INSERT INTO TB_LOG(BDCODLOG, BDDESCLOG, BDDATA, BDHORA, BDCODUSU, BDTELASISTEMA) values (0,'
      + QuotedStr(prDescricao) + ', ' + QuotedStr(DateToStr(prDataHora)) + ', '
      + QuotedStr(TimeToStr(prDataHora)) + ', ' + IntToStr(prUsuario) + ', ' +
      QuotedStr(prTela) + ');');
    SQLCommand.Open;

  finally
    SQLCommand.Close;
    FreeAndNil(SQLCommand);
  end;
end;

end.
