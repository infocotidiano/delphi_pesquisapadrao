program ExePesquisa;

uses
  Vcl.Forms,
  uprincipal in 'uprincipal.pas' {frmPrincipal},
  upesquisa in 'upesquisa.pas' {frmPesquisa},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 SlateGray');
  Application.Title := 'Pesquisa Padrao - Parametro entre formul�rios';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmPesquisa, frmPesquisa);
  Application.Run;
end.
