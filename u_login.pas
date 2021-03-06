unit u_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  Tf_login = class(TForm)
    edit_login: TEdit;
    edit_senha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    b_ok: TBitBtn;
    b_cancel: TBitBtn;
    procedure b_okClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_login: Tf_login;

implementation

{$R *.dfm}
  uses u_dm, U_Principal;

procedure Tf_login.b_okClick(Sender: TObject);
begin
  dm.Q_Geral.sql.clear;
  dm.Q_Geral.SQL.Add(' select * from usuarios ');
  dm.Q_Geral.SQL.Add(' where login = :login and senha = :senha ');
  dm.Q_Geral.ParamByName('login').AsString := edit_login.Text;
  dm.Q_Geral.ParamByName('senha').AsString := edit_senha.Text;
  dm.Q_Geral.Open();

  if not dm.Q_Geral.isEmpty then
  begin
      if dm.Q_Geral.FieldByName('ativo').AsInteger = 1 then
      begin
         dm.usuario.cod_usuario := dm.Q_Geral.FieldByname('cod_usuario').AsInteger;
         dm.usuario.login := dm.Q_Geral.FieldByname('login').AsString;
         dm.usuario.nome_completo := dm.Q_Geral.FieldByname('nome_completo').AsString;
         dm.usuario.administrador := dm.Q_Geral.FieldByname('administrador').AsInteger;

         ModalResult := mrOk;
      end
      else
      begin
        MessageDlg('USU?RIO INATIVO !!!',mtError,[mbOk],0);
      end;

  end
  else
  begin
    MessageDlg('Usu?rio e/ou senha invalidos!!',mtError,[mbOk],0);
  end;


end;

end.
