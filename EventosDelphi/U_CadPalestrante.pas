unit U_CadPalestrante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, SUIDBCtrls, StdCtrls, ExtDlgs, Menus,
  ActnPopup, Buttons, ShellAPI, Mask, ToolEdit, U_funcoes;

type
  TF_Palestrante = class(TForm)
    suiDBGrid1: TsuiDBGrid;
    Qry_Palestrante: TQuery;
    Qry_CrudPalestrante: TQuery;
    ds_Palestrante: TDataSource;
    Qry_PalestrantePalestranteId: TIntegerField;
    Qry_PalestranteNome: TStringField;
    Qry_PalestranteImagemUrl: TStringField;
    Qry_PalestranteTelefone: TIntegerField;
    Qry_PalestranteMinicurriculo: TStringField;
    Qry_PalestranteEmail: TStringField;
    edtIdPalestrante: TEdit;
    edtNomePalestrante: TEdit;
    edtTelefonePalestrante: TEdit;
    edtEmailPalestrante: TEdit;
    edtImagemPalestrante: TEdit;
    btnSalvarPalestrante: TButton;
    lblIdPalestrante: TLabel;
    lblNomePalestrante: TLabel;
    lblTelefone: TLabel;
    lblEmailPalestrante: TLabel;
    lblImagemPalestrante: TLabel;
    lblMinicurriculoPalestrante: TLabel;
    btnLimpar: TButton;
    opdBuscarImagem: TOpenPictureDialog;
    btnBuscarImagem: TButton;
    PopupActionBar1: TPopupActionBar;
    popExcluirPalestrante: TMenuItem;
    SpeedButton1: TSpeedButton;
    edtMinicurriculoPalestrante: TFilenameEdit;
    popMinicurriculo: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarPalestranteClick(Sender: TObject);
    procedure suiDBGrid1CellClick(Column: TColumn);
    procedure btnLimparClick(Sender: TObject);
    procedure btnBuscarImagemClick(Sender: TObject);
    procedure popExcluirPalestranteClick(Sender: TObject);
    procedure PopupActionBar1Popup(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure popMinicurriculoClick(Sender: TObject);
  private
    { Private declarations }
    postEvento: Boolean;
    palestranteId: Integer;
    procedure AtualizarForm();
    procedure PreencherForm();
    procedure ExcluirPalestrante();
    procedure IncluirPalestrante(testeEvento: Boolean);
  public
    { Public declarations }
  end;

var
  F_Palestrante: TF_Palestrante;

implementation
{$R *.dfm}

procedure TF_Palestrante.AtualizarForm();
begin
  LimparCamposForm(F_Palestrante);
  edtIdPalestrante.Enabled := true;
  edtIdPalestrante.ReadOnly := false;
  Qry_Palestrante.Close;
  Qry_Palestrante.Open;
  postEvento := true;
end;

procedure TF_Palestrante.PreencherForm();
begin
  edtIdPalestrante.Text := Qry_Palestrante.FieldByName('PalestranteID').AsString;
  edtNomePalestrante.Text := Qry_Palestrante.FieldByName('Nome').AsString;
  edtTelefonePalestrante.Text := Qry_Palestrante.FieldByName('Telefone').AsString;
  edtEmailPalestrante.Text := Qry_Palestrante.FieldByName('Email').AsString;
  edtImagemPalestrante.Text := Qry_Palestrante.FieldByName('ImagemUrl').AsString;
  edtMinicurriculoPalestrante.Text := Qry_Palestrante.FieldByName('Minicurriculo').AsString;

  palestranteId := Qry_Palestrante.FieldByName('PalestranteId').AsInteger;

  postEvento := false;
  edtIdPalestrante.ReadOnly := true;
  edtIdPalestrante.Enabled := false;
end;

procedure TF_Palestrante.ExcluirPalestrante();
begin
  Qry_CrudPalestrante.Close;
  Qry_CrudPalestrante.Sql.Clear;
  Qry_CrudPalestrante.Sql.Add('DELETE FROM Palestrante WHERE PalestranteId = :PALESTRANTEID');
  Qry_CrudPalestrante.ParamByName('PALESTRANTEID').AsInteger := StrToInt(edtIdPalestrante.Text);
  Qry_CrudPalestrante.ExecSql;

  ShowMessage('Palestrante excluido com sucesso!');
  AtualizarForm();
end;

procedure TF_Palestrante.IncluirPalestrante(testeEvento: Boolean);
begin
  if(testeEvento) then
  begin
    Qry_CrudPalestrante.Close;
    Qry_CrudPalestrante.Sql.Clear;
    Qry_CrudPalestrante.Sql.Add('INSERT INTO Palestrante(PalestranteId, Nome, Telefone, ');
    Qry_CrudPalestrante.Sql.Add('Email, ImagemUrl, Minicurriculo) VALUES (:PALESTRANTEID, ');
    Qry_CrudPalestrante.Sql.Add(':NOME, :TELEFONE, :EMAIL, :IMAGEM, :MINICURRICULO)');

    Qry_CrudPalestrante.ParamByName('PALESTRANTEID').AsString := edtIdPalestrante.Text;
    Qry_CrudPalestrante.ParamByName('NOME').AsString := edtNomePalestrante.Text;
    Qry_CrudPalestrante.ParamByName('TELEFONE').AsString := edtTelefonePalestrante.Text;
    Qry_CrudPalestrante.ParamByName('EMAIL').AsString := edtEmailPalestrante.Text;
    Qry_CrudPalestrante.ParamByName('IMAGEM').AsString := edtImagemPalestrante.Text;
    Qry_CrudPalestrante.ParamByName('MINICURRICULO').AsString := edtMinicurriculoPalestrante.FileName;
    Qry_CrudPalestrante.ExecSql;

    ShowMessage('Palestrante cadastrado com sucesso!');
  end

  else
  begin
    Qry_CrudPalestrante.Close;
    Qry_CrudPalestrante.Sql.Clear;
    Qry_CrudPalestrante.Sql.Add('UPDATE Palestrante ');
    Qry_CrudPalestrante.Sql.Add('SET ');
    Qry_CrudPalestrante.Sql.Add('Nome = :NOME, ');
    Qry_CrudPalestrante.Sql.Add('Telefone = :TELEFONE, ');
    Qry_CrudPalestrante.Sql.Add('Email = :EMAIL, ');
    Qry_CrudPalestrante.Sql.Add('ImagemUrl = :IMAGEM, ');
    Qry_CrudPalestrante.Sql.Add('Minicurriculo = :MINI ');
    Qry_CrudPalestrante.Sql.Add('WHERE PalestranteId = :PALESTRANTEID');

    Qry_CrudPalestrante.ParamByName('NOME').AsString := edtNomePalestrante.Text;
    Qry_CrudPalestrante.ParamByName('TELEFONE').AsString := edtTelefonePalestrante.Text;
    Qry_CrudPalestrante.ParamByName('EMAIL').AsString := edtEmailPalestrante.Text;
    Qry_CrudPalestrante.ParamByName('IMAGEM').AsString := edtImagemPalestrante.Text;
    Qry_CrudPalestrante.ParamByName('MINI').AsString := edtMinicurriculoPalestrante.FileName;
    Qry_CrudPalestrante.ParamByName('PALESTRANTEID').AsInteger := palestranteId;

    Qry_CrudPalestrante.ExecSql;

    ShowMessage('Dados alterados com sucesso!');
  end;

  AtualizarForm();
end;

//IMAGEM
procedure TF_Palestrante.btnBuscarImagemClick(Sender: TObject);
begin
  opdBuscarImagem.Execute;
  edtImagemPalestrante.Text := opdBuscarImagem.FileName;
end;

procedure TF_Palestrante.btnLimparClick(Sender: TObject);
begin
  AtualizarForm();
end;

procedure TF_Palestrante.btnSalvarPalestranteClick(Sender: TObject);
begin
  ValidarCamposForm(F_Palestrante);
  IncluirPalestrante(postEvento);
end;

procedure TF_Palestrante.FormCreate(Sender: TObject);
begin
  Qry_Palestrante.Open;
  postEvento := true;
end;

procedure TF_Palestrante.popExcluirPalestranteClick(Sender: TObject);
begin
  ExcluirPalestrante();
end;

procedure TF_Palestrante.popMinicurriculoClick(Sender: TObject);
begin
  AbrirDoc(edtMinicurriculoPalestrante.Text);
end;

procedure TF_Palestrante.PopupActionBar1Popup(Sender: TObject);
begin
  PreencherForm();
end;

procedure TF_Palestrante.SpeedButton1Click(Sender: TObject);
begin
  AbrirDoc(edtMinicurriculoPalestrante.Text);
end;

procedure TF_Palestrante.suiDBGrid1CellClick(Column: TColumn);
begin
  PreencherForm();
end;

end.
