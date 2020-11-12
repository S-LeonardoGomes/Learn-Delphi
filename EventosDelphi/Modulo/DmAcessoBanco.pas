unit DmAcessoBanco;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TdmBanco = class(TDataModule)
    dbConexao: TDatabase;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmBanco: TdmBanco;

implementation

{$R *.dfm}

procedure TdmBanco.DataModuleCreate(Sender: TObject);
begin
  dbConexao.Connected := true;
end;

end.
