unit U_CadRedeSocial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, SUIDBCtrls, StdCtrls, SUIComboBox,
  DBCtrls, Menus, ActnPopup, comObj, U_Funcoes;

type
  TF_RedeSocial = class(TForm)
    suiDBGrid1: TsuiDBGrid;
    dsRedeSocial: TDataSource;
    Qry_RedeSocial: TQuery;
    Qry_CrudRedeSocial: TQuery;
    Qry_RedeSocialRedeSocialId: TIntegerField;
    Qry_RedeSocialnome: TStringField;
    Qry_RedeSocialUrl: TStringField;
    Qry_RedeSocialEventoId: TIntegerField;
    Qry_RedeSocialPalestranteId: TIntegerField;
    edtNomeRedeSocial: TEdit;
    edtUrlRedeSocial: TEdit;
    btnSalvarRedeSocial: TButton;
    lblNome: TLabel;
    lblUrlRedeSocial: TLabel;
    ds_Eventos: TDataSource;
    Qry_Eventos: TQuery;
    cbbEventos: TsuiDBLookupComboBox;
    Qry_Palestrante: TQuery;
    ds_Palestrante: TDataSource;
    cbbPalestrante: TsuiDBLookupComboBox;
    btnLimpar: TButton;
    Qry_EventosEventoId: TIntegerField;
    Qry_EventosEndereco: TStringField;
    Qry_EventosDataEvento: TDateTimeField;
    Qry_EventosTema: TStringField;
    Qry_EventosQtdPessoas: TIntegerField;
    Qry_EventosTelefone: TStringField;
    Qry_RedeSocialNomeEvento: TStringField;
    Qry_RedeSocialNomePalestrante: TStringField;
    PopupActionBar1: TPopupActionBar;
    popUrl: TMenuItem;
    popExcluir: TMenuItem;
    Qry_PalestrantePalestranteId: TIntegerField;
    Qry_PalestranteNome: TStringField;
    Qry_PalestranteImagemUrl: TStringField;
    Qry_PalestranteTelefone: TIntegerField;
    Qry_PalestranteMinicurriculo: TStringField;
    Qry_PalestranteEmail: TStringField;
    rbPalestrante: TRadioButton;
    rbEvento: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarRedeSocialClick(Sender: TObject);
    procedure suiDBGrid1CellClick(Column: TColumn);
    procedure btnLimparClick(Sender: TObject);
    procedure Qry_RedeSocialCalcFields(DataSet: TDataSet);
    procedure popUrlClick(Sender: TObject);
    procedure PopupActionBar1Popup(Sender: TObject);
    procedure popExcluirClick(Sender: TObject);
    procedure rbPalestranteClick(Sender: TObject);
    procedure rbEventoClick(Sender: TObject);
    
  private
    { Private declarations }
    postEvento: Boolean;
    redeId: Integer;
    opcao: String;
    procedure PreencherCampos();
    procedure AtualizarForm();
    procedure ExcluirRedeSocial();
    procedure IncluirRedeSocial(testeEvento: Boolean; escolha: String);
    procedure HabilitarEvento();
    procedure DesabilitarEvento();
    procedure HabilitarPalestrante();
    procedure DesabilitarPalestrante();
    procedure HabilitarOpcoes();
    procedure DesabilitarOpcoes();

  public
    { Public declarations }
  end;

var
  F_RedeSocial: TF_RedeSocial;

implementation

{$R *.dfm}

procedure TF_RedeSocial.HabilitarOpcoes();
begin
  rbPalestrante.Enabled := true;
  rbEvento.Enabled := true;
end;

procedure TF_RedeSocial.DesabilitarOpcoes();
begin
  rbPalestrante.Enabled := false;
  rbEvento.Enabled := false;
end;

procedure TF_RedeSocial.HabilitarEvento();
begin
  cbbEventos.Enabled := true;
  cbbEventos.ReadOnly := false;
  cbbEventos.Visible := true;
end;

procedure TF_RedeSocial.DesabilitarEvento();
begin
  cbbEventos.KeyValue := -1;
  cbbEventos.Enabled := false;
  cbbEventos.ReadOnly := true;
  cbbEventos.Visible := false;
end;

procedure TF_RedeSocial.HabilitarPalestrante();
begin
  cbbPalestrante.Enabled := true;
  cbbPalestrante.ReadOnly := false;
  cbbPalestrante.Visible := true;
end;

procedure TF_RedeSocial.DesabilitarPalestrante();
begin
  cbbPalestrante.KeyValue := -1;
  cbbPalestrante.Enabled := false;
  cbbPalestrante.ReadOnly := true;
  cbbPalestrante.Visible := false;
end;

procedure TF_RedeSocial.AtualizarForm();
begin
  postEvento := true;
  Qry_RedeSocial.Close;
  Qry_RedeSocial.Open;
end;

procedure TF_RedeSocial.PreencherCampos();
begin
  DesabilitarOpcoes();
  DesabilitarEvento();
  DesabilitarPalestrante();
  redeId := Qry_RedeSocial.FieldByName('RedeSocialId').AsInteger;
  edtNomeRedeSocial.Text := Qry_RedeSocial.FieldByName('nome').asString;
  edtUrlRedeSocial.Text := Qry_RedeSocial.FieldByName('Url').AsString;

  postEvento := false;
end;

procedure TF_RedeSocial.ExcluirRedeSocial();
begin
  Qry_CrudRedeSocial.Close;
  Qry_CrudRedeSocial.Sql.Clear;
  Qry_CrudRedeSocial.Sql.Add('DELETE FROM RedeSocial where RedeSocialId = :REDEID');
  Qry_CrudRedeSocial.ParamByName('REDEID').AsInteger := redeId;
  Qry_CrudRedeSocial.ExecSql;

  ShowMessage('Rede social excluida com sucesso!');
end;

procedure TF_RedeSocial.IncluirRedeSocial(testeEvento: Boolean; escolha: String);
begin
  if(testeEvento) then
  begin
    Qry_CrudRedeSocial.Close;
    Qry_CrudRedeSocial.Sql.Clear;

    if(escolha = 'Evento') then
    begin
      Qry_CrudRedeSocial.Sql.Add('INSERT INTO RedeSocial(nome, Url, EventoId) ');
      Qry_CrudRedeSocial.Sql.Add('VALUES (:NOME, :URL, :EVENTOID)');
      Qry_CrudRedeSocial.ParamByName('NOME').AsString := edtNomeRedeSocial.Text;
      Qry_CrudRedeSocial.ParamByName('URL').AsString := edtUrlRedeSocial.Text;
      Qry_CrudRedeSocial.ParamByName('EVENTOID').AsInteger := cbbEventos.KeyValue;
      Qry_CrudRedeSocial.ExecSql;
    end

    else
    begin
      Qry_CrudRedeSocial.Sql.Add('INSERT INTO RedeSocial(nome, Url, PalestranteId) ');
      Qry_CrudRedeSocial.Sql.Add('VALUES (:NOME, :URL, :PALESTRANTEID)');
      Qry_CrudRedeSocial.ParamByName('NOME').AsString := edtNomeRedeSocial.Text;
      Qry_CrudRedeSocial.ParamByName('URL').AsString := edtUrlRedeSocial.Text;
      Qry_CrudRedeSocial.ParamByName('PALESTRANTEID').AsInteger := cbbPalestrante.KeyValue;
      Qry_CrudRedeSocial.ExecSql;
    end;

    ShowMessage('Rede social inserida com sucesso!');
  end

  else
  begin
    Qry_CrudRedeSocial.Close;
    Qry_CrudRedeSocial.Sql.Clear;
    Qry_CrudRedeSocial.Sql.Add('UPDATE RedeSocial ');
    Qry_CrudRedeSocial.Sql.Add('SET ');
    Qry_CrudRedeSocial.Sql.Add('nome = :NOME, ');
    Qry_CrudRedeSocial.Sql.Add('Url = :URL ');
    Qry_CrudRedeSocial.Sql.Add('WHERE RedeSocialId = :redeId');

    Qry_CrudRedeSocial.ParamByName('NOME').AsString := edtNomeRedeSocial.Text;
    Qry_CrudRedeSocial.ParamByName('URL').AsString := edtUrlRedeSocial.Text;
    Qry_CrudRedeSocial.ParamByName('redeId').AsInteger := redeId;

    Qry_CrudRedeSocial.ExecSql;

    ShowMessage('Rede social alterada com sucesso!');
  end;
end;

procedure TF_RedeSocial.btnLimparClick(Sender: TObject);
begin
  LimparCamposForm(F_RedeSocial);
  DesabilitarEvento();
  DesabilitarPalestrante();
  HabilitarOpcoes();
  AtualizarForm();

  rbPalestrante.Checked := false;
  rbEvento.Checked := false;
end;

procedure TF_RedeSocial.btnSalvarRedeSocialClick(Sender: TObject);
begin
  if((rbPalestrante.Checked = false) and (rbEvento.Checked = false) and (postEvento)) then
  begin
    ShowMessage('Você deve escolher uma opção!');
    Exit;
  end;
  
  ValidarCamposForm(F_RedeSocial);
  IncluirRedeSocial(postEvento, opcao);
  LimparCamposForm(F_RedeSocial);
  DesabilitarEvento();
  DesabilitarPalestrante();
  HabilitarOpcoes();
  AtualizarForm();
  cbbEventos.KeyValue := -1;
  cbbPalestrante.KeyValue := -1;
  rbEvento.Checked := false;
  rbPalestrante.Checked := false;
end;


procedure TF_RedeSocial.FormCreate(Sender: TObject);
begin
  Qry_RedeSocial.Open;
  Qry_Eventos.Open;
  Qry_Palestrante.Open;
  postEvento := true;
end;

procedure TF_RedeSocial.popExcluirClick(Sender: TObject);
begin
  ExcluirRedeSocial();
  LimparCamposForm(F_RedeSocial);
  AtualizarForm();
  HabilitarOpcoes();
end;

procedure TF_RedeSocial.PopupActionBar1Popup(Sender: TObject);
begin
  PreencherCampos();
end;

procedure TF_RedeSocial.suiDBGrid1CellClick(Column: TColumn);
begin
  PreencherCampos();
end;

procedure TF_RedeSocial.popUrlClick(Sender: TObject);
begin
  AbrirIE(edtUrlRedeSocial.Text);
end;

procedure TF_RedeSocial.Qry_RedeSocialCalcFields(DataSet: TDataSet);
begin
  Qry_CrudRedeSocial.Close;
  Qry_CrudRedeSocial.Sql.Clear;
  Qry_CrudRedeSocial.Sql.Add('SELECT Nome from Palestrante (NOLOCK) WHERE PalestranteId = :PALESTRANTEID');
  Qry_CrudRedeSocial.ParamByName('PALESTRANTEID').AsInteger := Qry_RedeSocial.FieldByName('PalestranteId').AsInteger;
  Qry_CrudRedeSocial.Open;

  Qry_RedeSocial.FieldByName('NomePalestrante').AsString := Qry_CrudRedeSocial.FieldByName('Nome').AsString;

  Qry_CrudRedeSocial.Close;
  Qry_CrudRedeSocial.Sql.Clear;
  Qry_CrudRedeSocial.Sql.Add('SELECT Tema FROM Evento (NOLOCK) WHERE EventoId = :ID');
  Qry_CrudRedeSocial.ParamByName('ID').AsInteger := Qry_RedeSocial.FieldByName('EventoId').AsInteger;
  Qry_CrudRedeSocial.Open;

  Qry_RedeSocial.FieldByName('NomeEvento').AsString := Qry_CrudRedeSocial.FieldByName('Tema').AsString;
end;

procedure TF_RedeSocial.rbEventoClick(Sender: TObject);
begin
  HabilitarEvento();
  DesabilitarPalestrante();
  opcao := 'Evento';
end;

procedure TF_RedeSocial.rbPalestranteClick(Sender: TObject);
begin
  HabilitarPalestrante();
  DesabilitarEvento();
  opcao := 'Palestrante';
end;

end.
