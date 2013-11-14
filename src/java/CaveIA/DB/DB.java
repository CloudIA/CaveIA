/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CaveIA.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author marco.bonamente
 */
public class DB {

    public static Connection getConn() {
        try {
            Class.forName("org.postgresql.Driver");
            return DriverManager.getConnection("jdbc:postgresql://192.168.88.138:5432/caveia", "postgres", "CloudIA2013");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }


    public static void close(Connection conn) throws SQLException {
        if (!conn.isClosed()) {
            conn.close();
        }
    }    
}
