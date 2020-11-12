unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls;

type
  TF_sucesso = class(TForm)
    lblUsuario: TLabel;
    lblSenha: TLabel;
    lblUsuarioResultado: TLabel;
    lblSenhaResultado: TLabel;
    Qry_Resultado: TQuery;
    //procedure lblUsuarioResultadoClick(Sender: TObject);
    //procedure lblSenhaResultadoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_sucesso: TF_sucesso;

implementation

{$R *.dfm}

procedure TF_sucesso.FormCreate(Sender: TObject);
begin
  Qry_Resultado.Close;
  Qry_Resultado.Sql.Clear;
  Qry_Resultado.Sql.Add('SELECT * FROM cad_usuario');
  Qry_Resultado.Open;
  lblSenhaResultado.Caption := Qry_Resultado.FieldByName('senha').AsString;

  Qry_Resultado.Close;
  Qry_Resultado.Sql.Clear;
  Qry_Resultado.Sql.Add('SELECT * FROM cad_usuario');
  Qry_Resultado.Open;
  lblUsuarioResultado.Caption := Qry_Resultado.FieldByName('usuario').AsString;
end;

//procedure TF_sucesso.lblSenhaResultadoClick(Sender: TObject);
//begin
  //Qry_Resultado.Close;
  //Qry_Resultado.Sql.Clear;
  //Qry_Resultado.Sql.Add('SELECT * FROM cad_usuario');
  //Qry_Resultado.Open;
  //lblSenhaResultado.Caption := Qry_Resultado.FieldByName('senha').AsString;
//end;

//procedure TF_sucesso.lblUsuarioResultadoClick(Sender: TObject);
//begin
  //Qry_Resultado.Close;
  //Qry_Resultado.Sql.Clear;
  //Qry_Resultado.Sql.Add('SELECT * FROM cad_usuario');
  //Qry_Resultado.Open;
  //lblUsuarioResultado.Caption := Qry_Resultado.FieldByName('usuario').AsString;
//end;

end.
