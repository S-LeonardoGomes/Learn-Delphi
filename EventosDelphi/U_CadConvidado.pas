unit U_CadConvidado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, SUIDBCtrls, Grids, DBGrids, DB, DBTables, U_funcoes,
  Menus, ActnPopup;

type
  TF_Convidado = class(TForm)
    suiDBGrid1: TsuiDBGrid;
    cbbFiltro: TsuiDBLookupComboBox;
    lblFiltro: TLabel;
    btnFiltro: TButton;
    GroupBox1: TGroupBox;
    edtIdEvento: TEdit;
    edtTemaEvento: TEdit;
    edtDataEvento: TEdit;
    edtEnderecoEvento: TEdit;
    GroupBox2: TGroupBox;
    edtNomeConvidado: TEdit;
    edtEmailConvidado: TEdit;
    edtEnderecoConvidado: TEdit;
    btnSalvarConvidado: TButton;
    lblIdEvento: TLabel;
    lblTemaEvento: TLabel;
    lblDataEvento: TLabel;
    lblEnderecoEvento: TLabel;
    edtTelefoneEvento: TEdit;
    lblTelefoneEvento: TLabel;
    cbbRedeSocialEvento: TsuiDBLookupComboBox;
    lblRedeSocialEvento: TLabel;
    edtRedeSocialEvento: TEdit;
    edtTelefoneConvidado: TEdit;
    btnLimparConvidado: TButton;
    lblNomeConvidado: TLabel;
    lblEmailConvidado: TLabel;
    lblEnderecoConvidado: TLabel;
    lblTelefoneConvidado: TLabel;
    Qry_Convidado: TQuery;
    ds_Convidado: TDataSource;
    Qry_CrudConvidado: TQuery;
    Qry_Filtro: TQuery;
    ds_Filtro: TDataSource;
    Qry_RedeSocialEvento: TQuery;
    ds_RedeSocialEvento: TDataSource;
    Qry_ConvidadoConvidadoId: TIntegerField;
    Qry_ConvidadoEventoId: TIntegerField;
    Qry_ConvidadoNomeConvidado: TStringField;
    Qry_ConvidadoEmailConvidado: TStringField;
    Qry_ConvidadoTelefoneConvidado: TIntegerField;
    Qry_ConvidadoEnderecoConvidado: TStringField;
    Qry_ConvidadoEndereco: TStringField;
    Qry_ConvidadoDataEvento: TDateTimeField;
    Qry_ConvidadoTema: TStringField;
    Qry_ConvidadoQtdPessoas: TIntegerField;
    Qry_ConvidadoImagemUrl: TMemoField;
    Qry_ConvidadoTelefone: TStringField;
    btnLimparFiltro: TButton;
    lblResultado: TLabel;
    lblLimiteAtingido: TLabel;
    Qry_RedeSocialEventoRedeSocialId: TIntegerField;
    Qry_RedeSocialEventonome: TStringField;
    Qry_RedeSocialEventoUrl: TStringField;
    Qry_RedeSocialEventoEventoId: TIntegerField;
    Qry_RedeSocialEventoPalestranteId: TIntegerField;
    Qry_Evento: TQuery;
    Qry_EventoEventoId: TIntegerField;
    Qry_EventoEndereco: TStringField;
    Qry_EventoDataEvento: TDateTimeField;
    Qry_EventoTema: TStringField;
    Qry_EventoQtdPessoas: TIntegerField;
    Qry_EventoImagemUrl: TMemoField;
    Qry_EventoTelefone: TStringField;
    lblLimite: TLabel;
    cbbLote: TsuiDBLookupComboBox;
    lblDisponibilidadeLote: TLabel;
    Qry_Lote: TQuery;
    Qry_ConvidadoLoteId: TIntegerField;
    Qry_LoteLoteId: TIntegerField;
    Qry_LoteNome: TStringField;
    Qry_LotePreco: TIntegerField;
    Qry_LoteDataInicio: TDateTimeField;
    Qry_LoteDataFim: TDateTimeField;
    Qry_LoteQuantidade: TIntegerField;
    Qry_LoteEventoId: TIntegerField;
    lblIdLote: TLabel;
    ds_Lote: TDataSource;
    Qry_CrudLote: TQuery;
    PopupActionBar1: TPopupActionBar;
    Enviaremail1: TMenuItem;
    Abrirendereodoconvidado1: TMenuItem;
    Abrirendereodoevento1: TMenuItem;
    Excluirconvidadodoevento1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure btnLimparFiltroClick(Sender: TObject);
    procedure btnLimparConvidadoClick(Sender: TObject);
    procedure cbbRedeSocialEventoClick(Sender: TObject);
    procedure edtRedeSocialEventoClick(Sender: TObject);
    procedure cbbLoteClick(Sender: TObject);
    procedure btnSalvarConvidadoClick(Sender: TObject);
    procedure Enviaremail1Click(Sender: TObject);
    procedure Abrirendereodoconvidado1Click(Sender: TObject);
    procedure Abrirendereodoevento1Click(Sender: TObject);
    procedure Excluirconvidadodoevento1Click(Sender: TObject);
  private
    { Private declarations }
    ConvidadosCadastrados: Integer;
    QtdMaximaConvidadosLote: Integer;
    VagasDisponiveis: Integer;
    procedure AbrirQryEvento(ID: Integer);
    procedure PreencherFormEvento();
    procedure ImprimirResultado(Valor: Integer);
    procedure ImprimirLimite(Valor: Integer);
    procedure HabilitarNovosCadastros();
    procedure BloquearNovosCadastros();
    procedure LimparDadosEvento();
    procedure FiltrarEvento(ID: Integer);
    procedure LimparFiltro();
    procedure VerificarExistenciaDeLote();
    procedure ObterNumeroDeVagasLote();
    procedure AtualizarForm();
    procedure IncluirConvidado();
    procedure ExcluirConvidado();
  public
    { Public declarations }
  end;

var
  F_Convidado: TF_Convidado;

implementation

{$R *.dfm}

procedure TF_Convidado.AtualizarForm();
begin
  Qry_Convidado.Close;
  Qry_Convidado.Open;
end;

procedure TF_Convidado.IncluirConvidado();
begin
  Qry_CrudConvidado.Close;
  Qry_CrudConvidado.Sql.Clear;
  Qry_CrudConvidado.Sql.Add('INSERT INTO CONVIDADO(EVENTOID, NOMECONVIDADO, EMAILCONVIDADO, ');
  Qry_CrudConvidado.Sql.Add('TELEFONECONVIDADO, ENDERECOCONVIDADO, LOTEID) VALUES ');
  Qry_CrudConvidado.Sql.Add('(:EVENTOID, :NOME, :EMAIL, :TELEFONE, :ENDERECO, :LOTEID)');
  Qry_CrudConvidado.ParamByName('EVENTOID').AsInteger := StrToInt(edtIdEvento.Text);
  Qry_CrudConvidado.ParamByName('NOME').AsString := edtNomeConvidado.Text;
  Qry_CrudConvidado.ParamByName('EMAIL').AsString := edtEmailConvidado.Text;
  Qry_CrudConvidado.ParamByName('TELEFONE').AsInteger := StrToInt(edtTelefoneConvidado.Text);
  Qry_CrudConvidado.ParamByName('ENDERECO').AsString := edtEnderecoConvidado.Text;
  Qry_CrudConvidado.ParamByName('LOTEID').AsInteger := cbbLote.KeyValue;

  Qry_CrudConvidado.ExecSql;

  ShowMessage('Convidado cadastrado com sucesso!');
end;

procedure TF_Convidado.ExcluirConvidado();
begin
  Qry_CrudConvidado.Close;
  Qry_CrudConvidado.Sql.Clear;
  Qry_CrudConvidado.Sql.Add('DELETE FROM CONVIDADO WHERE CONVIDADOID = :CONVIDADOID');
  Qry_CrudConvidado.ParamByName('CONVIDADOID').AsInteger := Qry_Convidado.FieldByName('CONVIDADOID').AsInteger;

  Qry_CrudConvidado.ExecSql;

  ShowMessage('Convidado removido com sucesso!');
end;

procedure TF_Convidado.VerificarExistenciaDeLote();
begin
  Qry_Lote.FetchAll;
  if(Qry_Lote.RecordCount = 0) then
  begin
    lblDisponibilidadeLote.Caption := 'Não há lotes disponíveis!';
    lblDisponibilidadeLote.Visible := true;
  end
  else
    lblDisponibilidadeLote.Visible := false; 
end;

procedure TF_Convidado.ObterNumeroDeVagasLote();
begin
  Qry_CrudLote.Close;
  Qry_CrudLote.Sql.Clear;
  Qry_CrudLote.Sql.Add('SELECT COUNT(*) AS CONVIDADOSCADASTRADOS FROM CONVIDADO WHERE LOTEID = :LOTEID');
  Qry_CrudLote.ParamByName('LOTEID').AsInteger := cbbLote.KeyValue;
  Qry_CrudLote.Open;

  ConvidadosCadastrados := Qry_CrudLote.FieldByName('CONVIDADOSCADASTRADOS').AsInteger;

  Qry_CrudLote.Close;
  Qry_CrudLote.Sql.Clear;
  Qry_CrudLote.Sql.Add('SELECT QUANTIDADE FROM LOTE WHERE LOTEID = :LOTEID');
  Qry_CrudLote.ParamByName('LOTEID').AsInteger := cbbLote.KeyValue;

  QtdMaximaConvidadosLote := Qry_Lote.FieldByName('QUANTIDADE').AsInteger;
  VagasDisponiveis := QtdMaximaConvidadosLote - ConvidadosCadastrados;

  lblDisponibilidadeLote.Caption := Format('%s vagas disponíveis', [IntToStr(VagasDisponiveis)]);
  lblDisponibilidadeLote.Visible := true;
end;

procedure TF_Convidado.Abrirendereodoconvidado1Click(Sender: TObject);
begin
  AbrirMaps(Qry_Convidado.FieldByName('ENDERECOCONVIDADO').AsString);
end;

procedure TF_Convidado.Abrirendereodoevento1Click(Sender: TObject);
begin
  AbrirMaps(Qry_Convidado.FieldByName('ENDERECO').AsString);
end;

procedure TF_Convidado.AbrirQryEvento(ID: Integer);
begin
  Qry_Evento.Close;
  Qry_Evento.ParamByName('EVENTOID').AsInteger := ID;
  Qry_Evento.Open;
end;

procedure TF_Convidado.PreencherFormEvento();
begin
  With Qry_Evento do
  begin
    edtIdEvento.Text := IntToStr(FieldByName('EventoId').AsInteger);
    edtTemaEvento.Text := FieldByName('Tema').AsString;
    edtDataEvento.Text := DateToStr(FieldByName('DataEvento').AsDateTime);
    edtEnderecoEvento.Text := FieldByName('Endereco').AsString;
    edtTelefoneEvento.Text := FieldByName('Telefone').AsString;
  end;
end;

procedure TF_Convidado.BloquearNovosCadastros();
begin
  lblLimiteAtingido.Visible := true;

  btnSalvarConvidado.Enabled := false;
  btnLimparConvidado.Enabled := false;

  edtNomeConvidado.Enabled := false;
  edtEmailConvidado.Enabled := false;
  edtEnderecoConvidado.Enabled := false;
  edtTelefoneConvidado.Enabled := false;
end;

procedure TF_Convidado.HabilitarNovosCadastros();
begin
  lblLimiteAtingido.Visible := false;

  btnSalvarConvidado.Enabled := true;
  btnLimparConvidado.Enabled := true;

  edtNomeConvidado.Enabled := true;
  edtEmailConvidado.Enabled := true;
  edtEnderecoConvidado.Enabled := true;
  edtTelefoneConvidado.Enabled := true;
end;

procedure TF_Convidado.FiltrarEvento(ID: Integer);
begin
  Qry_Convidado.Close;
  Qry_Convidado.Sql.Clear;
  Qry_Convidado.Sql.Add('SELECT * FROM CONVIDADO AS C ');
  Qry_Convidado.Sql.Add('INNER JOIN EVENTO AS E ');
  Qry_Convidado.Sql.Add('ON C.EVENTOID = E.EVENTOID ');
  Qry_Convidado.Sql.Add('WHERE C.EVENTOID = :FILTROEVENTO ');
  Qry_Convidado.Sql.Add('ORDER BY C.NOMECONVIDADO');
  Qry_Convidado.ParamByName('FILTROEVENTO').AsInteger := ID;
  Qry_Convidado.Open;
end;

procedure TF_Convidado.LimparFiltro();
begin
  Qry_Convidado.Close;
  Qry_Convidado.Sql.Clear;
  Qry_Convidado.Sql.Add('SELECT * FROM CONVIDADO AS C ');
  Qry_Convidado.Sql.Add('INNER JOIN EVENTO AS E ');
  Qry_Convidado.Sql.Add('ON C.EVENTOID = E.EVENTOID ');
  Qry_Convidado.Sql.Add('ORDER BY E.TEMA');
  Qry_Convidado.Open;
end;

procedure TF_Convidado.ImprimirResultado(Valor: Integer);
var
  LegendaResultado: String;
begin
  LegendaResultado := Format('Resultados: %s', [IntToStr(Valor)]);
  lblResultado.Caption := LegendaResultado;

  if(Valor >= Qry_Evento.FieldByName('QtdPessoas').AsInteger) then
  begin
    LimparCamposForm(F_Convidado);
    BloquearNovosCadastros();
  end
  else
    HabilitarNovosCadastros();
  //inc();
end;

procedure TF_Convidado.ImprimirLimite(Valor: Integer);
var
  LegendaLimite: String;
begin
  LegendaLimite := Format('Limite de convidados: %s', [IntToStr(Valor)]);
  lblLimite.Caption := LegendaLimite;
end;

procedure TF_Convidado.LimparDadosEvento();
begin
  cbbFiltro.KeyValue := -1;
  cbbRedeSocialEvento.KeyValue := -1;
  edtIdEvento.Text := EmptyStr;
  edtTemaEvento.Text := EmptyStr;
  edtDataEvento.Text := EmptyStr;
  edtEnderecoEvento.Text := EmptyStr;
  edtTelefoneEvento.Text := EmptyStr;
  edtRedeSocialEvento.Text := EmptyStr;
end;

procedure TF_Convidado.btnFiltroClick(Sender: TObject);
begin
  FiltrarEvento(cbbFiltro.KeyValue);
  LimparCamposForm(F_Convidado);
  AbrirQryEvento(cbbFiltro.KeyValue);
  ImprimirResultado(Qry_Convidado.Recordcount);
  ImprimirLimite(Qry_Evento.FieldByName('QtdPessoas').AsInteger);
  PreencherFormEvento();

  //REDE SOCIAL EVENTO
  Qry_RedeSocialEvento.Close;
  Qry_RedeSocialEvento.ParambyName('EVENTOID').AsInteger := cbbFiltro.KeyValue;
  Qry_RedeSocialEvento.Open;

  //LOTE EVENTO
  Qry_Lote.Close;
  Qry_Lote.ParamByName('EVENTOID').AsInteger := cbbFiltro.KeyValue;
  Qry_Lote.Open;
  VerificarExistenciaDeLote();
end;

procedure TF_Convidado.btnLimparConvidadoClick(Sender: TObject);
begin
  LimparCamposForm(F_Convidado);
  lblDisponibilidadeLote.Visible := false;
end;

procedure TF_Convidado.btnLimparFiltroClick(Sender: TObject);
begin
  LimparFiltro();
  ImprimirResultado(Qry_Convidado.Recordcount);
  ImprimirLimite(5000);
  LimparDadosEvento();
  LimparCamposForm(F_Convidado);
  lblDisponibilidadeLote.Visible := false;
end;

procedure TF_Convidado.btnSalvarConvidadoClick(Sender: TObject);
begin
  ValidarCamposForm(F_Convidado);
  IncluirConvidado();
  LimparCamposForm(F_Convidado);
  lblDisponibilidadeLote.Visible := false;
  AtualizarForm();
  Qry_Convidado.FetchAll;
  ImprimirResultado(Qry_Convidado.Recordcount);
end;

procedure TF_Convidado.cbbLoteClick(Sender: TObject);
begin
  ObterNumeroDeVagasLote();
  
  if(VagasDisponiveis > 0) then
    HabilitarNovosCadastros()
  else
    BloquearNovosCadastros();
end;

procedure TF_Convidado.cbbRedeSocialEventoClick(Sender: TObject);
begin
  edtRedeSocialEvento.Text := Qry_RedeSocialEvento.FieldByName('Url').AsString;
end;

procedure TF_Convidado.edtRedeSocialEventoClick(Sender: TObject);
begin
  AbrirIE(edtRedeSocialEvento.Text);
end;

procedure TF_Convidado.Enviaremail1Click(Sender: TObject);
begin
  AbrirEmail(Qry_Convidado.FieldByName('EMAILCONVIDADO').AsString);
end;

procedure TF_Convidado.Excluirconvidadodoevento1Click(Sender: TObject);
begin
  ExcluirConvidado();
  AtualizarForm();
  LimparCamposForm(F_Convidado);
  lblDisponibilidadeLote.Visible := false;
  Qry_Convidado.FetchAll;
  ImprimirResultado(Qry_Convidado.Recordcount);
end;

procedure TF_Convidado.FormCreate(Sender: TObject);
begin
  Qry_Convidado.Open;
  Qry_Filtro.Open;
  AbrirQryEvento(1);
  FiltrarEvento(1);
  PreencherFormEvento();

  Qry_Convidado.FetchAll;
  ImprimirResultado(Qry_Convidado.Recordcount);
  ImprimirLimite(Qry_Evento.FieldByName('QtdPessoas').AsInteger);
end;

end.
