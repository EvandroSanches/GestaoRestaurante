unit u_ingredientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tf_ingredientes = class(TForm)
    Panel1: TPanel;
    b_fechar: TBitBtn;
    Label1: TLabel;
    edit_pesquisa: TEdit;
    b_excluir: TBitBtn;
    b_alterar: TBitBtn;
    b_incluir: TBitBtn;
    Bevel1: TBevel;
    DBGrid1: TDBGrid;
    Q_ingredientes: TFDQuery;
    DS_ingredientes: TDataSource;
    Q_ingredientescod_ingrediente: TFDAutoIncField;
    Q_ingredientesdescricao: TStringField;
    Q_ingredientesvalor_unitario: TFloatField;
    Q_ingredientescod_unidade: TIntegerField;
    Q_ingredientesunidade: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edit_pesquisaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure b_fecharClick(Sender: TObject);
    procedure b_excluirClick(Sender: TObject);
    procedure b_incluirClick(Sender: TObject);
    procedure b_alterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure carregar_query(s : string);

  end;

var
  f_ingredientes: Tf_ingredientes;

implementation

{$R *.dfm}

uses u_dm, u_ingredientes_ficha;

// OnClose do botão fechar
procedure Tf_ingredientes.b_fecharClick(Sender: TObject);
begin
     close;
end;

procedure Tf_ingredientes.b_incluirClick(Sender: TObject);
// OnClick do botão Incluir
begin
     // se o formulário não estiver instanciado
     if not Assigned(F_ingredientes_ficha) then
     begin
          // instanciando o formulário
          F_ingredientes_ficha:= TF_ingredientes_ficha.create(application);
          F_ingredientes_ficha.cod_ingrediente:= '';
     end
     else begin
          F_ingredientes_ficha.Show;
     end;

end;

procedure Tf_ingredientes.b_alterarClick(Sender: TObject);
// OnClick do botão alterar
begin
     // se a query ingredientes não conter dados
     if Q_ingredientes.IsEmpty then
     begin
          ShowMessage('Não há um registro selecionado para alterar !');
          exit;
     end;

     // se o formulário não estiver instanciado
     if not Assigned(F_ingredientes_ficha) then
     begin
          // instanciando o formulário
          F_ingredientes_ficha:= TF_ingredientes_ficha.create(application);
          F_ingredientes_ficha.cod_ingrediente:= q_ingredientes.FieldByName('cod_ingrediente').AsString;
          F_ingredientes_ficha.carregar_dados;
     end
     else begin
          F_ingredientes_ficha.Show;
     end;

end;

procedure Tf_ingredientes.b_excluirClick(Sender: TObject);
// OnClick do botão excluir
begin
     // se a query ingredientes não conter dados
     if q_ingredientes.IsEmpty then
     begin
          ShowMessage('Não há um registro selecionado para exclusão !');
          exit;
     end;

     // verificar se há clientes e fornecedores relacionados
     dm.q_geral.sql.Clear;
     dm.q_geral.sql.add(' select count(*) as total ' );
     dm.q_geral.sql.add(' from composicao ');
     dm.q_geral.sql.add(' where cod_ingrediente = ' + QuotedStr(q_ingredientes.FieldByName('cod_ingrediente').AsString) );
     dm.q_geral.Open;
     if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
     begin
          ShowMessage('Não é possível excluir essa ingrediente porque há composição cadastrada !');
          exit;
     end;

     dm.q_geral.sql.Clear;
     dm.q_geral.sql.add(' select count(*) as total ' );
     dm.q_geral.sql.add(' from itens_compra ');
     dm.q_geral.sql.add(' where cod_ingrediente = ' + QuotedStr(q_ingredientes.FieldByName('cod_ingrediente').AsString) );
     dm.q_geral.Open;
     if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
     begin
          ShowMessage('Não é possível excluir essa ingrediente porque há compras relacionadas !');
          exit;
     end;

     dm.q_geral.sql.Clear;
     dm.q_geral.sql.add(' select count(*) as total ' );
     dm.q_geral.sql.add(' from composicao ');
     dm.q_geral.sql.add(' where cod_ingrediente = ' + QuotedStr(q_ingredientes.FieldByName('cod_ingrediente').AsString) );
     dm.q_geral.Open;
     if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
     begin
          ShowMessage('Não é possível excluir essa ingrediente porque há pratos relacionados !');
          exit;
     end;

     if MessageDlg('Deseja realmente excluir a ingrediente ' + q_ingredientes.FieldByName('descricao').AsString + ' ??',
                    mtConfirmation,[mbYes,mbNo],0) = mrYes then
     begin
          dm.q_geral.sql.clear;
          dm.q_geral.sql.add(' delete from ingredientes ');
          dm.q_geral.sql.add(' where cod_ingrediente = ' + QuotedStr(q_ingredientes.FieldByName('cod_ingrediente').AsString) );
          dm.q_geral.ExecSql;
          // observação:
          // o Método ExecSql é utilizado para os comandos SQL: Insert, Update e Delete
          // o Método Open é utilizado para o comando SELECT

          // Atualizando a query q_ingredientes
          carregar_query('');
     end;
end; // fim do onclick do botão excluir

procedure Tf_ingredientes.carregar_query(s : string);
begin

     q_ingredientes.SQL.Clear;
     q_ingredientes.SQL.add(' select i.*, u.descricao as unidade ');
     q_ingredientes.SQL.add(' from ingredientes i ');
     q_ingredientes.SQL.add('      left outer join unidades u on (u.cod_unidade = i.cod_unidade) ');
     q_ingredientes.SQL.add(' where i.descricao like ' + QuotedStr('%'+s+'%') + ' ');
     q_ingredientes.SQL.add(' order by i.descricao ');
     q_ingredientes.Open;
     //q_ingredientes.Active:= true;
     { Observações:
       - A função QuotedStr, coloca entre aspas simples o conteúdo de seu parâmetro
     }
end; // carregar_query

// OnChange do edit_pesuisa
procedure Tf_ingredientes.edit_pesquisaChange(Sender: TObject);
begin
     carregar_query(edit_pesquisa.text);
end;
// OnCreate do formulário f_ingredientes
procedure Tf_ingredientes.FormCreate(Sender: TObject);
begin
     carregar_query('');
end;

// OnClose de F_ingredientes
procedure Tf_ingredientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:= caFree;
     f_ingredientes:= nil;
end;



end.
