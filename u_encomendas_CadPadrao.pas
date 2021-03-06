unit u_encomendas_CadPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, u_cadastro_padrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.DBCtrls, Vcl.Mask, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TF_encomendas_CadPadrao = class(Tf_CadPadrao)
    q_dadosnum_encomenda: TFDAutoIncField;
    q_dadoscod_cliente: TIntegerField;
    q_dadosdata: TSQLTimeStampField;
    q_dadosvalor_total: TFloatField;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    ds_clientes: TDataSource;
    q_clientes: TFDQuery;
    q_dados_clientes: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function validar : boolean; override;
    function pode_excluir : String; override;
    procedure controle_visual; override;
  end;

var
  F_encomendas_CadPadrao: TF_encomendas_CadPadrao;

implementation

uses funcoes, u_dm;

{$R *.dfm}

procedure TF_encomendas_CadPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  F_encomendas_CadPadrao := nil;
end;

procedure TF_encomendas_CadPadrao.FormCreate(Sender: TObject);
begin
  inherited;
  q_clientes.Open();
end;

procedure TF_encomendas_CadPadrao.controle_visual;
begin
  inherited;
  DBEdit2.Enabled := b_gravar.Enabled;
  DBEdit3.Enabled := b_gravar.Enabled;
  DBLookupComboBox1.Enabled := b_gravar.Enabled;

end;


function TF_encomendas_CadPadrao.validar;
var data : string;
begin

     data := DBEdit2.Text;
  if trim(DBEdit2.Text) = '' then
  begin
    ShowMessage('O campo Cliente deve ser preenchido !');
    result := false;
    exit
  end;

  if not is_date(data) then
  begin

    ShowMessage('O campo Data deve ser uma data valida !');
    result := false;
    exit
  end;

  if trim(DBEdit3.Text) = '' then
  begin
    ShowMessage('O campo Valor Total deve ser preenchido !');
    result := false;
    exit
  end;

  if trim(DBLookupComboBox1.Text) = '' then
  begin
    ShowMessage('O campo Cliente deve ser preenchido !');
    result := false;
    exit
  end;

  result := true;
end;

function TF_encomendas_CadPadrao.pode_excluir;
begin
  dm.q_geral.SQL.Clear;
  dm.q_geral.SQL.Add('select count(*) as total '+'');
  dm.q_geral.SQL.Add(' from itens_encomenda as I '+ '');
  dm.q_geral.SQL.Add(' where I.num_encomenda = '+QuotedStr(q_dados.FieldByName('num_encomenda').AsString) +'');
  dm.q_geral.Open;

  if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
  begin
     result := 'N?o foi possivel excluir essa Encomenda pois possui Itens relacionados !';
     exit;
  end;


  result := '';

end;

end.
