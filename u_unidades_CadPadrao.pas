unit u_unidades_CadPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, u_cadastro_padrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TF_unidades_CadPadrao = class(Tf_CadPadrao)
    q_dadoscod_unidade: TFDAutoIncField;
    q_dadosdescricao: TStringField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  F_unidades_CadPadrao: TF_unidades_CadPadrao;

implementation

{$R *.dfm}

uses u_dm;

procedure TF_unidades_CadPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  F_unidades_CadPadrao := nil;
end;

procedure TF_unidades_CadPadrao.controle_visual;
begin
  inherited;
  DBEdit1.Enabled := b_gravar.Enabled;
end;


function TF_unidades_CadPadrao.validar;
begin
  if trim(DBEdit1.Text) = '' then
  begin
    ShowMessage('O campo Unidade deve ser preenchido !');
    result := false;
    exit;
  end;
  result := true
end;

function TF_unidades_CadPadrao.pode_excluir;
begin
  dm.q_geral.SQL.Clear;
  dm.q_geral.SQL.Add('select count(*) as total '+'');
  dm.q_geral.SQL.Add(' from ingredientes '+'');
  dm.q_geral.SQL.Add(' where cod_unidade = '+QuotedStr(q_dados.FieldByName('cod_unidade').AsString));
  dm.q_geral.Open;
  if dm.q_geral.FieldByName('total').AsInteger > 0 then
  begin
     result := 'N?o foi possivel excluir essa unidade pois possui ingredientes relacionados !';
     exit;
  end;
  result := '';

end;
end.
