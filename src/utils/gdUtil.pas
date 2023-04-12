unit gdUtil;

interface

uses
  Vcl.Dialogs, System.UITypes, Vcl.Forms, Vcl.Controls,
  Vcl.Graphics, Vcl.StdCtrls, System.SysUtils;


function MessageDlgGD(prMensagem: String; prTipo: TMsgDlgType; prBotoes: array of TMsgDlgBtn;
                      prCaption: Array of String; prBotaoDefault: Integer) : TModalResult; overload;

var
  FButtonNames                     : array[TMsgDlgBtn] of string = ('Yes', 'No', 'OK', 'Cancel', 'Abort', 'Retry','Ignore', 'All', 'NoToAll','YesToAll', 'Help', 'Close');

implementation

function MessageDlgGD(prMensagem: String; prTipo: TMsgDlgType; prBotoes: array of TMsgDlgBtn;
                      prCaption: Array of String; prBotaoDefault: Integer) : TModalResult;
var
  wConta ,
  wBotao : Integer;  { Vari�vel que indicar� o bot�o atual }
  wButton : TButton;
  wWidthPadrao : Integer;
  wTamTotBotoes : Integer;
  wLeft : Integer;
  wIBtn : Integer;
  wCjtoBtn : TMsgDlgButtons;
  wEspaco : Integer;
  wContaButton : integer;
  wTopButton : integer;
  wEspacoInicio : integer;
  wDiv : integer;
  wForm : TForm;

const
  C_ESPACO = 8;

begin
  wCjtoBtn := [];

  for wIBtn := 0 to Length(prBotoes) - 1 do
    Include(wCjtoBtn, prBotoes[wIBtn]);

  wBotao := 0;
  wWidthPadrao := 0;

  wForm := CreateMessageDialog(prMensagem,prTipo,wCjtoBtn);
  try
    // Ajusta o tamanho e posi��o dos bot�es
    for wConta := 0 to wForm.ComponentCount - 1 do
      begin
        if wForm.Components[wConta] is TButton then
           begin
             { Altera o Caption dos Bot�es }
             wButton := TButton(wForm.Components[wConta]);

             if (10 * Length(' ' + Trim(prCaption[wBotao]) + ' ')) > wButton.Width then
                wButton.Width := 10 * Length(' ' + prCaption[wBotao] + ' ');

             if wWidthPadrao < wButton.Width  then
                wWidthPadrao := wButton.Width;

             Inc(wBotao);
           end;
      end;

    wDiv := 1;

    wTamTotBotoes := wWidthPadrao * trunc(wBotao/wDiv);

    if (wTamTotBotoes + (C_ESPACO * (wBotao/wDiv + 1))) > wForm.Width then
       begin
         wForm.Width := (wTamTotBotoes + (C_ESPACO * (trunc(wBotao/wDiv) + 1)));
         wEspaco := C_ESPACO;
       end
    else
       begin
         wEspaco := (wForm.Width - wTamTotBotoes) div (trunc(wBotao/wDiv) + 1);
       end;

    wBotao := 0;
    wLeft := wEspaco;
    wEspacoInicio := wLeft;

    wContaButton := 0;
    wTopButton := 0;
    for wIBtn := 0 to Length(prBotoes) - 1 do
      begin
        wConta := 0;

        while wConta <= wForm.ComponentCount - 1 do
          begin
            if wForm.Components[wConta] is TButton  then
               begin
                 { Altera o Caption dos Bot�es }
                 wButton := TButton(wForm.Components[wConta]);

                 if wButton.Name = FButtonNames[prBotoes[wIBtn]] then
                    begin
                      inc(wContaButton);
                      if wContaButton = 1 then
                         wTopButton := wButton.Top;

                      wButton.Top := wTopButton;
                      wButton.Width := wWidthPadrao;
                      wButton.Left := wLeft;
                      wLeft := wLeft + wWidthPadrao + wEspaco;
                      wButton.Caption := prCaption[wBotao];
                      wButton.TabOrder := wBotao;

                      Inc(wBotao);

                      if (wButton.Caption = prCaption[prBotaoDefault]) then
                         wForm.ActiveControl := (wForm.Components[wConta] as TWinControl);

                      Break;
                    end;
               end;

            Inc(wConta);
          end;
      end;

    case prTipo of
      mtWarning     : wForm.Caption := 'Aten��o!';
      mtError       : wForm.Caption := 'Erro!';
      mtInformation : wForm.Caption := 'Informa��o!';
      mtConfirmation: wForm.Caption := 'Confirma��o!';
    end;
    wForm.Position := poScreenCenter;
    Result := wForm.ShowModal;
  finally
    wForm.Free;
  end;
end;

end.
