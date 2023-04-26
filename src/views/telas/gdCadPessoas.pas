unit gdCadPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gdSimples, System.ImageList,
  Vcl.ImgList, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.WinXPanels, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrCadPessoas = class(TfrSimples)
    cdPanel: TCardPanel;
    cardCadastroPessoas: TCard;
    cardConsultaPessoas: TCard;
    pnBotoes: TPanel;
    pnPesquisa: TPanel;
    pnGrid: TPanel;
    DBGrid1: TDBGrid;
    pnLeftBotoes: TPanel;
    pnExcluir: TPanel;
    spExcluir: TSpeedButton;
    pnCimaExcluir: TPanel;
    pnBaixoExcluir: TPanel;
    pnDireitaExcluir: TPanel;
    pnEsquerdaExcluir: TPanel;
    pnEditar: TPanel;
    spEditar: TSpeedButton;
    pnCimaEditar: TPanel;
    pnBaixoEditar: TPanel;
    pnDireitaEditar: TPanel;
    pnEsquerdaEditar: TPanel;
    pnNovoItem: TPanel;
    spNovoItem: TSpeedButton;
    pnCimaNovoItem: TPanel;
    pnBaixoNovoItem: TPanel;
    pnDireitaNovoItem: TPanel;
    pnEsquerdaNovoItem: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frCadPessoas: TfrCadPessoas;

implementation

{$R *.dfm}

end.
