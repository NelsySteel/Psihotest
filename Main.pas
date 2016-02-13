unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus;

type
  TFormMain = class(TForm)
    BitBtn1: TBitBtn;
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
    procedure MenuExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.MenuExitClick(Sender: TObject);
begin
Halt;
end;

end.
