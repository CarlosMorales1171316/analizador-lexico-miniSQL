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
DROP { 
        return new Symbol(sym.DROP ,yychar, yyline, yytext()); 
      } 
DATABASE { 
        return new Symbol(sym.DATABASE ,yychar, yyline, yytext());  
      }  
INDEX { 
        return new Symbol(sym.INDEX ,yychar, yyline, yytext());  
      }
VIEW { 
        return new Symbol(sym.VIEW ,yychar, yyline, yytext());  
      } 
USER { 
        return new Symbol(sym.USER ,yychar, yyline, yytext()); 
      } 
IF { 
        return new Symbol(sym.IF ,yychar, yyline, yytext());  
      } 
EXISTS { 
        return new Symbol(sym.EXISTS ,yychar, yyline, yytext());  
      }   
ON { 
        return new Symbol(sym.ON ,yychar, yyline, yytext());  
      }  
ALTER { 
        return new Symbol(sym.ALTER ,yychar, yyline, yytext()); 
      }
CURRENT { 
        return new Symbol(sym.CURRENT ,yychar, yyline, yytext());  
      } 
COLLATE { 
        return new Symbol(sym.COLLATE ,yychar, yyline, yytext());  
      } 
MODIFY { 
        return new Symbol(sym.MODIFY ,yychar, yyline, yytext()); 
      } 
NAME { 
        return new Symbol(sym.NAME ,yychar, yyline, yytext()); 
      } 
COLUMN { 
        return new Symbol(sym.COLUMN ,yychar, yyline, yytext());  
      } 
NULL { 
        return new Symbol(sym.NULL ,yychar, yyline, yytext());  
      }
NOT { 
        return new Symbol(sym.NOT ,yychar, yyline, yytext());  
      }
ALL  { 
        return new Symbol(sym.ALL ,yychar, yyline, yytext()); 
      } 
AS { 
        return new Symbol(sym.AS ,yychar, yyline, yytext()); 
      }
CHAR { 
        return new Symbol(sym.CHAR ,yychar, yyline, yytext()); 
      } 
BINARY { 
        return new Symbol(sym.BINARY ,yychar, yyline, yytext()); 
      }
BLOB { 
        return new Symbol(sym.BLOB ,yychar, yyline, yytext()); 
      }
BIT { 
        return new Symbol(sym.BIT ,yychar, yyline, yytext()); 
      }
SMALLINT { 
        return new Symbol(sym.SMALLINT ,yychar, yyline, yytext()); 
      }
INT { 
        return new Symbol(sym.INT ,yychar, yyline, yytext()); 
      }
INTEGER { 
        return new Symbol(sym.INTEGER ,yychar, yyline, yytext()); 
      }
FLOAT { 
        return new Symbol(sym.FLOAT ,yychar, yyline, yytext()); 
      }
VARCHAR { 
        return new Symbol(sym.VARCHAR ,yychar, yyline, yytext()); 
      }
BOOLEAN { 
        return new Symbol(sym.BOOLEAN ,yychar, yyline, yytext()); 
      }
DATE { 
        return new Symbol(sym.DATE ,yychar, yyline, yytext()); 
      }
YEAR { 
        return new Symbol(sym.YEAR ,yychar, yyline, yytext()); 
      }
IMAGE { 
        return new Symbol(sym.IMAGE ,yychar, yyline, yytext()); 
      }
REAL { 
        return new Symbol(sym.REAL ,yychar, yyline, yytext()); 
      }
TIME { 
        return new Symbol(sym.TIME ,yychar, yyline, yytext()); 
      }
TIMESTAMP { 
        return new Symbol(sym.TIMESTAMP ,yychar, yyline, yytext()); 
      }
CURSOR { 
        return new Symbol(sym.CURSOR ,yychar, yyline, yytext()); 
      }
TABLE { 
        return new Symbol(sym.TABLE ,yychar, yyline, yytext()); 
      }
TEXT { 
        return new Symbol(sym.TEXT ,yychar, yyline, yytext()); 
      }
BYTE { 
        return new Symbol(sym.BYTE ,yychar, yyline, yytext()); 
      }
LONG { 
        return new Symbol(sym.LONG ,yychar, yyline, yytext()); 
      }
DOUBLE { 
        return new Symbol(sym.DOUBLE ,yychar, yyline, yytext()); 
      }
NCHAR { 
        return new Symbol(sym.NCHAR ,yychar, yyline, yytext()); 
      }
ADD { 
        return new Symbol(sym.ADD ,yychar, yyline, yytext()); 
      }
CONSTRAINT { 
        return new Symbol(sym.CONSTRAINT ,yychar, yyline, yytext()); 
      }
UNIQUE { 
        return new Symbol(sym.UNIQUE ,yychar, yyline, yytext()); 
      }
PRIMARY { 
        return new Symbol(sym.PRIMARY ,yychar, yyline, yytext()); 
      }
KEY { 
        return new Symbol(sym.KEY ,yychar, yyline, yytext()); 
      }
IDENTITY { 
        return new Symbol(sym.IDENTITY ,yychar, yyline, yytext()); 
      }
CLUSTERED { 
        return new Symbol(sym.CLUSTERED ,yychar, yyline, yytext()); 
      }
NONCLUSTERED { 
        return new Symbol(sym.NONCLUSTERED ,yychar, yyline, yytext()); 
      }
COLUMN { 
        return new Symbol(sym.COLUMN ,yychar, yyline, yytext()); 
      }
FOREIGN  { 
        return new Symbol(sym.FOREIGN  ,yychar, yyline, yytext()); 
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
{Digito} { 
        return new Symbol(sym.Digito ,yychar, yyline, yytext()); 
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

