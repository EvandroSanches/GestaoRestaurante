unit u_cad_pratos_facil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.Mask,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tf_cad_pratos_facil = class(TForm)
    q_pratos: TFDQuery;
    ds_pratos: TDataSource;
    q_pratoscod_prato: TFDAutoIncField;
    q_pratosnome: TStringField;
    q_pratosdescricao_detalhada: TMemoField;
    q_pratosvalor: TFloatField;
    Label2: TLabel;
    edit_nome: TDBEdit;
    Label3: TLabel;
    edit_descricao: TDBMemo;
    Label4: TLabel;
    edit_valor: TDBEdit;
    DBGrid1: TDBGrid;
    edit_pesquisa: TEdit;
    Label1: TLabel;
    b_fechar: TBitBtn;
    b_excluir: TBitBtn;
    b_alterar: TBitBtn;
    b_incluir: TBitBtn;
    b_gravar: TBitBtn;
    b_cancelar: TBitBtn;
    procedure edit_pesquisaChange(Sender: TObject);
    procedure b_incluirClick(Sender: TObject);
    procedure b_alterarClick(Sender: TObject);
    procedure b_excluirClick(Sender: TObject);
    procedure b_gravarClick(Sender: TObject);
    procedure b_cancelarClick(Sender: TObject);
    procedure b_fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure q_pratosAfterCancel(DataSet: TDataSet);
    procedure q_pratosAfterEdit(DataSet: TDataSet);
    procedure q_pratosAfterDelete(DataSet: TDataSet);
    procedure q_pratosAfterInsert(DataSet: TDataSet);
    procedure q_pratosAfterOpen(DataSet: TDataSet);
    procedure q_pratosAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure carregar_dados(s : string);
    procedure controle_visual;
  end;

var
  f_cad_pratos_facil: Tf_cad_pratos_facil;

implementation

{$R *.dfm}

procedure Tf_cad_pratos_facil.controle_visual;
begin
     edit_nome.Enabled:= q_pratos.State in [dsEdit, dsInsert];
     edit_valor.Enabled:= edit_nome.Enabled;
     edit_descricao.Enabled:= edit_nome.Enabled;

     b_gravar.Enabled:= edit_nome.Enabled;
     b_cancelar.Enabled:= edit_nome.Enabled;

     b_excluir.Enabled:= not edit_nome.Enabled;
     b_alterar.Enabled:= not edit_nome.Enabled;
     b_incluir.Enabled:= not edit_nome.Enabled;

     b_fechar.Enabled:= not edit_nome.Enabled;

     DBGrid1.Enabled:= not edit_nome.Enabled;

     edit_pesquisa.enabled:= not edit_nome.Enabled;
end;


procedure Tf_cad_pratos_facil.edit_pesquisaChange(Sender: TObject);
begin
    carregar_dados(edit_pesquisa.Text);
end;

procedure Tf_cad_pratos_facil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:= caFree;
    f_cad_pratos_facil:= nil;
end;

procedure Tf_cad_pratos_facil.FormCreate(Sender: TObject);
begin
    q_pratos.Open();
end;

procedure Tf_cad_pratos_facil.q_pratosAfterCancel(DataSet: TDataSet);
begin
    controle_visual;
end;

procedure Tf_cad_pratos_facil.q_pratosAfterDelete(DataSet: TDataSet);
begin
    controle_visual;
end;

procedure Tf_cad_pratos_facil.q_pratosAfterEdit(DataSet: TDataSet);
begin
    controle_visual;
end;

procedure Tf_cad_pratos_facil.q_pratosAfterInsert(DataSet: TDataSet);
begin
    controle_visual;
end;

procedure Tf_cad_pratos_facil.q_pratosAfterOpen(DataSet: TDataSet);
begin
    controle_visual;
end;

procedure Tf_cad_pratos_facil.q_pratosAfterPost(DataSet: TDataSet);
begin
    controle_visual;
end;

procedure Tf_cad_pratos_facil.b_alterarClick(Sender: TObject);
begin
    q_pratos.Edit;
end;

procedure Tf_cad_pratos_facil.b_cancelarClick(Sender: TObject);
begin
    q_pratos.Cancel;
end;

procedure Tf_cad_pratos_facil.b_excluirClick(Sender: TObject);
begin

     if MessageDlg('Deseja realmente excluir este registro !!!',mtConfirmation,[mbYes,mbNo],0) = mrNo then
     begin
          exit;
     end;

    q_pratos.Delete;
end;

procedure Tf_cad_pratos_facil.b_fecharClick(Sender: TObject);
begin
    close;
end;

procedure Tf_cad_pratos_facil.b_gravarClick(Sender: TObject);
begin

    if edit_nome.Text = '' then
     begin
          MessageDlg('O nome deve ser informado !',mtError,[mbOk],0);
          exit;
     end;

    q_pratos.Post;
end;

procedure Tf_cad_pratos_facil.b_incluirClick(Sender: TObject);
begin
    q_pratos.Insert;
end;

procedure Tf_cad_pratos_facil.carregar_dados(s: string);
begin
     q_pratos.sql.clear;
     q_pratos.sql.add(' select * from pratos ');
     q_pratos.sql.add(' where nome like ' + QuotedStr('%'+s+'%') + ' ');
     q_pratos.sql.add(' order by nome ');
     q_pratos.open;

end;
end.
