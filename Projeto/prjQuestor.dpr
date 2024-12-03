program prjQuestor;

uses
  Vcl.Forms,
  View.Principal in '..\View\Principal\View.Principal.pas' {unPrincipal},
  Controller.Connection in '..\Controller\Controller.Connection.pas',
  Controller.GenericCrud in '..\Controller\Controller.GenericCrud.pas',
  Register.Marca in '..\Register\Register.Marca.pas',
  View.RegisterWrite in '..\View\RegisterWrite\View.RegisterWrite.pas' {ViewRegisterWrite},
  View.Marca in '..\View\Marca\View.Marca.pas' {Marca},
  Register.Modelo in '..\Register\Register.Modelo.pas',
  Register.Cliente in '..\Register\Register.Cliente.pas',
  Register.Venda in '..\Register\Register.Venda.pas',
  Register.Item in '..\Register\Register.Item.pas',
  View.Venda in '..\View\Venda\View.Venda.pas' {Venda},
  View.Consulta in '..\View\Consulta\View.Consulta.pas' {ViewConsulta},
  Controller.Fields in '..\Controller\Controller.Fields.pas',
  View.Modelo in '..\View\Modelo\View.Modelo.pas' {Modelo},
  View.Cliente in '..\View\Cliente\View.Cliente.pas' {Cliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TunPrincipal, unPrincipal);
  Application.Run;
end.
