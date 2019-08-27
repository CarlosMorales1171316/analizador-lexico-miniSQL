/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AnalizadorLexico;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFileChooser;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author carlo
 */
public class FormMain extends javax.swing.JFrame {

    /**
     * Creates new form FormMain
     */
    public FormMain() {
        initComponents();
        this.setLocationRelativeTo(null);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        btnAnalizar = new javax.swing.JButton();
        jPanel2 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        tblScanner = new javax.swing.JTable();
        jButton1 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        btnAnalizar.setBackground(new java.awt.Color(255, 153, 0));
        btnAnalizar.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        btnAnalizar.setText("Analizar");
        btnAnalizar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAnalizarActionPerformed(evt);
            }
        });

        jPanel2.setBackground(new java.awt.Color(102, 0, 0));

        jLabel1.setFont(new java.awt.Font("Arial Black", 0, 36)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("ANALIZADOR LÉXICO");

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addContainerGap(246, Short.MAX_VALUE)
                .addComponent(jLabel1)
                .addGap(222, 222, 222))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(42, 42, 42)
                .addComponent(jLabel1)
                .addContainerGap(44, Short.MAX_VALUE))
        );

        tblScanner.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "# Linea", "# Columna Inicial", "# Columna Final", "Palabra Analizada", "Token"
            }
        ));
        jScrollPane2.setViewportView(tblScanner);

        jButton1.setBackground(new java.awt.Color(255, 153, 0));
        jButton1.setFont(new java.awt.Font("Tahoma", 1, 16)); // NOI18N
        jButton1.setText("Generar archivo Lexer.java");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jScrollPane2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnAnalizar, javax.swing.GroupLayout.PREFERRED_SIZE, 116, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jButton1)
                .addGap(306, 306, 306))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 58, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(13, 13, 13)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 272, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnAnalizar, javax.swing.GroupLayout.PREFERRED_SIZE, 272, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(145, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

   
    private void btnAnalizarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAnalizarActionPerformed
        // TODO add your handling code here:
        
        final String path = System.getProperty("user.dir");
        final String path2 = "/src/AnalizadorLexico/";
        
        JFileChooser chooser = new JFileChooser();
        chooser.showOpenDialog(null);
   
        String NombreArchivoEntrada ="";
    
        NombreArchivoEntrada = chooser.getSelectedFile().getName();
        String [] split = NombreArchivoEntrada.split("\\.");
        NombreArchivoEntrada=split[0];
        
        DefaultTableModel tabla = (DefaultTableModel) tblScanner.getModel();
        
        //Listas con repetición
        ArrayList<String> listaOperador = new ArrayList<>();
        ArrayList<String> listaIdentificador = new ArrayList<>();
        ArrayList<String> listaReservada = new ArrayList<>();
        ArrayList<String> listaBit = new ArrayList<>();
        ArrayList<String> listaInt = new ArrayList<>();
        ArrayList<String> listaFloat = new ArrayList<>();
        ArrayList<String> listaExp = new ArrayList<>();
        ArrayList<String> listaString = new ArrayList<>();
        
        try {
            Reader reader = new BufferedReader (new FileReader(chooser.getSelectedFile()));
            Lexer lexer = new Lexer(reader);
           
            ArrayList<String>contenidoLista = new ArrayList<>();
            Path file = Paths.get(path+path2+NombreArchivoEntrada+".out");
            
            while (true) {
                Tokens tokens = lexer.yylex();
                
                if (tokens == null) {
                    Files.write(file, contenidoLista, StandardCharsets.UTF_8);
                   // bw.close();
                    return;
                }
                switch (tokens) {
                    case Error_Caracter_Invalido: 
                        String [] fila1 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Carácter Inválido"};                        
                        tabla.addRow(fila1);
                        contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Carácter Inválido");
                        break;
                    case Error_Cadena_Invalida: 
                        String [] fila2 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Cadena Inválida"};                        
                        tabla.addRow(fila2);
                        contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Cadena Inválida");
                        break;    
                    case Error_Comentario_Sin_Cerrar:
                        String [] fila3 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Comentario Sin Terminar"};                        
                        tabla.addRow(fila3);
                        contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Comentario Sin Terminar");
                        break;
                    case Identificador: 
                        if (lexer.yylength() > 31) {
                            String identificador = "";
                            int columnaFinal = 0;
                            identificador = lexer.yytext().substring(0,31);
                            columnaFinal = lexer.getColumnaInicial+30;
                            String columnaFinalString = Integer.toString(columnaFinal);
                            String [] fila4 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),columnaFinalString,identificador,"Indentificador De Longitud Excedida"}; 
                            tabla.addRow(fila4);
                            contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + columnaFinalString +" " + "Palabra analizada: " + identificador +" " + "Token: " + "Identificador De Longitud Excedida");
                            listaIdentificador.add(identificador);
                        }
                        else {
                            String [] fila4 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString, tokens.toString()}; 
                            tabla.addRow(fila4);
                            contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + tokens.toString());
                            listaIdentificador.add(lexer.toString);
                        }
                        break;
                    case Operador: 
                        // <editor-fold defaultstate="collapsed" desc="Switch Operadores">
                        switch (lexer.toString) {
                            case "+":
                                String [] fila4_1 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Suma"};
                                tabla.addRow(fila4_1);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Suma");
                                break;
                            case "-":
                                String [] fila4_2 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Resta"};
                                tabla.addRow(fila4_2);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Resta");
                                break;
                            case "*":
                                String [] fila4_3 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Multiplicación"};
                                tabla.addRow(fila4_3);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Multiplicación");
                                break;
                            case "/":
                                String [] fila4_4 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"División"};
                                tabla.addRow(fila4_4);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "División");
                                break;
                            case "%":
                                String [] fila4_5 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Porcentaje"};
                                tabla.addRow(fila4_5);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Porcentaje");
                                break;
                            case "<":
                                String [] fila4_6 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Menor"};
                                tabla.addRow(fila4_6);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Menor");
                                break;
                            case "<=":
                                String [] fila4_7 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Menor o igual"};
                                tabla.addRow(fila4_7);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Menor o igual");
                                break;
                            case ">":
                                String [] fila4_8 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Mayor"};
                                tabla.addRow(fila4_8);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Mayor");
                                break;
                            case ">=":
                                String [] fila4_9 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Mayor o igual"};
                                tabla.addRow(fila4_9);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Mayor o igual");
                                break;
                            case "=":
                                String [] fila4_10 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Igual"};
                                tabla.addRow(fila4_10);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Igual");
                                break;
                            case "==":
                                String [] fila4_11 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Igualdad"};
                                tabla.addRow(fila4_11);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Igualdad");
                                break;
                            case "!=":
                                String [] fila4_12 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Diferente"};
                                tabla.addRow(fila4_12);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Diferente");
                                break;
                            case "&&":
                                String [] fila4_13 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"And"};
                                tabla.addRow(fila4_13);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "And");
                                break;
                            case "||":
                                String [] fila4_14 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Or"};
                                tabla.addRow(fila4_14);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Or");
                                break;
                            case "!":
                                String [] fila4_15 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Not"};
                                tabla.addRow(fila4_15);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Not");
                                break;
                            case ";":
                                String [] fila4_16 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Punto y coma"};
                                tabla.addRow(fila4_16);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Punto y coma");
                                break;
                            case ",":
                                String [] fila4_17 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Coma"};
                                tabla.addRow(fila4_17);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Coma");
                                break;
                            case ".":
                                String [] fila4_18 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Punto"};
                                tabla.addRow(fila4_18);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Punto");
                                break;
                            case "[":
                                String [] fila4_19 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Corchete_A"};
                                tabla.addRow(fila4_19);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Corchete_A");
                                break;
                            case "]":
                                String [] fila4_20 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Corchete_B"};
                                tabla.addRow(fila4_20);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Corchete_B");
                                break;
                            case "[]":
                                String [] fila4_21 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Corchetes"};
                                tabla.addRow(fila4_21);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Corchetes");
                                break;
                            case "(":
                                String [] fila4_22 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Paréntesis_A"};
                                tabla.addRow(fila4_22);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Paréntesis_A");
                                break;
                            case ")":
                                String [] fila4_23 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Paréntesis_B"};
                                tabla.addRow(fila4_23);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Paréntesis_B");
                                break;
                            case "()":
                                String [] fila4_24 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Paréntesis"};
                                tabla.addRow(fila4_24);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Paréntesis");
                                break;
                            case "{":
                                String [] fila4_25 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Llave_A"};
                                tabla.addRow(fila4_25);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Llave_A");
                                break;
                            case "}":
                                String [] fila4_26 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Llave_B"};
                                tabla.addRow(fila4_26);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Llave_B");
                                break;
                            case "{}":
                                String [] fila4_27 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Llaves"};
                                tabla.addRow(fila4_27);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Llaves");
                                break;
                            case "@":
                                String [] fila4_28 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Arroba"};
                                tabla.addRow(fila4_28);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Arroba");
                                break;
                            case "#":
                                String [] fila4_29 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Numeral"};
                                tabla.addRow(fila4_29);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Numeral");
                                break;
                            case "##":
                                String [] fila4_30 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,"Doble Numeral"};
                                tabla.addRow(fila4_30);
                                contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + "Doble Numeral");
                                break;
                        default:
                                break;
                        }
                           // </editor-fold>
                        listaOperador.add(lexer.toString);
                        break;
                    case Reservada:
                        String [] fila5 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,tokens.toString()};                        
                        tabla.addRow(fila5);
                        listaReservada.add(lexer.toString);
                        contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + tokens.toString());
                        if (lexer.toString.equals("NULL") && (!lexer.ConstantesBooleanasLista.contains(lexer.toString))) {
                            lexer.ConstantesBooleanasLista.add(lexer.toString);
                        }
                        break;
                    case Int: 
                        String [] fila6 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,tokens.toString()};                        
                        tabla.addRow(fila6);
                        listaInt.add(lexer.toString);
                        contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + tokens.toString());
                        break;
                    case Float: 
                        String [] fila7 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,tokens.toString()};                        
                        tabla.addRow(fila7);
                        listaFloat.add(lexer.toString);
                        contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + tokens.toString());
                        break;
                    case Exp: 
                        String [] fila8 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,tokens.toString()};                        
                        tabla.addRow(fila8);
                        listaExp.add(lexer.toString);
                        contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + tokens.toString());
                        break;
                    case String:
                        String [] fila9 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,tokens.toString()};
                        tabla.addRow(fila9);
                        listaString.add(lexer.toString);
                        contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + tokens.toString());
                        break;
                    case Bit:
                        String [] fila10 = {lexer.getLinea.toString(),lexer.getColumnaInicial.toString(),lexer.getColumnaFinal.toString(),lexer.toString,tokens.toString()};                        
                        tabla.addRow(fila10);
                        listaBit.add(lexer.toString);
                        contenidoLista.add("Linea: " + lexer.getLinea.toString() +" " + "Columna: " +lexer.getColumnaInicial.toString() +" a " + lexer.getColumnaFinal.toString() +" " + "Palabra analizada: " + lexer.toString +" " + "Token: " + tokens.toString());
                        if (lexer.toString.equals("1") && (!lexer.ConstantesEnterasLista.contains(lexer.toString))) {
                            lexer.ConstantesEnterasLista.add(lexer.toString);
                        }
                        if (lexer.toString.equals("0") && (!lexer.ConstantesEnterasLista.contains(lexer.toString))) {
                            lexer.ConstantesEnterasLista.add(lexer.toString);
                        }
                        break;    
                    default:
                        break;
                        
                }   
            }
            
            
        } catch (FileNotFoundException ex) {
            Logger.getLogger(FormMain.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(FormMain.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }//GEN-LAST:event_btnAnalizarActionPerformed

    
    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
        final String path = System.getProperty("user.dir");
        final String path2 = "/src/AnalizadorLexico/";

        String ruta = path+path2+"Lexer.flex";
        generarLexema(ruta);
        System.exit(0);
    }//GEN-LAST:event_jButton1ActionPerformed

    public static void generarLexema(String ruta){
        File file = new File (ruta);
        jflex.Main.generate(file);
    }
    
    // <editor-fold defaultstate="collapsed" desc="writeTXT">  
    /*
    public void writeTXT(DefaultTableModel table) throws IOException, ClassNotFoundException, SQLException {
  Writer writer = null;
  try{
    writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("C:/Users/carlo/Documents/NetBeansProjects/analizador-lexico-miniSQL/src/AnalizadorLexico/PRUEBA.out")));
    StringBuffer bufferHeader = new StringBuffer();
    for(int i = 0; i<table.getColumnCount();i++){
      bufferHeader.append(table.getColumnName(i));
      if(i!=table.getColumnCount()) bufferHeader.append(" ");
    }
    writer.write(bufferHeader.toString()+"\r\n");

    for(int j = 0; j<table.getRowCount(); j++){
      StringBuffer buffer = new StringBuffer();
      for (int k = 0; k<table.getColumnCount(); k++){
        buffer.append(table.getValueAt(j,k));
        if(k!=table.getColumnCount()) buffer.append(" ");
      }
      writer.write(buffer.toString()+"\r\n");
    }
  }finally{
    writer.close();
  }
}
    */
    // </editor-fold>
    
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(FormMain.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(FormMain.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(FormMain.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(FormMain.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new FormMain().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAnalizar;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable tblScanner;
    // End of variables declaration//GEN-END:variables
}
