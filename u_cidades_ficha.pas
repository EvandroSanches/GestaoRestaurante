unit u_cidades_ficha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask;

type
  Tf_cidades_ficha = class(TForm)
    b_gravar: TBitBtn;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    edit_nome: TEdit;
    edit_uf: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edit_cep_padrao: TMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure b_gravarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    cod_cidade : string;

    procedure carregar_dados;

  end;

var
  f_cidades_ficha: Tf_cidades_ficha;

implementation

{$R *.dfm}

uses u_dm, u_cidades;

procedure Tf_cidades_ficha.BitBtn1Click(Sender: TObject);
begin
     close;
end;

procedure Tf_cidades_ficha.b_gravarClick(Sender: TObject);
// OnClick do bot?o gravar
begin

     dm.Q_Geral.SQL.Clear;
     dm.Q_Geral.SQL.add(' sp_cadastra_cidade :cod_cidade, :nome, :uf, :cep_padrao ');

     if cod_cidade = ''
       then dm.Q_Geral.parambyname('cod_cidade').AsString:= '0'
       else dm.Q_Geral.parambyname('cod_cidade').AsString:= cod_cidade;

     dm.Q_Geral.parambyname('nome').AsString       := edit_nome.Text;
     dm.Q_Geral.parambyname('uf').AsString         := edit_uf.Text;
     dm.Q_Geral.parambyname('cep_padrao').AsString := edit_cep_padrao.Text;

     dm.Q_Geral.open;

     if dm.Q_Geral.FieldByName('retorno').AsInteger = 0 then
     begin
          MessageDlg( dm.Q_Geral.FieldByName('msg').AsString, mtError,[mbok],0);
     end
     else begin
          f_cidades.carregar_query('');
          close;
     end;


{
     if trim(edit_nome.Text) = '' then
     begin
          ShowMessage('O campo nome deve ser preenchido !');
          exit;
     end;

     if trim(edit_uf.Text) = '' then
     begin
          ShowMessage('O campo Unidade Federal deve ser preenchido !');
          exit;
     end;


     if cod_cidade = '' then
     begin
          dm.q_geral.sql.clear;
          dm.q_geral.sql.add('insert into cidades (nome, uf, cep_padrao) values (:nome, :uf, :cep_padrao) ');

          dm.q_geral.ParamByName('nome').AsString:= trim(edit_nome.Text);
          dm.q_geral.ParamByName('uf').AsString:= trim(edit_uf.Text);
          dm.q_geral.ParamByName('cep_padrao').AsString:= trim(edit_cep_padrao.Text);

     end
     else begin
          dm.q_geral.sql.clear;
          dm.q_geral.sql.add(' update cidades set ');
          dm.q_geral.sql.add('   nome = :nome, ');
          dm.q_geral.sql.add('   uf = :uf, ');
          dm.q_geral.sql.add('   cep_padrao = :cep_padrao ');
          dm.q_geral.sql.add(' where cod_cidade = :cod_cidade ');

          dm.q_geral.ParamByName('nome').AsString:= trim(edit_nome.Text);
          dm.q_geral.ParamByName('uf').AsString:= trim(edit_uf.Text);
          dm.q_geral.ParamByName('cep_padrao').AsString:= trim(edit_cep_padrao.Text);
          dm.q_geral.ParamByName('cod_cidade').AsString:= cod_cidade;

     end;


     dm.q_geral.ExecSql;
     f_cidades.carregar_query('');
     close;
}


end;

procedure Tf_cidades_ficha.carregar_dados;
begin
     dm.q_geral.sql.clear;
     dm.q_geral.sql.add(' select * ');
     dm.q_geral.sql.add(' from cidades ');
     dm.q_geral.sql.add(' where cod_cidade = ' + QuotedStr(cod_cidade) + ' ');
     dm.q_geral.open;

     if dm.q_geral.isempty then
     begin
          ShowMessage('Cidade n?o encontrada !');
          close;
          exit;
     end;

     edit_nome.Text:= dm.q_geral.fieldbyname('nome').AsString;
     edit_uf.Text:= dm.q_geral.fieldbyname('uf').AsString;
     edit_cep_padrao.Text:= dm.q_geral.fieldbyname('cep_padrao').AsString;

end;

procedure Tf_cidades_ficha.FormClose(Sender: TObject; var Action: TCloseAction);
// OnClose do Formul?rio
begin
     Action:= caFree;
     f_cidades_ficha:= nil;
end;

end.
