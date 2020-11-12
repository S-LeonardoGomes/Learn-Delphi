unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TForm3 = class(TForm)
    GridPanel1: TGridPanel;
    pnlConteudoEsquerda: TPanel;
    pnlConteudoDireita: TPanel;
    imgLogo: TImage;
    lblNomeLogo: TLabel;
    lblNomeLogo2: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    lblLogin: TLabel;
    lblSenha: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

end.
