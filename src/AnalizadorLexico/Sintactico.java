/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorLexico;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;

/**
 *
 * @author carlo
 */
public class Sintactico {
    public ArrayList<String> CorrectasLista = new ArrayList<>();
    public ArrayList<String> LineasLista = new ArrayList<>();
    public ArrayList<String> ErroresLista = new ArrayList<>();
    public ArrayList<String> ListaSintactica = new ArrayList<>();

 public void AnalizadorErrores(Reader reader,ArrayList<String> Sentencias){
        try {
            SintacticoLexer SintactAnalizer = new SintacticoLexer(reader);   
            while(true){
                Tokens tokens = SintactAnalizer.yylex();
                if (tokens == null) {
                   // Files.write(file, contenidoLista, StandardCharsets.UTF_8);
                    return;
                }
                switch (tokens){
                    case ErrorSentencia:
                    ListaSintactica.add(SintactAnalizer.getString);
                    LineasLista.add("Error en linea: " + SintactAnalizer.getLinea);
                    break;
                }
            }
        }
         catch(IOException e){   
        }  
         AnalizadorSintactico(Sentencias);
    }
      
    
    public void AnalizadorSintactico(ArrayList<String> Sentencias){
        int i=0;
        for(String tempo:ListaSintactica){
            
            if(!Sentencias.contains(tempo)){
                if(tempo.startsWith("SELECT")){                
                ErroresLista.add(LineasLista.get(i) + ", Error Sintáctico en SELECT, Sentencia Analizada = " + ListaSintactica.get(i));
                }
                if(tempo.startsWith("INSERT")){               
                ErroresLista.add(LineasLista.get(i) + ", Error Sintáctico en INSERT, Sentencia Analizada = " + ListaSintactica.get(i));
                } 
                if(tempo.startsWith("UPDATE")){               
                ErroresLista.add(LineasLista.get(i) + ", Error Sintáctico en UPDATE, Sentencia Analizada = " + ListaSintactica.get(i));
                }
                if(tempo.startsWith("DELETE")){                
                ErroresLista.add(LineasLista.get(i) + ", Error Sintáctico en DELETE, Sentencia Analizada = " + ListaSintactica.get(i));
                }
                if(tempo.startsWith("CREATE")){                
                ErroresLista.add(LineasLista.get(i) + ", Error Sintáctico en CREATE, Sentencia Analizada = " + ListaSintactica.get(i));
                }
                if(tempo.startsWith("ALTER")){                
                ErroresLista.add(LineasLista.get(i) + ", Error Sintáctico en ALTER, Sentencia Analizada = " + ListaSintactica.get(i));
                }
                if(tempo.startsWith("DROP")){                
                ErroresLista.add(LineasLista.get(i) + ", Error Sintáctico en DROP, Sentencia Analizada = " + ListaSintactica.get(i));
                }
                if(tempo.startsWith("TRUNCATE")){                
                ErroresLista.add(LineasLista.get(i) + ", Error Sintáctico en TRUNCATE, Sentencia Analizada = " + ListaSintactica.get(i));
                }   
            }
            i++;
        }  
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
