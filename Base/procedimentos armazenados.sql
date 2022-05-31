use restaurante_LPV_2019
go


---------------------------------------------------------------------------------------
-- Procedimentos armazenados
---------------------------------------------------------------------------------------
/**/
--- procedimento armazenado para incluir/alterar cliente ------------
create procedure sp_cadastrar_cliente
	-- parâmetros
	
	-- quando @cod_cliente = 0, será realizada uma inclusão
	@cod_cliente int, 
	
	@nome varchar(100),
	@cpf char(11),
	@rg varchar(18),
	@data_nascimento datetime,
	@sexo char(1),	
	
	@endereco varchar(100),
	@bairro varchar(100),
	@cod_cidade	int, 
	@cep char(8),	
	@telefone varchar(15),
	@celular varchar(15),
	@email varchar(150),

	@conheceu_por_jornais char(1),
	@conheceu_por_internet char(1),
	@conheceu_por_outro char(1),
	@renda_familiar float
		
as begin

	-- retirando os espaços à esquerda e à direita	
	set @nome = ltrim(rtrim(@nome))

	if @cod_cidade = 0
	begin
		set @cod_cidade = null
	end
	
	if @nome = '' 
	begin
		select 'O campo nome deve ser informado !' as msg, 0 as retorno
		return; -- interrompe o script
	end
	
	-- se estiver incluindo
	if @cod_cliente = 0 
	begin
		if exists (select * from clientes where nome = @nome )
		begin
			select 'Já há um cliente com este nome ' as msg, 0 as retorno
			return;
		end

		if exists (select * from clientes where cpf = @cpf) and @cpf != ''
		begin
			select 'Já há um cliente com este CPF ' as msg, 0 as retorno
			return;
		end

		insert into clientes (
						nome ,
						cpf ,
						rg ,
						data_nascimento ,
						sexo ,	
	
						endereco ,
						bairro ,
						cod_cidade	, 
						cep ,	
						telefone ,
						celular ,
						email ,

						conheceu_por_jornais ,
						conheceu_por_internet ,
						conheceu_por_outro ,
						renda_familiar 
					)
					values (
						@nome ,
						@cpf ,
						@rg ,
						@data_nascimento ,
						@sexo ,	
	
						@endereco ,
						@bairro ,
						@cod_cidade	, 
						@cep ,	
						@telefone ,
						@celular ,
						@email ,

						@conheceu_por_jornais ,
						@conheceu_por_internet ,
						@conheceu_por_outro ,
						@renda_familiar 
					)

	
		select 'cliente Incluída com sucesso !' as msg, 
			   1 as retorno, 
			   IDENT_CURRENT( 'clientes' ) as cod_cliente -- obtem o código auto-increment do novo cliente 

	end -- incluindo
	else begin	
		if exists (select * from clientes where nome = @nome and cod_cliente != @cod_cliente)
		begin
			select 'Já há um cliente com este nome !' as msg, 0 as retorno
			return;
		end

		update clientes set 
				  nome                       = @nome                   ,
				  cpf                        = @cpf                    ,
				  rg                         = @rg                     ,
				  data_nascimento            = @data_nascimento        ,
				  sexo                       = @sexo                   ,
				  endereco                   = @endereco               ,
				  bairro                     = @bairro                 ,
				  cod_cidade                 = @cod_cidade             ,
				  cep                        = @cep                    ,
				  telefone                   = @telefone               ,
				  celular                    = @celular                ,
				  email                      = @email                  ,
				  conheceu_por_jornais       = @conheceu_por_jornais   ,
				  conheceu_por_internet      = @conheceu_por_internet  ,
				  conheceu_por_outro         = @conheceu_por_outro     ,
				  renda_familiar             = @renda_familiar
		where cod_cliente = @cod_cliente
		
		select 'Cliente Alterado com sucesso !' as msg, 1 as retorno

	end -- alterando	

end; -- sp_cadastra_cliente
go
/**/


-----------------------------------------------------------

create procedure sp_cadastra_cidade
-- parâmetros
	@cod_cidade int,
	@nome varchar(100),
	@uf char(2),
	@cep_padrao char(8)

as begin

	set @nome = ltrim(rtrim(@nome))
	set @uf = ltrim(rtrim(@uf))

	-----------------------------------------------------------
	if @nome = ''
	begin
		select 0 as retorno, 'O nome da cidade deve ser informado !' as msg
		return;
	end

	-----------------------------------------------------------
	if @uf = ''
	begin
		select 0 as retorno, 'A unidade federal da cidade deve ser informada !' as msg
		return;
	end

	-----------------------------------------------------------
	begin transaction 

	if @cod_cidade = 0
	begin

		if exists (select cod_cidade from cidades where nome = @nome and uf = @uf)
		begin
			select 0 as retorno, 'Já existe uma cidade com este Nome e UF !' as msg
		end
		else begin

			insert into cidades (
						nome, 
						uf,
						cep_padrao
						)
			values (
					@nome,
					@uf,
					@cep_padrao
				   )	

			select 1 as retorno, 'Cidade incluida com sucesso !' as msg
		end

	end -- incluindo
	-----------------------------------------------------------
	else begin

		if exists (select cod_cidade from cidades where nome = @nome and uf = @uf and cod_cidade != @cod_cidade)
		begin
			select 0 as retorno, 'Já existe uma cidade com este Nome e UF !' as msg
		end
		else begin
			update cidades set
					nome = @nome, 
					uf = @uf,
					cep_padrao = @cep_padrao
			where cod_cidade = @cod_cidade

			select 1 as retorno, 'Cidade alterada com sucesso !' as msg
		end

	end -- alterando

	commit

end; -- sp_cadastra_cidade
go
-------------------------------------------

create procedure sp_del_cidade
	@cod_cidade int
as begin

	begin transaction

	if exists (select cod_cliente from clientes where cod_cidade = @cod_cidade)
	begin
		select 0 as retorno, 'Esta cidade está relacionada com clientes, portanto não pode ser excluída !' as msg
		rollback;
		return;
	end

	if exists (select cod_fornecedor from fornecedores where cod_cidade = @cod_cidade)
	begin
		select 0 as retorno, 'Esta cidade está relacionada com fornecedores, portanto não pode ser excluída !' as msg
		rollback;
		return;
	end

	-----------------------------------------------------
	delete from cidades where cod_cidade = @cod_cidade

	select 1 as retorno, 'Cidade excluída com sucesso !' as msg

	commit

end;

go














