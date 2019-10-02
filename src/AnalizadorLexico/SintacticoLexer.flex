package AnalizadorLexico;
import static AnalizadorLexico.Tokens.*;
import java.util.ArrayList;
%%
%class SintacticoLexer
%type Tokens
%unicode 9.0
%line
%column


/*Comentarios*/
SQLSingleLineComment = "--" {InputCharacter}*
SQLMultiLineComment = ("/*" ~"*/")  
Comment = {SQLSingleLineComment} | {SQLMultiLineComment}
ErrorComment = ("/*"[^\r\n.*]*)  
ErrorCadena = ("'"([^'\r\n]*))


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


ErrorSentencia = (("SELECT" ~"GO") 
                | ("INSERT" ~"GO") 
                | ("UPDATE" ~"GO") 
                | ("DELETE" ~"GO") 
                | ("CREATE" ~"GO") 
                | ("ALTER" ~"GO") 
                | ("DROP" ~"GO") 
                | ("TRUNCATE" ~"GO"))

/*Variables*/
%{
    public String toString;
    public String getString;
    public Integer getLinea;
    public Integer getColumnaInicial;
    public Integer getColumnaFinal;
%}

%%
{WhiteSpace} {/*Ignore*/}
{Comment} {/*Ignore*/}

{ErrorSentencia} { getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        getString=yytext();  
        return ErrorSentencia; 
      }

/*Errores*/
{ErrorComment} {getColumnaInicial=yycolumn+1; getColumnaFinal=(yycolumn+1)+yytext().length()-1; getLinea=yyline+1; toString=yytext(); return Error_Comentario_Sin_Cerrar;}
{ErrorCadena} {getColumnaInicial=yycolumn+1; getColumnaFinal=(yycolumn+1)+yytext().length()-1; getLinea=yyline+1; toString=yytext(); return Error_Cadena_Invalida;}
 . {getColumnaInicial=yycolumn+1; getColumnaFinal=(yycolumn+1)+yytext().length()-1; getLinea=yyline+1; toString=yytext(); return Error_Caracter_Invalido;}


