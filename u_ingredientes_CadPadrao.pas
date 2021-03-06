unit u_ingredientes_CadPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, u_cadastro_padrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TF_ingredientes_CadPadrao = class(Tf_CadPadrao)
    q_dadoscod_ingrediente: TFDAutoIncField;
    q_dadosdescricao: TStringField;
    q_dadosvalor_unitario: TFloatField;
    q_dadoscod_unidade: TIntegerField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    q_unidades: TFDQuery;
    ds_unidades: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    q_dadosUnidade: TStringField;
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
  F_ingredientes_CadPadrao: TF_ingredientes_CadPadrao;

implementation

{$R *.dfm}

uses u_dm;

procedure TF_ingredientes_CadPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  F_ingredientes_CadPadrao := nil;
end;


procedure TF_ingredientes_CadPadrao.FormCreate(Sender: TObject);
begin
  inherited;
  q_unidades.Open;
end;

procedure TF_ingredientes_CadPadrao.controle_visual;
begin

  inherited;
  DBEdit1.Enabled := b_gravar.Enabled;
  DBEdit2.Enabled := b_gravar.Enabled;
  DBLookupComboBox1.Enabled := b_gravar.Enabled;
end;

function TF_ingredientes_CadPadrao.validar;
begin

  if trim(DBEdit1.Text) = '' then
  begin
    ShowMessage('O campo Nome deve ser preenchido !');
    result := false;
    exit
  end;

  if trim(DBEdit2.Text) = '' then
  begin
    ShowMessage('O campo Valor deve ser preenchido !');
    result := false;
    exit
  end;

  if trim(DBLookupComboBox1.Text) = '' then
  begin
    ShowMessage('O campo Unidade deve ser preenchido !');
    result := false;
    exit
  end;


  result := true;
end;


function TF_ingredientes_CadPadrao.pode_excluir;
begin
  dm.q_geral.SQL.Clear;
  dm.q_geral.SQL.Add('select count(*) as total '+'');
  dm.q_geral.SQL.Add(' from itens_compra as I '+ '');
  dm.q_geral.SQL.Add(' where I.cod_ingrediente = '+QuotedStr(q_dados.FieldByName('cod_ingrediente').AsString) +'');
  dm.q_geral.Open;
  if dm.q_geral.FieldByName('total').AsInteger > 0 then
  begin
     result := 'N?o foi possivel excluir esse Ingrediente pois possui Items relacionados !';
     exit;
  end;

  dm.q_geral.SQL.Clear;
  dm.q_geral.SQL.Add('select count(*) as total '+'');
  dm.q_geral.SQL.Add(' from composicao as C '+ '');
  dm.q_geral.SQL.Add(' where C.cod_ingrediente = '+QuotedStr(q_dados.FieldByName('cod_ingrediente').AsString) +'');
  dm.q_geral.Open;

  if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
  begin
     result := 'N?o foi possivel excluir esse Ingrediente pois possui Composi??es relacionadas !';
     exit;
  end;

  result := '';

end;
end.
