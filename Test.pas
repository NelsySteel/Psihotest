unit Test;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, DBCtrls, dbUtils, Grids, DBGrids, Buttons,
  ComCtrls, DB, ADODB, Main;

type
  TPosition = (pos1, pos2, pos3, pos4, neg1, neg2, neg3, neg4);
  TType = (Null, Gipertim, Cikloid, Labil, AstenoNerv, Sensitive, Psihasten, Shizoid, Epilept,
   Isteroid, Unstable, Konform, Negative, Dissimulation, Honest, Psihopat, Emansipation,
   Delikvent, Male, Female, Alcohole);
  TPos = set of TPosition;

  TFormTest = class(TForm)
    CheckListBox: TCheckListBox;
    ButtonNext: TBitBtn;
    ProgressBar1: TProgressBar;
    TempQ: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure CheckListBoxClickCheck(Sender: TObject);

    procedure CheckBoxUpdate;
    procedure ButtonNextClick(Sender: TObject);
    function CheckListBoxChecked:Integer;

  private
    { Private declarations }
    QuestionsQuery: TADOQuery;
    ResultQuery: TADOQuery;
    TempQuery: TADOQuery;
    Section: Integer;

    procedure CountCategory;
    procedure UpdateType(update_type: TType);
    procedure InitForm;

  public
    { Public declarations }
  end;

var
  FormTest: TFormTest;
  Positions: TPos;

const
  POS_TEXT: array[TPosition] of String =
  ('pos_1', 'pos_2', 'pos_3', 'pos_4', 'neg_1', 'neg_2','neg_3', 'neg_4');
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
  question: String;
begin
  QuestionsQuery.SQL.Clear;
  QuestionsQuery.SQL.Add('SELECT quest_name ');
  QuestionsQuery.SQL.Add('FROM questions ');
  QuestionsQuery.SQL.Add('WHERE sec_id=');
  QuestionsQuery.SQL.Add(IntToStr(Section));
  QuestionsQuery.Active:=True;

  CheckListBox.Clear(); // Компонент типа TCheckListBox

  for i := 1 to QuestionsQuery.RecordCount  do
  begin
    question := QuestionsQuery.FieldByName('quest_name').AsString;
    CheckListBox.Items.Add(question);
    QuestionsQuery.Next();
  end;
end;

procedure TFormTest.UpdateType(update_type: TType);
begin
  TempQuery.SQL.Clear;
  TempQuery.SQL.Add('SELECT * FROM user_data ');
  TempQuery.SQL.Add('WHERE user_id = ');
  TempQuery.SQL.Add(IntToStr(FormMain.UserID));
  TempQuery.SQL.Add('AND  type_id = ');
  TempQuery.SQL.Add(IntToStr(Ord(update_type)));
  TempQuery.Open;

  if TempQuery.RecordCount=0 then       //если еще нет этого типа для этого юзера
  begin
    TempQ.SQL.Clear;
    TempQ.SQL.Add('INSERT INTO user_data ');
    TempQ.SQL.Add('VALUES (');
    TempQ.SQL.Add(IntToStr(FormMain.UserID));
    TempQ.SQL.Add(', '+ IntToStr(Ord(update_type)) +', 1)');
    TempQ.ExecSQL;
  end

  else
  begin
    TempQ.SQL.Clear;
    TempQ.SQL.Add('UPDATE user_data ');
    TempQ.SQL.Add('SET user_data.count = user_data.count+1 ');
    TempQ.SQL.Add('WHERE user_id= ');
    TempQ.SQL.Add(IntToStr(FormMain.UserID));
    TempQ.SQL.Add('AND  type_id=');
    TempQ.SQL.Add(IntToStr(Ord(update_type)));
    TempQ.ExecSQL;
  end;

end;

procedure TFormTest.CountCategory;
var
  i,j: integer;
  pos: TPosition;
  type_id: TField;
  typesString: String;
begin
  ResultQuery.SQL.Clear;
  ResultQuery.SQL.Add('SELECT ');
  for pos in Positions do
  begin
    if pos <> pos1 then typesString := typesString + ', ';
    typesString := typesString + POS_TEXT[pos];
  end;
  ResultQuery.SQL.Add(typesString);
  ResultQuery.SQL.Add('FROM questions ');
  ResultQuery.SQL.Add('WHERE (sec_id='+IntToStr(Section)+') AND (');
  for I := 0 to CheckListBox.Items.Count - 1 do
  begin
    if CheckListBox.Checked[i] then
    begin
      ResultQuery.SQL.Add(' quest_nom='+IntToStr(i+1));
      ResultQuery.SQL.Add(' OR ');
    end;
  end;

  ResultQuery.SQL.Add(' quest_id = 0)');
  ResultQuery.Open;

  for I := 0 to ResultQuery.RecordCount - 1 do
  begin
    for pos in Positions do
    begin
      type_id := ResultQuery.FieldByName(POS_TEXT[pos]);
      if type_id.AsInteger<>0 then
        UpdateType(TType(type_id.AsInteger));
    end;
  end;
end;


procedure TFormTest.ButtonNextClick(Sender: TObject);
begin

  if CheckListBoxChecked()=0 then
    ShowMessage('Выберите хотя бы один правильный ответ! Если такого нет - выберите последний вариант.')
  else
  begin
    CountCategory();
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

procedure TFormTest.InitForm;
begin
  QuestionsQuery := FormDBUtils.GetQuery('MainQuery');
  ResultQuery := FormDBUtils.GetQuery('AdditionalQuery');
  TempQuery := FormDBUtils.GetQuery('TempQuery');
  Positions := [pos1, pos2, pos3, pos4, neg1, neg2, neg3]
end;

procedure TFormTest.FormCreate(Sender: TObject);
begin
  InitForm;
  Section:=1;
  CheckBoxUpdate;
end;
end.
