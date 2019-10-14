package AnalizadorLexico;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup 
%full
%unicode 9.0
%line
%column
%char

/*Alfabeto-Diccionarios*/
Letra=[a-zA-Z]+
LetraGuion=[a-zA-Z_]+
Digito=0|[1-9][0-9]*

/*Identificador*/
Identificador = {Letra}({LetraGuion}|{Digito})* 

/*Constantes*/
Bit=[0|1|"NULL"]
Int=[0-9][0-9]* | "-"[0-9][0-9]* 
Float=[0-9]+ ["."][0-9]* | "-"[0-9]+ ["."][0-9]*
FloatExp= (([0-9]+ ["."] [0-9]* ["e"|"E"] ["+"|"-"] [0-9]*) | ([0-9]+ ["."] [0-9]* ["e"|"E"] [0-9]*)) | (("-"[0-9]+ ["."] [0-9]* ["e"|"E"] ["+"|"-"] [0-9]*) | ("-"[0-9]+ ["."] [0-9]* ["e"|"E"] [0-9]*))
String = ("'"([^'\r\n])*"'")

/*Espacios en blanco*/
/* 
\r--> retorno de carro
\n--> nueva linea
\t--> tabulacion horizontal
\f -->tabulacion vertical
*/
LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace = {LineTerminator} | [ \t\f]

/*Comentarios*/
SQLSingleLineComment = "--" {InputCharacter}*
SQLMultiLineComment = ("/*" ~"*/") 
Comment = {SQLSingleLineComment} | {SQLMultiLineComment}
ErrorComment = ("/*"[^\r\n.*]*)  
ErrorCadena = ("'"([^'\r\n]*))


%{
    private Symbol symbol(int type, Object value){
        return new Symbol (type, yyline, yycolumn, value);
    }

    private Symbol symbol(int type){
        return new Symbol (type, yyline, yycolumn);
    }
%}

%%
/*Reservadas*/
TRUNCATE { 
        return new Symbol(sym.TRUNCATE ,yychar, yyline, yytext());  
      }
TABLE { 
        return new Symbol(sym.TABLE ,yychar, yyline, yytext());  
      }   
GO { 
        return new Symbol(sym.GO ,yychar, yyline, yytext());  
      }   

 
{WhiteSpace} {/*Ignore*/}
{Comment} {/*Ignore*/}

"+" { 
        return new Symbol(sym.Suma ,yychar, yyline, yytext()); 
      }
"-" { 
        return new Symbol(sym.Resta ,yychar, yyline, yytext()); 
      }
"*" { 
        return new Symbol(sym.Multiplicacion ,yychar, yyline, yytext()); 
      }
"/" { 
        return new Symbol(sym.Division ,yychar, yyline, yytext()); 
      }
"%" { 
        return new Symbol(sym.Porcentaje ,yychar, yyline, yytext()); 
      }
"<" { 
        return new Symbol(sym.Menor ,yychar, yyline, yytext()); 
      }
"<=" { 
        return new Symbol(sym.Menor_o_igual ,yychar, yyline, yytext()); 
      }
">" { 
        return new Symbol(sym.Mayor ,yychar, yyline, yytext()); 
      }
">=" { 
        return new Symbol(sym.Mayor_o_igual ,yychar, yyline, yytext()); 
      }
"=" { 
        return new Symbol(sym.Igual ,yychar, yyline, yytext()); 
      }
"==" { 
        return new Symbol(sym.Igualdad ,yychar, yyline, yytext()); 
      }
"!=" { 
        return new Symbol(sym.Diferente ,yychar, yyline, yytext()); 
      }
"&&" { 
        return new Symbol(sym.And ,yychar, yyline, yytext()); 
      }
"||" { 
        return new Symbol(sym.Or ,yychar, yyline, yytext()); 
      }
"!" { 
        return new Symbol(sym.Not ,yychar, yyline, yytext()); 
      }
";" { 
        return new Symbol(sym.Punto_y_coma ,yychar, yyline, yytext()); 
      }
"," { 
        return new Symbol(sym.Coma ,yychar, yyline, yytext()); 
      }
"." { 
        return new Symbol(sym.Punto ,yychar, yyline, yytext()); 
      }
"[" { 
        return new Symbol(sym.Corchete_de_apertura ,yychar, yyline, yytext()); 
      }
"]" { 
        return new Symbol(sym.Corchete_de_cierre ,yychar, yyline, yytext()); 
      }
"[]" { 
        return new Symbol(sym.Corchetes ,yychar, yyline, yytext()); 
      }
"(" { 
        return new Symbol(sym.Parentesis_de_apertura ,yychar, yyline, yytext()); 
      }
")" { 
        return new Symbol(sym.Parentesis_de_cierre ,yychar, yyline, yytext()); 
      }
"()" { 
        return new Symbol(sym.Parentesis ,yychar, yyline, yytext()); 
      }
"{" { 
        return new Symbol(sym.Llave_de_apertura ,yychar, yyline, yytext()); 
      }
"}" { 
        return new Symbol(sym.Llave_de_cierre ,yychar, yyline, yytext()); 
      }
"{}" { 
        return new Symbol(sym.Llaves ,yychar, yyline, yytext()); 
      }
"@" { 
        return new Symbol(sym.Arroba ,yychar, yyline, yytext()); 
      }
"#" { 
        return new Symbol(sym.Numeral ,yychar, yyline, yytext()); 
      }   
"##" { 
        return new Symbol(sym.Doble_numeral ,yychar, yyline, yytext()); 
      }

{Identificador} { 
        return new Symbol(sym.Identificador ,yychar, yyline, yytext()); 
      }

{Bit} { 
        return new Symbol(sym.Bit ,yychar, yyline, yytext()); 
      }

{Int} { 
        return new Symbol(sym.Int ,yychar, yyline, yytext()); 
      }

{Float} { 
        return new Symbol(sym.Float ,yychar, yyline, yytext()); 
      }

{FloatExp} { 
        return new Symbol(sym.Float ,yychar, yyline, yytext()); 
      }

{String} { 
        return new Symbol(sym.String ,yychar, yyline, yytext()); 
      }

/*Errores*/
{ErrorComment} { 
        return new Symbol(sym.Error_Comentario_Sin_Cerrar, yychar, yyline, yytext()); 
      }
{ErrorCadena} { 
        return new Symbol(sym.Error_Cadena_Invalida, yychar, yyline, yytext()); 
      }
 . { 
        return new Symbol(sym.Error_Caracter_Invalido, yychar, yyline, yytext()); 
      }

