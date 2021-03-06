unit u_pratos_CadPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, u_cadastro_padrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TF_pratos_CadPadrao = class(Tf_CadPadrao)
    q_dadoscod_prato: TFDAutoIncField;
    q_dadosnome: TStringField;
    q_dadosdescricao_detalhada: TMemoField;
    q_dadosvalor: TFloatField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }

  protected
           procedure controle_visual; override;
           function pode_excluir : String; override;
           function validar : boolean; override;
  end;

var
  F_pratos_CadPadrao: TF_pratos_CadPadrao;

implementation

uses u_dm;
{$R *.dfm}

procedure TF_pratos_CadPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  F_pratos_CadPadrao := nil;
end;

procedure TF_pratos_CadPadrao.controle_visual;
begin
  inherited;
  DBEdit1.Enabled := b_gravar.Enabled;
  DBEdit2.Enabled := b_gravar.Enabled;
  DBMemo1.Enabled := b_gravar.Enabled;
end;


function TF_pratos_CadPadrao.validar;
begin
  if trim(DBEdit1.Text) = '' then
  begin
    ShowMessage('O campo Nome deve ser preenchido !');
    result := false;
    exit;
  end;

  if trim(DBEdit2.Text) = '' then
  begin
    ShowMessage('O campo Valor deve ser preenchido !');
    result := false;
    exit;
  end;

  if trim(DBMemo1.Text) = '' then
  begin
    ShowMessage('O campo Descri??o deve ser preenchido !');
    result := false;
    exit;
  end;
  result := true;
end;


function TF_pratos_CadPadrao.pode_excluir;
begin
  dm.q_geral.SQL.Clear;
  dm.q_geral.SQL.Add('select count(*) as total '+'');
  dm.q_geral.SQL.Add(' from composicao as C '+ '');
  dm.q_geral.SQL.Add(' where C.cod_prato = '+QuotedStr(q_dados.FieldByName('cod_prato').AsString) +'');
  dm.q_geral.Open;

  if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
  begin
     result := 'N?o foi possivel excluir esse Prato pois possui composi??o relacionada !';
     exit;
  end;

  result := '';
end;
end.
