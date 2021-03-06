unit u_composicao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Db, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tf_composicao = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    l_prato: TLabel;
    Label8: TLabel;
    edit_cod_ingrediente: TEdit;
    b_ingrediente: TSpeedButton;
    edit_descricao_ingrediente: TEdit;
    Label2: TLabel;
    edit_qde: TEdit;
    b_incluir: TBitBtn;
    q_dados: TFDQuery;
    q_dadoscod_prato: TIntegerField;
    q_dadoscod_ingrediente: TIntegerField;
    q_dadosquantidade: TFloatField;
    q_dadosingrediente: TStringField;
    q_dadosunidade: TStringField;
    procedure edit_cod_ingredienteChange(Sender: TObject);
    procedure b_ingredienteClick(Sender: TObject);
    procedure edit_cod_ingredienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure b_incluirClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edit_qdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    cod_prato : string;
    procedure load_query;

  end;

var
  f_composicao: Tf_composicao;

implementation

uses u_dm, u_pesquisa, funcoes;

{$R *.DFM}

// onchange do cod_ingrediente -------------------------------------------------
procedure Tf_composicao.edit_cod_ingredienteChange(Sender: TObject);
begin
     dm.q_geral.sql.clear;
     dm.q_geral.sql.add(' select descricao ' +
                           ' from ingredientes ' +
                           ' where cod_ingrediente = ' + QuotedStr(edit_cod_ingrediente.text) );
     dm.q_geral.open;

     // se o ingrediente foi encontrado
     if not dm.q_geral.isempty then
     begin
          edit_descricao_ingrediente.text:= dm.q_geral.fieldbyname('descricao').AsString ;
     end
     else begin
          edit_descricao_ingrediente.text:= '';
     end;

end;

// onkeydown do cod_ingrediente ------------------------------------------------
procedure Tf_composicao.edit_cod_ingredienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     // se pressionou enter 
     if key = 13 then edit_qde.setfocus;

     // se pressionou F4
     if key = vk_f4 then
     begin
          b_ingrediente.OnClick(self);
     end;
end;

procedure Tf_composicao.b_ingredienteClick(Sender: TObject);
begin
  f_pesquisa:= TF_Pesquisa.create(application);

  f_pesquisa.tabela:= 'ingredientes';
  f_pesquisa.codigo:= 'cod_ingrediente';
  f_pesquisa.campo1:= 'descricao';
  f_pesquisa.campo2:= '';

  f_pesquisa.rotulo_codigo:= 'C?digo';
  f_pesquisa.rotulo_c1:= 'Ingrediente';
  f_pesquisa.rotulo_c2:= '';

  f_pesquisa.largura_codigo:= 0.10; // 10% da largura do dbgrid
  f_pesquisa.largura_c1:= 0.80;
  f_pesquisa.largura_c2:= 0.0;

  // se o usu?rio clicou no enter
  if f_pesquisa.ShowModal = mrOk then
  begin
    // se a pesquisa n?o estiver vazia
    if not f_pesquisa.q_dados.isempty then
    begin
      edit_cod_ingrediente.text:= f_pesquisa.q_dados.fieldbyname('cod_ingrediente').AsString;
    end;

  end; // if ok....

  f_pesquisa.free;
end;


procedure Tf_composicao.load_query;
begin
     q_dados.sql.clear;
     q_dados.sql.add(' select	c.*,                       ');
     q_dados.sql.add(' 		i.descricao as ingrediente,    ');
     q_dados.sql.add(' 		u.descricao as unidade         ');
     q_dados.sql.add('                                   ');
     q_dados.sql.add(' from	composicao c                 ');
     q_dados.sql.add(' 		inner join ingredientes i on (c.cod_ingrediente = i.cod_ingrediente) ');
     q_dados.sql.add(' 		left outer join unidades u on (i.cod_unidade = u.cod_unidade)        ');
     q_dados.sql.add(' where c.cod_prato = ' + QuotedStr(cod_prato) + '                        ');
     q_dados.sql.add(' order by ingrediente                                                    ');
     q_dados.open;

end;

procedure Tf_composicao.b_incluirClick(Sender: TObject);
begin
     if edit_descricao_ingrediente.text = '' then
     begin
          MessageDlg('O ingrediente deve ser selecionado !',mtWarning,[mbOk],0);
          exit;
     end;
     if not is_real(edit_qde.text) then
     begin
          MessageDlg('A quantidade deve ser um n?mero v?lido !',mtWarning,[mbOk],0);
          exit;
     end;       
     // verificando se n?o existe
     dm.q_geral.sql.clear;
     dm.q_geral.sql.add(' select count(*) as total from composicao ' +
                        ' where cod_ingrediente = ' + QuotedStr(edit_cod_ingrediente.text) + 
                        '       and cod_prato = ' + QuotedStr(cod_prato) + ' ');
     dm.q_geral.open;
     if dm.q_geral.fieldbyname('total').AsInteger = 0 then
     begin
          dm.q_geral.sql.clear;
          dm.q_geral.sql.add(' insert into composicao (cod_prato, cod_ingrediente, quantidade) ' +
                             ' values(' + QuotedStr(cod_prato)+',' +
                                          QuotedStr(edit_cod_ingrediente.text)+ ',' +
                                          RealUSA(edit_qde.text) +')');
          dm.q_geral.ExecSql;

          edit_cod_ingrediente.text:= '';
          edit_qde.text:= '';
          edit_cod_ingrediente.setfocus;
          load_query;
     end // se o ingrediente n?o estiver cadastrado
     else begin
          MessageDlg('Este ingrediente j? est? na composi??o !',mtWarning,[mbOk],0);
     end;
end;

procedure Tf_composicao.BitBtn4Click(Sender: TObject);
begin                                                                                              
     // verificando se h? informa??es na query
     if q_dados.isempty then
     begin
          MessageDlg('N?o h? um registro selecionado para excluir !',mtError,[mbOk],0);
          exit;
     end;

     if MessageDlg('Deseja realmente excluir o ingrediente ' +
                   q_dados.fieldbyname('ingrediente').AsString +
                   ' desta composi??o ??',
         mtConfirmation,[mbYes,mbNo],0) = mrYes then
     begin
          dm.q_geral.sql.clear;
          dm.q_geral.sql.add(' delete from composicao ');
          dm.q_geral.sql.add(' where ' +
                             ' cod_prato = ' + q_dados.fieldbyname('cod_prato').AsString + ' and ' +
                             ' cod_ingrediente = ' +q_dados.fieldbyname('cod_ingrediente').AsString);
          dm.q_geral.ExecSQL;

          load_query;
     end;                            
end;

procedure Tf_composicao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     action:= cafree;
     f_composicao:= nil;
end;

procedure Tf_composicao.edit_qdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     // se pressionou enter
     if key = 13 then
     begin
          b_incluir.onclick(self);
     end;
end;


procedure Tf_composicao.BitBtn1Click(Sender: TObject);
begin
     close;
end;

end.
