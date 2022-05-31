program Restaurante;

uses
  Vcl.Forms,
  CONTROLS,
  U_Principal in 'U_Principal.pas' {F_Principal},
  u_dm in 'u_dm.pas' {DM: TDataModule},
  u_cidades_ficha in 'u_cidades_ficha.pas' {f_cidades_ficha},
  u_pesquisa in 'u_pesquisa.pas' {f_pesquisa},
  u_clientes in 'u_clientes.pas' {f_clientes},
  u_fichacliente in 'u_fichacliente.pas' {f_fichacliente},
  U_pratos in 'U_pratos.pas' {f_pratos},
  u_pratos_ficha in 'u_pratos_ficha.pas' {f_pratos_ficha},
  u_ingredientes in 'u_ingredientes.pas' {f_ingredientes},
  u_ingredientes_ficha in 'u_ingredientes_ficha.pas' {f_ingredientes_ficha},
  u_composicao in 'u_composicao.pas' {f_composicao},
  u_cad_pratos_facil in 'u_cad_pratos_facil.pas' {f_cad_pratos_facil},
  u_ing_facil1 in 'u_ing_facil1.pas' {f_cad_ing_facil1},
  u_cadastro_padrao in 'u_cadastro_padrao.pas' {f_CadPadrao},
  u_unidades_CadPadrao in 'u_unidades_CadPadrao.pas' {F_unidades_CadPadrao},
  u_ingredientes_CadPadrao in 'u_ingredientes_CadPadrao.pas' {F_ingredientes_CadPadrao},
  u_compras_CadPadrao in 'u_compras_CadPadrao.pas' {F_compras_CadPadrao},
  u_encomendas_CadPadrao in 'u_encomendas_CadPadrao.pas' {F_encomendas_CadPadrao},
  u_pratos_CadPadrao in 'u_pratos_CadPadrao.pas' {F_pratos_CadPadrao},
  u_fornecedores_CadPadrao in 'u_fornecedores_CadPadrao.pas' {F_fornecedores_CadPadrao},
  u_clientes_CadPadrao in 'u_clientes_CadPadrao.pas' {F_clientes_CadPadrao},
  u_login in 'u_login.pas' {f_login},
  u_usuarios_CadPadrao in 'u_usuarios_CadPadrao.pas' {f_usuarios_CadPadrao},
  u_permissoes_CadPadrao in 'u_permissoes_CadPadrao.pas' {F_Permissoes_CadPadrao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tf_usuarios_CadPadrao, f_usuarios_CadPadrao);
  Application.CreateForm(TF_Permissoes_CadPadrao, F_Permissoes_CadPadrao);
  f_login := Tf_login.create(application);
  f_login.ShowModal;

  if f_login.ModalResult <> mrOk then
  begin
    Application.Terminate;
  end;

  Application.CreateForm(TF_Principal, F_Principal);
  Application.Run;
end.
