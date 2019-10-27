package AnalizadorLexico;
import static AnalizadorLexico.Tokens.*;
import java.util.ArrayList;
%%
%class Lexer
%type Tokens
%unicode 9.0
%line
%column

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

/*Variables*/
%{
    public String toString;
    public Integer getLinea;
    public Integer getColumnaInicial;
    public Integer getColumnaFinal;
%}

%%
/*Reservadas*/
ADD { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ADD; 
      }      
EXTERNAL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return EXTERNAL; 
      }      
PROCEDURE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PROCEDURE; 
      }      
NAME { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return NAME; 
      }
ALL  { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ALL; 
      }    
FETCH { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return FETCH; 
      }      
PUBLIC  { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PUBLIC; 
      }    
ALTER { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ALTER; 
      }     
FILE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return FILE; 
      }     
RAISERROR { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return RAISERROR; 
      }     
AND  { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return AND; 
      }    
FILLFACTOR { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return FILLFACTOR; 
      }     
READ { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return READ; 
      }     
ANY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ANY; 
      }     
FOR { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return FOR; 
      }     
READTEXT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return READTEXT; 
      }     
AS { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return AS; 
      }     
FOREIGN { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return FOREIGN; 
      }     
RECONFIGURE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return RECONFIGURE; 
      }     
ASC { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ASC; 
      }     
FREETEXT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return FREETEXT; 
      }      
AUTHORIZATION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return AUTHORIZATION; 
      }     
FREETEXTTABLE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return FREETEXTTABLE; 
      }     
REPLICATION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return REPLICATION; 
      }     
BACKUP { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return BACKUP; 
      }     
RESTORE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return RESTORE; 
      }     
BEGIN { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return BEGIN; 
      }     
FULL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return FULL; 
      }     
RESTRICT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return RESTRICT; 
      }     
BETWEEN { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return BETWEEN; 
      }     
FUNCTION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return FUNCTION; 
      }     
RETURN { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return RETURN; 
      }     
BREAK { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return BREAK; 
      }     
GOTO { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return GOTO; 
      }     
REVERT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return REVERT; 
      }     
BROWSE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return BROWSE; 
      }     
GRANT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return GRANT; 
      }     
BULK { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return BULK; 
      }     
GROUP { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return GROUP; 
      }     
RIGHT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return RIGHT; 
      }        
CASCADE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CASCADE; 
      }     
HOLDLOCK { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return HOLDLOCK; 
      }     
ROWCOUNT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ROWCOUNT; 
      }     
CASE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CASE; 
      }     
IDENTITY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return IDENTITY; 
      }     
ROWGUIDCOL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ROWGUIDCOL; 
      }      
IDENTITY_INSERT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return IDENTITY_INSERT; 
      }     
RULE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return RULE; 
      }     
CHECKPOINT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CHECKPOINT; 
      }     
IDENTITYCOL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return IDENTITYCOL; 
      }     
SAVE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SAVE; 
      }     
CLOSE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CLOSE; 
      }     
IF { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return IF; 
      }     
SCHEMA { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SCHEMA; 
      }     
CLUSTERED { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CLUSTERED; 
      }     
IN { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return IN; 
      }     
SECURITYAUDIT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SECURITYAUDIT; 
      }     
COALESCE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return COALESCE; 
      }     
INDEX { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return INDEX; 
      }       
COLLATE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return COLLATE; 
      }         
SEMANTICKEYPHRASETABLE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SEMANTICKEYPHRASETABLE; 
      }     
COLUMN { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return COLUMN; 
      }     
INSERT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return INSERT; 
      }     
SEMANTICSIMILARITYDETAILSTABLE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SEMANTICSIMILARITYDETAILSTABLE; 
      }     
COMMIT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return COMMIT; 
      }     
INTERSECT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return INTERSECT; 
      }     
SEMANTICSIMILARITYTABLE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SEMANTICSIMILARITYTABLE; 
      }     
COMPUTE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return COMPUTE; 
      }      
SESSION_USER { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SESSION_USER; 
      }     
CONSTRAINT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CONSTRAINT; 
      }     
IS { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return IS; 
      }     
SET { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SET; 
      }     
CONTAINS { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CONTAINS; 
      }      
SETUSER { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SETUSER; 
      }     
CONTAINSTABLE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CONTAINSTABLE; 
      }     
KEY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return KEY; 
      }     
SHUTDOWN { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SHUTDOWN; 
      }     
KILL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return KILL; 
      }        
CONVERT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CONVERT; 
      }      
STATISTICS { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return STATISTICS; 
      }      
LIKE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return LIKE; 
      }     
SYSTEM_USER { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SYSTEM_USER; 
      }     
CROSS { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CROSS; 
      }     
LINENO { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return LINENO; 
      }     
TABLE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TABLE; 
      }     
LOAD { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return LOAD; 
      }     
TABLESAMPLE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TABLESAMPLE; 
      }       
MERGE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return MERGE; 
      }     
TEXTSIZE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TEXTSIZE; 
      }                  
NOCHECK { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return NOCHECK; 
      }     
TO { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TO; 
      }     
NONCLUSTERED  { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return NONCLUSTERED; 
      }    
TOP { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TOP; 
      }     
CURSOR { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CURSOR; 
      }     
NOT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return NOT; 
      }     
TRAN { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TRAN; 
      }     
DATABASE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DATABASE; 
      }        
TRANSACTION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TRANSACTION; 
      }     
DBCC { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DBCC; 
      }     
NULLIF { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return NULLIF; 
      }     
TRIGGER { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TRIGGER; 
      }          
OF { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return OF; 
      }     
TRUNCATE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TRUNCATE; 
      }     
DECLARE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DECLARE; 
      }     
OFF { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return OFF; 
      }     
TRY_CONVERT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TRY_CONVERT; 
      }     
DEFAULT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DEFAULT; 
      }     
OFFSETS { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return OFFSETS; 
      }     
TSEQUAL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TSEQUAL; 
      }     
DELETE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DELETE; 
      }        
DENY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DENY; 
      }     
OPEN { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return OPEN; 
      }     
UNIQUE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return UNIQUE; 
      }     
DESC { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DESC; 
      }     
OPENDATASOURCE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return OPENDATASOURCE; 
      }     
UNPIVOT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return UNPIVOT; 
      }     
DISK { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DISK; 
      }     
OPENQUERY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return OPENQUERY; 
      }         
DISTINCT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DISTINCT; 
      }     
OPENROWSET { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return OPENROWSET; 
      }     
UPDATETEXT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return UPDATETEXT; 
      }     
DISTRIBUTED { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DISTRIBUTED; 
      }     
OPENXML { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return OPENXML; 
      }     
USE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return USE; 
      }       
USER { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return USER; 
      }     
DROP { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DROP; 
      }     
OR { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return OR; 
      }     
DUMP { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DUMP; 
      }     
ORDER { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ORDER; 
      }     
VARYING { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return VARYING; 
      }               
END { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return END; 
      }     
OVER { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return OVER; 
      }     
WAITFOR { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return WAITFOR; 
      }     
ERRLVL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ERRLVL; 
      }     
PERCENT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PERCENT; 
      }     
WHEN { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return WHEN; 
      }     
ESCAPE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ESCAPE; 
      }     
PIVOT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PIVOT; 
      }     
WHERE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return WHERE; 
      }     
EXCEPT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return EXCEPT; 
      }     
PLAN { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PLAN; 
      }     
WHILE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return WHILE; 
      }     
EXEC { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return EXEC; 
      }      
PRECISION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PRECISION; 
      }      
WITH { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return WITH; 
      }      
EXECUTE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return EXECUTE; 
      }                   
PRINT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PRINT; 
      }     
WRITETEXT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return WRITETEXT; 
      }      
EXIT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return EXIT; 
      }     
PROC { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PROC; 
      }     
LABEL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return LABEL; 
      }           
OVERLAPS { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return OVERLAPS; 
      }     
ACTION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ACTION; 
      }     
PAD { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PAD; 
      }     
ADA { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ADA; 
      }     
EXISTS { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return EXISTS; 
      }     
PARTIAL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PARTIAL; 
      }       
PASCAL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PASCAL; 
      }     
EXTRACT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return EXTRACT; 
      }     
POSITION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return POSITION; 
      }     
FALSE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return FALSE; 
      }         
PREPARE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PREPARE; 
      }       
FIRST { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return FIRST; 
      }     
PRESERVE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PRESERVE; 
      }         
FLOAT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return FLOAT; 
      }     
PRIMARY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PRIMARY; 
      }     
ARE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ARE; 
      }     
PRIOR { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PRIOR; 
      }       
PRIVILEGES { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PRIVILEGES; 
      }     
FORTRAN { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return FORTRAN; 
      }              
FOUND { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return FOUND; 
      }         
AT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return AT; 
      }     
FROM { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return FROM; 
      }         
REAL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return REAL; 
      }     
AVG { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return AVG; 
      }     
GET { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return GET; 
      }     
REFERENCES { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return REFERENCES; 
      }     
GLOBAL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return GLOBAL; 
      }     
RELATIVE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return RELATIVE; 
      }        
GO { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return GO; 
      }                 
REVOKE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return REVOKE; 
      }     
BIT_LENGTH { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return BIT_LENGTH; 
      }             
BOTH { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return BOTH; 
      }       
ROLLBACK { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ROLLBACK; 
      }     
BY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return BY; 
      }     
HAVING { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return HAVING; 
      }     
ROWS { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ROWS; 
      }         
HOUR { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return HOUR; 
      }     
CASCADED { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CASCADED; 
      }       
SCROLL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SCROLL; 
      }        
SECOND { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SECOND; 
      }           
SECTION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SECTION; 
      }     
CATALOG { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CATALOG; 
      }     
INCLUDE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return INCLUDE; 
      }     
SELECT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SELECT; 
      }     
CHAR { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CHAR; 
      }         
SESSION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SESSION; 
      }     
CHAR_LENGTH { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CHAR_LENGTH; 
      }     
INDICATOR { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return INDICATOR; 
      }       
CHARACTER { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CHARACTER; 
      }     
INITIALLY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return INITIALLY; 
      }        
CHARACTER_LENGTH { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CHARACTER_LENGTH; 
      }     
INNER { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return INNER; 
      }     
SIZE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SIZE; 
      }     
CHECK { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CHECK; 
      }     
INPUT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return INPUT; 
      }     
SMALLINT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SMALLINT; 
      }       
INSENSITIVE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return INSENSITIVE; 
      }     
SOME { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SOME; 
      }               
SPACE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SPACE; 
      }        
INT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return INT; 
      }       
COLLATION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return COLLATION; 
      }     
INTEGER { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return INTEGER; 
      }     
SQLCA { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SQLCA; 
      }            
SQLCODE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SQLCODE; 
      }        
INTERVAL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return INTERVAL; 
      }     
SQLERROR { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SQLERROR; 
      }     
CONNECT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CONNECT; 
      }     
INTO { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return INTO; 
      }         
CONNECTION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CONNECTION; 
      }         
ISOLATION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ISOLATION; 
      }     
SUBSTRING { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SUBSTRING; 
      }     
CONSTRAINTS { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CONSTRAINTS; 
      }     
JOIN { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return JOIN; 
      }     
SUM { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SUM; 
      }     
CONTINUE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CONTINUE; 
      }            
LANGUAGE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return LANGUAGE; 
      }      
CORRESPONDING { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CORRESPONDING; 
      }     
LAST { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return LAST; 
      }     
TEMPORARY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TEMPORARY; 
      }     
COUNT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return COUNT; 
      }     
LEADING { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return LEADING; 
      }     
THEN { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return THEN; 
      }     
CREATE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CREATE; 
      }     
LEFT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return LEFT; 
      }     
TIME { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TIME; 
      }        
LEVEL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return LEVEL; 
      }     
TIMESTAMP { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TIMESTAMP; 
      }     
CURRENT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CURRENT; 
      }      
TIMEZONE_HOUR { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TIMEZONE_HOUR; 
      }     
CURRENT_DATE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CURRENT_DATE; 
      }     
LOCAL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return LOCAL; 
      }     
TIMEZONE_MINUTE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TIMEZONE_MINUTE; 
      }     
CURRENT_TIME { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CURRENT_TIME; 
      }     
LOWER { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return LOWER; 
      }         
CURRENT_TIMESTAMP { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CURRENT_TIMESTAMP; 
      }     
MATCH { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return MATCH; 
      }     
TRAILING { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TRAILING; 
      }     
CURRENT_USER { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CURRENT_USER; 
      }     
MAX { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return MAX; 
      }      
MIN { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return MIN; 
      }     
TRANSLATE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TRANSLATE; 
      }     
DATE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DATE; 
      }     
MINUTE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return MINUTE; 
      }     
TRANSLATION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TRANSLATION; 
      }     
DAY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DAY; 
      }     
MODULE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return MODULE; 
      }     
TRIM { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TRIM; 
      }     
DEALLOCATE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DEALLOCATE; 
      }     
MONTH { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return MONTH; 
      }     
TRUE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TRUE; 
      }     
DEC { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DEC; 
      }     
NAMES { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return NAMES; 
      }     
UNION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return UNION; 
      }     
DECIMAL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DECIMAL; 
      }     
NATIONAL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return NATIONAL; 
      }        
NATURAL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return NATURAL; 
      }     
UNKNOWN { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return UNKNOWN; 
      }          
NCHAR { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return NCHAR; 
      }     
UPDATE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return UPDATE; 
      }     
DEFERRABLE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DEFERRABLE; 
      }     
NEXT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return NEXT; 
      }     
UPPER { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return UPPER; 
      }     
DEFERRED { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DEFERRED; 
      }         
USAGE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return USAGE; 
      }                     
USING { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return USING; 
      }     
DESCRIBE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DESCRIBE; 
      }     
NULL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return NULL; 
      }     
VALUE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return VALUE; 
      }     
DESCRIPTOR { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DESCRIPTOR; 
      }     
VALUES { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return VALUES; 
      }          
NUMERIC { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return NUMERIC; 
      }     
VARCHAR { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return VARCHAR; 
      }     
DISCONNECT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DISCONNECT; 
      }     
OCTET_LENGTH { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return OCTET_LENGTH; 
      }            
VIEW { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return VIEW; 
      }     
DOMAIN { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DOMAIN; 
      }     
ON { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ON; 
      }        
DOUBLE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DOUBLE; 
      }     
ONLY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ONLY; 
      }     
WHENEVER { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return WHENEVER; 
      }             
ELSE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ELSE; 
      }     
OPTION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return OPTION; 
      }                
WORK { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return WORK; 
      }         
WRITE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return WRITE; 
      }        
OUTER { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return OUTER; 
      }     
YEAR { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return YEAR; 
      }       
OUTPUT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return OUTPUT; 
      }     
ZONE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ZONE; 
      }     
EXCEPTION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return EXCEPTION; 
      }     
ABSOLUTE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ABSOLUTE; 
      }     
HOST { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return HOST; 
      }               
RELEASE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return RELEASE; 
      }     
ADMIN { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ADMIN; 
      }     
IGNORE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return IGNORE; 
      }     
RESULT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return RESULT; 
      }     
AFTER { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return AFTER; 
      }     
IMMEDIATE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return IMMEDIATE; 
      }     
RETURNS { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return RETURNS; 
      }     
AGGREGATE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return AGGREGATE; 
      }     
ROLE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ROLE; 
      }     
ALIAS { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ALIAS; 
      }     
INITIALIZE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return INITIALIZE; 
      }     
ROLLUP { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ROLLUP; 
      }     
ALLOCATE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ALLOCATE; 
      }          
ROUTINE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ROUTINE; 
      }        
INOUT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return INOUT; 
      }     
ROW { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ROW; 
      }     
ARRAY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ARRAY; 
      }            
ASENSITIVE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ASENSITIVE; 
      }       
SAVEPOINT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SAVEPOINT; 
      }     
ASSERTION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ASSERTION; 
      }              
ASYMMETRIC { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ASYMMETRIC; 
      }     
INTERSECTION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return INTERSECTION; 
      }     
SCOPE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SCOPE; 
      }              
SEARCH { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SEARCH; 
      }     
ATOMIC { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ATOMIC; 
      }             
BEFORE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return BEFORE; 
      }     
ITERATE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ITERATE; 
      }          
BINARY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return BINARY; 
      }         
SENSITIVE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SENSITIVE; 
      }     
BIT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return BIT; 
      }     
LARGE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return LARGE; 
      }     
SEQUENCE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SEQUENCE; 
      }     
BLOB { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return BLOB; 
      }           
BOOLEAN { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return BOOLEAN; 
      }     
LATERAL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return LATERAL; 
      }     
SETS { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SETS; 
      }         
SIMILAR { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SIMILAR; 
      }     
BREADTH { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return BREADTH; 
      }     
LESS { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return LESS; 
      }     
CALL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CALL; 
      }           
CALLED { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CALLED; 
      }     
LIKE_REGEX { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return LIKE_REGEX; 
      }          
CARDINALITY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CARDINALITY; 
      }     
LIMIT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return LIMIT; 
      }     
SPECIFIC { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SPECIFIC; 
      }         
LN { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return LN; 
      }     
SPECIFICTYPE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SPECIFICTYPE; 
      }     
CAST { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CAST; 
      }         
SQL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SQL; 
      }       
LOCALTIME { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return LOCALTIME; 
      }     
SQLEXCEPTION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SQLEXCEPTION; 
      }        
LOCALTIMESTAMP { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return LOCALTIMESTAMP; 
      }     
SQLSTATE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SQLSTATE; 
      }     
LOCATOR { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return LOCATOR; 
      }     
SQLWARNING { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SQLWARNING; 
      }     
CLASS { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CLASS; 
      }     
MAP { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return MAP; 
      }     
START { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return START; 
      }     
CLOB { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CLOB; 
      }         
STATE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return STATE; 
      }        
MEMBER { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return MEMBER; 
      }     
STATEMENT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return STATEMENT; 
      }     
COLLECT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return COLLECT; 
      }     
METHOD { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return METHOD; 
      }     
STATIC { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return STATIC; 
      }     
COMPLETION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return COMPLETION; 
      }      
STDDEV_POP { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return STDDEV_POP; 
      }     
CONDITION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CONDITION; 
      }     
MOD { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return MOD; 
      }     
STDDEV_SAMP { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return STDDEV_SAMP; 
      }           
MODIFIES { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return MODIFIES; 
      }     
STRUCTURE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return STRUCTURE; 
      }       
MODIFY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return MODIFY; 
      }     
SUBMULTISET { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SUBMULTISET; 
      }           
SUBSTRING_REGEX { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SUBSTRING_REGEX; 
      }     
CONSTRUCTOR { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CONSTRUCTOR; 
      }        
SYMMETRIC { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SYMMETRIC; 
      }     
CORR { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CORR; 
      }     
MULTISET { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return MULTISET; 
      }     
SYSTEM { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return SYSTEM; 
      }                 
COVAR_POP { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return COVAR_POP; 
      }      
TERMINATE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TERMINATE; 
      }     
COVAR_SAMP { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return COVAR_SAMP; 
      }         
THAN { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return THAN; 
      }     
CUBE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CUBE; 
      }     
NCLOB { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return NCLOB; 
      }          
CUME_DIST { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CUME_DIST; 
      }     
NEW { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return NEW; 
      }         
CURRENT_CATALOG { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CURRENT_CATALOG; 
      }             
CURRENT_DEFAULT_TRANSFORM_GROUP { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CURRENT_DEFAULT_TRANSFORM_GROUP; 
      }     
NO { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return NO; 
      }          
CURRENT_PATH { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CURRENT_PATH; 
      }     
NONE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return NONE; 
      }          
CURRENT_ROLE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CURRENT_ROLE; 
      }     
NORMALIZE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return NORMALIZE; 
      }     
TRANSLATE_REGEX { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TRANSLATE_REGEX; 
      }     
CURRENT_SCHEMA { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CURRENT_SCHEMA; 
      }            
CURRENT_TRANSFORM_GROUP_FOR_TYPE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CURRENT_TRANSFORM_GROUP_FOR_TYPE; 
      }     
OBJECT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return OBJECT; 
      }     
TREAT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return TREAT; 
      }     
CYCLE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return CYCLE; 
      }     
OCCURRENCES_REGEX { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return OCCURRENCES_REGEX; 
      }        
DATA { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DATA; 
      }     
OLD { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return OLD; 
      }     
UESCAPE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return UESCAPE; 
      }         
UNDER { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return UNDER; 
      }         
OPERATION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return OPERATION; 
      }       
ORDINALITY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ORDINALITY; 
      }     
UNNEST { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return UNNEST; 
      }         
OUT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return OUT; 
      }         
OVERLAY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return OVERLAY; 
      }                 
DEPTH { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DEPTH; 
      }       
VAR_POP { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return VAR_POP; 
      }     
DEREF { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DEREF; 
      }     
PARAMETER { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PARAMETER; 
      }     
VAR_SAMP { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return VAR_SAMP; 
      }         
PARAMETERS { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PARAMETERS; 
      }              
VARIABLE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return VARIABLE; 
      }     
DESTROY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DESTROY; 
      }     
PARTITION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PARTITION; 
      }          
DESTRUCTOR { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DESTRUCTOR; 
      }     
PATH { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PATH; 
      }     
WIDTH_BUCKET { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return WIDTH_BUCKET; 
      }     
DETERMINISTIC { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DETERMINISTIC; 
      }     
POSTFIX { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return POSTFIX; 
      }     
WITHOUT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return WITHOUT; 
      }     
DICTIONARY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DICTIONARY; 
      }     
PREFIX { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PREFIX; 
      }     
WINDOW { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return WINDOW; 
      }     
DIAGNOSTICS { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DIAGNOSTICS; 
      }     
PREORDER { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PREORDER; 
      }     
WITHIN { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return WITHIN; 
      }                
PERCENT_RANK { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PERCENT_RANK; 
      }      
DYNAMIC { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return DYNAMIC; 
      }     
PERCENTILE_CONT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PERCENTILE_CONT; 
      }     
XMLAGG { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return XMLAGG; 
      }     
EACH { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return EACH; 
      }     
PERCENTILE_DISC { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return PERCENTILE_DISC; 
      }      
XMLATTRIBUTES { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return XMLATTRIBUTES; 
      }     
ELEMENT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return ELEMENT; 
      }     
POSITION_REGEX { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return POSITION_REGEX; 
      }     
XMLBINARY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return XMLBINARY; 
      }              
XMLCAST { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return XMLCAST; 
      }     
EQUALS { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return EQUALS; 
      }          
XMLCOMMENT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return XMLCOMMENT; 
      }     
EVERY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return EVERY; 
      }       
XMLCONCAT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return XMLCONCAT; 
      }       
RANGE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return RANGE; 
      }     
XMLDOCUMENT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return XMLDOCUMENT; 
      }         
READS { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return READS; 
      }     
XMLELEMENT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return XMLELEMENT; 
      }     
FILTER { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return FILTER; 
      }          
XMLEXISTS { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return XMLEXISTS; 
      }       
RECURSIVE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return RECURSIVE; 
      }     
XMLFOREST { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return XMLFOREST; 
      }        
REF { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return REF; 
      }     
XMLITERATE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return XMLITERATE; 
      }          
REFERENCING { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return REFERENCING; 
      }     
XMLNAMESPACES { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return XMLNAMESPACES; 
      }     
FREE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return FREE; 
      }    
REGR_AVGX { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return REGR_AVGX; 
      }     
XMLPARSE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return XMLPARSE; 
      }     
FULLTEXTTABLE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return FULLTEXTTABLE; 
      }     
REGR_AVGY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return REGR_AVGY; 
      }     
XMLPI { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return XMLPI; 
      }     
FUSION { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return FUSION; 
      }     
REGR_COUNT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return REGR_COUNT; 
      }     
XMLQUERY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return XMLQUERY; 
      }     
GENERAL { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return GENERAL; 
      }     
REGR_INTERCEPT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return REGR_INTERCEPT; 
      }     
XMLSERIALIZE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return XMLSERIALIZE; 
      }          
REGR_R2 { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return REGR_R2; 
      }     
XMLTABLE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return XMLTABLE; 
      }     
REGR_SLOPE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return REGR_SLOPE; 
      }     
XMLTEXT { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return XMLTEXT; 
      }          
REGR_SXX { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return REGR_SXX; 
      }     
XMLVALIDATE { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return XMLVALIDATE; 
      }     
GROUPING { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return GROUPING; 
      }     
REGR_SXY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return REGR_SXY; 
      }         
HOLD { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return HOLD; 
      }     
REGR_SYY { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return REGR_SYY; 
      }
 
{WhiteSpace} {/*Ignore*/}
{Comment} {/*Ignore*/}

"+" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Suma; 
      }
"-" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Resta; 
      }
"*" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Multiplicacion; 
      }
"/" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Division; 
      }
"%" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Porcentaje; 
      }
"<" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Menor; 
      }
"<=" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Menor_o_igual; 
      }
">" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Mayor; 
      }
">=" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Mayor_o_igual; 
      }
"=" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Igual; 
      }
"==" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Igualdad; 
      }
"!=" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Diferente; 
      }
"&&" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return And; 
      }
"||" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Or; 
      }
"!" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Not; 
      }
";" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Punto_y_coma; 
      }
"," { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Coma; 
      }
"." { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Punto; 
      }
"[" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Corchete_de_apertura; 
      }
"]" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Corchete_de_cierre; 
      }
"[]" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Corchetes; 
      }
"(" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Parentesis_de_apertura; 
      }
")" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Parentesis_de_cierre; 
      }
"()" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Parentesis; 
      }
"{" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Llave_de_apertura; 
      }
"}" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Llave_de_cierre; 
      }
"{}" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Llaves;   
      }
"@" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Arroba; 
      }
"#" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Numeral; 
      }   
"##" { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Doble_numeral; 
      }

{Identificador} { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1; 
        toString=yytext();
        return Identificador; 
      }

{Bit} { 
        getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Bit; 
      }

{Int} { 
        getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Int; 
      }

{Float} { 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Float; 
      }

{FloatExp} { 
        getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Float; 
      }

{String} { 
        getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return String; 
      }

/*Errores*/
{ErrorComment} {getColumnaInicial=yycolumn+1; getColumnaFinal=(yycolumn+1)+yytext().length()-1; getLinea=yyline+1; toString=yytext(); return Error_Comentario_Sin_Cerrar;}
{ErrorCadena} {getColumnaInicial=yycolumn+1; getColumnaFinal=(yycolumn+1)+yytext().length()-1; getLinea=yyline+1; toString=yytext(); return Error_Cadena_Invalida;}
 . {getColumnaInicial=yycolumn+1; getColumnaFinal=(yycolumn+1)+yytext().length()-1; getLinea=yyline+1; toString=yytext(); return Error_Caracter_Invalido;}
