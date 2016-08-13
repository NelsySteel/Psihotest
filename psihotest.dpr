program psihotest;

uses
  Forms,
  Main in 'Main.pas' {FormMain},
  dbUtils in 'dbUtils.pas' {FormDBUtils},
  Test in 'Test.pas' {FormTest},
  User in 'User.pas' {FormUser},
  Result in 'Result.pas' {FormResult};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormDBUtils, FormDBUtils);
  Application.CreateForm(TFormTest, FormTest);
  Application.CreateForm(TFormUser, FormUser);
  Application.CreateForm(TFormResult, FormResult);
  Application.Run;
end.
