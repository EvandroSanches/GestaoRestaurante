unit u_permissoes_CadPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, u_cadastro_padrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TF_Permissoes_CadPadrao = class(Tf_CadPadrao)
    q_dadoscod_usuario: TIntegerField;
    q_dadosmodulo: TStringField;
    q_dadosnivel: TSmallintField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBComboBox1: TDBComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function validar : boolean; override;
    procedure controle_visual; override;
    procedure carregar_dados(p:string); override;
  end;

var
  F_Permissoes_CadPadrao: TF_Permissoes_CadPadrao;

implementation

{$R *.dfm}

procedure TF_Permissoes_CadPadrao.controle_visual;
begin
  inherited;
  DBEdit1.Enabled := b_gravar.Enabled;
  DBCombobox1.Enabled := b_gravar.Enabled;
end;
procedure TF_Permissoes_CadPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  F_Permissoes_CadPadrao := nil;
end;

procedure TF_Permissoes_CadPadrao.carregar_dados(p: string);
begin
     q_dados.SQL.Clear;
     q_dados.SQL.Add(' select * ');
     q_dados.SQL.Add(' from ' + tabela + ' ');
     q_dados.SQL.Add(' inner join usuario_permissao on ('+campor_chave+' = usuario_permissao.cod_usuario)');
     q_dados.SQL.Add(' where ' + campo_pesquisa + ' like ' + QuotedStr('%'+p+'%') +' ');
     q_dados.SQL.Add(' order by '+campo_pesquisa+'');
     q_dados.open;
end;


function TF_Permissoes_CadPadrao.validar;
begin
  if trim(DBEdit1.Text) = '' then
  begin
    ShowMessage('O campo Nome deve ser preenchido !');
    result := false;
    exit
  end;

end;
end.
