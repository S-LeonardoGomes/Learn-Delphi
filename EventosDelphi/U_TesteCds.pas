unit U_TesteCds;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, DBTables, Grids, DBGrids, SUIDBCtrls, Mask,
  ToolEdit;

type
  TF_Teste = class(TForm)
    suiDBGrid1: TsuiDBGrid;
    Qry_Teste: TQuery;
    Qry_TesteEventoId: TIntegerField;
    Qry_TesteEndereco: TStringField;
    Qry_TesteDataEvento: TDateTimeField;
    Qry_TesteTema: TStringField;
    Qry_TesteQtdPessoas: TIntegerField;
    Qry_TesteImagemUrl: TMemoField;
    Qry_TesteTelefone: TStringField;
    Qry_TestePalestranteId: TIntegerField;
    Qry_TesteNOME: TStringField;
    Qry_TesteEMAIL: TStringField;
    Qry_TesteIMGPALESTRANTE: TStringField;
    Qry_TesteMINICURRICULO: TStringField;
    Qry_TesteTELPALESTRANTE: TIntegerField;
    ds_Teste: TDataSource;
    cds_teste: TClientDataSet;
    datada: TsuiDBGrid;
    ds_cdsteste: TDataSource;
    Button1: TButton;
    cds_testeEventoId: TIntegerField;
    cds_testeEnderecoEvento: TStringField;
    cds_testeDataEvento: TDateTimeField;
    cds_testeTemaEvento: TStringField;
    cds_testeQtdPessoasEvento: TIntegerField;
    cds_testePalestranteId: TIntegerField;
    cds_testeNomePalestrante: TStringField;
    cds_testeEmailPalestrante: TStringField;
    dt_Filtro: TDateEdit;
    btnFiltro: TButton;
    edtAlterar: TEdit;
    btnSalvar: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure datadaCellClick(Column: TColumn);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Teste: TF_Teste;

implementation

{$R *.dfm}

procedure TF_Teste.btnFiltroClick(Sender: TObject);
var
  dataFiltroInicio: TDateTime;
  dataFiltroFim: TDateTime;
begin
  if((Trim(dt_Filtro.Text) = ('/  /')))then
  begin
    Cds_teste.Filtered := false;
    exit;
  end;

  Cds_teste.Filtered := false;
  Cds_teste.Filter := 'DataEvento <= ' + QuotedStr(DateToStr(dt_Filtro.Date));
  Cds_teste.Filtered := true;
end;

procedure TF_Teste.btnSalvarClick(Sender: TObject);
begin
  Cds_teste.Edit;
  Cds_teste.FieldByName('TemaEvento').AsString := edtAlterar.Text;
  Cds_teste.Post;
end;

procedure TF_Teste.Button1Click(Sender: TObject);
begin
  Cds_teste.Close;
  Cds_teste.CreateDataSet;
  Cds_teste.Open;

  while not Qry_teste.EOF do
  begin
    Cds_teste.Append;
    Cds_teste.FieldByName('EventoId').AsInteger := Qry_teste.FieldByName('EventoId').AsInteger;
    Cds_teste.FieldByName('EnderecoEvento').AsString := Qry_teste.FieldByName('endereco').AsString;
    Cds_teste.FieldByName('DataEvento').AsDateTime := Qry_teste.FieldByName('DataEvento').AsDateTime;
    Cds_teste.FieldByName('TemaEvento').AsString := Qry_teste.FieldByName('Tema').AsString;
    Cds_teste.FieldByName('QtdPessoasEvento').AsInteger := Qry_teste.FieldByName('QtdPessoas').AsInteger;
    Cds_teste.FieldByName('PalestranteId').AsInteger := Qry_teste.FieldByName('PalestranteId').AsInteger;
    Cds_teste.FieldByName('NomePalestrante').AsString := Qry_teste.FieldByName('Nome').AsString;
    Cds_teste.FieldByName('EmailPalestrante').AsString := Qry_teste.FieldByName('Email').AsString;
    Cds_teste.Post;

    Qry_teste.Next;
  end;
end;

procedure TF_Teste.datadaCellClick(Column: TColumn);
begin
  edtAlterar.Text := cds_teste.FieldByName('TemaEvento').AsString;
end;

procedure TF_Teste.FormCreate(Sender: TObject);
begin
  Qry_Teste.Open;
end;

end.
