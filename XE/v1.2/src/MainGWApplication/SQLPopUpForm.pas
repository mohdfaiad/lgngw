unit SQLPopUpForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SynEditHighlighter, SynHighlighterSQL, SynEdit, StdCtrls,
  ExtCtrls;

type
  TFormSQLPopUp = class(TForm)
    Panel1: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    Panel2: TPanel;
    SynSQL: TSynEdit;
    SynSQLSyn1: TSynSQLSyn;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FSQLText: TStringList;
    procedure SetSQLText(const Value: TStringList);

    { Private declarations }
  public
    { Public declarations }
    property SQLText : TStringList read FSQLText write SetSQLText;
  end;

var
  FormSQLPopUp: TFormSQLPopUp;

implementation

{$R *.dfm}

{ TFormSQLPopUp }



{ TFormSQLPopUp }

procedure TFormSQLPopUp.SetSQLText(const Value: TStringList);
begin
  FSQLText := Value;
end;

procedure TFormSQLPopUp.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFormSQLPopUp.btnOKClick(Sender: TObject);
begin
  FSQLText :=TStringList.Create;
  FSQLText.Text := SynSQL.Text;
  Close;
end;

procedure TFormSQLPopUp.FormShow(Sender: TObject);
begin
    SynSQL.Text := FSQLText.Text;
end;

end.
