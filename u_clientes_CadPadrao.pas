unit u_clientes_CadPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, u_cadastro_padrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ComCtrls;

type
  TF_clientes_CadPadrao = class(Tf_CadPadrao)
    PageControl1: TPageControl;
    q_dadoscod_cliente: TFDAutoIncField;
    q_dadosnome: TStringField;
    q_dadoscpf: TStringField;
    q_dadosrg: TStringField;
    q_dadosdata_nascimento: TSQLTimeStampField;
    q_dadossexo: TStringField;
    q_dadosendereco: TStringField;
    q_dadosbairro: TStringField;
    q_dadoscod_cidade: TIntegerField;
    q_dadoscep: TStringField;
    q_dadostelefone: TStringField;
    q_dadoscelular: TStringField;
    q_dadosemail: TStringField;
    q_dadosconheceu_por_jornais: TStringField;
    q_dadosconheceu_por_internet: TStringField;
    q_dadosconheceu_por_outro: TStringField;
    q_dadosrenda_familiar: TFloatField;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    TabSheet2: TTabSheet;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    q_cidades: TFDQuery;
    ds_cidades: TDataSource;
    TabSheet3: TTabSheet;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    Label13: TLabel;
    DBEdit10: TDBEdit;
    TabSheet4: TTabSheet;
    Label14: TLabel;
    DBEdit11: TDBEdit;
    q_dadosCidade: TStringField;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  protected
           procedure controle_visual; override;
           function pode_excluir : string; override;
           function validar : boolean; override;
  end;

var
  F_clientes_CadPadrao: TF_clientes_CadPadrao;

implementation
 uses u_dm, funcoes;

{$R *.dfm}

procedure TF_clientes_CadPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  F_clientes_CadPadrao := nil;
end;


procedure TF_clientes_CadPadrao.FormCreate(Sender: TObject);
begin
  inherited;
  q_cidades.Open();
end;

procedure TF_clientes_CadPadrao.controle_visual;
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
  DBEdit11.Enabled := b_gravar.Enabled;
  DBRadioGroup1.Enabled := b_gravar.Enabled;
  DBCheckBox1.Enabled := b_gravar.Enabled;
  DBCheckBox2.Enabled := b_gravar.Enabled;
  DBCheckBox3.Enabled := b_gravar.Enabled;

end;

function TF_clientes_CadPadrao.validar;
begin
  if trim(DBEdit1.Text) = '' then
  begin
    ShowMessage('O campo Nome deve ser preenchido !');
    result := false;
    exit
  end;

  if trim(DBEdit2.Text) = '' then
  begin
    ShowMessage('O campo CPF deve ser preenchido !');
    result := false;
    exit;
  end;

  if trim(DBRadioGroup1.Value) = '' then
  begin
    ShowMessage('O campo Sexo deve ser preenchido !');
    result := false;
    exit;
  end;
  result := true;


end;

function TF_clientes_CadPadrao.pode_excluir;
begin
  dm.q_geral.SQL.Clear;
  dm.q_geral.SQL.Add('select count(*) as total '+'');
  dm.q_geral.SQL.Add(' from encomendas as E '+ '');
  dm.q_geral.SQL.Add(' where E.cod_cliente = '+QuotedStr(q_dados.FieldByName('cliente').AsString) +'');
  dm.q_geral.Open;

  if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
  begin
     result := 'N?o foi possivel excluir esse Cliente pois possui Encomendas relacionadas !';
     exit;
  end;

  result := '';
end;
end.
