unit SettingSyncSQLForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SynEdit, StdCtrls, SynDBEdit, SynEditHighlighter,
  SynHighlighterSQL;

type
  TformSettingSyncSQL = class(TForm)
    Panel1: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    Panel2: TPanel;
    Splitter1: TSplitter;
    SynSQLSyn1: TSynSQLSyn;
    srcSQL: TSynEdit;
    targetSQL: TSynEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    FSqlTarget: TStringList;
    FSqlSource: TStringList;
    procedure SetSqlSource(const Value: TStringList);
    procedure SetSqlTarget(const Value: TStringList);
    { Private declarations }
  public
    { Public declarations }
    property SqlSource : TStringList read FSqlSource write SetSqlSource;
    property SqlTarget : TStringList read FSqlTarget write SetSqlTarget;

  end;

var
  formSettingSyncSQL: TformSettingSyncSQL;

implementation

{$R *.dfm}

procedure TformSettingSyncSQL.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TformSettingSyncSQL.btnOKClick(Sender: TObject);
begin
  FSqlTarget:=TStringList.Create;
  FSqlTarget.Text := srcSQL.Text;

  FSqlSource := TStringList.Create;
  FSqlSource.Text := targetSQL.Text;

  Close;
end;

procedure TformSettingSyncSQL.SetSqlSource(const Value: TStringList);
begin
  FSqlSource := Value;
  srcSQL.Text := Value.Text;
end;

procedure TformSettingSyncSQL.SetSqlTarget(const Value: TStringList);
begin
  FSqlTarget := Value;

  targetSQL.Text := Value.Text;
end;

end.
