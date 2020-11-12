unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmCalc = class(TForm)
    btnAdd: TButton;
    edtA: TEdit;
    edtB: TEdit;
    lblResult: TLabel;
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalc: TfrmCalc;

implementation

{$R *.dfm}

procedure TfrmCalc.btnAddClick(Sender: TObject);
Var
a, b, c : Single;
begin
  a := StrToFloat(edtA.Text);
  b := StrToFloat(edtB.Text);
  c := a + b;
  lblResult.Visible := true;
  lblResult.Caption := FloatToStr(c);
end;

end.
