# analizador-lexico-miniSQL
```
Universidad Rafael Landivar  
Carlos Andrés Morales Lara - 1171316  
Proyecto - Fase #1 - Analizador Léxico
```
#### Implementación de Analizador Léxico con Jflex
## Funcionamiento
![img](https://i.imgur.com/oBn4jVs.png)
Primero debemos de presionar el botón ***Generar archivo Lexer.java*** este botón lo que hará es que con la ayuda de la librería  [Jflex]( https://jflex.de/) este leerá el archivo llamado “Lexer.flex” el cual contiene toda la estructura de nuestros diccionarios, tokens y expresiones regulares que servirán para la base del analizador léxico luego se compilara en vivo para crear una clase llamada “Lexer.java” y el programa se cerrara.

Luego con la clase "Lexer.java" ya creada ya se podrá continuar con el siguiente botón llamado ***Analizar***.
![img](https://i.imgur.com/ncuycT8.png)
Al presionar el botón ***Analizar*** se abrirá una ventana en el cual podremos seleccionar el archivo de entrada que queramos, en este caso un archivo con extensión “.sql”.

Luego de seleccionar el archivo de entrada, se mostrará los resultados del analizador léxico en dos formas:
1. Jtable
![img](https://i.imgur.com/71vOZJx.png)
2. Archivo de salida con extensión ".out"
![img](https://i.imgur.com/o0A2WpS.png)

Manejo de errores: 
- Error por carácter inválido: Estos errores solo se mostrarán cuando el scanner lea un carácter que no sea parte de los diccionarios o expresiones regulares definidos.
- Error por comentario sin terminar: Estos errores solo se indicarán cuando se encuentre un comentario multilinea sin cerrar, es decir, sin su simbolo de cierre "*/".
- Error por cadena de carácteres no válidas: Estos errores se mostrarán solamente cuando el scanner detecte que una constante de tipo cadena no tenga su apostrofe de cierre y que se mantenga en la misma línea. 
- Error por longitud excedida en identificador: Este error se dará cuando la palabra analizada de un token de tipo identificador sea mayor a 31 carácteres, se agarrará los primeros 31 carácteres y se ignorará el resto.

Creo que mi programa funciona correctamente y es robusto ya que se realizó con tiempo y paciencia. Además, se realizaron demasiadas pruebas para cada tipo de Token, para cada Expresión Regular se hicieron todo tipo de pruebas posibles para todos los n casos que pudieran venir de entrada.
 
