unit u_ing_facil1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons;

type
  Tf_cad_ing_facil1 = class(TForm)
    q_ing: TFDQuery;
    DBGrid1: TDBGrid;
    q_ingcod_ingrediente: TFDAutoIncField;
    q_ingdescricao: TStringField;
    q_ingvalor_unitario: TFloatField;
    q_ingcod_unidade: TIntegerField;
    Label1: TLabel;
    edit_descricao: TDBEdit;
    ds_ing: TDataSource;
    Label2: TLabel;
    edit_valor_unitario: TDBEdit;
    Label3: TLabel;
    combo_cod_unidade: TDBLookupComboBox;
    q_unidades: TFDQuery;
    ds_unidades: TDataSource;
    b_fechar: TBitBtn;
    b_excluir: TBitBtn;
    b_alterar: TBitBtn;
    b_incluir: TBitBtn;
    b_gravar: TBitBtn;
    b_cancelar: TBitBtn;
    q_ingdescricao_unidade: TStringField;
    edit_pesquisa: TEdit;
    Label4: TLabel;
    procedure b_fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure b_incluirClick(Sender: TObject);
    procedure b_alterarClick(Sender: TObject);
    procedure b_excluirClick(Sender: TObject);
    procedure b_gravarClick(Sender: TObject);
    procedure b_cancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure q_ingAfterCancel(DataSet: TDataSet);
    procedure q_ingAfterDelete(DataSet: TDataSet);
    procedure q_ingAfterEdit(DataSet: TDataSet);
    procedure q_ingAfterInsert(DataSet: TDataSet);
    procedure q_ingAfterOpen(DataSet: TDataSet);
    procedure q_ingAfterPost(DataSet: TDataSet);
    procedure edit_pesquisaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure Controle_visual;
    procedure carregar_dados(s : string);

  end;

var
  f_cad_ing_facil1: Tf_cad_ing_facil1;

implementation

{$R *.dfm}

//------------------------------------------------------------------
procedure Tf_cad_ing_facil1.Controle_visual;
begin

     edit_descricao.Enabled:= q_ing.State in [dsEdit, dsInsert];
     edit_valor_unitario.Enabled:= edit_descricao.Enabled;
     combo_cod_unidade.Enabled:= edit_descricao.Enabled;

     b_gravar.Enabled:= edit_descricao.Enabled;
     b_cancelar.Enabled:= edit_descricao.Enabled;

     b_excluir.Enabled:= not edit_descricao.Enabled;
     b_alterar.Enabled:= not edit_descricao.Enabled;
     b_incluir.Enabled:= not edit_descricao.Enabled;

     b_fechar.Enabled:= not edit_descricao.Enabled;

     DBGrid1.Enabled:= not edit_descricao.Enabled;

     edit_pesquisa.enabled:= not edit_descricao.Enabled;


end;

procedure Tf_cad_ing_facil1.carregar_dados(s : string);
begin
     q_ing.sql.clear;
     q_ing.sql.add(' select * from ingredientes ');
     q_ing.sql.add(' where descricao like ' + QuotedStr('%'+s+'%') + ' ');
     q_ing.sql.add(' order by descricao ');
     q_ing.open;

end; // carregar_dados

procedure Tf_cad_ing_facil1.edit_pesquisaChange(Sender: TObject);
begin
     carregar_dados(edit_pesquisa.Text);
end;

// procedure Controle_visual;

procedure Tf_cad_ing_facil1.b_alterarClick(Sender: TObject);
begin
     q_ing.Edit;
end;

procedure Tf_cad_ing_facil1.b_cancelarClick(Sender: TObject);
begin
     q_ing.Cancel;
end;

procedure Tf_cad_ing_facil1.b_excluirClick(Sender: TObject);
begin
     // fazer validações

     // pedindo confirmação
     if MessageDlg('Deseja realmente excluir este registro !!!',mtConfirmation,[mbYes,mbNo],0) = mrNo then
     begin
          exit;
     end;

     q_ing.Delete;
end;

procedure Tf_cad_ing_facil1.b_fecharClick(Sender: TObject);
begin
     close;
end;

procedure Tf_cad_ing_facil1.b_gravarClick(Sender: TObject);
begin

     if edit_descricao.Text = '' then
     begin
          MessageDlg('A descrição deve ser informada !',mtError,[mbOk],0);
          exit;
     end;


     q_ing.Post;
end;

procedure Tf_cad_ing_facil1.b_incluirClick(Sender: TObject);
begin
     q_ing.Insert;
end;

procedure Tf_cad_ing_facil1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:= caFree;
     f_cad_ing_facil1:= nil;
end;

procedure Tf_cad_ing_facil1.FormCreate(Sender: TObject);
begin
     q_unidades.Open();
     q_ing.Open();
end;

procedure Tf_cad_ing_facil1.q_ingAfterCancel(DataSet: TDataSet);
begin
     Controle_visual;
end;

procedure Tf_cad_ing_facil1.q_ingAfterDelete(DataSet: TDataSet);
begin
     Controle_visual;
end;

procedure Tf_cad_ing_facil1.q_ingAfterEdit(DataSet: TDataSet);
begin
     Controle_visual;
end;

procedure Tf_cad_ing_facil1.q_ingAfterInsert(DataSet: TDataSet);
begin
     Controle_visual;
end;

procedure Tf_cad_ing_facil1.q_ingAfterOpen(DataSet: TDataSet);
begin
     Controle_visual;
end;

procedure Tf_cad_ing_facil1.q_ingAfterPost(DataSet: TDataSet);
begin
     Controle_visual;
end;

end.
