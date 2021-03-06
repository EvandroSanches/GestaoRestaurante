unit u_compras_CadPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, u_cadastro_padrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Mask, Vcl.DBCtrls, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TF_compras_CadPadrao = class(Tf_CadPadrao)
    q_dadoscod_compra: TFDAutoIncField;
    q_dadosnota_fiscal: TIntegerField;
    q_dadosdata: TSQLTimeStampField;
    q_dadoscod_fornecedor: TIntegerField;
    q_dadosvalor_total: TFloatField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    q_fornecedor: TFDQuery;
    ds_fornecedor: TDataSource;
    q_dadosFornecedor: TStringField;
    b_relatorio: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure b_relatorioClick(Sender: TObject);
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
  F_compras_CadPadrao: TF_compras_CadPadrao;

implementation

{$R *.dfm}

uses u_dm, funcoes;



procedure TF_compras_CadPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  F_compras_CadPadrao := nil;
end;


procedure TF_compras_CadPadrao.FormCreate(Sender: TObject);
begin
  inherited;
  q_fornecedor.Open;

end;

procedure TF_compras_CadPadrao.b_relatorioClick(Sender: TObject);
begin

  if q_dados.IsEmpty then
  begin
    ShowMessage('N?o h? um registro selecionado para imprimir !');
    exit;
  end;

  //R_compras := TR_compras.Create(application);
  //R_compras.cod_compra := q_dados.FieldByName('cod_compra').AsString;
  //R_compras.QRP.Preview;
  //R_compras.free;
end;

procedure TF_compras_CadPadrao.controle_visual;
begin
  inherited;
  DBEdit1.Enabled := b_gravar.Enabled;
  DBEdit2.Enabled := b_gravar.Enabled;
  DBEdit4.Enabled := b_gravar.Enabled;
  DBLookupComboBox1.Enabled := b_gravar.Enabled;
end;


function TF_compras_CadPadrao.validar;
begin
  if trim(DBEdit1.Text) = '' then
  begin
    ShowMessage('O campo Nota Fiscal deve ser preenchido !');
    result := false;
    exit
  end;

  if trim(DBEdit2.Text) = '' then
  begin
    ShowMessage('O campo Data deve ser preenchido !');
    result := false;
    exit
  end;

  if not is_date (DBEdit2.Text) then
  begin
    ShowMessage('O campo Data deve ser uma data valida !');
    result := false;
    exit
  end;

  if trim(DBEdit4.Text) = '' then
  begin
    ShowMessage('O campo Valor Total deve ser preenchido !');
    result := false;
    exit
  end;

  if trim(DBLookupComboBox1.Text) = '' then
  begin
    ShowMessage('O campo Fornecedor deve ser preenchido !');
    result := false;
    exit
  end;

  result := true;
end;


function TF_compras_CadPadrao.pode_excluir;
begin


  dm.q_geral.SQL.Clear;
  dm.q_geral.SQL.Add('select count(*) as total '+'');
  dm.q_geral.SQL.Add(' from itens_compra as C '+ '');
  dm.q_geral.SQL.Add(' where C.cod_compra = '+QuotedStr(q_dados.FieldByName('cod_compra').AsString) +'');
  dm.q_geral.Open;

  if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
  begin
     result := 'N?o foi possivel excluir essa Compra pois possui Itens relacionados !';
     exit;
  end;

  result := '';
end;

end.
