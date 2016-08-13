unit dbUtils;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB;

type
  TFormDBUtils = class(TForm)
    ADOConnection: TADOConnection;
    ADOQuery: TADOQuery;
    DataSource: TDataSource;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    TempQuery: TADOQuery;

    function GetQuery(s:string): TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FormDBUtils: TFormDBUtils;

implementation

{$R *.dfm}

function TFormDBUtils.GetQuery(S:string): TADOQuery;
begin
  if (S = 'MainQuery') then Result := ADOQuery
  else if (s = 'AdditionalQuery') then Result := ADOQuery1
  else Result := TempQuery;

end;

end.
