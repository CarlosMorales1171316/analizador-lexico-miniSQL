/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorLexico;

import java.io.File;

/**
 *
 * @author carlo
 */
public class Main {
    public static void main(String[] args) {
        String ruta = "C:/Users/carlo/Documents/NetBeansProjects/analizador-lexico-miniSQL/src/AnalizadorLexico/Lexer.flex";
        generarLexema(ruta);
    }
    
    public static void generarLexema(String ruta){
        File file = new File (ruta);
        jflex.Main.generate(file);
    }
}
    