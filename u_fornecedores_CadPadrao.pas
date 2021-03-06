unit u_fornecedores_CadPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, u_cadastro_padrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Mask;

type
  TF_fornecedores_CadPadrao = class(Tf_CadPadrao)
    q_dadoscod_fornecedor: TFDAutoIncField;
    q_dadosrazao_social: TStringField;
    q_dadosnome_fantasia: TStringField;
    q_dadoscnpj: TStringField;
    q_dadosinscricao_estadual: TStringField;
    q_dadosendereco: TStringField;
    q_dadosbairro: TStringField;
    q_dadoscod_cidade: TIntegerField;
    q_dadoscep: TStringField;
    q_dadostelefone: TStringField;
    q_dadoscelular: TStringField;
    q_dadosemail: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label12: TLabel;
    q_cidades: TFDQuery;
    ds_cidades: TDataSource;
    q_dadosCidade: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  protected
           procedure controle_visual; override;
           function validar : boolean; override;
           function pode_excluir : String; override;

  end;

var
  F_fornecedores_CadPadrao: TF_fornecedores_CadPadrao;

implementation

uses u_dm, funcoes;
{$R *.dfm}

procedure TF_fornecedores_CadPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  F_fornecedores_CadPadrao := nil;
end;

procedure TF_fornecedores_CadPadrao.FormCreate(Sender: TObject);
begin
  inherited;
  q_cidades.Open();
end;


procedure TF_fornecedores_CadPadrao.controle_visual;
begin
  inherited;
  DBEdit1.Enabled := b_gravar.Enabled;
  DBEdit2.Enabled := b_gravar.Enabled;
  DBEdit3.Enabled := b_gravar.Enabled;
  DBEdit4.Enabled := b_gravar.Enabled;
  DBEdit5.Enabled := b_gravar.Enabled;
  DBEdit6.Enabled := b_gravar.Enabled;
  DBEdit7.Enabled := b_gravar.Enabled;
  DBEdit8.Enabled := b_gravar.Enabled;
  DBEdit9.Enabled := b_gravar.Enabled;
  DBEdit10.Enabled := b_gravar.Enabled;
  DBLookupComboBox1.Enabled := b_gravar.Enabled;
end;


function TF_fornecedores_CadPadrao.validar;
begin
     if trim(DBEdit1.Text) = '' then
  begin
    ShowMessage('O campo Raz?o Social deve ser preenchido !');
    result := false;
    exit
  end;

  if trim(DBEdit2.Text) = '' then
  begin
    ShowMessage('O campo Nome Fantasia deve ser preenchido !');
    result := false;
    exit;
  end;

  if trim(DBEdit3.Text) = '' then
  begin
    ShowMessage('O campo CNPJ deve ser preenchido !');
    result := false;
    exit
  end;

  result := true;
end;


function TF_fornecedores_CadPadrao.pode_excluir;
begin
  dm.q_geral.SQL.Clear;
  dm.q_geral.SQL.Add('select count(*) as total '+'');
  dm.q_geral.SQL.Add(' from compras as C '+ '');
  dm.q_geral.SQL.Add(' where C.cod_fornecedor = '+QuotedStr(q_dados.FieldByName('cod_fornecedor').AsString) +'');
  dm.q_geral.Open;

  if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
  begin
     result := 'N?o foi possivel excluir esse Fornecedor pois possui Compras relacionadas !';
     exit;
  end;

  result := '';
end;

end.
