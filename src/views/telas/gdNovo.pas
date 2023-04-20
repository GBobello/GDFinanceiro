unit gdNovo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gdSimples, System.ImageList,
  Vcl.ImgList, Vcl.Buttons, Vcl.ExtCtrls, Vcl.WinXPanels, Vcl.StdCtrls, GD_Edit,
  Vcl.Mask, GD_MaskEdit_Data, Vcl.DBCtrls, Vcl.Samples.Spin, GD_SpinEdit,
  GD_DBLookupComboBox;

type
  TfrNovo = class(TfrSimples)
    cdPanel: TCardPanel;
    cardConsulta: TCard;
    cardCadastro: TCard;
    pnBotoes: TPanel;
    pnEdits: TPanel;
    GD_SpinEdit1: TGD_SpinEdit;
    GD_MaskEdit_Data1: TGD_MaskEdit_Data;
    GD_Edit1: TGD_Edit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    pnCentralCadastro: TPanel;
    GD_DBLookupComboBox1: TGD_DBLookupComboBox;
    GD_DBLookupComboBox2: TGD_DBLookupComboBox;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frNovo: TfrNovo;

implementation

{$R *.dfm}

procedure TfrNovo.FormResize(Sender: TObject);
begin
  inherited;
  pnCentralCadastro.Left := (pnEdits.Width div 2) - (pnCentralCadastro.Width div 2);
  pnCentralCadastro.Top  := (pnEdits.Height div 2) - (pnCentralCadastro.Height div 2);
end;

end.
