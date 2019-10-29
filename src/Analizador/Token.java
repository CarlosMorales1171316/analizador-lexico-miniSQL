/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Analizador;

/**
 *
 * @author carlo
 */
public class Token {
    
    public String Valor;
    public int Linea;
    public int PI;

    public Token() 
    {
        
    }
    
    public Token(String valor, int linea, int pi) 
    {
        Valor = valor;
        Linea = linea;
        PI = pi;
    }
}
