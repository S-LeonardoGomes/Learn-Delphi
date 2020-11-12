unit DetalhesEvento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, SUIDBCtrls, StdCtrls, ExtCtrls, jpeg, ShellAPI, U_Funcoes,
  DBCtrls;

type
  TF_DetalhesEvento = class(TForm)
    Qry_Detalhes: TQuery;
    gpbPalestrante: TGroupBox;
    GroupBox2: TGroupBox;
    edtNomePalestrante: TEdit;
    edtEmailPalestrante: TEdit;
    lblNomePalestrante: TLabel;
    lblEmailPalestrante: TLabel;
    edtTelefonePalestrante: TEdit;
    lblTelefonePalestrante: TLabel;
    edtMinicurriculoPalestrante: TEdit;
    lblMinicurriculoPalestrante: TLabel;
    edtIdPalestrante: TEdit;
    lbl: TLabel;
    edtTemaEvento: TEdit;
    lblTemaEvento: TLabel;
    edtConvidadosEvento: TEdit;
    lblConvidadosEvento: TLabel;
    edtDataEvento: TEdit;
    lblDataEvento: TLabel;
    edtEnderecoEvento: TEdit;
    lblEnderecoEvento: TLabel;
    edtIdEvento: TEdit;
    lblCodigoEvento: TLabel;
    edtContatoEvento: TEdit;
    lblContatoEvento: TLabel;
    imgPalestrante: TImage;
    imgEvento: TImage;
    edtRedeSocialPalestrante: TEdit;
    suiDBGrid1: TsuiDBGrid;
    ds_Lote: TDataSource;
    Qry_lotes: TQuery;
    Qry_lotesLoteId: TIntegerField;
    Qry_lotesNome: TStringField;
    Qry_lotesPreco: TIntegerField;
    Qry_lotesDataInicio: TDateTimeField;
    Qry_lotesDataFim: TDateTimeField;
    Qry_lotesQuantidade: TIntegerField;
    Qry_lotesEventoId: TIntegerField;
    Qry_lotesNomeEvento: TStringField;
    Qry_CrudLotes: TQuery;
    gpbLote: TGroupBox;
    edtIdLote: TEdit;
    lblIdLote: TLabel;
    edtNomeLote: TEdit;
    lblNomeLote: TLabel;
    edtPrecoLote: TEdit;
    edtQuantidadeLote: TEdit;
    edtDataInicioLote: TEdit;
    edtDataFimLote: TEdit;
    lblPrecoLote: TLabel;
    lblQuantidadeLote: TLabel;
    lblDataInicioLote: TLabel;
    lblDataFimLote: TLabel;
    suiDBGrid2: TsuiDBGrid;
    lblListaLotes: TLabel;
    lblListaPalestrante: TLabel;
    Qry_CrudPalestrante: TQuery;
    Qry_Palestrante: TQuery;
    ds_Palestrante: TDataSource;
    Qry_PalestrantePalestranteId: TIntegerField;
    Qry_PalestranteNome: TStringField;
    Qry_PalestranteImagemUrl: TStringField;
    Qry_PalestranteTelefone: TIntegerField;
    Qry_PalestranteMinicurriculo: TStringField;
    Qry_PalestranteEmail: TStringField;
    lblRedeSocialPalestrante: TLabel;
    Qry_RedeSocialPalestrante: TQuery;
    ds_RedeSocialPalestrante: TDataSource;
    Qry_RedeSocialPalestranteRedeSocialId: TIntegerField;
    Qry_RedeSocialPalestrantenome: TStringField;
    Qry_RedeSocialPalestranteUrl: TStringField;
    Qry_RedeSocialPalestranteEventoId: TIntegerField;
    Qry_RedeSocialPalestrantePalestranteId: TIntegerField;
    cbbPalestrante: TsuiDBLookupComboBox;
    edtRedeSocialEvento: TEdit;
    cbbEvento: TsuiDBLookupComboBox;
    lblRedeSocialEvento: TLabel;
    Qry_RedeSocialEvento: TQuery;
    ds_RedeSocialEvento: TDataSource;
    Qry_RedeSocialEventoRedeSocialId: TIntegerField;
    Qry_RedeSocialEventonome: TStringField;
    Qry_RedeSocialEventoUrl: TStringField;
    Qry_RedeSocialEventoEventoId: TIntegerField;
    Qry_RedeSocialEventoPalestranteId: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure edtRedeSocialPalestranteClick(Sender: TObject);
    procedure edtMinicurriculoPalestranteClick(Sender: TObject);
    procedure edtEnderecoEventoClick(Sender: TObject);
    procedure edtEmailPalestranteClick(Sender: TObject);
    procedure Qry_lotesCalcFields(DataSet: TDataSet);
    procedure suiDBGrid1CellClick(Column: TColumn);
    procedure suiDBGrid2CellClick(Column: TColumn);
    procedure DbCbRedeSocialPalestranteClick(Sender: TObject);
    procedure cbbPalestranteClick(Sender: TObject);
    procedure cbbEventoClick(Sender: TObject);
  private
    { Private declarations }
    urlImagemPalestrante: String;
    urlImagemEvento: String;
    procedure PreencherInfoLote();
    procedure PreencherInfoEvento();
    procedure PreencherInfoPalestrante();

  public
    { Public declarations }
  end;

var
  F_DetalhesEvento: TF_DetalhesEvento;

implementation

uses
  Unit1, comObj;

{$R *.dfm}

procedure TF_DetalhesEvento.PreencherInfoLote();
begin
  gpbLote.Caption := Format('Lote %s do evento %s:',[Qry_lotes.FieldByName('LOTEID').AsString, Qry_lotes.FieldByName('NOMEEVENTO').AsString]);
  edtIdLote.Text := Qry_lotes.FieldByName('LOTEID').AsString;
  edtNomeLote.Text := Qry_lotes.FieldByName('NOME').AsString;
  edtPrecoLote.Text := Qry_lotes.FieldbyName('Preco').Asstring;
  edtQuantidadeLote.Text := Qry_lotes.FieldByName('QUANTIDADE').AsString;
  if(edtIdLote.Text <> EmptyStr) then
  begin
    edtDataInicioLote.Text := DateToStr(Qry_lotes.FieldByName('DATAINICIO').AsDateTime);
    edtDataFimLote.Text := DateToStr(Qry_lotes.FieldByName('DATAFIM').AsDateTime);
  end;
end;

procedure TF_DetalhesEvento.PreencherInfoEvento();
begin
  //imagemEvento
  Qry_Detalhes.Close;
  Qry_Detalhes.Sql.Clear;
  Qry_Detalhes.Sql.Add('SELECT E.IMAGEMURL FROM EVENTO AS E INNER JOIN VWDETALHE AS VDW ');
  Qry_Detalhes.Sql.Add('ON E.EVENTOID = :EVENTOID');
  Qry_Detalhes.ParamByname('EVENTOID').AsInteger :=
    F_Principal.Qry_Filtro.FieldByName('EVENTOID').AsInteger;

  urlImagemEvento := F_Principal.Qry_Filtro.FieldByName('IMAGEMURL').AsString;
  imgEvento.Picture.LoadFromFile(urlImagemEvento);
  imgEvento.Stretch := true;

  With F_Principal.Qry_Filtro do
  begin
    //Dados do evento
    edtIdEvento.Text := FieldByName('EventoId').AsString;
    edtTemaEvento.Text := FieldByName('Tema').AsString;
    edtConvidadosEvento.Text := FieldByName('QtdPessoas').AsString;
    edtDataEvento.Text := DateToStr(FieldByName('DataEvento').AsDateTime);
    edtEnderecoEvento.Text := FieldByName('Endereco').AsString;
    edtContatoEvento.Text := FieldByName('Telefone').AsString;

    /////GRIDS PALESTRANTE E LOTE
    Qry_lotes.Close;
    Qry_lotes.ParamByName('EVENTOID').AsInteger := F_Principal.Qry_Filtro.FieldByName('EventoId').AsInteger;
    Qry_lotes.Open;

    Qry_Palestrante.Close;
    Qry_Palestrante.ParamByName('EventoId').AsInteger := F_Principal.Qry_Filtro.FieldByName('EventoId').AsInteger;
    Qry_Palestrante.Open;
    /////FIM GRIDS
  end;

  //RedeSocialEvento
  Qry_RedeSocialEvento.Close;
  Qry_RedeSocialEvento.ParamByName('IDEVENTO').AsInteger := StrToInt(edtIdEvento.Text);
  Qry_RedeSocialEvento.Open;
end;

procedure TF_DetalhesEvento.PreencherInfoPalestrante();
begin
  /////ALTERANDO LEGENDA DO GROUP BOX
    gpbPalestrante.Caption := Format('Informações de %s',[Qry_Palestrante.FieldByName('NOME').AsString]);
  /////FIM LEGENDA

  /////IMAGEM DO PALESTRANTE
    Qry_CrudPalestrante.Close;
    Qry_CrudPalestrante.Sql.Clear;
    Qry_CrudPalestrante.Sql.Add('SELECT P.IMAGEMURL FROM PALESTRANTE AS P INNER JOIN VWDETALHE AS VWD ');
    Qry_CrudPalestrante.Sql.Add('ON P.PALESTRANTEID = :PALESTRANTEID');
    Qry_CrudPalestrante.ParamByName('PALESTRANTEID').AsInteger :=
      Qry_Palestrante.FieldByName('PALESTRANTEID').AsInteger;
    urlImagemPalestrante := Qry_Palestrante.FieldByName('IMAGEMURL').AsString;
    imgPalestrante.Picture.LoadFromFile(urlImagemPalestrante);
    imgPalestrante.Stretch := true;
  /////FIM DA IMAGEM

  /////INFORMAÇÃO DOS CAMPOS
    With Qry_Palestrante do
    begin
      edtIdPalestrante.Text := FieldByName('PalestranteId').AsString;
      edtNomePalestrante.Text := FieldByName('Nome').AsString;
      edtEmailPalestrante.Text := FieldByName('Email').AsString;
      edtTelefonePalestrante.Text := FieldByName('Telefone').AsString;
      edtMinicurriculoPalestrante.Text := FieldByName('Minicurriculo').AsString;
    end;
  /////FIM INFORMAÇÃO

  Qry_RedeSocialPalestrante.Close;
  Qry_RedeSocialPalestrante.ParamByName('ID').AsInteger := StrToInt(edtIdPalestrante.Text);
  Qry_RedeSocialPalestrante.Open;
end;


procedure TF_DetalhesEvento.edtEmailPalestranteClick(Sender: TObject);
begin
  AbrirEmail(edtEmailPalestrante.Text);
end;

procedure TF_DetalhesEvento.edtEnderecoEventoClick(Sender: TObject);
begin
  AbrirMaps(edtEnderecoEvento.Text);
end;

procedure TF_DetalhesEvento.edtMinicurriculoPalestranteClick(Sender: TObject);
begin
  AbrirDoc(edtMinicurriculoPalestrante.text);
end;

procedure TF_DetalhesEvento.edtRedeSocialPalestranteClick(Sender: TObject);
begin
  AbrirIE(edtRedeSocialPalestrante.Text);
end;

procedure TF_DetalhesEvento.FormCreate(Sender: TObject);
begin
  PreencherInfoEvento();
  PreencherInfoPalestrante();
  PreencherInfoLote();
end;

procedure TF_DetalhesEvento.suiDBGrid1CellClick(Column: TColumn);
begin
  PreencherInfoLote();
end;

procedure TF_DetalhesEvento.suiDBGrid2CellClick(Column: TColumn);
begin
  PreencherInfoPalestrante();
end;

procedure TF_DetalhesEvento.cbbEventoClick(Sender: TObject);
begin
  edtRedeSocialEvento.Text := Qry_RedeSocialEvento.FieldByName('Url').AsString;
end;

procedure TF_DetalhesEvento.cbbPalestranteClick(Sender: TObject);
begin
  edtRedeSocialPalestrante.Text := Qry_RedeSocialPalestrante.FieldByName('Url').AsString;
end;

procedure TF_DetalhesEvento.DbCbRedeSocialPalestranteClick(Sender: TObject);
begin
  edtRedeSocialPalestrante.Text := Qry_RedeSocialPalestrante.FieldByName('Url').AsString;
end;

procedure TF_DetalhesEvento.Qry_lotesCalcFields(DataSet: TDataSet);
begin
  Qry_CrudLotes.Close;
  Qry_CrudLotes.Sql.Clear;
  Qry_CrudLotes.Sql.Add('SELECT TEMA FROM EVENTO (NOLOCK) WHERE EVENTOID = :ID');
  Qry_CrudLotes.ParamByName('ID').AsInteger := Qry_lotes.FieldByName('EVENTOID').AsInteger;
  Qry_CrudLotes.Open;

  Qry_lotes.FieldByName('NomeEvento').AsString := Qry_CrudLotes.FieldByName('TEMA').AsString;
end;
end.
