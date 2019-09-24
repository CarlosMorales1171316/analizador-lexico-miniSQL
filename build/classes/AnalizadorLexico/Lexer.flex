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


/*DDL*/
DropDatabase =  (("DROP") {WhiteSpace}* ("DATABASE") {WhiteSpace}* (("IF") {WhiteSpace}* ("EXISTS"))? {WhiteSpace}* {Identificador} {WhiteSpace}* [";"])
             | (("DROP") {WhiteSpace}* ("DATABASE") {WhiteSpace}* (("IF") {WhiteSpace}* ("EXISTS"))? {WhiteSpace}* ({Identificador}{WhiteSpace}*[","]{WhiteSpace}*{Identificador}({WhiteSpace}*[","]{WhiteSpace}*{Identificador})*)+ {WhiteSpace}* [";"])

DropTable =   (("DROP") {WhiteSpace}* ("TABLE") {WhiteSpace}* (("IF") {WhiteSpace}* ("EXISTS"))? {WhiteSpace}* ({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) {WhiteSpace}* [";"])
            | (("DROP") {WhiteSpace}* ("TABLE") {WhiteSpace}* (("IF") {WhiteSpace}* ("EXISTS"))? {WhiteSpace}* ({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) ({WhiteSpace}* [","]{WhiteSpace}*({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}))+ {WhiteSpace}* [";"])
            | (("DROP") {WhiteSpace}* ("TABLE") {WhiteSpace}* (("IF") {WhiteSpace}* ("EXISTS"))? {WhiteSpace}* (["#"]|("##")) {Identificador} {WhiteSpace}* [";"])
            | (("DROP") {WhiteSpace}* ("TABLE") {WhiteSpace}* (("IF") {WhiteSpace}* ("EXISTS"))? {WhiteSpace}* (["#"]|("##")) {Identificador}({WhiteSpace}*[","]{WhiteSpace}*(["#"]|("##")) {Identificador})+ {WhiteSpace}* [";"])

DropLogin = (("DROP") {WhiteSpace}* ("LOGIN") {WhiteSpace}* {Identificador} {WhiteSpace}* [";"])

DropIndex =   (("DROP") {WhiteSpace}* ("INDEX") {WhiteSpace}* (("IF") {WhiteSpace}* ("EXISTS"))? {WhiteSpace}* {Identificador} {WhiteSpace}* ("ON") {WhiteSpace}* ({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) {WhiteSpace}* [";"])
            | (("DROP") {WhiteSpace}* ("INDEX") {WhiteSpace}* (("IF") {WhiteSpace}* ("EXISTS"))? {WhiteSpace}* {Identificador} {WhiteSpace}* ("ON") {WhiteSpace}* ({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) ({WhiteSpace}* [","] {WhiteSpace}* {Identificador} {WhiteSpace}* ("ON") {WhiteSpace}* ({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}))* {WhiteSpace}* [";"])
            | (("DROP") {WhiteSpace}* ("INDEX") {WhiteSpace}* (("IF") {WhiteSpace}* ("EXISTS"))? {WhiteSpace}* {Identificador} {WhiteSpace}* ("ON") {WhiteSpace}* ({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) {WhiteSpace}* ("WITH") {WhiteSpace}* ["("] {WhiteSpace}* ( (("ONLINE") {WhiteSpace}* ["="] {WhiteSpace}* ("ON"|"OFF") {WhiteSpace}*) | (("MAXDOP") {WhiteSpace}* ["="] {WhiteSpace}* {Digito} {WhiteSpace}*) | (("MOVE") {WhiteSpace}* ("TO") {WhiteSpace}* ({Identificador}|{Identificador}{WhiteSpace}*["("]{WhiteSpace}*{Identificador}{WhiteSpace}*[")"]{WhiteSpace}*)) | (("FILESTREAM_ON") {WhiteSpace}* {Identificador} {WhiteSpace}*) ) ({WhiteSpace}*[","]{WhiteSpace}*( (("ONLINE") {WhiteSpace}* ["="] {WhiteSpace}* ("ON"|"OFF") {WhiteSpace}*) | (("MAXDOP") {WhiteSpace}* ["="] {WhiteSpace}* {Digito} {WhiteSpace}*) | (("MOVE") {WhiteSpace}* ("TO") {WhiteSpace}* ({Identificador}|{Identificador}{WhiteSpace}*["("]{WhiteSpace}*{Identificador}{WhiteSpace}*[")"]{WhiteSpace}*)) | (("FILESTREAM_ON") {WhiteSpace}* {Identificador} {WhiteSpace}*) ))* {WhiteSpace}* [")"] {WhiteSpace}* [";"])
           
DropView = (("DROP") {WhiteSpace}* ("VIEW") {WhiteSpace}* (("IF") {WhiteSpace}* ("EXISTS"))? {WhiteSpace}* ({Identificador}"."{Identificador}|{Identificador}) {WhiteSpace}* [";"])
           | (("DROP") {WhiteSpace}* ("VIEW") {WhiteSpace}* (("IF") {WhiteSpace}* ("EXISTS"))? {WhiteSpace}* ({Identificador}"."{Identificador}|{Identificador})({WhiteSpace}* [","] {WhiteSpace}* ({Identificador}"."{Identificador}|{Identificador}))* {WhiteSpace}* [";"])



TruncateTable = (("TRUNCATE") {WhiteSpace}* ("TABLE") {WhiteSpace}* {Identificador} {WhiteSpace}* [";"])



/*Variables*/
%{
    public String toString;
    public Integer getLinea;
    public Integer getColumnaInicial;
    public Integer getColumnaFinal;
%}

/*Listas sin repeticion*/
%{
    ArrayList<String> IdentificadoresLista = new ArrayList<>();
    ArrayList<String> ReservadasLista = new ArrayList<>();
    ArrayList<String> OperadoresLista = new ArrayList<>();
%}
/*Listas de Constantes*/
%{
    ArrayList<String> ConstantesBooleanasLista = new ArrayList<>();
    ArrayList<String> ConstantesEnterasLista = new ArrayList<>();
    ArrayList<String> ConstantesDecimalesLista = new ArrayList<>();
    ArrayList<String> ConstantesExponencialesLista = new ArrayList<>();
    ArrayList<String> ConstantesCadenasLista = new ArrayList<>();
%}

%%
/*Reservadas*/
ADD |      
EXTERNAL |      
PROCEDURE |      
ALL  |    
FETCH |      
PUBLIC  |    
ALTER |     
FILE |     
RAISERROR |     
AND  |    
FILLFACTOR |     
READ |     
ANY |     
FOR |     
READTEXT |     
AS |     
FOREIGN |     
RECONFIGURE |     
ASC |     
FREETEXT |      
AUTHORIZATION |     
FREETEXTTABLE |     
REPLICATION |     
BACKUP |     
RESTORE |     
BEGIN |     
FULL |     
RESTRICT |     
BETWEEN |     
FUNCTION |     
RETURN |     
BREAK |     
GOTO |     
REVERT |     
BROWSE |     
GRANT |     
BULK |     
GROUP |     
RIGHT |        
CASCADE |     
HOLDLOCK |     
ROWCOUNT |     
CASE |     
IDENTITY |     
ROWGUIDCOL |      
IDENTITY_INSERT |     
RULE |     
CHECKPOINT |     
IDENTITYCOL |     
SAVE |     
CLOSE |     
IF |     
SCHEMA |     
CLUSTERED |     
IN |     
SECURITYAUDIT |     
COALESCE |     
INDEX |       
COLLATE |         
SEMANTICKEYPHRASETABLE |     
COLUMN |     
INSERT |     
SEMANTICSIMILARITYDETAILSTABLE |     
COMMIT |     
INTERSECT |     
SEMANTICSIMILARITYTABLE |     
COMPUTE |      
SESSION_USER |     
CONSTRAINT |     
IS |     
SET |     
CONTAINS |      
SETUSER |     
CONTAINSTABLE |     
KEY |     
SHUTDOWN |     
KILL |        
CONVERT |      
STATISTICS |      
LIKE |     
SYSTEM_USER |     
CROSS |     
LINENO |     
TABLE |     
LOAD |     
TABLESAMPLE |       
MERGE |     
TEXTSIZE |                  
NOCHECK |     
TO |     
NONCLUSTERED  |    
TOP |     
CURSOR |     
NOT |     
TRAN |     
DATABASE |        
TRANSACTION |     
DBCC |     
NULLIF |     
TRIGGER |          
OF |     
TRUNCATE |     
DECLARE |     
OFF |     
TRY_CONVERT |     
DEFAULT |     
OFFSETS |     
TSEQUAL |     
DELETE |        
DENY |     
OPEN |     
UNIQUE |     
DESC |     
OPENDATASOURCE |     
UNPIVOT |     
DISK |     
OPENQUERY |         
DISTINCT |     
OPENROWSET |     
UPDATETEXT |     
DISTRIBUTED |     
OPENXML |     
USE |       
USER |     
DROP |     
OR |     
DUMP |     
ORDER |     
VARYING |               
END |     
OVER |     
WAITFOR |     
ERRLVL |     
PERCENT |     
WHEN |     
ESCAPE |     
PIVOT |     
WHERE |     
EXCEPT |     
PLAN |     
WHILE |     
EXEC |      
PRECISION |      
WITH |      
EXECUTE |         
WITHIN GROUP |           
PRINT |     
WRITETEXT |      
EXIT |     
PROC |     
LABEL |           
OVERLAPS |     
ACTION |     
PAD |     
ADA |     
EXISTS |     
PARTIAL |       
PASCAL |     
EXTRACT |     
POSITION |     
FALSE |         
PREPARE |       
FIRST |     
PRESERVE |         
FLOAT |     
PRIMARY |     
ARE |     
PRIOR |       
PRIVILEGES |     
FORTRAN |              
FOUND |         
AT |     
FROM |         
REAL |     
AVG |     
GET |     
REFERENCES |     
GLOBAL |     
RELATIVE |        
GO |                 
REVOKE |     
BIT_LENGTH |             
BOTH |       
ROLLBACK |     
BY |     
HAVING |     
ROWS |         
HOUR |     
CASCADED |       
SCROLL |        
SECOND |           
SECTION |     
CATALOG |     
INCLUDE |     
SELECT |     
CHAR |         
SESSION |     
CHAR_LENGTH |     
INDICATOR |       
CHARACTER |     
INITIALLY |        
CHARACTER_LENGTH |     
INNER |     
SIZE |     
CHECK |     
INPUT |     
SMALLINT |       
INSENSITIVE |     
SOME |               
SPACE |        
INT |       
COLLATION |     
INTEGER |     
SQLCA |            
SQLCODE |        
INTERVAL |     
SQLERROR |     
CONNECT |     
INTO |         
CONNECTION |         
ISOLATION |     
SUBSTRING |     
CONSTRAINTS |     
JOIN |     
SUM |     
CONTINUE |            
LANGUAGE |      
CORRESPONDING |     
LAST |     
TEMPORARY |     
COUNT |     
LEADING |     
THEN |     
CREATE |     
LEFT |     
TIME |        
LEVEL |     
TIMESTAMP |     
CURRENT |      
TIMEZONE_HOUR |     
CURRENT_DATE |     
LOCAL |     
TIMEZONE_MINUTE |     
CURRENT_TIME |     
LOWER |         
CURRENT_TIMESTAMP |     
MATCH |     
TRAILING |     
CURRENT_USER |     
MAX |      
MIN |     
TRANSLATE |     
DATE |     
MINUTE |     
TRANSLATION |     
DAY |     
MODULE |     
TRIM |     
DEALLOCATE |     
MONTH |     
TRUE |     
DEC |     
NAMES |     
UNION |     
DECIMAL |     
NATIONAL |        
NATURAL |     
UNKNOWN |          
NCHAR |     
UPDATE |     
DEFERRABLE |     
NEXT |     
UPPER |     
DEFERRED |         
USAGE |                     
USING |     
DESCRIBE |     
NULL |     
VALUE |     
DESCRIPTOR |     
VALUES |          
NUMERIC |     
VARCHAR |     
DISCONNECT |     
OCTET_LENGTH |            
VIEW |     
DOMAIN |     
ON |        
DOUBLE |     
ONLY |     
WHENEVER |             
ELSE |     
OPTION |                
WORK |     
END-EXEC |     
WRITE |        
OUTER |     
YEAR |       
OUTPUT |     
ZONE |     
EXCEPTION |     
ABSOLUTE |     
HOST |               
RELEASE |     
ADMIN |     
IGNORE |     
RESULT |     
AFTER |     
IMMEDIATE |     
RETURNS |     
AGGREGATE |     
ROLE |     
ALIAS |     
INITIALIZE |     
ROLLUP |     
ALLOCATE |          
ROUTINE |        
INOUT |     
ROW |     
ARRAY |            
ASENSITIVE |       
SAVEPOINT |     
ASSERTION |              
ASYMMETRIC |     
INTERSECTION |     
SCOPE |              
SEARCH |     
ATOMIC |             
BEFORE |     
ITERATE |          
BINARY |         
SENSITIVE |     
BIT |     
LARGE |     
SEQUENCE |     
BLOB |           
BOOLEAN |     
LATERAL |     
SETS |         
SIMILAR |     
BREADTH |     
LESS |     
CALL |           
CALLED |     
LIKE_REGEX |          
CARDINALITY |     
LIMIT |     
SPECIFIC |         
LN |     
SPECIFICTYPE |     
CAST |         
SQL |       
LOCALTIME |     
SQLEXCEPTION |        
LOCALTIMESTAMP |     
SQLSTATE |     
LOCATOR |     
SQLWARNING |     
CLASS |     
MAP |     
START |     
CLOB |         
STATE |        
MEMBER |     
STATEMENT |     
COLLECT |     
METHOD |     
STATIC |     
COMPLETION |      
STDDEV_POP |     
CONDITION |     
MOD |     
STDDEV_SAMP |           
MODIFIES |     
STRUCTURE |       
MODIFY |     
SUBMULTISET |           
SUBSTRING_REGEX |     
CONSTRUCTOR |        
SYMMETRIC |     
CORR |     
MULTISET |     
SYSTEM |                 
COVAR_POP |      
TERMINATE |     
COVAR_SAMP |         
THAN |     
CUBE |     
NCLOB |          
CUME_DIST |     
NEW |         
CURRENT_CATALOG |             
CURRENT_DEFAULT_TRANSFORM_GROUP |     
NO |          
CURRENT_PATH |     
NONE |          
CURRENT_ROLE |     
NORMALIZE |     
TRANSLATE_REGEX |     
CURRENT_SCHEMA |            
CURRENT_TRANSFORM_GROUP_FOR_TYPE |     
OBJECT |     
TREAT |     
CYCLE |     
OCCURRENCES_REGEX |        
DATA |     
OLD |     
UESCAPE |         
UNDER |         
OPERATION |       
ORDINALITY |     
UNNEST |         
OUT |         
OVERLAY |                 
DEPTH |       
VAR_POP |     
DEREF |     
PARAMETER |     
VAR_SAMP |         
PARAMETERS |              
VARIABLE |     
DESTROY |     
PARTITION |          
DESTRUCTOR |     
PATH |     
WIDTH_BUCKET |     
DETERMINISTIC |     
POSTFIX |     
WITHOUT |     
DICTIONARY |     
PREFIX |     
WINDOW |     
DIAGNOSTICS |     
PREORDER |     
WITHIN |                
PERCENT_RANK |      
DYNAMIC |     
PERCENTILE_CONT |     
XMLAGG |     
EACH |     
PERCENTILE_DISC |      
XMLATTRIBUTES |     
ELEMENT |     
POSITION_REGEX |     
XMLBINARY |              
XMLCAST |     
EQUALS |          
XMLCOMMENT |     
EVERY |       
XMLCONCAT |       
RANGE |     
XMLDOCUMENT |         
READS |     
XMLELEMENT |     
FILTER |          
XMLEXISTS |       
RECURSIVE |     
XMLFOREST |        
REF |     
XMLITERATE |          
REFERENCING |     
XMLNAMESPACES |     
FREE |    
REGR_AVGX |     
XMLPARSE |     
FULLTEXTTABLE |     
REGR_AVGY |     
XMLPI |     
FUSION |     
REGR_COUNT |     
XMLQUERY |     
GENERAL |     
REGR_INTERCEPT |     
XMLSERIALIZE |          
REGR_R2 |     
XMLTABLE |     
REGR_SLOPE |     
XMLTEXT |          
REGR_SXX |     
XMLVALIDATE |     
GROUPING |     
REGR_SXY |         
HOLD |     
REGR_SYY |     
while { if(ReservadasLista.contains(yytext())){
        getColumnaInicial=yycolumn+1; getColumnaFinal=(yycolumn+1)+yytext().length()-1; getLinea=yyline+1; toString=yytext(); return Reservada;
      } else {
        ReservadasLista.add(yytext()); 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Reservada; 
      }
} 
{WhiteSpace} {/*Ignore*/}
{Comment} {/*Ignore*/}
"+" |
"-" |
"*" |
"/" |
"%" |
"<" |
"<=" |
">" |
">=" |
"=" |
"==" | 
"!=" |
"&&" |
"||" |
"!" |
";" |
"," |
"." |
"[" |
"]" |
"[]" |
"(" |
")" |
"()" |
"{" |
"}" |
"{}" |
"@" |
"#" |    
"##" |
while { if(OperadoresLista.contains(yytext())){
        getColumnaInicial=yycolumn+1; getColumnaFinal=(yycolumn+1)+yytext().length()-1; getLinea=yyline+1; toString=yytext(); return Operador;
      } else {
        OperadoresLista.add(yytext()); 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1; 
        toString=yytext();
        return Operador; 
      }
}

{Identificador} { if(IdentificadoresLista.contains(yytext())){
        getColumnaInicial=yycolumn+1; getColumnaFinal=(yycolumn+1)+yytext().length()-1; getLinea=yyline+1; toString=yytext(); return Identificador;
      } else {
        IdentificadoresLista.add(yytext()); 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1; 
        toString=yytext();
        return Identificador; 
      }
}

{Bit} { if(ConstantesBooleanasLista.contains(yytext())){
        getColumnaInicial=yycolumn+1; getColumnaFinal=(yycolumn+1)+yytext().length()-1; getLinea=yyline+1; toString=yytext(); return Bit;
      } else {
        ConstantesBooleanasLista.add(yytext()); 
        getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Bit; 
      }
}
{Int} { if(ConstantesEnterasLista.contains(yytext())){
        getColumnaInicial=yycolumn+1; getColumnaFinal=(yycolumn+1)+yytext().length()-1; getLinea=yyline+1; toString=yytext(); return Int;
      } else {
        ConstantesEnterasLista.add(yytext()); 
        getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Int; 
      }
}

{Float} { if(ConstantesDecimalesLista.contains(yytext())){
        getColumnaInicial=yycolumn+1; getColumnaFinal=(yycolumn+1)+yytext().length()-1; getLinea=yyline+1; toString=yytext(); return Float;
      } else {
        ConstantesDecimalesLista.add(yytext()); 
        getLinea=yyline+1; 
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext(); 
        return Float; 
      }
}
{FloatExp} { if(ConstantesExponencialesLista.contains(yytext())){
        getColumnaInicial=yycolumn+1; getColumnaFinal=(yycolumn+1)+yytext().length()-1; getLinea=yyline+1; toString=yytext(); return Float;
      } else {
        ConstantesExponencialesLista.add(yytext()); 
        getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Float; 
      }
}
{String} { if(ConstantesCadenasLista.contains(yytext())){
         getColumnaInicial=yycolumn+1; getColumnaFinal=(yycolumn+1)+yytext().length()-1; getLinea=yyline+1; toString=yytext(); return String;
      } else {
        ConstantesCadenasLista.add(yytext()); 
        getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return String; 
      }
}

{DropDatabase} { getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Drop; 
      }
{DropTable} { getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Drop; 
      }
{DropLogin} { getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Drop; 
      }
{DropIndex} { getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Drop; 
      }
{DropView} { getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Drop; 
      }



/*Errores*/
{ErrorComment} {getColumnaInicial=yycolumn+1; getColumnaFinal=(yycolumn+1)+yytext().length()-1; getLinea=yyline+1; toString=yytext(); return Error_Comentario_Sin_Cerrar;}
{ErrorCadena} {getColumnaInicial=yycolumn+1; getColumnaFinal=(yycolumn+1)+yytext().length()-1; getLinea=yyline+1; toString=yytext(); return Error_Cadena_Invalida;}
 . {getColumnaInicial=yycolumn+1; getColumnaFinal=(yycolumn+1)+yytext().length()-1; getLinea=yyline+1; toString=yytext(); return Error_Caracter_Invalido;}

