/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.angel.javaweb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ResourceBundle;

/**
 *
 * @author whoangel
 */
public class UConexion {
    private static Connection conn = null;
    private static final String USER = "root";
    private static final String URL = "jdbc:mysql://localhost/cursojava";
    private static final String PASS = "admin";
    
    private UConexion(){}
    
    public static Connection getConnection(){
        try {
            if(conn==null){
                Runtime.getRuntime().addShutdownHook(new MiShDwHook());
                
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(URL, USER, PASS);
            }
            return conn;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error al crear la conexion: "+e.getMessage());
        }
    }
    static class MiShDwHook extends Thread{
        // justo antes de finalizar el programa la JVm invocara 
        // a este metodo donde podemos cerrar la conexion
        public void run(){
            try {
                Connection con = UConexion.getConnection();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException(e);
            }
        }
    }
}
