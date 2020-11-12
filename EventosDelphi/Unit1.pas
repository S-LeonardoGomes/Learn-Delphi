unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, SUIForm, Menus, SUIMainMenu, DB, DBTables,
  ComCtrls, Grids, DBGrids, SUIDBCtrls, Mask, ToolEdit, Provider, DBClient, U_funcoes,
  U_TesteCds;

type
  TF_Principal = class(TForm)
    suiForm1: TsuiForm;
    suiMainMenu1: TsuiMainMenu;
    Open: TMenuItem;
    Evento1: TMenuItem;
    Palestrante1: TMenuItem;
    Lote1: TMenuItem;
    Evento2: TMenuItem;
    Palestrante2: TMenuItem;
    Redesocial2: TMenuItem;
    suiDBGrid1: TsuiDBGrid;
    btnFiltro: TButton;
    lblFiltro: TLabel;
    ds_Filtro: TDataSource;
    Qry_Filtro: TQuery;
    dt_FiltroFim: TDateEdit;
    dt_FiltroInicio: TDateEdit;
    lblDataInicio: TLabel;
    Label1: TLabel;
    Qry_CrudFiltro: TQuery;
    Qry_FiltroEventoId: TIntegerField;
    Qry_FiltroEndereco: TStringField;
    Qry_FiltroDataEvento: TDateTimeField;
    Qry_FiltroTema: TStringField;
    Qry_FiltroQtdPessoas: TIntegerField;
    Qry_FiltroTelefone: TStringField;
    Qry_FiltroPalestranteId: TIntegerField;
    Qry_FiltroNOME: TStringField;
    Qry_FiltroEMAIL: TStringField;
    Qry_FiltroIMGPALESTRANTE: TStringField;
    Qry_FiltroMINICURRICULO: TStringField;
    Qry_FiltroTELPALESTRANTE: TIntegerField;
    Qry_FiltroNomePalestrante: TStringField;
    PalestranteEvento: TMenuItem;
    Qry_FiltroImagemUrl: TMemoField;
    cds_filtro: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    cds_filtroEventoId: TIntegerField;
    cds_filtroEndereco: TStringField;
    cds_filtroDataEvento: TDateTimeField;
    cds_filtroTema: TStringField;
    cds_filtroQtdPessoas: TIntegerField;
    cds_filtroTelefone: TStringField;
    cds_filtroPalestranteId: TIntegerField;
    cds_filtroNOME: TStringField;
    cds_filtroEMAIL: TStringField;
    cds_filtroIMGPALESTRANTE: TStringField;
    cds_filtroMINICURRICULO: TStringField;
    cds_filtroTELPALESTRANTE: TIntegerField;
    cds_filtroNomePalestrante: TStringField;
    cds_filtroImagemUrl: TMemoField;
    Convidados1: TMenuItem;
    este1: TMenuItem;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Evento2Click(Sender: TObject);
    procedure Lote1Click(Sender: TObject);
    procedure Palestrante2Click(Sender: TObject);
    procedure Redesocial2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFiltroClick(Sender: TObject);
    procedure Qry_FiltroCalcFields(DataSet: TDataSet);
    procedure suiDBGrid1DblClick(Sender: TObject);
    procedure PalestranteEventoClick(Sender: TObject);
    procedure suiDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Convidados1Click(Sender: TObject);
    procedure este1Click(Sender: TObject);

  private
    { Private declarations }
   procedure CriaForm(AFormClass: TComponentClass; AForm : TForm);
  public
    { Public declarations }
  end;

var
  F_Principal: TF_Principal;
  count : Integer;

implementation

uses
  Unit3, U_CadEvento, U_CadLote, U_CadPalestrante, U_CadRedeSocial,
  DetalhesEvento, U_CadPalestranteEvento, U_CadConvidado;

{$R *.dfm}

procedure TF_Principal.btnCloseClick(Sender: TObject);
begin
  F_principal.Close;
end;

procedure TF_Principal.btnFiltroClick(Sender: TObject);
var
  dataFiltroInicio: TDateTime;
  dataFiltroFim: TDateTime;
begin
  if(Trim(dt_FiltroInicio.Text) = ('/  /')) then
  begin
    dataFiltroInicio := StrToDate('01/01/1900');
    dataFiltroFim := dt_FiltroFim.Date;
  end;

  if (Trim(dt_FiltroFim.Text) = ('/  /')) then
  begin
    dataFiltroFim := StrToDate('01/01/2100');
    dataFiltroInicio := dt_FiltroInicio.Date;
  end;

  if((Trim(dt_FiltroFim.Text) <> ('/  /')) and (Trim(dt_FiltroInicio.Text) <> ('/  /')))then
  begin
    dataFiltroInicio := dt_FiltroInicio.Date;
    dataFiltroFim := dt_FiltroFim.Date;
  end;

  Qry_Filtro.Close;
  Qry_Filtro.Sql.Clear;
  Qry_Filtro.Sql.Add('SELECT * FROM VWDETALHE');
  Qry_Filtro.Sql.Add('WHERE DataEvento BETWEEN :DATAINICIO AND :DATAFIM');
  Qry_Filtro.ParamByName('DATAINICIO').AsDateTime := dataFiltroInicio;
  Qry_Filtro.ParamByName('DATAFIM').AsDateTime := dataFiltroFim;
  Qry_Filtro.Open;
end;

procedure TF_Principal.Convidados1Click(Sender: TObject);
begin
  Application.CreateForm(TF_Convidado, F_Convidado);
  F_Convidado.ShowModal;
  F_Convidado.Release;
end;

procedure TF_Principal.CriaForm(AFormClass: TComponentClass; AForm : TForm);
begin
  Application.CreateForm(AFormClass, AForm);
  AForm.ShowModal;
  AForm.Release;
end;

procedure TF_Principal.este1Click(Sender: TObject);
begin
  Application.CreateForm(TF_Teste, F_Teste);
  F_Teste.ShowModal;
  F_Teste.Release;
end;

procedure TF_Principal.Evento2Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmCrudEvento, frmCrudEvento);
    frmCrudEvento.ShowModal;
    frmCrudEvento.Release;
  except
    on E: Exception do
    begin
      ShowMessage('Ocorreu um erro ao tetnar abrir a tela de Eventos. ' + E.Message);
      frmCrudEvento.Release;
    end;
  end;
end;

procedure TF_Principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TF_Principal.FormCreate(Sender: TObject);
begin
  Qry_Filtro.Open;
  Application.CreateForm(TF_Login, F_Login);
  F_login.ShowModal;
  F_Login.Release;
end;


procedure TF_Principal.Lote1Click(Sender: TObject);
begin
  Application.CreateForm(TF_Lote, F_Lote);
  F_Lote.ShowModal;
  F_Lote.Release;
end;

procedure TF_Principal.Palestrante2Click(Sender: TObject);
begin
  Application.CreateForm(TF_Palestrante, F_Palestrante);
  F_Palestrante.ShowModal;
  F_Palestrante.Release;

end;

procedure TF_Principal.PalestranteEventoClick(Sender: TObject);
begin
  Application.CreateForm(TF_PalestranteEvento, F_PalestranteEvento);
  F_PalestranteEvento.ShowModal;
  F_PalestranteEvento.Release;

  Qry_Filtro.Close;
  Qry_Filtro.Open;
end;

procedure TF_Principal.Qry_FiltroCalcFields(DataSet: TDataSet);
begin
  Qry_CrudFiltro.Close;
  Qry_CrudFiltro.Sql.Clear;
  Qry_CrudFiltro.Sql.Add('SELECT Nome FROM VWDetalhe Where PalestranteId = :PALESTRANTEID');
  Qry_CrudFiltro.ParamByName('PALESTRANTEID').AsInteger := Qry_Filtro.FieldByName('PalestranteId').AsInteger;
  Qry_CrudFiltro.Open;
  Qry_Filtro.FieldByName('NomePalestrante').AsString := Qry_CrudFiltro.FieldByName('Nome').AsString;
end;

procedure TF_Principal.Redesocial2Click(Sender: TObject);
begin
  Application.CreateForm(TF_RedeSocial, F_RedeSocial);
  F_RedeSocial.ShowModal;
  F_RedeSocial.Release;
end;

procedure TF_Principal.suiDBGrid1DblClick(Sender: TObject);
begin
  Application.CreateForm(TF_DetalhesEvento, F_DetalhesEvento);
  F_DetalhesEvento.ShowModal;
  F_DetalhesEvento.Release;
end;

procedure TF_Principal.suiDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
Var R : TRect;
begin
  R := Rect;
  Dec(R.Bottom, 2);
  if (Column.Field = Qry_FiltroImagemUrl) then
  begin
    if not (gdSelected in State) then
      suiDBGrid1.Canvas.FillRect(Rect);
    suiDBGrid1.Canvas.TextRect(R, R.Left, R.Top, Qry_FiltroImagemUrl.AsString);
  end;
end;

end.
