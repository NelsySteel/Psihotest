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
    procedure TestBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}
uses User,Test,Result;

procedure TFormMain.TestBtnClick(Sender: TObject);
begin
  FormResult.Show;
end;

procedure TFormMain.MenuExitClick(Sender: TObject);
begin
  Halt;
end;

end.
