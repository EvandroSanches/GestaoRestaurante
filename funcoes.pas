unit funcoes;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Db, u_dm;

Function valida_cpf(cpf:string):boolean;
Function  is_Inteiro( n : string) : boolean;
Function  RealUSA(x:string) : string;
Function  Is_Date(Data : string): Boolean;
Function  Is_DateTime(Data : string) : Boolean;
Function  is_Real( n : string) : boolean;
function DataUSA( d : string ) : string;
function DataBR( d : string ) : string;
function Busca_Permissao(modulo : String) : boolean;
procedure apresentar_msg( s : string );
Function checkCNPJ(CNPJ : string): integer;
//Function isCNPJ(campo : string) : boolean;

var
   usuario : record
                   nome,
                   login : string;
                   administrador : boolean;
             end;


implementation

//------------------------------------------------------------------------------
Function valida_cpf(cpf:string):boolean;
var i:integer;
    Want:char;
    Wvalid:boolean;
    Wdigit1,Wdigit2:integer;
begin
     Wvalid:= false;

     cpf:= trim(cpf);

     if cpf = '' then
     begin
          result:= false;
          exit;
     end;

    Wdigit1:=0;
    Wdigit2:=0;
    Want:=cpf[1];//variavel para testar se o cpf ? repetido como 111.111.111-11
    Delete(cpf,ansipos('.',cpf),1);  //retira as mascaras se houver
    Delete(cpf,ansipos('.',cpf),1);
    Delete(cpf,ansipos('-',cpf),1);

     if length(cpf) <> 11  then
     begin
          result:= false;
          exit;
     end;


   //testar se o cpf ? repetido como 111.111.111-11
   for i:=1 to length(cpf) do
     begin
       if cpf[i] <> Want then
         begin
            Wvalid:=true;  // se o cpf possui um digito diferente ele passou no primeiro teste
            break
         end;
     end;
       // se o cpf ? composto por numeros repetido retorna falso
     if not Wvalid then
       begin
          result:=false;
          exit;
       end;

     //executa o calculo para o primeiro verificador
     for i:=1 to 9 do
       begin
          wdigit1:=Wdigit1+(strtoint(cpf[10-i])*(I+1));
       end;
        Wdigit1:= ((11 - (Wdigit1 mod 11))mod 11) mod 10;
        {formula do primeiro verificador
            soma=1?*2+2?*3+3?*4.. at? 9?*10
            digito1 = 11 - soma mod 11
            se digito > 10 digito1 =0
          }

         //verifica se o 1? digito confere
        if IntToStr(Wdigit1) <> cpf[10] then
          begin
             result:=false;
             exit;
          end;


         for i:=1 to 10 do
       begin
          wdigit2:=Wdigit2+(strtoint(cpf[11-i])*(I+1));
       end;
       Wdigit2:= ((11 - (Wdigit2 mod 11))mod 11) mod 10;
         {formula do segundo verificador
            soma=1?*2+2?*3+3?*4.. at? 10?*11
            digito1 = 11 - soma mod 11
            se digito > 10 digito1 =0
          }

       // confere o 2? digito verificador
       if IntToStr(Wdigit2) <> cpf[11] then
          begin
             result:=false;
             exit;
          end;

   //se chegar at? aqui o cpf ? valido
   result:=true;
   
end; // valida cpf
(* *)

//------------------------------------------------------------------------------
Function  is_Inteiro( n : string) : boolean;
var
   code : integer;
   x : integer;
begin
     // tenta converter
     val(n, x, code);
     result:= code = 0;          
end;
//------------------------------------------------------------------------------
Function Busca_Permissao(modulo : string)     : boolean;
begin

  dm.Q_usuario.SQL.clear();
  dm.Q_usuario.SQL.add('select * from usuarios left join usuario_permissao on');
  dm.Q_usuario.SQL.add(' (usuarios.cod_usuario = usuario_permissao.cod_usuario)');
  dm.Q_usuario.SQL.add(' where usuarios.cod_usuario = :cod_usuario');
  dm.Q_usuario.parambyname('cod_usuario').AsString := (dm.usuario.cod_usuario).ToHexString;
  dm.Q_usuario.Open();
  dm.usuario.nivel := dm.Q_usuario.fieldbyname('nivel').AsInteger;

  if dm.Q_usuario.fieldbyname('administrador').AsInteger = 1 then
  begin
    result := True;

  end

  else if dm.Q_usuario.fieldbyname('modulo').AsString = modulo then
  begin
    result := True;

  end
  else
  begin
    result := False;

  end;

end;
//------------------------------------------------------------------------------
procedure apresentar_msg( s : string );
begin
     MessageDlg(s,mtInformation,[mbok],0);
end;


//------------------------------------------------------------------------------
function DataBR( d : string ) : string;
var
   data_nova : string;
begin
     // 2012/05/07
     data_nova:= copy(d, 1,2)+'/' + copy(d,4,2) +'/'+ copy(d,7,4);

     result:= data_nova;

end;

//------------------------------------------------------------------------------
function DataUSA( d : string ) : string;
var
   data_nova : string;
begin
     // 23/04/2012
     data_nova:= copy(d,7,4) + '/' + copy(d,4,2) + '/' + copy(d, 1,2);
     //data_nova:= copy(d,4,2) + '/' + copy(d, 1,2) +'/'+ copy(d,7,4);

     result:= data_nova;

     //showmessage(result);
     //result:= d;

end;

//------------------------------------------------------------------------------
Function  Is_Date(Data : string) : Boolean;
begin
     try
        StrToDate(Data);
     Except
        on E:EConvertError do
        begin
             Result:= False;
             Exit;
        end
     end;
     Result:= True;
end;

//------------------------------------------------------------------------------
Function  Is_DateTime(Data : string) : Boolean;
begin
     try
        StrToDateTime(Data);
     Except
        on E:EConvertError do
        begin
             Result:= False;
             Exit;
        end
     end;
     Result:= True;
end;

//------------------------------------------------------------------------------
Function  RealUSA(x:string) : string;
var
   i : integer;
   n : string;
begin
     n:= x;
     Result:= '';
     for i:= 1 to length(n) do
     begin
          if n[i] = ',' then Result:= Result + '.'
          else
          if n[i] <> '.' then Result:= Result + n[i];
     end;
end;

//------------------------------------------------------------------------------
Function  is_Real( n : string) : boolean;
var
   code : integer;
   x : real;
   i : integer;
   n_novo : string;
begin
     // tira separador de milhares e substitui virgula por ponto
     n_novo:= '';
     for i:= 1 to length(n) do
     begin
          if n[i] = ',' then n_novo:= n_novo + '.'
          else
          if n[i] <> '.' then n_novo:= n_novo + n[i];
     end;

     // tenta converter
     val(n_novo, x, code);

     if code <> 0 then
     begin
          result:= false;
     end
     else begin
          result:= true;
     end;

end;
//------------------------------------------------------------------------------
Function checkCNPJ(CNPJ : string) : integer;
var
   i : integer;
   j : integer;
   mSoma : integer;
   mDigito : integer;
   mControle : integer;
   mControle1 : integer;
   aTabCNPJ : array[0..11] of integer;
begin
     mSoma := 0;
     mControle := 0;
     aTabCNPJ[0] := 5;
     aTabCNPJ[1] := 4;
     aTabCNPJ[2] := 3;
     aTabCNPJ[3] := 2;
     aTabCNPJ[4] := 9;
     aTabCNPJ[5] := 8;
     aTabCNPJ[6] := 7;
     aTabCNPJ[7] := 6;
     aTabCNPJ[8] := 5;
     aTabCNPJ[9] := 4;
     aTabCNPJ[10] := 3;
     aTabCNPJ[11] := 2;

     for i := 1 to 2 do
     begin
          for j := 0 to CNPJ.Length do
          begin
            mSoma := mSoma + (StrToInt(CNPJ.Substring(j,j+1)) * (aTabCNPJ[j]));
            if i = 2 then
            begin
              mSoma := mSoma + (2 * mDigito);
            end;

            mDigito := (mSoma * 10) mod 11;

            if mDigito = 10 then
            begin
              mDigito := 0;
            end;

            mControle1 := mControle;
            mControle := mDigito;

            aTabCNPJ[0] := 6;
            aTabCNPJ[1] := 5;
            aTabCNPJ[2] := 4;
            aTabCNPJ[3] := 3;
            aTabCNPJ[4] := 2;
            aTabCNPJ[5] := 9;
            aTabCNPJ[6] := 8;
            aTabCNPJ[7] := 7;
            aTabCNPJ[8] := 6;
            aTabCNPJ[9] := 5;
            aTabCNPJ[10] := 4;
            aTabCNPJ[11] := 3;

          end;
     end;

     result := ( (mControle1 * 10) + mControle );
end;

//------------------------------------------------------------------------------

{Function isCNPJ(campo : string) : boolean;
var
   valido : boolean;
   campo_filtrado : integer;
   valor_1 : integer;
   valor_2 : integer;
   ch : integer;
   i : integer;
begin
     if trim(campo) = '' then
     begin
          result := false;
     end;

     for i := 0 to campo.Length do
     begin
          ch := StrToInt(campo.substring(i, i + 1));
          if (ch >= 0 and ch <= 9)
          begin
              campo_filtrado = campo_filtrado.toString() + ch.toString()
               valor_1 = valor_2;
               valor_2 = ch;
          end;
     end;


end;}

end.
