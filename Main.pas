unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus;

type
  TFormMain = class(TForm)
    TestBtn: TBitBtn;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Admin1: TMenuItem;
    N1: TMenuItem;
    MenuResultsSimple: TMenuItem;
    MenuResultsExt: TMenuItem;
    MenuEdit: TMenuItem;
    N5: TMenuItem;
    MenuTestHelp: TMenuItem;
    MenuProgHelp: TMenuItem;
    MenuTest: TMenuItem;
    MenuExit: TMenuItem;
    N2: TMenuItem;
    Results: TBitBtn;
    procedure MenuExitClick(Sender: TObject);
    procedure ResultBtnClick(Sender: TObject);
    procedure TestBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FUserID: Integer;
    function GetUserID: Integer;
    procedure InitNewData;
  public
    { Public declarations }
    property UserID: Integer read GetUserID write FUserID;
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}
uses User,Test,Result;

procedure TFormMain.ResultBtnClick(Sender: TObject);
begin
  FormResult.Show;
end;

procedure TFormMain.TestBtnClick(Sender: TObject);
begin
  FormTest.Show;
end;

procedure TFormMain.MenuExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFormMain.InitNewData;
begin
  FUserId:=1;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  InitNewData;
end;

function TFormMain.GetuserID: Integer;
begin
  Result := FUserID;
end;
end.
