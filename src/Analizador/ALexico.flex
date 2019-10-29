package Analizador;
import static Analizador.Tokens.*;

%%
%class ALexico
%type Tokens
%line
%column

/*DICCIONARIOS*/
L=[a-zA-Z]+
D=[0-9]+
Digito = [0-9]
Numero = {Digito} {Digito}*
Letra = [A-Za-z]
Palabra = {Letra} {Letra}*
Guion = "_"
Espacio = [ \t\r\n]+
Operador = "+"|"-"|"*"|"/"|"%"|"<"|"<="|">"|">="|"="|"=="|"!="|"&&"|"||"
Puntuacion = "!"|";"|","|"."
SignosA = "[]"|"()"|"{}"
Simbolos = "@"|"#"|"##"
SignosApertura = "["|"{"|"("
SignosCierre = "]"|"}"|")"
Salto = \r| \n| \r\n
EspacioE = [ \t]
Empty = {Salto} | {EspacioE}

/*VARIABLES*/
%{
    public String lexeme;
    public int line;
    public int initialcolumn;
    public int finalcolumn;
%}

%%
/*RESERVADAS*/
"ADD" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ADD;}
"EXTERNAL" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return EXTERNAL;}
"FETCH" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return FETCH;}
"PUBLIC" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return PUBLIC;}
"ALTER" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ALTER;}
"FILE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return FILE;}
"RAISERROR" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return RAISERROR;}
"AND" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return AND;}
"FILLFACTOR" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return FILLFACTOR;}
"READ" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return READ;}
"ANY" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ANY;}
"FOR" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return FOR;}
"READTEXT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return READTEXT;}
"AS" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return AS;}
"FOREIGN" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return FOREIGN;}
"RECONFIGURE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return RECONFIGURE;}
"FREETEXT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return FREETEXT;}
"REFERENCES" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return REFERENCES;}
"AUTHORIZATION" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return AUTHORIZATION;}
"FREETEXTTABLE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return FREETEXTTABLE;}
"REPLICATION" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return REPLICATION;}
"BACKUP" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return BACKUP;}
"FROM" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return FROM;}
"RESTORE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return RESTORE;}
"BEGIN" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return BEGIN;}
"FULL" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return FULL;}
"RESTRICT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return RESTRICT;}
"BETWEEN" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return BETWEEN;}
"FUNCTION" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return FUNCTION;}
"RETURN" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return RETURN;}
"BREAK" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return BREAK;}
"GOTO" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return GOTO;}
"REVERT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return REVERT;}
"BROWSE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return BROWSE;}
"GRANT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return GRANT;}
"REVOKE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return REVOKE;}
"BULK" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return BULK;}
"GROUP" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return GROUP;}
"RIGHT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return RIGHT;}
"BY" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return BY;}
"HAVING" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return HAVING;}
"ROLLBACK" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ROLLBACK;}
"CASCADE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CASCADE;}
"HOLDLOCK" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return HOLDLOCK;}
"ROWCOUNT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ROWCOUNT;}
"CASE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CASE;}
"IDENTITY" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return IDENTITY;}
"ROWGUIDCOL" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ROWGUIDCOL;}
"CHECK" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CHECK;}
"IDENTITY_INSERT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return IDENTITY_INSERT;}
"RULE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return RULE;}
"CHECKPOINT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CHECKPOINT;}
"IDENTITYCOL" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return IDENTITYCOL;}
"SAVE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SAVE;}
"CLOSE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CLOSE;}
"IF" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return IF;}
"SCHEMA" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SCHEMA;}
"CLUSTERED" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CLUSTERED;}
"IN" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return IN;}
"SECURITYAUDIT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SECURITYAUDIT;}
"COALESCE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return COALESCE;}
"INDEX" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return INDEX;}
"SELECT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SELECT;}
"COLLATE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return COLLATE;}
"INNER" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return INNER;}
"SEMANTICKEYPHRASETABLE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SEMANTICKEYPHRASETABLE;}
"COLUMN" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return COLUMN;}
"INSERT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return INSERT;}
"SEMANTICSIMILARITYDETAILSTABLE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SEMANTICSIMILARITYDETAILSTABLE;}
"COMMIT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return COMMIT;}
"INTERSECT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return INTERSECT;}
"SEMANTICSIMILARITYTABLE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SEMANTICSIMILARITYTABLE;}
"COMPUTE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return COMPUTE;}
"INTO" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return INTO;}
"SESSION_USER" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SESSION_USER;}
"CONSTRAINT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CONSTRAINT;}
"IS" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return IS;}
"SET" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SET;}
"CONTAINS" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CONTAINS;}
"JOIN" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return JOIN;}
"SETUSER" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SETUSER;}
"CONTAINSTABLE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CONTAINSTABLE;}
"KEY" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return KEY;}
"SHUTDOWN" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SHUTDOWN;}
"CONTINUE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CONTINUE;}
"KILL" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return KILL;}
"SOME" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SOME;}
"CONVERT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CONVERT;}
"LEFT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return LEFT;}
"STATISTICS" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return STATISTICS;}
"CREATE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CREATE;}
"LIKE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return LIKE;}
"SYSTEM_USER" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SYSTEM_USER;}
"CROSS" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CROSS;}
"LINENO" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return LINENO;}
"TABLE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return TABLE;}
"CURRENT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CURRENT;}
"LOAD" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return LOAD;}
"TABLESAMPLE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return TABLESAMPLE;}
"CURRENT_DATE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CURRENT_DATE;}
"MERGE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return MERGE;}
"TEXTSIZE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return TEXTSIZE;}
"CURRENT_TIME" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CURRENT_TIME;}
"NATIONAL" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return NATIONAL;}
"THEN" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return THEN;}
"CURRENT_TIMESTAMP" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CURRENT_TIMESTAMP;}
"NOCHECK" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return NOCHECK;}
"TO" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return TO;}
"CURRENT_USER" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CURRENT_USER;}
"NONCLUSTERED" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return NONCLUSTERED;}
"TOP" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return TOP;}
"CURSOR" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CURSOR;}
"NOT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return NOT;}
"TRAN" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return TRAN;}
"DATABASE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DATABASE;}
"NULL" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return NULL;}
"TRANSACTION" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return TRANSACTION;}
"DBCC" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DBCC;}
"NULLIF" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return NULLIF;}
"TRIGGER" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return TRIGGER;}
"DEALLOCATE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DEALLOCATE;}
"OF" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return OF;}
"TRUNCATE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return TRUNCATE;}
"DECLARE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DECLARE;}
"OFF" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return OFF;}
"TRY_CONVERT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return TRY_CONVERT;}
"DEFAULT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DEFAULT;}
"OFFSETS" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return OFFSETS;}
"TSEQUAL" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return TSEQUAL;}
"DELETE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DELETE;}
"ON" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ON;}
"UNION" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return UNION;}
"DENY" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DENY;}
"OPEN" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return OPEN;}
"UNIQUE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return UNIQUE;}
"DESC" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DESC;}
"OPENDATASOURCE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return OPENDATASOURCE;}
"UNPIVOT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return UNPIVOT;}
"DISK" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DISK;}
"OPENQUERY" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return OPENQUERY;}
"UPDATE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return UPDATE;}
"DISTINCT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DISTINCT;}
"OPENROWSET" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return OPENROWSET;}
"UPDATETEXT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return UPDATETEXT;}
"DISTRIBUTED" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DISTRIBUTED;}
"OPENXML" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return OPENXML;}
"USE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return USE;}
"DOUBLE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DOUBLE;}
"OPTION" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return OPTION;}
"USER" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return USER;}
"DROP" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DROP;}
"OR" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return OR;}
"VALUES" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return VALUES;}
"DUMP" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DUMP;}
"ORDER" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ORDER;}
"ARYING" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ARYING;}
"ELSE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ELSE;}
"OUTER" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return OUTER;}
"VIEW" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return VIEW;}
"END" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return END;}
"OVER" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return OVER;}
"WAITFOR" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return WAITFOR;}
"ERRLVL" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ERRLVL;}
"PERCENT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return PERCENT;}
"WHEN" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return WHEN;}
"ESCAPE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ESCAPE;}
"PIVOT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return PIVOT;}
"WHERE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return WHERE;}
"EXCEPT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return EXCEPT;}
"PLAN" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return PLAN;}
"WHILE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return WHILE;}
"EXEC" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return EXEC;}
"PRECISION" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return PRECISION;}
"WITH" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return WITH;}
"EXECUTE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return EXECUTE;}
"PRIMARY" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return PRIMARY;}
"WITHIN GROUP" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return WITHIN_GROUP;}
"EXISTS" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return EXISTS;}
"PRINT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return PRINT;}
"WRITETEXT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return WRITETEXT;}
"EXIT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return EXIT;}
"PROC" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return PROC;}
"ABSOLUTE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ABSOLUTE;}
"OVERLAPS" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return OVERLAPS;}
"ACTION" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ACTION;}
"PAD" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return PAD;}
"ADA" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ADA;}
"PARTIAL" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return PARTIAL;}
"PASCAL" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return PASCAL;}
"ALL" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ALL;}
"EXTRACT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return EXTRACT;}
"POSITION" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return POSITION;}
"ALLOCATE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ALLOCATE;}
"FALSE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return FALSE;}
"PREPARE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return PREPARE;}
"FIRST" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return FIRST;}
"PRESERVE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return PRESERVE;}
"FLOAT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return FLOAT;}
"ARE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ARE;}
"PRIOR" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return PRIOR;}
"PRIVILEGES" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return PRIVILEGES;}
"ASC" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ASC;}
"FORTRAN" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return FORTRAN;}
"PROCEDURE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return PROCEDURE;}
"ASSERTION" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ASSERTION;}
"FOUND" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return FOUND;}
"AT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return AT;}
"REAL" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return REAL;}
"AVG" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return AVG;}
"GET" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return GET;}
"GLOBAL" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return GLOBAL;}
"RELATIVE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return RELATIVE;}
"GO" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return GO;}
"BIT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return BIT;}
"BIT_LENGTH" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return BIT_LENGTH;}
"BOTH" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return BOTH;}
"ROWS" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ROWS;}
"HOUR" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return HOUR;}
"CASCADED" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CASCADED;}
"SCROLL" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SCROLL;}
"IMMEDIATE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return IMMEDIATE;}
"SECOND" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SECOND;}
"CAST" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CAST;}
"IN" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return IN;}
"SECTION" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SECTION;}
"CATALOG" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CATALOG;}
"INCLUDE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return INCLUDE;}
"CHAR" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CHAR;}
"SESSION" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SESSION;}
"CHAR_LENGTH" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CHAR_LENGTH;}
"INDICATOR" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return INDICATOR;}
"CHARACTER" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CHARACTER;}
"INITIALLY" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return INITIALLY;}
"CHARACTER_LENGTH" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CHARACTER_LENGTH;}
"SIZE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SIZE;}
"INPUT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return INPUT;}
"SMALLINT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SMALLINT;}
"INSENSITIVE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return INSENSITIVE;}
"SPACE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SPACE;}
"INT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return INT;}
"SQL" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SQL;}
"COLLATION" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return COLLATION;}
"INTEGER" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return INTEGER;}
"SQLCA" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SQLCA;}
"SQLCODE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SQLCODE;}
"INTERVAL" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return INTERVAL;}
"SQLERROR" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SQLERROR;}
"CONNECT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CONNECT;}
"SQLSTATE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SQLSTATE;}
"CONNECTION" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CONNECTION;}
"SQLWARNING" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SQLWARNING;}
"ISOLATION" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ISOLATION;}
"SUBSTRING" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SUBSTRING;}
"CONSTRAINTS" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CONSTRAINTS;}
"SUM" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SUM;}
"LANGUAGE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return LANGUAGE;}
"CORRESPONDING" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CORRESPONDING;}
"LAST" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return LAST;}
"TEMPORARY" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return TEMPORARY;}
"COUNT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return COUNT;}
"LEADING" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return LEADING;}
"TIME" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return TIME;}
"LEVEL" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return LEVEL;}
"TIMESTAMP" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return TIMESTAMP;}
"TIMEZONE_HOUR" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return TIMEZONE_HOUR;}
"LOCAL" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return LOCAL;}
"TIMEZONE_MINUTE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return TIMEZONE_MINUTE;}
"LOWER" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return LOWER;}
"MATCH" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return MATCH;}
"TRAILING" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return TRAILING;}
"MAX" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return MAX;}
"MIN" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return MIN;}
"TRANSLATE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return TRANSLATE;}
"DATE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DATE;}
"MINUTE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return MINUTE;}
"TRANSLATION" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return TRANSLATION;}
"DAY" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DAY;}
"MODULE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return MODULE;}
"TRIM" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return TRIM;}
"MONTH" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return MONTH;}
"TRUE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return TRUE;}
"DEC" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DEC;}
"NAMES" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return NAMES;}
"DECIMAL" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DECIMAL;}
"NATURAL" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return NATURAL;}
"UNKNOWN" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return UNKNOWN;}
"NCHAR" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return NCHAR;}
"DEFERRABLE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DEFERRABLE;}
"NEXT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return NEXT;}
"UPPER" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return UPPER;}
"DEFERRED" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DEFERRED;}
"NO" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return NO;}
"USAGE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return USAGE;}
"NONE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return NONE;}
"USING" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return USING;}
"DESCRIBE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DESCRIBE;}
"VALUE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return VALUE;}
"DESCRIPTOR" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DESCRIPTOR;}
"DIAGNOSTICS" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DIAGNOSTICS;}
"NUMERIC" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return NUMERIC;}
"VARCHAR" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return VARCHAR;}
"DISCONNECT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DISCONNECT;}
"OCTET_LENGTH" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return OCTET_LENGTH;}
"VARYING" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return VARYING;}
"DOMAIN" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DOMAIN;}
"ON" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ON;}
"ONLY" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ONLY;}
"WHENEVER" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return WHENEVER;}
"WORK" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return WORK;}
"END-EXEC" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return END_EXEC;}
"WRITE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return WRITE;}
"YEAR" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return YEAR;}
"OUTPUT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return OUTPUT;}
"ZONE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ZONE;}
"EXCEPTION" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return EXCEPTION;}
"OUT" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return OUT;}
"READONLY" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return READONLY;}
"ENCRYPTION" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return ENCRYPTION;}
"RETURNS" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return RETURNS;}
"SCHEMABINDING" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SCHEMABINDING;}
"CALLED" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CALLED;}
"INLINE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return INLINE;}
"CALLER" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return CALLER;}
"SELF" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SELF;}
"OWNER" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return OWNER;}
"RECOMPILE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return RECOMPILE;}
"MARK" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return MARK;}
"FORWARD_ONLY" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return FORWARD_ONLY;}
"STATIC" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return STATIC;}
"KEYSET" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return KEYSET;}
"DYNAMIC" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return DYNAMIC;}
"FAST_FORWARD" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return FAST_FORWARD;}
"READ_ONLY" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return READ_ONLY;}
"SCROLL_LOCKS" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return SCROLL_LOCKS;}
"OPTIMISTIC" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return OPTIMISTIC;}
"TYPE_WARNING" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return TYPE_WARNING;}
"NAME" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return NAME;} 
"FILENAME" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return FILENAME;} 
"KB" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return KB;} 
"GB" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return GB;}
"TB" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return TB;}
"MB" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return MB;}
"MAXSIZE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return MAXSIZE;} 
"UNLIMITED" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return UNLIMITED;} 
"FILEGROWTH" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return FILEGROWTH;}
"MODULAR" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return MODULAR;}
"EXECUTE_AS_CLAUSE" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return EXECUTE_AS_CLAUSE;}
";"{Empty}*"GO" {lexeme = yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength() -1; return PYCGO;}

/*WHITESPACE*/
{Espacio}+ {/*Ignore*/}

/*COMENTARIOS*/
"--".* {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Comentario;}
("/*" [^*] ~"*/") {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Comentario;}
("/*" [*.]+ ~"*/") {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Comentario;}
("/*"[^\r\n.*]*) {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return ComentarioE;}
//("/*"([^*/])*) {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return ComentarioE;}

/*CONSTANTES*/
(0|1|NULL) {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Bit;}
({Numero}) {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Int;}
("-"{Numero})|("+"{Numero}) {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Int;}
("'"([^'\r\n])*"'") {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return String;}
("'") {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return ERROR;}
("'"([^'\r\n]*)) {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return StringE;}
({Numero}+"."{Numero}*) {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Float;}
({Numero}+"."{Numero}*(E|e)?("+"|"-")?{Numero}?) {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Float;}

/*OPERADORES*/
"=" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Igual;}
("+") {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Suma;}
"-" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Resta;}
"*" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Multiplicacion;}
"/" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Division;}
"%" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Porcentaje;}
"<" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Menor_que;}
"<=" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Menor_o_igual_que;}
">" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Mayor_que;}
">=" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Mayor_o_igual_que;}
"==" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Operador_de_Igualdad;}
"!=" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Operador_no_igual;}
"&&" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Operador_AND;}
"||" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Operador_OR;}
"!" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Signo_de_Exclamación;}
"?" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Cierre_signo_de_Interrogacion;}
"¿" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Apertura_signo_de_Interrogacion;}
";" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Punto_y_coma;}
(,) {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Coma;}
"." {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Punto;}
"@" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Arroba;}
"#" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Numeral;}
"##" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Doble_Numeral;}
"[]" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Corchetes;}
"{}" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Llaves;}
"()" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Paréntesis;}
"[" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Apertura_de_corchetes;}
"{" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Apertura_de_llaves;}
"(" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Apertura_de_paréntesis;}
"]" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Cierre_de_corchetes;}
"}" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Cierre_de_llaves;}
")" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Cierre_de_paréntesis;}
"_" {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Guión_bajo;}

/*IDENTIFICADOR*/
{L}({L}|{D}|{Guion})* {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return Identificador;}

. {lexeme=yytext(); line = yyline; initialcolumn = yycolumn; finalcolumn = yycolumn + yylength()-1; return ERROR;}

