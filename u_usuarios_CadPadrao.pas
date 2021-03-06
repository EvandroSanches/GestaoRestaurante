unit u_usuarios_CadPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, u_cadastro_padrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  Tf_usuarios_CadPadrao = class(Tf_CadPadrao)
    q_dadoscod_usuario: TFDAutoIncField;
    q_dadosnome_completo: TStringField;
    q_dadoslogin: TStringField;
    q_dadossenha: TStringField;
    q_dadosativo: TSmallintField;
    q_dadosadministrador: TSmallintField;
    q_dadoscod_usuario_1: TIntegerField;
    q_dadosmodulo: TStringField;
    q_dadosnivel: TSmallintField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    editConfirm_senha: TEdit;
    Label6: TLabel;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    Label7: TLabel;
    b_permissoes: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure b_permissoesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function validar : boolean; override;
    function pode_excluir : String; override;
    procedure controle_visual; override;
  end;

var
  f_usuarios_CadPadrao: Tf_usuarios_CadPadrao;

implementation
   uses funcoes,u_dm, u_permissoes_CadPadrao;
{$R *.dfm}


procedure Tf_usuarios_CadPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  f_usuarios_CadPadrao := nil;
end;




procedure Tf_usuarios_CadPadrao.b_permissoesClick(Sender: TObject);
begin
  inherited;
  if not funcoes.Busca_Permissao('usuario_permissao') then
     begin
        ShowMessage('N?o possui permiss?o para acessar este modulo');
        exit;

     end;
     // se o formul?rio n?o estiver instanciado
     if not Assigned(F_permissoes_CadPadrao) then
     begin
          // instanciando o formul?rio
          F_permissoes_CadPadrao:= TF_permissoes_CadPadrao(application);
          F_permissoes_CadPadrao.tabela := 'usuario_permissao';
          F_permissoes_CadPadrao.campor_chave := q_dados.FieldByName('cod_usuario').AsString;;
          F_permissoes_CadPadrao.campo_pesquisa := 'modulo';

          F_permissoes_CadPadrao.carregar_dados('');
     end
     else begin
          F_permissoes_CadPadrao.Show;
     end;
end;

Procedure Tf_usuarios_CadPadrao.controle_visual;
begin
     inherited;
     DBEdit1.Enabled := b_gravar.Enabled;
     DBEdit2.Enabled := b_gravar.Enabled;
     DBEdit3.Enabled := b_gravar.Enabled;
     editConfirm_senha.Enabled := b_gravar.Enabled;
     if dm.usuario.administrador = 1 then
     begin
          DBCombobox1.Enabled = True;
          DBCombobox2.Enabled = True;
     end
     else
     begin
          DBCombobox1.Enabled = False;
          DBCombobox2.Enabled = False;
     end;

end;

Function Tf_usuarios_CadPadrao.validar;
begin
    if trim(DBEdit1.Text) = '' then
  begin
    ShowMessage('O campo Nome deve ser preenchido !');
    result := false;
    exit
  end;

  if trim(DBEdit2.Text) = '' then
  begin
    ShowMessage('O campo Login deve ser preenchido !');
    result := false;
    exit
  end;

  if trim(DBEdit3.Text) = '' then
  begin
    ShowMessage('O campo Senha deve ser preenchido !');
    result := false;
    exit
  end;


  if (DBEdit3.Text) <> EditConfirm_senha.Text then
  begin
    ShowMessage('O campo Confirmar senha esta incorreto !');
    result := false;
    exit
  end;
end;


Function Tf_usuarios_CadPadrao.pode_excluir;
begin
  dm.q_geral.SQL.Clear;
  dm.q_geral.SQL.Add('select count(*) as total '+'');
  dm.q_geral.SQL.Add(' from usuario_permissao as u '+ '');
  dm.q_geral.SQL.Add(' where u.cod_usuario = '+QuotedStr(q_dados.FieldByName('cod_usuario').AsString) +'');
  dm.q_geral.Open;

  if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
  begin
     result := 'N?o foi possivel excluir esse Usu?rio pois possui relacionamento com permissoes !';
     exit;
  end;


  result := '';
end;
end.
