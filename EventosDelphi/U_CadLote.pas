unit U_CadLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, SUIDBCtrls, StdCtrls, ComCtrls, DBCtrls,
  Menus, ActnPopup, U_funcoes, Mask, ToolEdit;

type
  TF_Lote = class(TForm)
    suiDBGrid2: TsuiDBGrid;
    dsLote: TDataSource;
    Qry_Lote: TQuery;
    edtNomeLote: TEdit;
    edtPrecoLote: TEdit;
    edtQuantidadeLote: TEdit;
    lblNomeLote: TLabel;
    lblPrecoLote: TLabel;
    lblQuantidadeLote: TLabel;
    lblIdEvento: TLabel;
    btnSalvarLote: TButton;
    Qry_CrudLote: TQuery;
    lblDataInicioLote: TLabel;
    lblDataFimLote: TLabel;
    btnLimpar: TButton;
    cbbEventos: TsuiDBLookupComboBox;
    ds_Eventos: TDataSource;
    Qry_Eventos: TQuery;
    Qry_LoteLoteId: TIntegerField;
    Qry_LoteNome: TStringField;
    Qry_LotePreco: TIntegerField;
    Qry_LoteDataInicio: TDateTimeField;
    Qry_LoteDataFim: TDateTimeField;
    Qry_LoteQuantidade: TIntegerField;
    Qry_LoteEventoId: TIntegerField;
    Qry_LoteNomeEvento: TStringField;
    PopupActionBar1: TPopupActionBar;
    popExcluirLote: TMenuItem;
    dtInicio: TDateEdit;
    dtFim: TDateEdit;
    Qry_EventosEventoId: TIntegerField;
    Qry_EventosEndereco: TStringField;
    Qry_EventosDataEvento: TDateTimeField;
    Qry_EventosTema: TStringField;
    Qry_EventosQtdPessoas: TIntegerField;
    Qry_EventosImagemUrl: TMemoField;
    Qry_EventosTelefone: TStringField;
    lblAvisoDisponibilidade: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarLoteClick(Sender: TObject);
    procedure suiDBGrid2CellClick(Column: TColumn);
    procedure btnLimparClick(Sender: TObject);
    procedure Qry_LoteCalcFields(DataSet: TDataSet);
    procedure PopupActionBar1Popup(Sender: TObject);
    procedure popExcluirLoteClick(Sender: TObject);
    procedure cbbEventosClick(Sender: TObject);
    
  private
    { Private declarations }
    postEvento: Boolean;
    Lote: Integer;
    IngressosDisponiveis: Integer;
    IngressosTotaisEvento: Integer;
    QtdIngressoAtualLote: Integer;
    function VerificarIngressosDisponiveis(EventoId: Integer): Integer;
    procedure AtualizarMensagemLabel();
    procedure PreencherGrid();
    procedure ExcluirLote();
    procedure IncluirLote(testeEvento: Boolean);
    procedure AtualizarForm();

  public
    { Public declarations }
  end;

var
  F_Lote: TF_Lote;

implementation

{$R *.dfm}

function TF_Lote.VerificarIngressosDisponiveis(EventoId: Integer): Integer;
Var
  //OBTER A SOMA DA QTD DE INGRESSOS RESERVADOS EM LOTES
  TotaisReservadosLote: Integer;

begin
  Qry_CrudLote.Close;
  Qry_CrudLote.Sql.Clear;
  Qry_CrudLote.Sql.Add('SELECT QTDPESSOAS FROM EVENTO WHERE EVENTOID = :EVENTOID');
  Qry_CrudLote.ParambyName('EVENTOID').AsInteger := EventoId;
  Qry_CrudLote.Open;

  IngressosTotaisEvento := Qry_CrudLote.FieldByName('QTDPESSOAS').AsInteger;

  Qry_CrudLote.Close;
  Qry_CrudLote.Sql.Clear;
  Qry_CrudLote.Sql.Add('SELECT SUM(QUANTIDADE) AS RESERVADOS FROM LOTE ');
  Qry_CrudLote.Sql.Add('WHERE EVENTOID = :EVENTOID');
  Qry_CrudLote.ParamByName('EVENTOID').AsInteger := EventoId;
  Qry_CrudLote.Open;

  Qry_CrudLote.FetchAll;
  if(Qry_CrudLote.RecordCount = 0) then
    Result := IngressosTotaisEvento;


  TotaisReservadosLote := Qry_CrudLote.FieldByName('RESERVADOS').AsInteger;
  Result := IngressosTotaisEvento - TotaisReservadosLote;
end;

procedure TF_Lote.AtualizarMensagemLabel();
begin
  if(IngressosDisponiveis <= 0) then
    lblAvisoDisponibilidade.Caption := 'Este evento não possui ingressos disponíveis!'
  else
    lblAvisoDisponibilidade.Caption := Format('Este evento possui %s ingressos disponíveis',
      [IntToStr(IngressosDisponiveis)]);

  lblAvisoDisponibilidade.Visible := true;
end;

procedure TF_Lote.PreencherGrid();
begin
  Lote := Qry_Lote.FieldByName('LoteId').AsInteger;
  edtNomeLote.Text := Qry_Lote.FieldByName('Nome').AsString;
  edtPrecoLote.Text := Qry_Lote.FieldByName('Preco').AsString;
  edtQuantidadeLote.Text := Qry_Lote.FieldByName('Quantidade').AsString;
  cbbEventos.KeyValue := Qry_Lote.FieldByName('EventoId').AsInteger;
  dtInicio.Date := Qry_Lote.FieldByName('DataInicio').AsDateTime;
  dtFim.Date := Qry_Lote.FieldByName('DataFim').AsDateTime;

  postEvento := false;
end;

procedure TF_Lote.ExcluirLote();
begin
  Qry_CrudLote.Close;
  Qry_CrudLote.Sql.Clear;
  Qry_CrudLote.Sql.Add('DELETE FROM Lote WHERE LoteId = :Id');
  Qry_CrudLote.ParamByName('Id').AsInteger := Lote;
  Qry_CrudLote.ExecSql;
  ShowMessage('Lote excluido com sucesso!');
end;

procedure TF_Lote.IncluirLote(testeEvento: Boolean);
begin
  if(testeEvento) then
  begin
    Qry_CrudLote.Close;
    Qry_CrudLote.Sql.Clear;
    Qry_CrudLote.Sql.Add('INSERT INTO Lote(Nome, Preco, DataInicio, DataFim, ');
    Qry_CrudLote.Sql.Add('Quantidade, EventoId) VALUES (:NOME, :PRECO, ');
    Qry_CrudLote.Sql.Add(':DATAINICIO, :DATAFIM, :QUANTIDADE, :EVENTOID)');

    Qry_CrudLote.ParamByName('NOME').AsString := edtNomeLote.Text;
    Qry_CrudLote.ParamByName('PRECO').AsInteger := StrToInt(edtPrecoLote.Text);
    Qry_CrudLote.ParamByName('DATAINICIO').AsDateTime := StrToDate(dtInicio.Text);
    Qry_CrudLote.ParamByName('DATAFIM').AsDateTime := StrToDate(dtFim.Text);
    Qry_CrudLote.ParamByName('QUANTIDADE').AsInteger := StrToInt(edtQuantidadeLote.Text);
    Qry_CrudLote.ParamByName('EVENTOID').AsInteger := cbbEventos.KeyValue;
    Qry_CrudLote.ExecSql;

    ShowMessage('Lote criado com sucesso!');
  end

  else
  begin
    if((StrToInt(edtQuantidadeLote.Text)) > (QtdIngressoAtualLote + IngressosDisponiveis)) then
    begin
      ShowMessage('Impossível atualizar: A quantidade desejada é maior que a disponível!');
      Exit;
    end;

    Qry_CrudLote.Close;
    Qry_CrudLote.Sql.Clear;
    Qry_CrudLote.Sql.Add('UPDATE Lote ');
    Qry_CrudLote.Sql.Add('SET ');
    Qry_CrudLote.Sql.Add('Nome = :NOME, Preco = :PRECO, ');
    Qry_CrudLote.Sql.Add('DataInicio = :DATAINICIO, DataFim = :DATAFIM, Quantidade = :QUANTIDADE, EventoId = :EVENTOID ');
    Qry_CrudLote.Sql.Add('WHERE LoteId = :Lote');

    Qry_CrudLote.ParamByName('NOME').AsString := edtNomeLote.Text;
    Qry_CrudLote.ParamByName('PRECO').AsInteger := StrToInt(edtPrecoLote.Text);
    Qry_CrudLote.ParamByName('DATAINICIO').AsDateTime := StrToDate(dtInicio.Text);
    Qry_CrudLote.ParamByName('DATAFIM').AsDateTime := StrToDate(dtFim.Text);
    Qry_CrudLote.ParamByName('QUANTIDADE').AsInteger := StrToInt(edtQuantidadeLote.Text);
    Qry_CrudLote.ParamByName('EVENTOID').AsInteger := cbbEventos.KeyValue;
    Qry_CrudLote.ParamByName('Lote').AsInteger := Lote;
    Qry_CrudLote.ExecSql;

    ShowMessage('Lote alterado com sucesso!');
  end;
end;

procedure TF_Lote.AtualizarForm();
begin
  lblAvisoDisponibilidade.Visible := false;
  postEvento := true;
  Qry_Lote.Close;
  Qry_Lote.Open;
end;

procedure TF_Lote.btnLimparClick(Sender: TObject);
begin
  LimparCamposForm(F_Lote);
  AtualizarForm();
end;

procedure TF_Lote.btnSalvarLoteClick(Sender: TObject);
begin
  ValidarCamposForm(F_Lote);

  if((postEvento) and (StrToInt(edtQuantidadeLote.Text) > IngressosDisponiveis)) then
  begin
    ShowMessage('Impossível cadastrar: quantidade de ingressos desejada é maior que a disponível!');
    Exit;
  end;

  IncluirLote(postEvento);
  LimparCamposForm(F_Lote);
  AtualizarForm();
end;

procedure TF_Lote.cbbEventosClick(Sender: TObject);
begin
  IngressosDisponiveis := VerificarIngressosDisponiveis(cbbEventos.KeyValue);
  AtualizarMensagemLabel();
end;

procedure TF_Lote.FormCreate(Sender: TObject);
begin
  Qry_Lote.Open;
  Qry_Eventos.Open;
  postEvento := true;
end;

procedure TF_Lote.popExcluirLoteClick(Sender: TObject);
begin
  ExcluirLote();
  LimparCamposForm(F_Lote);
  AtualizarForm();
end;

procedure TF_Lote.PopupActionBar1Popup(Sender: TObject);
begin
  PreencherGrid();
  QtdIngressoAtualLote := StrToInt(edtQuantidadeLote.Text);
  IngressosDisponiveis := VerificarIngressosDisponiveis(cbbEventos.KeyValue);
  AtualizarMensagemLabel();
end;

procedure TF_Lote.suiDBGrid2CellClick(Column: TColumn);
begin
  PreencherGrid();
  QtdIngressoAtualLote := StrToInt(edtQuantidadeLote.Text);
  IngressosDisponiveis := VerificarIngressosDisponiveis(cbbEventos.KeyValue);
  AtualizarMensagemLabel();
end;

procedure TF_Lote.Qry_LoteCalcFields(DataSet: TDataSet);
begin
  Qry_CrudLote.Close;
  Qry_CrudLote.Sql.Clear;
  Qry_CrudLote.Sql.Add('SELECT TEMA FROM EVENTO (NOLOCK) WHERE EVENTOID = :ID');
  Qry_CrudLote.ParamByName('ID').AsInteger := Qry_lote.FieldByName('EVENTOID').AsInteger;
  Qry_CrudLote.Open;

  Qry_lote.FieldByName('NomeEvento').AsString := Qry_CrudLote.FieldByName('TEMA').AsString;
end;

end.
