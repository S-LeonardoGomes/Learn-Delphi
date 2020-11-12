unit U_funcoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, DB,
  DBTables, Grids, DBGrids, SUIDBCtrls, StdCtrls, ExtCtrls, jpeg, ShellApi, comObj, ComCtrls;

procedure ValidarCamposForm(AForm : TForm);
procedure LimparCamposForm(AForm : TForm);
procedure AbrirMaps(Endereco: String);
procedure AbrirIE(Endereco: String);
procedure AbrirEmail(Email: String);
procedure AbrirDoc(Caminho: String);

implementation

uses
  ToolEdit;

/////VERIFICAR SE OS CAMPOS DO ESTÃO VAZIOS
procedure ValidarCamposForm(AForm : TForm);
var
  i: Integer;
begin
  for i := 0 to Aform.ComponentCount - 1 do
  begin
    if(Aform.Components[i].Tag = 1)then
    begin
      /////T_EDIT
      if(Aform.Components[i] is TEdit) then
      begin
        if((Aform.Components[i] as TEdit).Text = EmptyStr) then
        begin
          ShowMessage('O Campo ' + (Aform.Components[i] as TEdit).Hint + ' é obrigatório!');
          (Aform.Components[i] as TEdit).SetFocus;
          Abort;
        end;
      end;

      /////T_DATE_EDIT
      if(Aform.Components[i] is TDateEdit) then
      begin
        if(Trim((Aform.Components[i] as TDateEdit).Text) = '/  /') then
        begin
          ShowMessage('O Campo ' + (Aform.Components[i] as TDateEdit).Hint + ' é obrigatório!');
          (Aform.Components[i] as TDateEdit).SetFocus;
          Abort;
        end;
      end;

      /////TsuiDBLookupcomboBox
      if(Aform.Components[i] is TsuiDBLookupComboBox) then
      begin
        if((Aform.Components[i] as TsuiDBLookUpComboBox).Text = EmptyStr) then
        begin
          ShowMessage('O Campo ' + (Aform.Components[i] as TsuiDBLookupcomboBox).Hint + ' é obrigatório!');
          (Aform.Components[i] as TsuiDBLookupcomboBox).SetFocus;
          Abort;
        end;
      end;

      /////T_FILENAME_EDIT
      if(Aform.Components[i] is TFilenameEdit) then
      begin
        if((Aform.Components[i] as TFilenameEdit).Text = EmptyStr) then
        begin
          ShowMessage('O Campo ' + (Aform.Components[i] as TFilenameEdit).Hint + ' é obrigatório!');
          (Aform.Components[i] as TFilenameEdit).SetFocus;
          Abort;
        end;
      end;
    end;
  end;
end;

/////LIMPAR CAMPOS DO FORM
procedure LimparCamposForm(AForm : TForm);
var
  i: Integer;
begin
  for i := 0 to Aform.ComponentCount - 1 do
  begin
    if(Aform.Components[i].Tag = 1)then
    begin
      /////T_EDIT
      if(Aform.Components[i] is TEdit) then
      begin
        (Aform.Components[i] as TEdit).Text := EmptyStr;
      end;

      /////T_DATE_EDIT
      if(Aform.Components[i] is TDateEdit) then
      begin
        (Aform.Components[i] as TDateEdit).Text := '/  /';
      end;

      /////TsuiDBLookupcomboBox
      if(Aform.Components[i] is TsuiDBLookupComboBox) then
      begin
        (Aform.Components[i] as TsuiDBLookUpComboBox).KeyValue := -1;
      end;

      /////T_FILENAME_EDIT
      if(Aform.Components[i] is TFilenameEdit) then
      begin
        (Aform.Components[i] as TFilenameEdit).Text := EmptyStr;
      end;
    end;
  end;
end;

/////ABRINDO O GOOGLE MAPS
procedure AbrirMaps(Endereco: String);
Var
  IE: Variant;
  ConsultaEndereco: String;
begin
  ConsultaEndereco := Format('http://maps.google.com/maps?q=%s', [Endereco]);
  try
    IE := CreateOleObject('InternetExplorer.Application');
    IE.Visible := true;
    IE.Navigate(ConsultaEndereco);
  finally
    if (not VarIsEmpty(IE)) then
      IE := Unassigned;
  end;
end;

/////ABRINDO O INTERNET EXPLORER
procedure AbrirIE(Endereco: String);
Var
  IE: Variant;
begin
  try
    IE := CreateOleObject('InternetExplorer.Application');
    IE.Visible := true;
    IE.Navigate(Endereco);
  finally
    if (not VarIsEmpty(IE)) then
      IE := Unassigned;
  end;
end;

/////ABRINDO O EMAIL
procedure AbrirEmail(Email: String);
Var
  mail: String;
begin
  mail := Format('mailto:%s', [Email]);
  ShellExecute(GetDesktopWindow, 'open', PChar(mail), '', '', SW_SHOWNORMAL);
end;

/////ABRIR DOCUMENTO
procedure AbrirDoc(Caminho: String);
begin
  ShellExecute(GetDesktopWindow, 'open', PChar(Caminho), '', '', SW_SHOWNORMAL);
end;

end.
