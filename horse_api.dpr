program horse_api;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  ServerReact.Model.Connection in 'model\ServerReact.Model.Connection.pas',
  ServerReact.Model.Entidades.User in 'model\Entidades\ServerReact.Model.Entidades.User.pas',
  ServerReact.Model.DAOGeneric in 'model\ServerReact.Model.DAOGeneric.pas';

var
  App: THorse;

begin
  App := THorse.Create(9000);

  App.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      ServerReact.Model.Connection.Connected;
      ServerReact.Model.Connection.Disconnected;
      Res.Send('pong');
    end);

  App.Start;
end.
