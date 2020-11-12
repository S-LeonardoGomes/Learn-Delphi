unit U_CadPalestranteEvento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, SUIDBCtrls, DB, DBTables, U_funcoes;

type
  TF_PalestranteEvento = class(TForm)
    rb_Adicionar: TRadioButton;
    rb_Remover: TRadioButton;
    lblAcao: TLabel;
    lblAcaoPalestrante: TLabel;
    lblAcaoEvento: TLabel;
    btnConfirmarAcao: TButton;
    Qry_AcaoPalestrante: TQuery;
    ds_AcaoPalestrante: TDataSource;
    Qry_AcaoPalestrantePalestranteId: TIntegerField;
    Qry_AcaoPalestranteNome: TStringField;
    Qry_AcaoPalestranteImagemUrl: TStringField;
    Qry_AcaoPalestranteTelefone: TIntegerField;
    Qry_AcaoPalestranteMinicurriculo: TStringField;
    Qry_AcaoPalestranteEmail: TStringField;
    cbb_Palestrante: TsuiDBLookupComboBox;
    cbb_Evento: TsuiDBLookupComboBox;
    Qry_AcaoEvento: TQuery;
    ds_AcaoEvento: TDataSource;
    Qry_AcaoEventoEventoId: TIntegerField;
    Qry_AcaoEventoEndereco: TStringField;
    Qry_AcaoEventoDataEvento: TDateTimeField;
    Qry_AcaoEventoTema: TStringField;
    Qry_AcaoEventoQtdPessoas: TIntegerField;
    Qry_AcaoEventoImagemUrl: TMemoField;
    Qry_AcaoEventoTelefone: TStringField;
    Qry_CrudAcao: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarAcaoClick(Sender: TObject);
  private
    { Private declarations }
    
  public
    { Public declarations }
    function VerificarExistencia(PalestranteId: Integer; EventoId: Integer): boolean;
  end;

var
  F_PalestranteEvento: TF_PalestranteEvento;

implementation
{$R *.dfm}

function TF_PalestranteEvento.VerificarExistencia(PalestranteId: Integer; EventoId: Integer): boolean;
begin
  Qry_CrudAcao.Close;
  Qry_CrudAcao.Sql.Clear;
  Qry_CrudAcao.Sql.Add('SELECT * FROM PalestranteEvento WHERE PALESTRANTEID = :PALESTRANTE ');
  Qry_CrudAcao.Sql.Add('AND EVENTOID = :EVENTO');
  Qry_CrudAcao.ParamByName('PALESTRANTE').AsInteger := PalestranteId;
  Qry_CrudAcao.ParamByName('EVENTO').AsInteger := EventoId;
  Qry_CrudAcao.Open;

  Result := not Qry_CrudAcao.IsEmpty;
end;

procedure TF_PalestranteEvento.btnConfirmarAcaoClick(Sender: TObject);
var
  PalestranteId: Integer;
  EventoId: Integer;
  Exist: boolean;
  Mensagem: String;
begin
  if ((rb_Adicionar.Checked = false) and (rb_Remover.Checked = false)) then
  begin
    ShowMessage('Você precisa selecionar uma ação!');
    Exit;
  end;

  ValidarCamposForm(F_PalestranteEvento);
  PalestranteId := StrToInt(cbb_Palestrante.KeyValue);
  EventoId := StrToInt(cbb_Evento.KeyValue);
  Exist := VerificarExistencia(PalestranteId, EventoId);

  if(rb_Adicionar.Checked) then
  begin
    if(not Exist) then
    begin
      Qry_CrudAcao.Close;
      Qry_CrudAcao.Sql.Clear;
      Qry_CrudAcao.Sql.Add('INSERT INTO PALESTRANTEEVENTO(EventoId, PalestranteId) Values(');
      Qry_CrudAcao.Sql.Add(':EVENTOID, :PALESTRANTEID)');
      Qry_CrudAcao.ParamByName('EVENTOID').AsInteger := EventoId;
      Qry_CrudAcao.ParamByName('PALESTRANTEID').AsInteger := PalestranteId;
      Qry_CrudAcao.ExecSql;

      Mensagem := Format('Palestrante %s cadastrado(a) no evento %s com sucesso!',
        [cbb_Palestrante.Text, cbb_Evento.Text]);
    end

    else
    begin
      Mensagem := Format('%s já está cadastrado(a) no evento %s!',
        [cbb_Palestrante.Text, cbb_Evento.Text]);
    end;
  end

  else
  begin
    if(Exist) then
    begin
      Qry_CrudAcao.Close;
      Qry_CrudAcao.Sql.Clear;
      Qry_CrudAcao.Sql.Add('DELETE FROM PALESTRANTEEVENTO WHERE EventoId = :EVENTOID ');
      Qry_CrudAcao.Sql.Add('AND PalestranteId = :PALESTRANTEID');
      Qry_CrudAcao.ParamByName('EVENTOID').AsInteger := EventoId;
      Qry_CrudAcao.ParamByName('PALESTRANTEID').AsInteger := PalestranteId;
      Qry_CrudAcao.ExecSql;

      Mensagem := Format('Palestrante %s removido(a) do evento %s com sucesso!',
        [cbb_Palestrante.Text, cbb_Evento.Text]);
    end

    else
    begin
      Mensagem := Format('%s não está cadastrado(a) no evento %s!',
        [cbb_Palestrante.Text, cbb_Evento.Text]);
    end;
  end;

  ShowMessage(Mensagem);
  LimparCamposForm(F_PalestranteEvento);
end;

procedure TF_PalestranteEvento.FormCreate(Sender: TObject);
begin
  Qry_AcaoPalestrante.Open;
  Qry_AcaoEvento.Open;
end;

end.
