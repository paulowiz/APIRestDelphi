program horse_api;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  System.JSON,
  ServerReact.Model.Connection in 'model\ServerReact.Model.Connection.pas',
  ServerReact.Model.Entidades.User in 'model\Entidades\ServerReact.Model.Entidades.User.pas',
  ServerReact.Model.DAOGeneric in 'model\ServerReact.Model.DAOGeneric.pas';

var
  App: THorse;

begin
  App := THorse.Create(9000);

  App.Use(Jhonson);

  App.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      ServerReact.Model.Connection.Connected;
      ServerReact.Model.Connection.Disconnected;
      Res.Send('pong');
    end);

    App.Get('/users',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      FDAO : iDAOGeneric<TUSER>;
    begin
      FDAO := TDAOGeneric<TUSER>.New;
      Res.Send<TJsonArray>(FDAO.Find);
    end);
  App.Start;
end.
