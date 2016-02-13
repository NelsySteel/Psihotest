unit Test;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, DBCtrls, dbUtils, Grids, DBGrids, Buttons;

type
  TFormTest = class(TForm)
    CheckListBox: TCheckListBox;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure CheckListBoxClickCheck(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTest: TFormTest;
  Section: Integer;

implementation

{$R *.dfm}
procedure TFormTest.BitBtn1Click(Sender: TObject);
begin
  Inc(Section);
end;

procedure TFormTest.CheckListBoxClickCheck(Sender: TObject);
var
  cnt: integer;
  i: integer;
begin
  cnt:=0;
  for I := 0 to CheckListBox.Items.Count - 1 do
  begin
    if CheckListBox.Checked[i] then
      Inc(cnt);
  end;

  if cnt >= 3 then
  for I := 0 to CheckListBox.Items.Count - 1 do
  begin
    if not CheckListBox.Checked[i] then
      CheckListBox.ItemEnabled[i] := false;
  end
  else
  for I := 0 to CheckListBox.Items.Count - 1 do
  begin
      CheckListBox.ItemEnabled[i] := true;
  end;
  CheckListBox.Repaint;
end;

procedure TFormTest.FormCreate(Sender: TObject);
begin
  Section:=1;
end;

procedure TFormTest.FormPaint(Sender: TObject);
var i:Integer;
begin
  FormDBUtils.ADOQuery.SQL.Clear;
  FormDBUtils.ADOQuery.SQL.Add('SELECT quest_name FROM questions Where sec_id='+IntToStr(Section));
  FormDBUtils.ADOQuery.Active:=True;

  CheckListBox.Clear(); // Компонент типа TCheckListBox
  for i:=1 to FormDBUtils.ADOQuery.RecordCount  do
  begin
    CheckListBox.Items.Add(FormDBUtils.ADOQuery.FieldByName('quest_name').AsString);
    FormDBUtils.ADOQuery.Next();
  end;
end;

end.
