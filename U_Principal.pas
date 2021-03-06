unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TF_Principal = class(TForm)
    MainMenu1: TMainMenu;
    StatusBar1: TStatusBar;
    Cadastros1: TMenuItem;
    Cidades1: TMenuItem;
    Clientes1: TMenuItem;
    Pratos1: TMenuItem;
    UnidadesdeMedida1: TMenuItem;
    Ingredientes1: TMenuItem;
    Fornecedores1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Movimentao1: TMenuItem;
    Compras1: TMenuItem;
    Encomendas1: TMenuItem;
    Relatrios1: TMenuItem;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    Timer1: TTimer;
    CadastrosFaceis1: TMenuItem;
    Ingredientes2: TMenuItem;
    Pratos2: TMenuItem;
    CadastrosHerdados1: TMenuItem;
    Cidades2: TMenuItem;
    Unidades1: TMenuItem;
    Ingredientes3: TMenuItem;
    Compras2: TMenuItem;
    Encomendas2: TMenuItem;
    Pratos3: TMenuItem;
    Fornecedores2: TMenuItem;
    Clientes2: TMenuItem;
    Cidades3: TMenuItem;
    Composio1: TMenuItem;
    Compras3: TMenuItem;
    RelatriosRaiz1: TMenuItem;
    abuada1: TMenuItem;
    QuickReport1: TMenuItem;
    FastReport1: TMenuItem;
    Cidades4: TMenuItem;
    Unidades2: TMenuItem;
    Ingredientes4: TMenuItem;
    Pratos4: TMenuItem;
    Clientes3: TMenuItem;
    Usurios1: TMenuItem;
    Usurios2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Pratos1Click(Sender: TObject);
    procedure Ingredientes1Click(Sender: TObject);
    procedure Ingredientes2Click(Sender: TObject);
    procedure Pratos2Click(Sender: TObject);
    procedure Cidades2Click(Sender: TObject);
    procedure Unidades1Click(Sender: TObject);
    procedure Ingredientes3Click(Sender: TObject);
    procedure Compras2Click(Sender: TObject);
    procedure Encomendas2Click(Sender: TObject);
    procedure Pratos3Click(Sender: TObject);
    procedure Fornecedores2Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure Cidades3Click(Sender: TObject);
    procedure Composio1Click(Sender: TObject);
    procedure Compras3Click(Sender: TObject);
    procedure abuada1Click(Sender: TObject);
    procedure Cidades4Click(Sender: TObject);
    procedure Unidades2Click(Sender: TObject);
    procedure Ingredientes4Click(Sender: TObject);
    procedure Pratos4Click(Sender: TObject);
    procedure Clientes3Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure Usurios2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Principal: TF_Principal;


implementation

{$R *.dfm}

uses  u_clientes, U_pratos, u_ingredientes, u_ing_facil1,
  u_cad_pratos_facil, u_unidades_CadPadrao
  ,u_ingredientes_CadPadrao, u_compras_CadPadrao, u_encomendas_CadPadrao,
  u_pratos_CadPadrao, u_fornecedores_CadPadrao, u_clientes_CadPadrao,
   funcoes, u_dm_fastreport, u_usuarios_CadPadrao;



procedure TF_Principal.abuada1Click(Sender: TObject);
var
  sn : string;
begin

  while InputQuery('Tabuada','Qual tabuada deseja gerar?', sn) do
  begin
    if is_Inteiro(sn) then
    begin
      r_tabuada := TR_tabuada.create(application);
      r_tabuada.n := StrToInt(sn);
      r_tabuada.qrp.Preview;
      r_tabuada.qrp.Free;
      break;
    end
    else
    begin
      MessageDlg( 'Digite um numero valido!!', mtError,[mbOk],0);
    end;
  end;


end;

procedure TF_Principal.Cidades1Click(Sender: TObject);
begin
     // se o formul?rio n?o estiver instanciado
     if not Assigned(F_cidades) then
     begin
          // instanciando o formul?rio
          F_cidades:= TF_Cidades.create(application);
     end
     else begin
          F_cidades.Show;
     end;
end;

// OnCreate do Formul?rio F_principal
procedure TF_Principal.Cidades2Click(Sender: TObject);
begin
     if not funcoes.Busca_Permissao('cidades') then
     begin
        ShowMessage('N?o possui permiss?o para acessar este modulo');
        exit;

     end;
     // se o formul?rio n?o estiver instanciado
     if not Assigned(F_cidade_CadPadrao) then
     begin
          // instanciando o formul?rio
          F_cidade_CadPadrao:= TF_cidade_CadPadrao.create(application);
          F_cidade_CadPadrao.tabela := 'cidades';
          F_cidade_CadPadrao.campor_chave := 'cod_cidade';
          F_cidade_CadPadrao.campo_pesquisa := 'nome';

          F_cidade_CadPadrao.carregar_dados('');
     end
     else begin
          F_cidade_CadPadrao.Show;
     end;
end;

procedure TF_Principal.Cidades3Click(Sender: TObject);
begin
  R_cidades := TR_cidades.Create(application);
  R_cidades.QRP.Preview;
  R_cidades.free;
end;

procedure TF_Principal.Cidades4Click(Sender: TObject);
begin
  dm_fastreport.q_cidades.open();
  dm_fastreport.fastreport_cidades.PrepareReport();
  dm_fastreport.fastreport_cidades.ShowPreparedReport;
  dm_fastreport.q_cidades.close;
end;

procedure TF_Principal.Clientes1Click(Sender: TObject);
begin
     // se o formul?rio n?o estiver instanciado
     if not Assigned(F_clientes) then
     begin
          // instanciando o formul?rio
          F_clientes:= TF_clientes.create(application);
     end
     else begin
          F_clientes.Show;
     end;

end;

procedure TF_Principal.Clientes2Click(Sender: TObject);
begin
     if not funcoes.Busca_Permissao('clientes') then
     begin
        ShowMessage('N?o possui permiss?o para acessar este modulo');
        exit;

     end;
     // se o formul?rio n?o estiver instanciado
     if not Assigned(F_clientes_CadPadrao) then
     begin
          // instanciando o formul?rio
          F_clientes_CadPadrao:= TF_clientes_CadPadrao.create(application);
          F_clientes_CadPadrao.tabela := 'clientes';
          F_clientes_CadPadrao.campor_chave := 'cod_cliente';
          F_clientes_CadPadrao.campo_pesquisa := 'nome';
          F_clientes_CadPadrao.carregar_dados('');
     end
     else begin
          F_clientes_CadPadrao.Show;
     end;

end;

procedure TF_Principal.Clientes3Click(Sender: TObject);
begin
  dm_fastreport.q_clientes.open();
  dm_fastreport.fastreport_clientes.PrepareReport();
  dm_fastreport.fastreport_clientes.ShowPreparedReport;
  dm_fastreport.q_clientes.close;
end;

procedure TF_Principal.Encomendas2Click(Sender: TObject);
begin
     if not funcoes.Busca_Permissao('encomendas') then
     begin
        ShowMessage('N?o possui permiss?o para acessar este modulo');
        exit;

     end;
  // se o formul?rio n?o estiver instanciado
     if not Assigned(F_encomendas_CadPadrao) then
     begin
          // instanciando o formul?rio
          F_encomendas_CadPadrao:= TF_encomendas_CadPadrao.create(application);
          F_encomendas_CadPadrao.tabela := 'encomendas';
          F_encomendas_CadPadrao.campor_chave := 'num_encomenda';
          F_encomendas_CadPadrao.campo_pesquisa := 'num_encomenda';
          F_encomendas_CadPadrao.carregar_dados('');
     end
     else begin
          F_encomendas_CadPadrao.Show;
     end;
end;

procedure TF_Principal.FormCreate(Sender: TObject);
begin

     StatusBar1.Panels[0].Text:= DateTimeToStr(now);
     StatusBar1.Panels[1].Text:= 'Usu?rio: '+dm.usuario.nome_completo;
end;

procedure TF_Principal.Fornecedores2Click(Sender: TObject);
begin
     if not funcoes.Busca_Permissao('fornecedores') then
     begin
        ShowMessage('N?o possui permiss?o para acessar este modulo');
        exit;

     end;
     // se o formul?rio n?o estiver instanciado
     if not Assigned(F_fornecedores_CadPadrao) then
     begin
          // instanciando o formul?rio
          F_fornecedores_CadPadrao:= TF_fornecedores_CadPadrao.create(application);
          F_fornecedores_CadPadrao.tabela := 'fornecedores';
          F_fornecedores_CadPadrao.campor_chave := 'cod_fornecedor';
          F_fornecedores_CadPadrao.campo_pesquisa := 'nome_fantasia';
          F_fornecedores_CadPadrao.carregar_dados('');
     end
     else begin
          F_fornecedores_CadPadrao.Show;
     end;
end;

procedure TF_Principal.Composio1Click(Sender: TObject);
begin
  R_composicao := TR_composicao.Create(application);
  R_composicao.cod_prato := '';
  R_composicao.QRP.Preview;
  R_composicao.free;
end;

procedure TF_Principal.Compras2Click(Sender: TObject);
begin
     if not funcoes.Busca_Permissao('compras') then
     begin
        ShowMessage('N?o possui permiss?o para acessar este modulo');
        exit;

     end;
    // se o formul?rio n?o estiver instanciado
     if not Assigned(F_compras_CadPadrao) then
     begin
          // instanciando o formul?rio
          F_compras_CadPadrao:= TF_compras_CadPadrao.create(application);
          F_compras_CadPadrao.tabela := 'compras';
          F_compras_CadPadrao.campor_chave := 'cod_compra';
          F_compras_CadPadrao.campo_pesquisa := 'nota_fiscal';
          F_compras_CadPadrao.carregar_dados('');
     end
     else begin
          F_compras_CadPadrao.Show;
     end;
end;

procedure TF_Principal.Compras3Click(Sender: TObject);
begin
  R_compras := TR_compras.create(application);
  R_compras.QRP.Preview;
  R_compras.free;
end;

procedure TF_Principal.Ingredientes1Click(Sender: TObject);
begin
     // se o formul?rio n?o estiver instanciado
     if not Assigned(F_ingredientes) then
     begin
          // instanciando o formul?rio
          F_ingredientes:= TF_ingredientes.create(application);
     end
     else begin
          F_ingredientes.Show;
     end;
end;

procedure TF_Principal.Ingredientes2Click(Sender: TObject);
begin
     // se o formul?rio n?o estiver instanciado
     if not Assigned(f_cad_ing_facil1) then
     begin
          // instanciando o formul?rio
          f_cad_ing_facil1:= Tf_cad_ing_facil1.create(application);
     end
     else begin
          f_cad_ing_facil1.Show;
     end;
end;

procedure TF_Principal.Ingredientes3Click(Sender: TObject);
begin
  if not funcoes.Busca_Permissao('ingredientes') then
     begin
        ShowMessage('N?o possui permiss?o para acessar este modulo');
        exit;

     end;
  if not Assigned(F_ingredientes_CadPadrao) then
     begin
          // instanciando o formul?rio
          F_ingredientes_CadPadrao:= TF_ingredientes_CadPadrao.create(application);
          F_ingredientes_CadPadrao.tabela := 'ingredientes';
          F_ingredientes_CadPadrao.campor_chave := 'cod_ingrediente';
          F_ingredientes_CadPadrao.campo_pesquisa := 'descricao';
          F_ingredientes_CadPadrao.carregar_dados('');
     end
     else begin
          F_ingredientes_CadPadrao.Show;
     end;
end;


procedure TF_Principal.Ingredientes4Click(Sender: TObject);
begin
  dm_fastreport.q_ingredientes.open();
  dm_fastreport.fastreport_ingredientes.PrepareReport();
  dm_fastreport.fastreport_ingredientes.ShowPreparedReport;
  dm_fastreport.q_ingredientes.close;
end;

procedure TF_Principal.Pratos1Click(Sender: TObject);
begin
     // se o formul?rio n?o estiver instanciado
     if not Assigned(F_pratos) then
     begin
          // instanciando o formul?rio
          F_pratos:= TF_pratos.create(application);
     end
     else begin
          F_pratos.Show;
     end;
end;

procedure TF_Principal.Pratos2Click(Sender: TObject);
begin
    if not Assigned(f_cad_pratos_facil) then
     begin
          // instanciando o formul?rio
          f_cad_pratos_facil:= Tf_cad_pratos_facil.create(application);
     end
     else begin
          f_cad_pratos_facil.Show;
     end;
end;

procedure TF_Principal.Pratos3Click(Sender: TObject);
begin
     if not funcoes.Busca_Permissao('pratos') then
     begin
        ShowMessage('N?o possui permiss?o para acessar este modulo');
        exit;

     end;
     // se o formul?rio n?o estiver instanciado
     if not Assigned(F_pratos_CadPadrao) then
     begin
          // instanciando o formul?rio
          F_pratos_CadPadrao:= TF_pratos_CadPadrao.create(application);
          F_pratos_CadPadrao.tabela := 'pratos';
          F_pratos_CadPadrao.campor_chave := 'cod_prato';
          F_pratos_CadPadrao.campo_pesquisa := 'nome';
          F_pratos_CadPadrao.carregar_dados('');
     end
     else begin
          F_pratos_CadPadrao.Show;
     end;
end;

procedure TF_Principal.Pratos4Click(Sender: TObject);
begin
  dm_fastreport.q_pratos.open();
  dm_fastreport.fastreport_pratos.PrepareReport();
  dm_fastreport.fastreport_pratos.ShowPreparedReport;
  dm_fastreport.q_pratos.close;
end;

// OnTimer do componente Timer
procedure TF_Principal.Timer1Timer(Sender: TObject);
begin
     StatusBar1.Panels[0].Text:= DateTimeToStr(now);
end;

procedure TF_Principal.Unidades1Click(Sender: TObject);
begin
     if not funcoes.Busca_Permissao('unidades') then
     begin
        ShowMessage('N?o possui permiss?o para acessar este modulo');
        exit;

     end;
    // se o formul?rio n?o estiver instanciado
     if not Assigned(F_unidades_CadPadrao) then
     begin
          // instanciando o formul?rio
          F_unidades_CadPadrao:= TF_unidades_CadPadrao.create(application);
          F_unidades_CadPadrao.tabela := 'unidades';
          F_unidades_CadPadrao.campor_chave := 'cod_unidade';
          F_unidades_CadPadrao.campo_pesquisa := 'descricao';
          F_unidades_CadPadrao.carregar_dados('');
     end
     else begin
          F_unidades_CadPadrao.Show;
     end;
end;

procedure TF_Principal.Unidades2Click(Sender: TObject);
begin
  dm_fastreport.q_unidades.open();
  dm_fastreport.fastreport_unidades.PrepareReport();
  dm_fastreport.fastreport_unidades.ShowPreparedReport;
  dm_fastreport.q_unidades.close;
end;

procedure TF_Principal.Usurios1Click(Sender: TObject);
begin
  dm_fastreport.q_usuarios.open();
  dm_fastreport.fastreport_usuarios.PrepareReport();
  dm_fastreport.fastreport_usuarios.ShowPreparedReport;
  dm_fastreport.q_usuarios.close;
end;

procedure TF_Principal.Usurios2Click(Sender: TObject);
begin
    if not funcoes.Busca_Permissao('usuarios') then
     begin
        ShowMessage('N?o possui permiss?o para acessar este modulo');
        exit;

     end;
    // se o formul?rio n?o estiver instanciado
     if not Assigned(F_usuarios_CadPadrao) then
     begin
          // instanciando o formul?rio
          F_usuarios_CadPadrao:= TF_usuarios_CadPadrao.create(application);
          F_usuarios_CadPadrao.tabela := 'usuarios';
          F_usuarios_CadPadrao.campor_chave := 'cod_usuario';
          F_usuarios_CadPadrao.campo_pesquisa := 'nome_completo';
          F_usuarios_CadPadrao.carregar_dados('');
     end
     else begin
          F_usuarios_CadPadrao.Show;
     end;
end;

end.
