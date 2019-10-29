# MiniSQL Proyecto de Compiladores


# Contenibles
La primera fase del proyecto cuenta con:
- Codigo Fuente
- Ejecutable .jar

# Objetivo y Funcionalidad

El objetivo de la primera parte del Compilador (Analizador Léxico) es indentificar con precisión cada una de las expresiones, simbolos y oraciones que esten dentro del lenguaje MiniSQL que ya ha sido definido previamente.

Por lo que el analizador leera un archivo .minisql el cual contendra instrucciones en lenguaje MiniSQL y analizara cada una de las instrucciones y líneas para ver si coincide o no con algún TOKEN perteneciente al lenguaje, en caso contrario podra mostrar:

- ERROR, Simbolo no identificado (Esto indica que el simbolo o palabra no se encuentra en el lenguaje .minisql)
- ERROR, comentario no terminado (Indica que el comentario nunca ha sido finalizado)
- ERROR, Identificador fuera de rango (Indica que el identificador excedió la cantidad límite de 31 caracteres)

el analizador ignorará los comentarios y solo mostrara los TOKENS, indicando en que línea se encuentran y la columna donde empieza y termina el respectivo token, luego generará la salida en un archivo .out el cual contendra el analisis del archivo ingresado y se encontrara en la misma ubicación de donde se obtuvo el archivo .txt para analizar.

El analizador léxico es un analizador robusto, ya que reconoce los errores y tokens correctos, analizando cada sentencia de forma separa de acuerdo a los parámetros establecidos por lo que cumple con los requisitos requeridos por el lenguaje.


