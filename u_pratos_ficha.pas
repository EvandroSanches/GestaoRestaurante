unit u_pratos_ficha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask;

type
  Tf_pratos_ficha = class(TForm)
    b_gravar: TBitBtn;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    edit_nome: TEdit;
    Label2: TLabel;
    edit_descricao_detalhada: TMemo;
    edit_valor: TEdit;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure b_gravarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    cod_prato : string;

    procedure carregar_dados;

  end;

var
  f_pratos_ficha: Tf_pratos_ficha;

implementation

{$R *.dfm}

uses u_dm, u_pratos, funcoes;

procedure Tf_pratos_ficha.BitBtn1Click(Sender: TObject);
begin
     close;
end;

procedure Tf_pratos_ficha.b_gravarClick(Sender: TObject);
// OnClick do botão gravar
begin
     if trim(edit_nome.Text) = '' then
     begin
          ShowMessage('O campo descrição deve ser preenchido !');
          exit;
     end;

     if not is_Real(edit_valor.Text)  then
     begin
          ShowMessage('O campo Valor deve ser preenchido com um valor válido !');
          exit;
     end;


     if cod_prato = '' then
     begin
          dm.q_geral.sql.clear;
          dm.q_geral.sql.add('insert into pratos (nome, valor, descricao_detalhada) values (:nome, :valor, :descricao_detalhada) ');

          dm.q_geral.ParamByName('nome').AsString:= trim(edit_nome.Text);
          dm.q_geral.ParamByName('valor').AsString:= RealUSA(trim(edit_valor.Text));
          dm.q_geral.ParamByName('descricao_detalhada').AsString:= trim(edit_descricao_detalhada.lines.Text);

     end
     else begin
          dm.q_geral.sql.clear;
          dm.q_geral.sql.add(' update pratos set ');
          dm.q_geral.sql.add('   nome = :nome, ');
          dm.q_geral.sql.add('   valor = :valor, ');
          dm.q_geral.sql.add('   descricao_detalhada = :descricao_detalhada ');
          dm.q_geral.sql.add(' where cod_prato = :cod_prato ');

          dm.q_geral.ParamByName('nome').AsString:= trim(edit_nome.Text);
          dm.q_geral.ParamByName('valor').AsString:= RealUSA(trim(edit_valor.Text));
          dm.q_geral.ParamByName('descricao_detalhada').AsString:= trim(edit_descricao_detalhada.Lines.Text);
          dm.q_geral.ParamByName('cod_prato').AsString:= cod_prato;

     end;


     dm.q_geral.ExecSql;
     f_pratos.carregar_query('');
     close;



end;

procedure Tf_pratos_ficha.carregar_dados;
begin
     dm.q_geral.sql.clear;
     dm.q_geral.sql.add(' select * ');
     dm.q_geral.sql.add(' from pratos ');
     dm.q_geral.sql.add(' where cod_prato = ' + QuotedStr(cod_prato) + ' ');
     dm.q_geral.open;

     if dm.q_geral.isempty then
     begin
          ShowMessage('prato não encontrado !');
          close;
          exit;
     end;

     edit_nome.Text:= dm.q_geral.fieldbyname('nome').AsString;
     edit_valor.Text:= dm.q_geral.fieldbyname('valor').AsString;
     edit_descricao_detalhada.lines.Text:= dm.q_geral.fieldbyname('descricao_detalhada').AsString;

end;

procedure Tf_pratos_ficha.FormClose(Sender: TObject; var Action: TCloseAction);
// OnClose do Formulário
begin
     Action:= caFree;
     f_pratos_ficha:= nil;
end;

end.
