unit u_fichacliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tf_fichacliente = class(TForm)
    b_gravar: TBitBtn;
    b_cancelar: TBitBtn;
    Panel1: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    edit_nome: TEdit;
    PageControl1: TPageControl;
    ts_documentos: TTabSheet;
    ts_contato: TTabSheet;
    edit_endereco: TEdit;
    Label2: TLabel;
    edit_cod_cidade: TEdit;
    Label3: TLabel;
    edit_nome_cidade: TEdit;
    b_pesquisa_cidade: TSpeedButton;
    Label4: TLabel;
    edit_bairro: TEdit;
    Label5: TLabel;
    edit_cep: TMaskEdit;
    edit_telefone: TEdit;
    Label6: TLabel;
    edit_celular: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edit_email: TEdit;
    TabSheet1: TTabSheet;
    Label9: TLabel;
    edit_rg: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    edit_data_nascimento: TMaskEdit;
    rad_sexo: TRadioGroup;
    GroupBox1: TGroupBox;
    ck_conheceu_por_jornais: TCheckBox;
    ck_conheceu_por_internet: TCheckBox;
    ck_conheceu_por_outro: TCheckBox;
    Label12: TLabel;
    edit_renda_familiar: TEdit;
    edit_cpf: TMaskEdit;
    procedure b_cancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure b_gravarClick(Sender: TObject);
    procedure edit_cod_cidadeChange(Sender: TObject);
    procedure b_pesquisa_cidadeClick(Sender: TObject);
    procedure edit_cod_cidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edit_emailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_data_nascimentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_nomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }

    cod_cliente : string;

    procedure carregar_campos;

  end;

var
  f_fichacliente: Tf_fichacliente;

implementation

{$R *.dfm}

uses u_dm, u_clientes, u_pesquisa, funcoes;

procedure Tf_fichacliente.carregar_campos;
var
   minha_query : TFDQuery;
begin
     minha_query:= TFDQuery.create(application);
     minha_query.Connection:= Dm.Q_Geral.Connection;
     minha_query.ConnectionName:= Dm.Q_Geral.ConnectionName;

     minha_query.SQL.Clear;
     minha_query.SQL.add(' select * from clientes where cod_cliente = ' + cod_cliente);
     minha_query.Open;

     edit_nome.Text               := minha_query.FieldByName('nome').AsString;
	   edit_cpf.text                := minha_query.FieldByName('cpf').AsString;
	   edit_rg.text                 := minha_query.FieldByName('rg').AsString;
	   edit_data_nascimento.text    := minha_query.FieldByName('data_nascimento').AsString;

     if minha_query.FieldByName('sexo').AsString  = 'M' then rad_sexo.ItemIndex:= 0;
     if minha_query.FieldByName('sexo').AsString  = 'F' then rad_sexo.ItemIndex:= 1;

	   edit_endereco.text           := minha_query.FieldByName('endereco').AsString;
	   edit_bairro.text             := minha_query.FieldByName('bairro').AsString;
	   edit_cod_cidade.text         := minha_query.FieldByName('cod_cidade').AsString;
	   edit_cep.text                := minha_query.FieldByName('cep').AsString;
	   edit_telefone.text           := minha_query.FieldByName('telefone').AsString;
	   edit_celular.text            := minha_query.FieldByName('celular').AsString;
	   edit_email.text              := minha_query.FieldByName('email').AsString;

	   ck_conheceu_por_jornais.Checked    := minha_query.FieldByName('conheceu_por_jornais').AsString  = '1';
	   ck_conheceu_por_internet.Checked   := minha_query.FieldByName('conheceu_por_internet').AsString = '1';
	   ck_conheceu_por_outro.Checked      := minha_query.FieldByName('conheceu_por_outro').AsString    = '1';

	   edit_renda_familiar.text     := minha_query.FieldByName('renda_familiar').AsString;

     minha_query.Free;
end;

procedure Tf_fichacliente.edit_cod_cidadeChange(Sender: TObject);
begin
     edit_nome_cidade.Text:= '';

     dm.q_geral.SQL.Clear;
     dm.q_geral.SQL.add(' select * from cidades where cod_cidade = ' + QuotedStr(edit_cod_cidade.Text));
     dm.q_geral.open;

     if not dm.q_geral.IsEmpty
      then edit_nome_cidade.Text:= dm.q_geral.FieldByName('nome').AsString + '-' +  dm.q_geral.FieldByName('uf').AsString;


end;

procedure Tf_fichacliente.edit_cod_cidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = vk_f4 then
     begin
          b_pesquisa_cidade.OnClick( b_pesquisa_cidade );
     end;
end;

procedure Tf_fichacliente.edit_data_nascimentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if key = 13 then
     begin
          PageControl1.TabIndex:= 1;
          edit_endereco.SetFocus;
     end;end;

procedure Tf_fichacliente.edit_emailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = 13 then
     begin
          PageControl1.TabIndex:= 2;
          ck_conheceu_por_jornais.SetFocus;
     end;
end;

procedure Tf_fichacliente.edit_nomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = 13 then
     begin
          PageControl1.TabIndex:= 0;
          rad_sexo.SetFocus;
     end;
end;

procedure Tf_fichacliente.b_gravarClick(Sender: TObject);
var
 	   conheceu_por_jornais,
	   conheceu_por_internet,
	   conheceu_por_outro,
     cod_cidade,
     sexo : string;

begin

     // fazendo as valida??es pr?vias
     if trim(edit_nome.Text) = '' then
     begin
          MessageDlg('O campo nome ? obrigat?rio !',mtError,[mbOk],0);
          edit_nome.SetFocus;
          exit;
     end;

     // fazendo as valida??es pr?vias
     if not valida_cpf(edit_cpf.Text) then
     begin
          pagecontrol1.TabIndex:= 0; // mudando a aba do pagecontrol
          MessageDlg('O CPF informado ? inv?lido !',mtError,[mbOk],0);
          edit_cpf.SetFocus;
          exit;
     end;

     if not is_date(edit_data_nascimento.Text) then
     begin
          pagecontrol1.TabIndex:= 0;
          MessageDlg('A data de nascimento ? inv?lida !',mtError,[mbOk],0);
          edit_data_nascimento.SetFocus;
          exit;
     end;

     if not is_real(edit_renda_familiar.Text) then
     begin
          pagecontrol1.TabIndex:= 2;
          MessageDlg('A renda familiar deve ser um n?mero v?lido  !',mtError,[mbOk],0);
          edit_renda_familiar.SetFocus;
          exit;
     end;

     if StrToFloat(edit_renda_familiar.Text) <= 500 then
     begin
          pagecontrol1.TabIndex:= 2;
          MessageDlg('A renda familiar deve ser superior a R$ 500,00 !',mtError,[mbOk],0);
          edit_renda_familiar.SetFocus;
          exit;
     end;

     if edit_nome_cidade.Text = '' then
     begin
          pagecontrol1.TabIndex:= 1;
          MessageDlg('A cidade deve ser informada!',mtError,[mbOk],0);
          edit_cod_cidade.SetFocus;
          exit;
     end;

 	   conheceu_por_jornais  := '';
	   conheceu_por_internet := '';
	   conheceu_por_outro    := '';
     cod_cidade            := '';
     sexo                  := '';

     if ck_conheceu_por_jornais.Checked then conheceu_por_jornais:= '1';
     if ck_conheceu_por_internet.Checked then conheceu_por_internet:= '1';
     if ck_conheceu_por_outro.Checked then conheceu_por_outro:= '1';

     if rad_sexo.ItemIndex = 0 then sexo:= 'M';
     if rad_sexo.ItemIndex = 1 then sexo:= 'F';


     if edit_nome_cidade.Text = ''
       then cod_cidade:= '0'
       else cod_cidade:= edit_cod_cidade.Text;

     // quando @cod_cliente = 0, ser? realizada uma inclus?o
	   if cod_cliente = '' then cod_cliente := '0';

     dm.q_geral.SQL.Clear;
     dm.q_geral.SQL.add(' sp_cadastrar_cliente ');
     dm.q_geral.SQL.add( QuotedStr(cod_cliente              )              + ', ');
	   dm.q_geral.SQL.add( QuotedStr(edit_nome.text           )              + ', ');
	   dm.q_geral.SQL.add( QuotedStr(edit_cpf.text            )              + ', ');
	   dm.q_geral.SQL.add( QuotedStr(edit_rg.text             )              + ', ');
	   dm.q_geral.SQL.add( QuotedStr(edit_data_nascimento.text)              + ', ');
	   dm.q_geral.SQL.add( QuotedStr(sexo                     )              + ', ');
	   dm.q_geral.SQL.add( QuotedStr(edit_endereco.text       )              + ', ');
	   dm.q_geral.SQL.add( QuotedStr(edit_bairro.text         )              + ', ');
	   dm.q_geral.SQL.add( QuotedStr(cod_cidade               )              + ', ');
	   dm.q_geral.SQL.add( QuotedStr(edit_cep.text            )              + ', ');
	   dm.q_geral.SQL.add( QuotedStr(edit_telefone.text       )              + ', ');
	   dm.q_geral.SQL.add( QuotedStr(edit_celular.text        )              + ', ');
	   dm.q_geral.SQL.add( QuotedStr(edit_email.text          )              + ', ');
	   dm.q_geral.SQL.add( QuotedStr(conheceu_por_jornais     )              + ', ');
	   dm.q_geral.SQL.add( QuotedStr(conheceu_por_internet    )              + ', ');
	   dm.q_geral.SQL.add( QuotedStr(conheceu_por_outro       )              + ', ');
	   dm.q_geral.SQL.add( QuotedStr(   RealUSA(edit_renda_familiar.text)  )  );

     // Executando com open porque h? mensagens de retorno
     dm.q_geral.Open;

     if dm.q_geral.FieldByName('retorno').AsInteger = 0 then
     begin
          MessageDlg(dm.q_geral.FieldByName('msg').AsString,mtError,[mbOk],0);
     end
     else begin
          f_clientes.mostrar_dados;
          close;
     end;



end;

procedure Tf_fichacliente.b_cancelarClick(Sender: TObject);
begin
     close;
end;

procedure Tf_fichacliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin

     Action:= caFree;
     F_fichacliente:= nil;

end;

procedure Tf_fichacliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
     begin
          // coloca o foco no pr?ximo componente
          Perform(WM_NEXTDLGCTL, 0, 0);
     end;
end;

procedure Tf_fichacliente.FormShow(Sender: TObject);
begin
     // fazendo com que a p?gina documentos apare?a
     PageControl1.TabIndex:= 0;

     edit_nome.SetFocus;
end;

procedure Tf_fichacliente.b_pesquisa_cidadeClick(Sender: TObject);
begin

     f_pesquisa:= Tf_pesquisa.create(application);

     f_pesquisa.tabela:= 'cidades';
     f_pesquisa.codigo:= 'cod_cidade';
     f_pesquisa.campo1:= 'nome';
     f_pesquisa.campo2:= 'uf';

     f_pesquisa.rotulo_codigo:= 'C?digo';
     f_pesquisa.rotulo_c1:= 'Nome da Cidade';
     f_pesquisa.rotulo_c2:= 'Unidade Federal';

     f_pesquisa.largura_codigo:= 0.10; // 10% da largura do dbgrid
     f_pesquisa.largura_c1:= 0.60;
     f_pesquisa.largura_c2:= 0.20;


     f_pesquisa.ShowModal;

     if f_pesquisa.ModalResult = mrOk then
     begin
          edit_cod_cidade.Text:= f_pesquisa.q_dados.fieldbyname(f_pesquisa.codigo).AsString;
     end;

     // retira o objeto da mem?ria
     f_pesquisa.Free;


end;

end.
