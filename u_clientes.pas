unit u_clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids;

type
  Tf_clientes = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    b_incluir: TBitBtn;
    b_alterar: TBitBtn;
    b_excluir: TBitBtn;
    b_fechar: TBitBtn;
    edit_pesq: TEdit;
    ds_dados: TDataSource;
    q_dados: TFDQuery;
    procedure b_fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure b_excluirClick(Sender: TObject);
    procedure b_incluirClick(Sender: TObject);
    procedure b_alterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edit_pesqChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure mostrar_dados;
  end;

var
  f_clientes: Tf_clientes;

implementation

{$R *.dfm}

uses u_fichacliente, u_dm;

procedure Tf_clientes.mostrar_dados;
begin
     q_dados.SQL.Clear;
     q_dados.SQL.add(' select * ');
     q_dados.SQL.add(' from clientes ');
     q_dados.SQL.add(' where nome like ' + QuotedStr('%'+edit_pesq.Text+'%') + ' ');
     q_dados.SQL.add(' order by nome ');
     q_dados.open;
end; // mostrar_dados


procedure Tf_clientes.b_alterarClick(Sender: TObject);
begin
     if Assigned(f_fichacliente) then
     begin
          ShowMessage('A janela de edi??o j? est? em Execu??o !');
          f_fichacliente.Show;
          exit;
     end;

     if q_dados.IsEmpty then
     begin
          MessageDlg('N?o h? um registro para ser alterado !',mtError,[mbOk],0);
          exit;
     end;

     f_fichacliente:= TF_Fichacliente.create(application);
     f_fichacliente.cod_cliente:= q_dados.FieldByName('cod_cliente').AsString;
     f_fichacliente.carregar_campos;

end;

procedure Tf_clientes.b_excluirClick(Sender: TObject);
begin
     if q_dados.IsEmpty then
     begin
          MessageDlg('N?o h? um registro para ser Exclu?do !',mtError,[mbOk],0);
          exit;
     end;

     if MessageDlg('Deseja realmente excluir o registro selecionado ?',
        mtConfirmation,[mbYes,mbNo],0) = mrYes then
     begin
          dm.q_geral.sql.clear;
          dm.q_geral.sql.add(' delete from clientes where cod_cliente = :cod_cliente ');
          dm.q_geral.ParamByName('cod_cliente').AsString:= q_dados.FieldByName('cod_cliente').AsString;
          dm.q_geral.ExecSQL;

          edit_pesq.text:= '';
          mostrar_dados;

     end; // se confirmou a exclus?o

end;

procedure Tf_clientes.b_fecharClick(Sender: TObject);
begin
     close;
end;

procedure Tf_clientes.b_incluirClick(Sender: TObject);
begin
     if Assigned(f_fichacliente) then
     begin
          ShowMessage('A janela de edi??o j? est? em Execu??o !');
          f_fichacliente.Show;
          exit;
     end;

     f_fichacliente:= TF_Fichacliente.create(application);
     f_fichacliente.cod_cliente:= '';

end;

procedure Tf_clientes.edit_pesqChange(Sender: TObject);
begin
     mostrar_dados;
end;

procedure Tf_clientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:= caFree;
     f_clientes:= nil;
end;

procedure Tf_clientes.FormShow(Sender: TObject);
begin
     mostrar_dados;
end;

end.
