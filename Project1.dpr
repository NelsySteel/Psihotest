program Project1;

uses
  Forms,
  Main in 'Main.pas' {FormMain},
  dbUtils in 'dbUtils.pas' {FormDBUtils},
  Test in 'Test.pas' {Form3},
  User in 'User.pas' {FormUser};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormDBUtils, FormDBUtils);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TFormUser, FormUser);
  Application.Run;
end.
