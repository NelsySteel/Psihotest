unit Test;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, DBCtrls, dbUtils, Grids, DBGrids, Buttons,
  ComCtrls, DB, ADODB;

type
  TFormTest = class(TForm)
    CheckListBox: TCheckListBox;
    BitBtn1: TBitBtn;
    ProgressBar1: TProgressBar;
    TempQ: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure CheckListBoxClickCheck(Sender: TObject);
    procedure CountCategory;
    procedure CheckBoxUpdate;
    procedure BitBtn1Click(Sender: TObject);
    function CheckListBoxChecked:Integer;
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
function TFormTest.CheckListBoxChecked;
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
  CheckListBoxChecked:=cnt;
end;
procedure TFormTest.CheckBoxUpdate;
var
  i:integer;
begin
  FormDBUtils.ADOQuery.SQL.Clear;
  FormDBUtils.ADOQuery.SQL.Add('SELECT quest_name FROM questions WHERE sec_id='+IntToStr(Section));
  FormDBUtils.ADOQuery.Active:=True;

  CheckListBox.Clear(); // Компонент типа TCheckListBox
  for i:=1 to FormDBUtils.ADOQuery.RecordCount  do
  begin
    CheckListBox.Items.Add(FormDBUtils.ADOQuery.FieldByName('quest_name').AsString);
    FormDBUtils.ADOQuery.Next();
  end;
end;
procedure TFormTest.CountCategory;
var
  i,j: integer;
begin
  FormDBUtils.ADOQuery1.SQL.Clear;
  FormDBUtils.ADOQuery1.SQL.Add('SELECT pos_1, pos_2, pos_3, pos_4, neg_1, neg_2, neg_3 ');
  FormDBUtils.ADOQuery1.SQL.Add(' FROM questions WHERE (sec_id='+IntToStr(Section)+') AND (');

  for I := 0 to CheckListBox.Items.Count - 1 do
    begin
      if CheckListBox.Checked[i] then
      begin
        FormDBUtils.ADOQuery1.SQL.Add(' quest_nom='+IntToStr(i+1));
        FormDBUtils.ADOQuery1.SQL.Add(' OR ');
      end;
    end;
    FormDBUtils.ADOQuery1.SQL.Add(' quest_id = 0)');
    FormDBUtils.ADOQuery1.Open;

    for I := 0 to FormDBUtils.ADOQuery1.RecordCount - 1 do
    begin
      FormDBUtils.TempQuery.SQL.Clear;
      FormDBUtils.TempQuery.SQL.Add('SELECT * FROM user_data WHERE user_id=1 ');
      FormDBUtils.TempQuery.SQL.Add('AND  type_id = ');
      FormDBUtils.TempQuery.SQL.Add(FormDBUtils.ADOQuery1.FieldByName('pos_1').AsString);
      FormDBUtils.TempQuery.Open;

      for j:= 0 to 6 do
      begin
      FormDBUtils.ADOQuery1.Open;
      if FormDBUtils.ADOQuery1.Fields[j].AsInteger<>0  then
      begin    //Если есть балл типа в поле
        if FormDBUtils.TempQuery.RecordCount=0 then       //если еще нет этого типа для этого юзера
          begin
          TempQ.SQL.Clear;
          TempQ.SQL.Add('INSERT INTO user_data ');
          TempQ.SQL.Add('VALUES (1, '+ FormDBUtils.ADOQuery1.Fields[j].AsString+', 1)');
          TempQ.ExecSQL;
          end
        else
        begin
          TempQ.SQL.Clear;
          TempQ.SQL.Add('UPDATE user_data ');
          TempQ.SQL.Add('SET user_data.count = user_data.count+1 ');
          TempQ.SQL.Add('WHERE user_id=1 ');
          TempQ.SQL.Add('AND  type_id=');
          TempQ.SQL.Add(FormDBUtils.ADOQuery1.Fields[j].AsString);
          TempQ.ExecSQL;
        end;
      end;
      end;
    end;

end;

procedure TFormTest.BitBtn1Click(Sender: TObject);
begin
  CountCategory();
  if CheckListBoxChecked()=0 then
    ShowMessage('Выберите хотя бы один правильный ответ! Если такого нет - выберите последний вариант.')
  else
  begin
    Inc(Section);
    ProgressBar1.Position:=Section*10;
    CheckBoxUpdate;
  end;
end;

procedure TFormTest.CheckListBoxClickCheck(Sender: TObject);
var i:integer;
begin
  if CheckListBoxChecked() >= 3 then
    for I := 0 to CheckListBox.Items.Count - 1 do
    begin
      if not CheckListBox.Checked[i] then
        CheckListBox.ItemEnabled[i] := false;
      CheckListBox.Repaint;
    end
  else
    for I := 0 to CheckListBox.Items.Count - 1 do
    begin
      CheckListBox.ItemEnabled[i] := true;
      CheckListBox.Repaint;
    end;
end;

procedure TFormTest.FormCreate(Sender: TObject);
var
i:integer;
begin
  Section:=1;
  CheckBoxUpdate;
end;

end.
