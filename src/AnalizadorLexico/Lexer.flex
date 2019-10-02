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
letra=[a-zA-Z'-]+ 
LetraGuion=[a-zA-Z_]+
letraGuion= [a-zA-Z_,'-]+
Digito=0|[1-9][0-9]*
digito=0|[1-9][0-9]*|[0-9][0-9]*
Signos = (["["]|["]"]|["("]|[")"]|["#"]|["##"]|["."]|[","]|["-"]|["/"]|[";"]|["{"]|["}"])
DataType = ("CHAR(" {Digito} ")" | "BINARY(" {Digito} ")" |"BLOB("{Digito}")" | "BIT("{Digito}")" |"SMALLINT(" {Digito} ")" | "INT("{Digito}")" | "INTEGER("{Digito}")" |  "FLOAT("{Digito}")" | "CHAR("{Digito}")" | "VARCHAR("{Digito}")" | "BINARY("{Digito}")" | "FLOAT("{Digito}")"|("BLOB") |("INT") |("BOOLEAN") | ("DATE") | ("YEAR") | ("VARCHAR(MAX)") |("IMAGE") | ("BIT") | ("SMALLINT") | ("REAL")| ("DATE") | ("TIME") | ("TIMESTAMP") |("CURSOR") |("TABLE") | ("TEXT") | ("BYTE") | ("INTEGER") | ("LONG")|("DOUBLE")|("TEXT")| ("NCHAR") |("VARCHAR"))

/*Identificador*/
Identificador = {Letra}({LetraGuion}|{Digito})* 
identificador = {letra}({letraGuion}|{digito})*


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
Espacio = [ ]
WhiteSpace = {LineTerminator} | [ \t\f]

/*Comentarios*/
SQLSingleLineComment = "--" {InputCharacter}*
SQLMultiLineComment = ("/*" ~"*/")  
Comment = {SQLSingleLineComment} | {SQLMultiLineComment}
ErrorComment = ("/*"[^\r\n.*]*)  
ErrorCadena = ("'"([^'\r\n]*))

/*DML*/
/*SELECT*/
select = (("SELECT") {WhiteSpace}+ ( "."|("("| ")"|{identificador}) {WhiteSpace}*)+  {WhiteSpace}* ("FROM") {WhiteSpace}* (({identificador}|"("|")"|".") {WhiteSpace}*)+ {WhiteSpace}*  ("AS" {WhiteSpace}* {identificador} {WhiteSpace}* ("(")? {WhiteSpace}* ({identificador}  {WhiteSpace}*)+ (")")?)?   {WhiteSpace}* (("WHERE")  {WhiteSpace}* ( ("<"|">"|"-" |"@"|"="|"("|")" |{identificador}) {WhiteSpace}*)+)?)
select_list = (([""] | ({Identificador}"."{Identificador} | {Identificador}) | ({expression} ({WhiteSpace} (("AS"){WhiteSpace}+)? {Identificador})?)  |  ({Identificador} {WhiteSpace}* ["="] {WhiteSpace}* {expression}))  ({WhiteSpace}* [","] {WhiteSpace}* ([""] | ({Identificador}"."{Identificador} | {Identificador}) | ({expression} ({WhiteSpace} (("AS"){WhiteSpace}+)? {Identificador})?)  |  ({Identificador} {WhiteSpace}* ["="] {WhiteSpace}* {expression})))*)
expression = (({Identificador}|{Int}|{Float}|("@"){Identificador}|"'"{Identificador}"'"|"'"{Int}"'"|"'"{Float}"'") |  (["("] {WhiteSpace}* ({Identificador}|{Int}|{Float}|("@"){Identificador}|"'"{Identificador}"'"|"'"{Int}"'"|"'"{Float}"'") {WhiteSpace}* [")"]))
Select = (("SELECT") ({WhiteSpace}+(("ALL")|("DISTINCT")))? ({WhiteSpace}+("TOP") {WhiteSpace}* ({Digito}|["("]{WhiteSpace}{Digito}{WhiteSpace}[")"]) ({WhiteSpace}+("PERCENT"))?)? {WhiteSpace}+ {select_list} ({WhiteSpace}* ("INTO") {WhiteSpace}* {Identificador})? ({WhiteSpace}* ("FROM") {WhiteSpace}* (({Identificador} |"."|"("|")"|"["|"]") {WhiteSpace})+)? ({WhiteSpace} ("WHERE") {WhiteSpace}* (({Identificador} |"."|"("|")"|"["|"]") {WhiteSpace})+)?  {WhiteSpace} (";") {WhiteSpace}* ("GO"))


/*INSERT*/
insertValues = ((("(") {WhiteSpace}* ({identificador} {WhiteSpace}*)+ {WhiteSpace}* (")")) | (("VALUES") {WhiteSpace}* ({WhiteSpace}* ("(") {WhiteSpace}* (("DEFAULT"|"NULL" | (( "(" |")" |{identificador}) {WhiteSpace}*)+) {WhiteSpace}* (",")?) {WhiteSpace}* (")") {WhiteSpace}* (",")? )+) | (("DEFAULT") {WhiteSpace}* ("VALUES")) | {select})     
Insert = ( ("INSERT") ({WhiteSpace}+ ("TOP") {WhiteSpace}* (("(") {WhiteSpace}* {Digito} {WhiteSpace}*(")") | ({Digito})) ({WhiteSpace}* ("PERCENT") {WhiteSpace}*)?)? ({WhiteSpace}+ ("INTO"))? {WhiteSpace}* ((("##"|"#") {Identificador})|({Identificador}"."{Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador})) {WhiteSpace}* (("(") {WhiteSpace}* ({identificador} {WhiteSpace}*)+ (")"))? {WhiteSpace}* {insertValues} {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))

/*UPDATE*/
from = ((({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) ({WhiteSpace}* ("AS") {WhiteSpace}* {Identificador})?) | ((({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) ({WhiteSpace}* ("AS") {WhiteSpace}* {Identificador})?) {WhiteSpace}+ {join_type} {WhiteSpace}+ (({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) ({WhiteSpace}* ("AS") {WhiteSpace}* {Identificador})?)) | ((({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) ({WhiteSpace}* ("AS") {WhiteSpace}* {Identificador})?) {WhiteSpace}* ("CROSS") {WhiteSpace}* ("JOIN") {WhiteSpace}* (({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) ({WhiteSpace}* ("AS") {WhiteSpace}* {Identificador})?)) | (["("]  {WhiteSpace}* (({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) ({WhiteSpace}* ("AS") {WhiteSpace}* {Identificador})?) {WhiteSpace}* [")"]) | (["("] {WhiteSpace}* ((({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) ({WhiteSpace}* ("AS") {WhiteSpace}* {Identificador})?) {WhiteSpace}+ {join_type} {WhiteSpace}+ (({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) ({WhiteSpace}* ("AS") {WhiteSpace}* {Identificador})?)) {WhiteSpace}* [")"])  {WhiteSpace}* ("ON") {WhiteSpace}* {Where})     
join_type = (((("INNER"){WhiteSpace}+)? ("JOIN")) | (("LEFT"){WhiteSpace}+ (("OUTER"){WhiteSpace}+)? ("JOIN")) | (("RIGHT"){WhiteSpace}+ (("OUTER"){WhiteSpace}+)? ("JOIN")) | (("FULL"){WhiteSpace}+ (("OUTER"){WhiteSpace}+)? ("JOIN")))
Update = (("UPDATE") {WhiteSpace}+ (("TOP") {WhiteSpace}* ({Digito}|["("]{WhiteSpace}*{Digito}{WhiteSpace}*[")"]) ({WhiteSpace}+("PERCENT"))?)? {WhiteSpace}* ({Identificador}"."{Identificador}"."{Identificador}"."{Identificador}|{Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador} | ["@"]{Identificador}) {WhiteSpace}+ ("SET") {WhiteSpace}*  ({Identificador} {WhiteSpace}* ["="] {WhiteSpace}* {Identificador}|{Int}|{Float}|("@"){Identificador}|"'"{Identificador}"'"|"'"{Int}"'"|"'"{Float}"'" |("NULL")|("DEFAULT")) | (("@"){Identificador} {WhiteSpace}* (["="] | ("<>") | ("!=") | [">"] | (">=") | ["<"] | ("<=")) {WhiteSpace}* ({Identificador}|{Int}|{Float}|("@"){Identificador}|"'"{Identificador}"'"|"'"{Int}"'"|"'"{Float}"'"))  |  (("@"){Identificador} {WhiteSpace}* ["="] {WhiteSpace}* ("COLUMN") {WhiteSpace}* (["="] | ("<>") | ("!=") | [">"] | (">=") | ["<"] | ("<=")) {WhiteSpace}* ({Identificador}|{Int}|{Float}|("@"){Identificador}|"'"{Identificador}"'"|"'"{Int}"'"|"'"{Float}"'")) ({WhiteSpace}* [","] {WhiteSpace}* ({Identificador} {WhiteSpace}* ["="] {WhiteSpace}* {Identificador}|{Int}|{Float}|("@"){Identificador}|"'"{Identificador}"'"|"'"{Int}"'"|"'"{Float}"'" |("NULL")|("DEFAULT")) | (("@"){Identificador} {WhiteSpace}* (["="] | ("<>") | ("!=") | [">"] | (">=") | ["<"] | ("<=")) {WhiteSpace}* ({Identificador}|{Int}|{Float}|("@"){Identificador}|"'"{Identificador}"'"|"'"{Int}"'"|"'"{Float}"'"))  |  (("@"){Identificador} {WhiteSpace}* ["="] {WhiteSpace}* ("COLUMN") {WhiteSpace}* (["="] | ("<>") | ("!=") | [">"] | (">=") | ["<"] | ("<=")) {WhiteSpace}* ({Identificador}|{Int}|{Float}|("@"){Identificador}|"'"{Identificador}"'"|"'"{Int}"'"|"'"{Float}"'")))* ({WhiteSpace}+ ("OUTPUT") {WhiteSpace}+ {Identificador} ["."] (["*"] | {Identificador}) (({WhiteSpace}+ ("AS"))? {WhiteSpace}+ {Identificador})? {WhiteSpace}+ ("INTO") {WhiteSpace}+ ({Identificador} | ["@"]{Identificador}) ({WhiteSpace}+ {Identificador})?)? {WhiteSpace}+ ("FROM") {WhiteSpace}+  {from} {WhiteSpace}+ ("WHERE") {WhiteSpace}+ {Where} {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))


/*DELETE*/
Where =  (({search_condition_without_match} | {search_condition_without_match} {WhiteSpace}+ ("AND") {WhiteSpace}+ {search_condition_without_match}))
search_condition_without_match = (((("NOT"){WhiteSpace}+)? {predicate} | ["("]{WhiteSpace}* (("NOT"){WhiteSpace}+)? {predicate} {WhiteSpace}* [")"]) ((("AND")|("OR")) ({WhiteSpace}+ ("NOT") {WhiteSpace}+)? {predicate} ({WhiteSpace}* [","] (("AND")|("OR")) ({WhiteSpace}+ ("NOT") {WhiteSpace}+)? {predicate})*)?)
predicate = (((({Identificador}|("@"){Identificador}) {WhiteSpace}* (["="] | ("<>") | ("!=") | [">"] | (">=") | ["<"] | ("<=")) {WhiteSpace}* ({Identificador}|{Int}|{Float}|("@"){Identificador}|"'"{Identificador}"'"|"'"{Int}"'"|"'"{Float}"'")) | ({Identificador} {WhiteSpace}+ (("NOT") {WhiteSpace}+)? ("LIKE") {WhiteSpace}+ ["'"] ((["%"]({Identificador}|{Digito}|{Signos}|{Int}|{Float}|{Espacio})+["%"]) | (["%"]({Identificador}|{Digito}|{Signos}|{Int}|{Float}|{Espacio})+) | (({Identificador}|{Digito}|{Signos}|{Int}|{Float}|{Espacio})+["%"]) | (["@"]{Identificador})) {WhiteSpace}* ["'"] ({WhiteSpace}+ ("ESCAPE") {WhiteSpace}* "'"{Identificador}"'" )?) | ({Identificador} {WhiteSpace}+ ("NOT" {WhiteSpace}+)? ("BETWEEN") {WhiteSpace}+ ({Int}|{Float}) {WhiteSpace}+ ("AND") {WhiteSpace}+ ({Int}|{Float})) | ({Identificador} {WhiteSpace}+ ("IS") {WhiteSpace}+ (("NOT"){WhiteSpace}+)? ("NULL"))))
Delete =  (("DELETE") {WhiteSpace}+ (("TOP") {WhiteSpace}* ({Digito}|["("]{WhiteSpace}*{Digito}{WhiteSpace}*[")"] {WhiteSpace}*) ({WhiteSpace}+("PERCENT"))?)? ((("FROM"){WhiteSpace}+)? ({Identificador}"."{Identificador}"."{Identificador}"."{Identificador}|{Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador} | ["@"]{Identificador})) ({WhiteSpace}+ ("OUTPUT") {WhiteSpace}+ {Identificador} ["."] (["*"] | {Identificador}) (({WhiteSpace}+ ("AS"))? {WhiteSpace}+ {Identificador})? {WhiteSpace}+ ("INTO") {WhiteSpace}+ ({Identificador} | ["@"]{Identificador}) ({WhiteSpace}+ {Identificador})?)? ({WhiteSpace}+ ("FROM") ({WhiteSpace}+ {Identificador} ({WhiteSpace}* [","] {Identificador})*)?)? ({WhiteSpace}+ ("WHERE") {WhiteSpace}* (({Where}) | (("CURRENT") {WhiteSpace}+ ("OF") {WhiteSpace}+ (("GLOBAL"){WhiteSpace}+)? {Identificador} | {Identificador})?))? {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))

/*DDL*/
/*CREATE*/
CreateDatabase = (("CREATE") {WhiteSpace}+ ("DATABASE") {WhiteSpace}+ {Identificador} ({WhiteSpace}+ (("ON") {WhiteSpace}+ "PRIMARY"))? ({WhiteSpace}+ ("COLLATE") {WhiteSpace}+ {Identificador})? {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))

ColumnConstraint = (("CONSTRAINT") {WhiteSpace}+ {identificador})?  {WhiteSpace}* (((("PRIMARY" {WhiteSpace}+ "KEY")| "UNIQUE") {WhiteSpace}+ ("CLUSTERED"|"NONCLUSTERED")?  ({WhiteSpace}+ ("ON") (((({identificador}|")"|"("|"["|"]"){WhiteSpace}*)+)))?) | ((("FOREIGN") {WhiteSpace}+ ("KEY") {WhiteSpace}*(({identificador}|"("|")"|"["|"]"|".") {WhiteSpace}*)+ {WhiteSpace}+)? ("REFERENCES") {WhiteSpace}+ (({identificador}|"("|")"|"["|"]"|".") {WhiteSpace}*)+ (({WhiteSpace}* (("ON"){WhiteSpace}*("DELETE")|("ON"){WhiteSpace}*("UPDATE")) {WhiteSpace}* (("NO"){WhiteSpace}*("ACTION")|("CASCADE")|("SET"){WhiteSpace}*("NULL")|("SET"){WhiteSpace}*("DEFAULT")))+)? {WhiteSpace}* ("NOT" {WhiteSpace}+ "FOR" {WhiteSpace}+ "REPLICATION")?) | (("CHECK") {WhiteSpace}+ ("NOT"{WhiteSpace}+ "FOR" {WhiteSpace}+ "REPLICATION")? {WhiteSpace}+ {Identificador}) )
ColumnIndex = (("INDEX") {WhiteSpace}+ {identificador} ({WhiteSpace}+ ("CLUSTERED"|"NONCLUSTERED"))? ({WhiteSpace}+ ("ON") {WhiteSpace}+ ((({identificador}|")"|"("|"["|"]")|{WhiteSpace}*)+))?)
ColumnDefinition=  ({identificador} {WhiteSpace}+ {DataType} ({WhiteSpace}+ ("COLLATE") {WhiteSpace}+ {identificador})? ({WhiteSpace}+ ("CONSTRAINT") {WhiteSpace}+ {identificador})? ({WhiteSpace}+ ("DEFAULT") {WhiteSpace}+ {Identificador})? ({WhiteSpace}+ ("NULL"|"NOT NULL"))?)
CreateTable = (("CREATE") {WhiteSpace}+ ("TABLE") {WhiteSpace}+ ((("##"|"#") {Identificador})|({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador})) {WhiteSpace}* ("(") ({WhiteSpace}* {ColumnDefinition} {WhiteSpace}* {ColumnConstraint}? {WhiteSpace}* {ColumnIndex}? {WhiteSpace}* (",")?)+ {WhiteSpace}* (")") {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))


CreateUser =  (("CREATE") {WhiteSpace}+ ("USER") ({WhiteSpace}+ {Identificador}|{WhiteSpace}* ["["] {WhiteSpace}* {Identificador} {WhiteSpace}* ["]"]) {WhiteSpace}*  [";"] {WhiteSpace}* ("GO"))                           
                        
CreateIndex = (("CREATE") {WhiteSpace}+ (("UNIQUE"){WhiteSpace}+)? ((("CLUSTERED")|("NONCLUSTERED")){WhiteSpace}+)? ("INDEX") {WhiteSpace}+ {Identificador} {WhiteSpace}+ ("ON") {WhiteSpace}+ ({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) {WhiteSpace}* ["("] {WhiteSpace}* {Identificador} {WhiteSpace}* (("ASC")|("DESC"))? ({WhiteSpace}* [","] {WhiteSpace}* {Identificador} {WhiteSpace}*(("ASC")|("DESC"))?)* {WhiteSpace}* [")"] ({WhiteSpace}+ ("INCLUDE") {WhiteSpace}* ["("] {WhiteSpace}* {Identificador} ({WhiteSpace}* [","] {Identificador})* {WhiteSpace}* [")"])? ({WhiteSpace}* ("WHERE") {WhiteSpace}* {Where} {WhiteSpace}*)? {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))

CreateView = (("CREATE") {WhiteSpace}+ ("VIEW") {WhiteSpace}+ ({Identificador}"."{Identificador}|{Identificador}) {WhiteSpace}+ (["("] {WhiteSpace}* {Identificador} {WhiteSpace}* ({WhiteSpace}* [","] {Identificador})* {WhiteSpace}* [")"])? ("AS") {WhiteSpace}* {select} {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))

/*ALTER*/
AlterDatabase = (("ALTER") {WhiteSpace}+ ("DATABASE") {WhiteSpace}+ ({Identificador} | ("CURRENT")) {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))
              | (("ALTER") {WhiteSpace}+ ("DATABASE") {WhiteSpace}+ ({Identificador} | ("CURRENT")) {WhiteSpace}+ (("COLLATE") {WhiteSpace}+ {Identificador} | {Identificador} | ("SET") {WhiteSpace}+ ({Identificador}|{Digito}) ({WhiteSpace}* [","] {WhiteSpace}* ({Identificador}|{Digito}))*) {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))

AlterTable = (("ALTER") {WhiteSpace}+ ("TABLE") {WhiteSpace}+ ({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) {WhiteSpace}+ (("ALTER") {WhiteSpace}+ ("COLUMN") {WhiteSpace}+ {Identificador} {WhiteSpace}+ {DataType} ({WhiteSpace}+ ("COLLATE") {WhiteSpace}+ {Identificador})? ({WhiteSpace}+ (("NULL")|("NOT") {WhiteSpace}+ ("NULL")))?) {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))
          |  (("ALTER") {WhiteSpace}+ ("TABLE") {WhiteSpace}+ ({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) {WhiteSpace}+ (("ADD") {WhiteSpace}+ {Identificador} {WhiteSpace}+ {DataType} ({WhiteSpace}* [","] {Identificador} {WhiteSpace}+ {DataType})*) {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))
          |  (("ALTER") {WhiteSpace}+ ("TABLE") {WhiteSpace}+ ({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) {WhiteSpace}+ (("DROP") {WhiteSpace}+ (("CONSTRAINT")|("COLUMN")) {WhiteSpace}+ {Identificador} ((({WhiteSpace}* [","] {WhiteSpace}* ("CONSTRAINT") {WhiteSpace}+ {Identificador}) | ({WhiteSpace}* [","] {WhiteSpace}* ("COLUMN") {WhiteSpace}+ {Identificador}))*)) {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))
          |  (("ALTER") {WhiteSpace}+ ("TABLE") {WhiteSpace}+ ({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) {WhiteSpace}+ (("MODIFY") ({WhiteSpace}+ ("COLUMN"))? {WhiteSpace}+ {Identificador} {WhiteSpace}+ {DataType}) {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))
          |  (("ALTER") {WhiteSpace}+ ("TABLE") {WhiteSpace}+ (["#"]|("##")) {Identificador} {WhiteSpace}+ (("ALTER") {WhiteSpace}+ ("COLUMN") {WhiteSpace}+ {Identificador} {WhiteSpace}+ {DataType} ({WhiteSpace}+ ("COLLATE") {WhiteSpace}+ {Identificador})? ({WhiteSpace}+ (("NULL")|("NOT") {WhiteSpace}+ ("NULL")))?) {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))
          |  (("ALTER") {WhiteSpace}+ ("TABLE") {WhiteSpace}+ (["#"]|("##")) {Identificador} {WhiteSpace}+ (("ADD") {WhiteSpace}+ {Identificador} {WhiteSpace}+ {DataType} ({WhiteSpace}* [","] {Identificador} {WhiteSpace}+ {DataType})*) {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))
          |  (("ALTER") {WhiteSpace}+ ("TABLE") {WhiteSpace}+ (["#"]|("##")) {Identificador} {WhiteSpace}+ (("DROP") {WhiteSpace}+ (("CONSTRAINT")|("COLUMN")) {WhiteSpace}+ {Identificador} ((({WhiteSpace}* [","] {WhiteSpace}* ("CONSTRAINT") {WhiteSpace}+ {Identificador}) | ({WhiteSpace}* [","] {WhiteSpace}* ("COLUMN") {WhiteSpace}+ {Identificador}))*)) {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))
          |  (("ALTER") {WhiteSpace}+ ("TABLE") {WhiteSpace}+ (["#"]|("##")) {Identificador} {WhiteSpace}+ (("MODIFY") ({WhiteSpace}+ ("COLUMN"))? {WhiteSpace}+ {Identificador} {WhiteSpace}+ {DataType}) {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))

AlterUser = (("ALTER") {WhiteSpace}+ ("USER") {WhiteSpace}+ {Identificador} {WhiteSpace}*  [";"] {WhiteSpace}* ("GO"))
 
AlterIndex =  (("ALTER") {WhiteSpace}+ ("INDEX") {WhiteSpace}+ ({Identificador}|("ALL")) {WhiteSpace}+ ("ON") {WhiteSpace}+ ({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) {WhiteSpace}*  [";"] {WhiteSpace}* ("GO"))

AlterView = (("ALTER") {WhiteSpace}+ ("VIEW") {WhiteSpace}+  ({Identificador}"."{Identificador} | {Identificador}) {WhiteSpace}* ["("] {WhiteSpace}* {Identificador} {WhiteSpace}* ({WhiteSpace}* [","] {WhiteSpace}* {Identificador} {WhiteSpace}*)* {WhiteSpace}* [")"] {WhiteSpace}* ("AS") {WhiteSpace}+ {select} {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))
          | (("ALTER") {WhiteSpace}+ ("VIEW") {WhiteSpace}+  ({Identificador}"."{Identificador} | {Identificador}) {WhiteSpace}+ ("AS") {WhiteSpace}+ {select} {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))

/*DROP*/
DropDatabase = (("DROP") {WhiteSpace}+ ("DATABASE") {WhiteSpace}+ {Identificador} {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))
             | (("DROP") {WhiteSpace}+ ("DATABASE") {WhiteSpace}+ ({Identificador}{WhiteSpace}*[","]{WhiteSpace}*{Identificador}({WhiteSpace}*[","]{WhiteSpace}*{Identificador})*)+ {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))

DropTable =   (("DROP") {WhiteSpace}+ ("TABLE") {WhiteSpace}+ ({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))
            | (("DROP") {WhiteSpace}+ ("TABLE") {WhiteSpace}+ ({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) ({WhiteSpace}* [","]{WhiteSpace}*({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}))+ {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))
            | (("DROP") {WhiteSpace}+ ("TABLE") {WhiteSpace}+ (["#"]|("##")) {Identificador} {WhiteSpace}* [";"] {WhiteSpace}* ("GO")?)
            | (("DROP") {WhiteSpace}+ ("TABLE") {WhiteSpace}+ (["#"]|("##")) {Identificador}({WhiteSpace}*[","]{WhiteSpace}*(["#"]|("##")) {Identificador})+ {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))

DropUser = (("DROP") {WhiteSpace}+ ("USER") {WhiteSpace}+ {Identificador} {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))

DropIndex =   (("DROP") {WhiteSpace}+ ("INDEX") {WhiteSpace}+ {Identificador} {WhiteSpace}+ ("ON") {WhiteSpace}+ ({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))
            | (("DROP") {WhiteSpace}+ ("INDEX") {WhiteSpace}+ {Identificador} {WhiteSpace}+ ("ON") {WhiteSpace}+ ({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) ({WhiteSpace}* [","] {WhiteSpace}* {Identificador} {WhiteSpace}+ ("ON") {WhiteSpace}+ ({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}))* {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))
            
DropView =   (("DROP") {WhiteSpace}+ ("VIEW") {WhiteSpace}+ ({Identificador}"."{Identificador}|{Identificador}) {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))
           | (("DROP") {WhiteSpace}+ ("VIEW") {WhiteSpace}+ ({Identificador}"."{Identificador}|{Identificador})({WhiteSpace}* [","] {WhiteSpace}* ({Identificador}"."{Identificador}|{Identificador}))* {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))

/*TRUNCATE*/
TruncateTable =   (("TRUNCATE") {WhiteSpace}+ ("TABLE") {WhiteSpace}+ ({Identificador}"."{Identificador}"."{Identificador} | {Identificador}"."{Identificador} | {Identificador}) {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))
                | (("TRUNCATE") {WhiteSpace}+ ("TABLE") {WhiteSpace}+ (["#"]|("##")) {Identificador} {WhiteSpace}* [";"] {WhiteSpace}* ("GO"))  

 
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

{Select} { getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Select; 
      }
{Insert} { getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Insert; 
      }
{Update} { getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Update; 
      }
{Delete} { getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Delete; 
      }
{CreateDatabase} { getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Create; 
      }
{CreateTable} { getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Create; 
      }
{CreateUser} { getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Create; 
      }
{CreateIndex} { getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Create; 
      }
{CreateView} { getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Create; 
      }
{AlterDatabase} { getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Alter; 
      }
{AlterTable} { getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Alter; 
      }
{AlterUser} { getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Alter; 
      }
{AlterIndex} { getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Alter; 
      }
{AlterView} { getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Alter; 
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
{DropUser} { getLinea=yyline+1;
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
{TruncateTable} { getLinea=yyline+1;
        getColumnaInicial=yycolumn+1;
        getColumnaFinal=(yycolumn+1)+yytext().length()-1;
        toString=yytext();  
        return Truncate; 
      }



/*Errores*/
{ErrorComment} {getColumnaInicial=yycolumn+1; getColumnaFinal=(yycolumn+1)+yytext().length()-1; getLinea=yyline+1; toString=yytext(); return Error_Comentario_Sin_Cerrar;}
{ErrorCadena} {getColumnaInicial=yycolumn+1; getColumnaFinal=(yycolumn+1)+yytext().length()-1; getLinea=yyline+1; toString=yytext(); return Error_Cadena_Invalida;}
 . {getColumnaInicial=yycolumn+1; getColumnaFinal=(yycolumn+1)+yytext().length()-1; getLinea=yyline+1; toString=yytext(); return Error_Caracter_Invalido;}



