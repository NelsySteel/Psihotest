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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDBUtils: TFormDBUtils;

implementation

{$R *.dfm}

end.
