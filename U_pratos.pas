unit U_pratos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tf_pratos = class(TForm)
    Panel1: TPanel;
    b_fechar: TBitBtn;
    Label1: TLabel;
    edit_pesquisa: TEdit;
    b_excluir: TBitBtn;
    b_alterar: TBitBtn;
    b_incluir: TBitBtn;
    Bevel1: TBevel;
    DBGrid1: TDBGrid;
    q_pratos : TFDQuery;
    ds_pratos : TDataSource;
    Q_Pratoscod_prato: TFDAutoIncField;
    Q_Pratosnome: TStringField;
    Q_Pratosdescricao_detalhada: TMemoField;
    Q_Pratosvalor: TFloatField;
    b_composicao: TBitBtn;
    b_imprimir: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edit_pesquisaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure b_fecharClick(Sender: TObject);
    procedure b_excluirClick(Sender: TObject);
    procedure b_incluirClick(Sender: TObject);
    procedure b_alterarClick(Sender: TObject);
    procedure b_composicaoClick(Sender: TObject);
    procedure b_imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure carregar_query(s : string);

  end;

var
  f_pratos: Tf_pratos;

implementation

{$R *.dfm}

uses u_dm, u_pratos_ficha, u_composicao;

// OnClose do bot?o fechar
procedure Tf_pratos.b_fecharClick(Sender: TObject);
begin
     close;
end;

procedure Tf_pratos.b_imprimirClick(Sender: TObject);
begin
  if q_pratos.IsEmpty then
  begin
    ShowMessage('N?o h? um registro selecionado para imprimir !');
    exit;
  end;

  //R_composicao := TR_composicao.Create(application);
 // R_composicao.cod_prato := q_pratos.FieldByName('cod_prato').AsString;
  //R_composicao.QRP.Preview;
  //R_composicao.free;
end;

procedure Tf_pratos.b_incluirClick(Sender: TObject);
// OnClick do bot?o Incluir
begin
     // se o formul?rio n?o estiver instanciado
     if not Assigned(F_pratos_ficha) then
     begin
          // instanciando o formul?rio
          F_pratos_ficha:= TF_pratos_ficha.create(application);
          F_pratos_ficha.cod_prato:= '';
     end
     else begin
          F_pratos_ficha.Show;
     end;

end;

procedure Tf_pratos.b_alterarClick(Sender: TObject);
// OnClick do bot?o alterar
begin
     // se a query pratos n?o conter dados
     if Q_Pratos.IsEmpty then
     begin
          ShowMessage('N?o h? um registro selecionado para alterar !');
          exit;
     end;

     // se o formul?rio n?o estiver instanciado
     if not Assigned(F_pratos_ficha) then
     begin
          // instanciando o formul?rio
          F_pratos_ficha:= TF_pratos_ficha.create(application);
          F_pratos_ficha.cod_prato:= q_pratos.FieldByName('cod_prato').AsString;
          F_pratos_ficha.carregar_dados;
     end
     else begin
          F_pratos_ficha.Show;
     end;

end;

procedure Tf_pratos.b_composicaoClick(Sender: TObject);
begin
     // se a query pratos n?o conter dados
     if Q_Pratos.IsEmpty then
     begin
          ShowMessage('N?o h? um prato selecionado para montar a composi??o !');
          exit;
     end;

     // se o formul?rio n?o estiver instanciado
     if not Assigned(f_composicao) then
     begin
          // instanciando o formul?rio
          f_composicao:= Tf_composicao.create(application);
          f_composicao.cod_prato:= q_pratos.FieldByName('cod_prato').AsString;
          f_composicao.l_prato.caption:= q_pratos.FieldByName('nome').AsString;
          f_composicao.load_query;
     end
     else begin
          f_composicao.Show;
     end;

end;

procedure Tf_pratos.b_excluirClick(Sender: TObject);
// OnClick do bot?o excluir
begin
     // se a query pratos n?o conter dados
     if q_pratos.IsEmpty then
     begin
          ShowMessage('N?o h? um registro selecionado para exclus?o !');
          exit;
     end;

     // verificar se h? clientes e fornecedores relacionados
     dm.q_geral.sql.Clear;
     dm.q_geral.sql.add(' select count(*) as total ' );
     dm.q_geral.sql.add(' from composicao ');
     dm.q_geral.sql.add(' where cod_prato = ' + QuotedStr(q_pratos.FieldByName('cod_prato').AsString) );
     dm.q_geral.Open;
     if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
     begin
          ShowMessage('N?o ? poss?vel excluir essa prato porque h? composi??o cadastrada !');
          exit;
     end;

     dm.q_geral.sql.Clear;
     dm.q_geral.sql.add(' select count(*) as total ' );
     dm.q_geral.sql.add(' from itens_encomenda ');
     dm.q_geral.sql.add(' where cod_prato = ' + QuotedStr(q_pratos.FieldByName('cod_prato').AsString) );
     dm.q_geral.Open;
     if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
     begin
          ShowMessage('N?o ? poss?vel excluir essa prato porque h? encomendas relacionadas !');
          exit;
     end;

     if MessageDlg('Deseja realmente excluir a prato ' + q_pratos.FieldByName('nome').AsString + ' ??',
                    mtConfirmation,[mbYes,mbNo],0) = mrYes then
     begin
          dm.q_geral.sql.clear;
          dm.q_geral.sql.add(' delete from pratos ');
          dm.q_geral.sql.add(' where cod_prato = ' + QuotedStr(q_pratos.FieldByName('cod_prato').AsString) );
          dm.q_geral.ExecSql;
          // observa??o:
          // o M?todo ExecSql ? utilizado para os comandos SQL: Insert, Update e Delete
          // o M?todo Open ? utilizado para o comando SELECT

          // Atualizando a query q_pratos
          carregar_query('');
     end;
end; // fim do onclick do bot?o excluir

procedure Tf_pratos.carregar_query(s : string);
begin
     q_pratos.SQL.Clear;
     q_pratos.SQL.add(' select * ');
     q_pratos.SQL.add(' from pratos ');
     q_pratos.SQL.add(' where nome like ' + QuotedStr('%'+s+'%') + ' ');
     q_pratos.SQL.add(' order by nome ');
     q_pratos.Open;
     //q_pratos.Active:= true;
     { Observa??es:
       - A fun??o QuotedStr, coloca entre aspas simples o conte?do de seu par?metro
     }
end; // carregar_query

// OnChange do edit_pesuisa
procedure Tf_pratos.edit_pesquisaChange(Sender: TObject);
begin
     carregar_query(edit_pesquisa.text);
end;
// OnCreate do formul?rio f_pratos
procedure Tf_pratos.FormCreate(Sender: TObject);
begin
     carregar_query('');
end;

// OnClose de F_pratos
procedure Tf_pratos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:= caFree;
     f_pratos:= nil;
end;



end.
