unit u_ingredientes_ficha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask;

type
  Tf_ingredientes_ficha = class(TForm)
    b_gravar: TBitBtn;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    edit_descricao: TEdit;
    edit_valor_unitario: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    combo_cod_unidade: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure b_gravarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    unidades_codigos : TStringList;

  public
    { Public declarations }

    cod_ingrediente : string;

    procedure carregar_dados;

  end;

var
  f_ingredientes_ficha: Tf_ingredientes_ficha;

implementation

{$R *.dfm}

uses u_dm, u_ingredientes, funcoes;

procedure Tf_ingredientes_ficha.BitBtn1Click(Sender: TObject);
begin
     close;
end;

procedure Tf_ingredientes_ficha.b_gravarClick(Sender: TObject);
// OnClick do bot?o gravar
begin
     if trim(edit_descricao.Text) = '' then
     begin
          ShowMessage('O campo descri??o deve ser preenchido !');
          exit;
     end;

     if not is_Real(edit_valor_unitario.Text)  then
     begin
          ShowMessage('O campo Valor deve ser preenchido com um valor v?lido !');
          exit;
     end;

     if combo_cod_unidade.ItemIndex = -1 then
     begin
          ShowMessage('O campo unidade deve ser preenchido !');
          exit;
     end;


     if cod_ingrediente = '' then
     begin
          dm.q_geral.sql.clear;
          dm.q_geral.sql.add('insert into ingredientes (descricao, valor_unitario, cod_unidade) values (:descricao, :valor_unitario, :cod_unidade) ');
     end
     else begin
          dm.q_geral.sql.clear;
          dm.q_geral.sql.add(' update ingredientes set ');
          dm.q_geral.sql.add('   descricao = :descricao, ');
          dm.q_geral.sql.add('   valor_unitario = :valor_unitario, ');
          dm.q_geral.sql.add('   cod_unidade = :cod_unidade ');
          dm.q_geral.sql.add(' where cod_ingrediente = :cod_ingrediente ');

          dm.q_geral.ParamByName('cod_ingrediente').AsString:= cod_ingrediente;

     end;

     dm.q_geral.ParamByName('descricao').AsString:= trim(edit_descricao.Text);
     dm.q_geral.ParamByName('valor_unitario').AsString:= RealUSA(trim(edit_valor_unitario.Text));
     dm.q_geral.ParamByName('cod_unidade').AsString:= unidades_codigos[combo_cod_unidade.ItemIndex];

     dm.q_geral.ExecSql;
     f_ingredientes.carregar_query('');
     close;



end;

procedure Tf_ingredientes_ficha.carregar_dados;
var
   i : integer;
begin
     dm.q_geral.sql.clear;
     dm.q_geral.sql.add(' select * ');
     dm.q_geral.sql.add(' from ingredientes ');
     dm.q_geral.sql.add(' where cod_ingrediente = ' + QuotedStr(cod_ingrediente) + ' ');
     dm.q_geral.open;

     if dm.q_geral.isempty then
     begin
          ShowMessage('ingrediente n?o encontrado !');
          close;
          exit;
     end;

     edit_descricao.Text:= dm.q_geral.fieldbyname('descricao').AsString;
     edit_valor_unitario.Text:= dm.q_geral.fieldbyname('valor_unitario').AsString;

     combo_cod_unidade.ItemIndex:= -1;
     for i:= 0 to unidades_codigos.Count-1 do
     begin
          if unidades_codigos[i] = dm.Q_Geral.FieldByName('cod_unidade').AsString then
          begin
               combo_cod_unidade.ItemIndex:= i;
          end;
     end;


end;

procedure Tf_ingredientes_ficha.FormClose(Sender: TObject; var Action: TCloseAction);
// OnClose do Formul?rio
begin
     Action:= caFree;
     f_ingredientes_ficha:= nil;
end;

procedure Tf_ingredientes_ficha.FormCreate(Sender: TObject);
begin
     unidades_codigos := TStringList.Create;

     unidades_codigos.Clear;


     combo_cod_unidade.Items.Clear;

     dm.Q_Geral.SQL.Clear;
     dm.Q_Geral.SQL.add(' select * from unidades order by descricao ');
     dm.Q_Geral.open;
     while not dm.Q_Geral.eof do
     begin
          unidades_codigos.Add(dm.Q_Geral.FieldByName('cod_unidade').AsString);
          combo_cod_unidade.Items.Add(dm.Q_Geral.FieldByName('descricao').AsString);
          dm.Q_Geral.next;
     end;

end;

end.
