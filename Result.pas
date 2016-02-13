unit Result;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids;

type
  TFormResult = class(TForm)
    DBGrid1: TDBGrid;
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormResult: TFormResult;

implementation

{$R *.dfm}
uses dbUtils;
procedure TFormResult.FormPaint(Sender: TObject);
var i:Integer;
begin
  FormDBUtils.ADOQuery.SQL.Clear;
  FormDBUtils.ADOQuery.SQL.Add('SELECT type_desc AS Тип, count AS Показатель FROM user_data LEFT JOIN types ON user_data.type_id = types.type_id WHERE user_id=1;');
  FormDBUtils.ADOQuery.Active:=True;

  DBGrid1.Columns[0].Width:=50;
end;

end.
