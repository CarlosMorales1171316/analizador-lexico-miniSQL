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


En el repositorio deberá incluir un archivo README.txt donde explique todo el funcionamiento y porque cree que su programa funciona correctamente y es robusto, así también detallando cómo se manejan los errores. 
 
