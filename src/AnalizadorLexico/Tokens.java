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
    Bit,
    Int,
    Float,
    String,
    Operador,
    Error_Caracter_Invalido,
    Error_Cadena_Invalida,
    Error_Comentario_Sin_Cerrar,
    Alter,
    Drop,
    Truncate
}
