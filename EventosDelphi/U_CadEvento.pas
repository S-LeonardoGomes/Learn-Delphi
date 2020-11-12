unit U_CadEvento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Mask, ToolEdit, StdCtrls, Grids, DBGrids, SUIDBCtrls,
  ExtDlgs, Menus, ActnPopup, U_Funcoes, DBClient, Provider, ComCtrls,
  SUITreeView, ExtCtrls, SUISideChannel;

type
  TfrmCrudEvento = class(TForm)
    btnCadastrarEvento: TButton;
    edtEnderecoEvento: TEdit;
    edtTemaEvento: TEdit;
    edtQtdPessoasEvento: TEdit;
    lblEnderecoEvento: TLabel;
    lblTemaEvento: TLabel;
    lblQtdPessoasEvento: TLabel;
    lblTelefoneEvento: TLabel;
    edtTelefoneEvento: TEdit;
    lblDataEvento: TLabel;
    lblImagemEvento: TLabel;
    Qry_CrudEvento: TQuery;
    edtImagemEvento: TEdit;
    edtDataEvento: TDateEdit;
    suiDBGrid1: TsuiDBGrid;
    dsEvento: TDataSource;
    Qry_Evento: TQuery;
    btnLimpar: TButton;
    Qry_EventoEventoId: TIntegerField;
    Qry_EventoEndereco: TStringField;
    Qry_EventoDataEvento: TDateTimeField;
    Qry_EventoTema: TStringField;
    Qry_EventoQtdPessoas: TIntegerField;
    Qry_EventoTelefone: TStringField;
    btnBuscarImagemEvento: TButton;
    opdBuscarImagemEvento: TOpenPictureDialog;
    PopupActionBar1: TPopupActionBar;
    popExcluirEvento: TMenuItem;
    Qry_EventoImagemUrl: TMemoField;
    DataSetProvider1: TDataSetProvider;
    cds_Evento: TClientDataSet;
    cds_EventoEventoId: TIntegerField;
    cds_EventoEndereco: TStringField;
    cds_EventoDataEvento: TDateTimeField;
    cds_EventoTema: TStringField;
    cds_EventoQtdPessoas: TIntegerField;
    cds_EventoTelefone: TStringField;
    cds_EventoImagemUrl: TMemoField;
    suiSideChannel1: TsuiSideChannel;
    suiTreeView1: TsuiTreeView;
    procedure btnCadastrarEventoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure suiDBGrid1CellClick(Column: TColumn);
    procedure btnLimparClick(Sender: TObject);
    procedure btnBuscarImagemEventoClick(Sender: TObject);
    procedure popExcluirEventoClick(Sender: TObject);
    procedure PopupActionBar1Popup(Sender: TObject);
    procedure suiDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private
    EventoId: Integer;
    postEvento: Boolean;
    caminhoImagemEvento: string;
    procedure AtualizarForm();
    procedure PreencherForm();
    procedure ExcluirEvento();
    procedure IncluirEvento(testeEvento: Boolean);

//  procedure CarregarTreePalestrante();
  public
    { Public declarations }
  end;

var
  frmCrudEvento: TfrmCrudEvento;

implementation

{$R *.dfm}

procedure TfrmCrudEvento.AtualizarForm();
begin
  postEvento := true;
  Qry_Evento.Close;
  Qry_Evento.Open;
end;

procedure TfrmCrudEvento.PreencherForm();
begin
  EventoId := Qry_Evento.FieldByName('EventoId').AsInteger;
  edtEnderecoEvento.Text := Qry_Evento.FieldByName('Endereco').AsString;
  edtTemaEvento.Text := Qry_Evento.FieldByname('Tema').AsString;
  edtQtdPessoasEvento.Text := Qry_Evento.FieldByName('QtdPessoas').AsString;
  edtTelefoneEvento.Text := Qry_Evento.FieldByName('Telefone').AsString;
  edtDataEvento.Date := Qry_Evento.FieldByName('DataEvento').AsDateTime;
  edtImagemEvento.Text := Qry_Evento.FieldByName('ImagemUrl').AsString;
  postEvento := false;
end;

procedure TfrmCrudEvento.ExcluirEvento();
begin
  Qry_CrudEvento.Close;
  Qry_CrudEvento.Sql.Clear;
  Qry_CrudEvento.Sql.Add('DELETE FROM Evento where EventoId = :ID');
  Qry_CrudEvento.ParamByName('ID').AsString := Qry_Evento.FieldByName('EventoId').AsString;
  Qry_CrudEvento.ExecSql;

  ShowMessage('Evento excluido com sucesso!');
end;

procedure TfrmCrudEvento.IncluirEvento(testeEvento: Boolean);
begin
  if (testeEvento) then
  begin
    Qry_CrudEvento.Close;
    Qry_CrudEvento.Sql.Clear;
    Qry_CrudEvento.Sql.Add('INSERT INTO Evento VALUES(');
    Qry_CrudEvento.Sql.Add(':endereco,');
    Qry_CrudEvento.Sql.Add(':data,');
    Qry_CrudEvento.Sql.Add(':tema,');
    Qry_CrudEvento.Sql.Add(':qtdPessoas,');
    Qry_CrudEvento.Sql.Add(':imagem,');
    Qry_CrudEvento.Sql.Add(':telefone)');

    Qry_CrudEvento.ParamByName('endereco').AsString := edtEnderecoEvento.Text;
    Qry_CrudEvento.ParamByName('data').AsDateTime := edtDataEvento.Date;
    Qry_CrudEvento.ParamByName('tema').AsString := edtTemaEvento.Text;
    Qry_CrudEvento.ParamByName('qtdPessoas').AsString := edtQtdPessoasEvento.Text;
    Qry_CrudEvento.ParamByName('imagem').AsString := edtImagemEvento.Text;
    Qry_CrudEvento.ParamByName('telefone').AsString := edtTelefoneEvento.Text;
    Qry_CrudEvento.ExecSql;

    ShowMessage('Evento criado com sucesso!');
  end

  else
  begin
    Qry_CrudEvento.Close;
    Qry_CrudEvento.Sql.Clear;
    Qry_CrudEvento.Sql.Add('UPDATE Evento ');
    Qry_CrudEvento.sql.Add('SET Endereco = :ENDERECO, Tema = :TEMA, QtdPessoas = :QTDPESSOAS, ');
    Qry_CrudEvento.Sql.Add('Telefone = :TELEFONE, DataEvento = :DATAEVENTO, ImagemUrl = :IMAGEM');
    Qry_CrudEvento.Sql.Add('WHERE EventoId = :EventoId');

    Qry_CrudEvento.ParamByName('ENDERECO').AsString := edtEnderecoEvento.Text;
    Qry_CrudEvento.ParamByName('TEMA').AsString := edtTemaEvento.Text;
    Qry_Crudevento.ParamByName('QTDPESSOAS').AsInteger := StrToInt(edtQtdPessoasEvento.Text);
    Qry_CrudEvento.ParamByName('TELEFONE').AsString := edtTelefoneEvento.Text;
    Qry_CrudEvento.ParamByName('DATAEVENTO').AsDateTime := edtDataEvento.Date;
    Qry_CrudEvento.ParamByName('IMAGEM').AsString := edtImagemEvento.Text;
    Qry_CrudEvento.ParamByName('EventoId').AsInteger := EventoId;
    Qry_CrudEvento.ExecSql;

    ShowMessage('Evento atualizado com sucesso!');
  end;
end;

procedure TfrmCrudEvento.btnBuscarImagemEventoClick(Sender: TObject);
begin
  opdBuscarImagemEvento.Execute;
  edtImagemEvento.Text := opdBuscarImagemEvento.FileName;
end;

procedure TfrmCrudEvento.btnCadastrarEventoClick(Sender: TObject);
begin
  ValidarCamposForm(frmCrudEvento);
  IncluirEvento(postEvento);
  LimparCamposForm(frmCrudEvento);
  AtualizarForm();
end;

procedure TfrmCrudEvento.btnLimparClick(Sender: TObject);
begin
  LimparCamposForm(frmCrudEvento);
  AtualizarForm();
end;

procedure TfrmCrudEvento.FormCreate(Sender: TObject);
begin
  Qry_evento.Open;
  postEvento := true;
end;

procedure TfrmCrudEvento.popExcluirEventoClick(Sender: TObject);
begin
  ExcluirEvento();
  LimparCamposForm(frmCrudEvento);
  AtualizarForm();
end;

procedure TfrmCrudEvento.PopupActionBar1Popup(Sender: TObject);
begin
  PreencherForm();
end;

procedure TfrmCrudEvento.suiDBGrid1CellClick(Column: TColumn);
begin
  PreencherForm();

//  CarregarTreePalestrante();
end;

procedure TfrmCrudEvento.suiDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
Var R : TRect;
begin
  R := Rect;
  Dec(R.Bottom, 2);
  if (Column.Field = Qry_EventoImagemUrl) then
  begin
    if not (gdSelected in State) then
      suiDBGrid1.Canvas.FillRect(Rect);
      suiDBGrid1.Canvas.TextRect(R, R.Left, R.Top, Qry_EventoImagemUrl.AsString);
  end;
end;

//procedure TfrmCrudEvento.CarregarTreePalestrante;
//var
//  QryPalestrante : TQuery;
//begin
//  QryPalestrante := TQuery.Create(Self);
//
//  with QryPalestrante do
//  begin
//    DatabaseName := 'Db';
//
//    Close;
//    SQL.Clear;
//    SQL.Add();
//    SQL.Open;
//    First;
//
//    while (not Eof) do
//    begin
//     { Limpar o Tree e preencher com os palestrantes do evento }
//
//      Next;
//    end;
//
//    Free;
//  end;
//end;

end.
