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
  FormDBUtils.ADOQuery.SQL.Add('SELECT type_id, count FROM user_data Where user_id=1');
  FormDBUtils.ADOQuery.Active:=True;
end;

end.
