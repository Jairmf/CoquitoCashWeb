/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.mysql.jdbc.Driver;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Estudiante
 */
public class bd {
    
    public bd() {
    }
    public Connection obtieneConexionMysql(){
        // Variables de Conexión
        Connection c = null;
        String user = "root";
        String clave = "database";
        String url = "jdbc:mysql://localhost:3306/coquitocash";
        
        try {
            // Registrar el Driver de Conexión
            DriverManager.registerDriver(new Driver());
            c = DriverManager.getConnection(url,user, clave);
        } catch (SQLException ex) {
            Logger.getLogger(bd.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return c;
    }
    
}
