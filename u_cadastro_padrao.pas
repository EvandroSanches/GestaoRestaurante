unit u_cadastro_padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  Tf_CadPadrao = class(TForm)
    Bevel1: TBevel;
    b_gravar: TButton;
    b_excluir: TButton;
    b_alterar: TButton;
    b_cancelar: TButton;
    b_incluir: TButton;
    b_fechar: TButton;
    Grid_dados: TDBGrid;
    Bevel2: TBevel;
    edit_pesquisa: TEdit;
    Label1: TLabel;
    q_dados: TFDQuery;
    ds_dados: TDataSource;
    procedure edit_pesquisaChange(Sender: TObject);
    procedure q_dadosAfterCancel(DataSet: TDataSet);
    procedure q_dadosAfterClose(DataSet: TDataSet);
    procedure q_dadosAfterDelete(DataSet: TDataSet);
    procedure q_dadosAfterEdit(DataSet: TDataSet);
    procedure q_dadosAfterInsert(DataSet: TDataSet);
    procedure q_dadosAfterOpen(DataSet: TDataSet);
    procedure q_dadosAfterPost(DataSet: TDataSet);
    procedure b_incluirClick(Sender: TObject);
    procedure b_alterarClick(Sender: TObject);
    procedure b_excluirClick(Sender: TObject);
    procedure b_fecharClick(Sender: TObject);
    procedure b_gravarClick(Sender: TObject);
    procedure b_cancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  protected
    { Protected declarations}
    procedure controle_visual; virtual;
    function pode_excluir: String; virtual;
    function validar: boolean; virtual;
  private
    { Private declarations }

  public
    { Public declarations }
    tabela, campor_chave, campo_pesquisa : string;

    procedure carregar_dados(p:string); virtual;
  end;

var
  f_CadPadrao: Tf_CadPadrao;

implementation

uses funcoes,u_dm;

{$R *.dfm}

procedure TF_CadPadrao.controle_visual;
begin
     b_gravar.Enabled := q_dados.State in [dsEdit, dsInsert];
     b_cancelar.Enabled := b_gravar.Enabled;
     grid_Dados.Enabled := not b_gravar.Enabled;
     b_incluir.Enabled := not b_gravar.Enabled;
     b_alterar.Enabled := not b_gravar.Enabled;
     b_excluir.Enabled := not b_gravar.Enabled;
     edit_pesquisa.Enabled := not b_gravar.Enabled;
     if edit_pesquisa.Enabled then
     begin
          edit_pesquisa.Color := clWhite;
     end
     else
     begin
          edit_pesquisa.Color := clSilver;
     end;
end;

procedure Tf_CadPadrao.edit_pesquisaChange(Sender: TObject);
begin
     carregar_dados(edit_pesquisa.Text);
end;

procedure Tf_CadPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:= caFree;
end;

procedure Tf_CadPadrao.b_alterarClick(Sender: TObject);
begin
     if dm.usuario.nivel = 0 then
     begin
          ShowMessage('Voc? n?o possui permiss?o a este modulo!!!');
          exit;
     end;
     if q_dados.IsEmpty then
     begin
       ShowMessage('N?o h? registro selecionado para alterar !!!');
       exit
     end;

     q_dados.Edit;
end;

procedure Tf_CadPadrao.b_cancelarClick(Sender: TObject);
begin
     q_dados.Cancel;
end;

procedure Tf_CadPadrao.b_excluirClick(Sender: TObject);
var
   erro : string;
begin
     if dm.usuario.nivel = 0 then
     begin
          ShowMessage('Voc? n?o possui permiss?o a este modulo!!!');
          exit;
     end;
     if q_dados.IsEmpty then
     begin
       ShowMessage('N?o h? registro selecionado para excluir !!');
       exit
     end;
     erro := pode_excluir;

     if erro = '' then
     begin
        if MessageDlg('Deseja realmente excluir esse registro?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
        begin
          q_dados.Delete;
          carregar_dados('');
        end;
     end
     else
     begin
       ShowMessage( erro );
     end;
end;

procedure Tf_CadPadrao.b_fecharClick(Sender: TObject);
begin
     close;
end;

procedure Tf_CadPadrao.b_gravarClick(Sender: TObject);
begin
     if validar then
     begin
       q_dados.Post;
     end;

end;

procedure Tf_CadPadrao.b_incluirClick(Sender: TObject);
begin



     if dm.usuario.nivel = 0 then
     begin
          ShowMessage('Voc? n?o possui permiss?o a este modulo!!!');
          exit;
     end;
     q_dados.Insert;
end;

procedure TF_CadPadrao.carregar_dados(p: string);
begin
     q_dados.SQL.Clear;
     q_dados.SQL.Add(' select * ');
     q_dados.SQL.Add(' from ' + tabela + ' ');
     q_dados.SQL.Add(' where ' + campo_pesquisa + ' like ' + QuotedStr('%'+p+'%') +' ');
     q_dados.SQL.Add(' order by '+campo_pesquisa+'');
     q_dados.open;
end;

function TF_CadPadrao.pode_excluir;
begin
    result := '';
end;


procedure Tf_CadPadrao.q_dadosAfterCancel(DataSet: TDataSet);
begin
     controle_visual;
end;

procedure Tf_CadPadrao.q_dadosAfterClose(DataSet: TDataSet);
begin
     controle_visual;
end;

procedure Tf_CadPadrao.q_dadosAfterDelete(DataSet: TDataSet);
begin
     controle_visual;
end;

procedure Tf_CadPadrao.q_dadosAfterEdit(DataSet: TDataSet);
begin
     controle_visual;
end;

procedure Tf_CadPadrao.q_dadosAfterInsert(DataSet: TDataSet);
begin
     controle_visual;
end;

procedure Tf_CadPadrao.q_dadosAfterOpen(DataSet: TDataSet);
begin
     controle_visual;
end;

procedure Tf_CadPadrao.q_dadosAfterPost(DataSet: TDataSet);
begin
     controle_visual;
end;

function TF_CadPadrao.validar;
begin
    result := true;
end;
end.
