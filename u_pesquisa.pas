unit u_pesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tf_pesquisa = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    b_ok: TBitBtn;
    b_cancelar: TBitBtn;
    edit_pesq: TEdit;
    q_dados: TFDQuery;
    ds_dados: TDataSource;
    procedure b_okClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edit_pesqChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }

    procedure mostrar_dados;

  public
    { Public declarations }
    tabela, codigo, campo1, campo2 : string;
    rotulo_codigo, rotulo_c1, rotulo_c2 : string;

    largura_codigo, largura_c1, largura_c2 : real;

  end;

var
  f_pesquisa: Tf_pesquisa;

implementation

{$R *.dfm}

procedure Tf_pesquisa.DBGrid1DblClick(Sender: TObject);
begin
     b_ok.OnClick(b_ok);
end;

procedure Tf_pesquisa.edit_pesqChange(Sender: TObject);
begin
     mostrar_dados;
end;

procedure Tf_pesquisa.FormShow(Sender: TObject);
begin
     DBGrid1.Columns.Clear;

     DBGrid1.Columns.Add;
     DBGrid1.Columns[0].FieldName:= codigo;
     DBGrid1.Columns[0].Title.Caption:= rotulo_codigo;
     DBGrid1.Columns[0].Width:= Trunc(largura_codigo * DBGrid1.Width);

     DBGrid1.Columns.Add;
     DBGrid1.Columns[1].FieldName:= campo1;
     DBGrid1.Columns[1].Title.Caption:= rotulo_c1;
     DBGrid1.Columns[1].Width:= Trunc(largura_c1 * DBGrid1.Width);

     if campo2 <> '' then
     begin
          DBGrid1.Columns.Add;
          DBGrid1.Columns[2].FieldName:= campo2;
          DBGrid1.Columns[2].Title.Caption:= rotulo_c2;
          DBGrid1.Columns[2].Width:= Trunc(largura_c2 * DBGrid1.Width);
     end;


     mostrar_dados;
end;

procedure Tf_pesquisa.mostrar_dados;
begin
     q_dados.SQL.Clear;
     q_dados.SQL.add(' select ');
     q_dados.SQL.add(codigo + ', ');
     q_dados.SQL.add(campo1 + '  ');

     if campo2 <> '' then
     begin
          q_dados.SQL.add(',' + campo2 );
     end;

     q_dados.sql.Add('from ' + tabela);
     q_dados.SQL.add('where ' + campo1 + ' like ' + QuotedStr('%'+edit_pesq.Text+'%') + ' ' );
     q_dados.sql.Add('order by ' + campo1 );

     q_dados.open;

end;

procedure Tf_pesquisa.b_okClick(Sender: TObject);
begin
     if q_dados.IsEmpty then
     begin
          ShowMessage('Não há um registro selecionado para aceitar !');
          exit;
     end;

     // fecha o formulário
     modalresult:= mrOk;

end;

end.
