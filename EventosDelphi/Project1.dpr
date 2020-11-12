program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {F_Principal},
  Unit3 in '..\Nave\Unit3.pas' {F_Login},
  U_CadEvento in 'U_CadEvento.pas' {frmCrudEvento},
  DmAcessoBanco in 'Modulo\DmAcessoBanco.pas' {dmBanco: TDataModule},
  U_CadLote in 'U_CadLote.pas' {F_Lote},
  U_CadPalestrante in 'U_CadPalestrante.pas' {F_Palestrante},
  U_CadRedeSocial in 'U_CadRedeSocial.pas' {F_RedeSocial},
  DetalhesEvento in 'DetalhesEvento.pas' {F_DetalhesEvento},
  U_CadPalestranteEvento in 'U_CadPalestranteEvento.pas' {F_PalestranteEvento},
  U_funcoes in 'U_funcoes.pas',
  U_CadConvidado in 'U_CadConvidado.pas' {F_Convidado},
  U_TesteCds in 'U_TesteCds.pas' {F_Teste};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmBanco, dmBanco);
  Application.CreateForm(TF_Principal, F_Principal);
  Application.CreateForm(TF_PalestranteEvento, F_PalestranteEvento);
  Application.CreateForm(TF_Convidado, F_Convidado);
  Application.CreateForm(TF_Teste, F_Teste);
  Application.Run;
end.
