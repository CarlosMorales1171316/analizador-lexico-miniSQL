/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorLexico;

/**
 *
 * @author carlo
 */
public enum Tokens {
    Reservada,
    Identificador,
    Constante_Booleana,
    Constante_Entera,
    Constante_Decimal,
    Constante_Exponencial,
    Constante_Cadena,
    Operador,
    Error_Caracter_Invalido,
    Error_Comentario
}
