/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CaveIA.DB;

import Class.Alert;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

/**
 *
 * @author marco.bonamente
 */
public class DBAlert {
    
    
    static PreparedStatement doInsert = null;
    static PreparedStatement doLoadById = null;
    static PreparedStatement doDeleteById = null;
    static PreparedStatement doUpdate = null;   
    
    
    public static LinkedList LoadAll() throws SQLException{
        return Load("SELECT * FROM alert order by id_alert desc",null);
    }
    
    public static LinkedList Load(String sql) throws SQLException{
        return Load(sql,null);
    }
    
    
    public static LinkedList Load(String sql, Connection oconn) throws SQLException{
        Connection conn = oconn == null ? DB.getConn() : oconn;
        Statement doLoad = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = doLoad.executeQuery(sql);
        LinkedList<Alert> ret = new LinkedList();
        while(rs.next()){
            Alert alert = new Alert();
            alert.setIdAlert(rs.getLong("id_alert"));
            alert.setIdUtente(rs.getLong("id_utente"));
            alert.setIstante(rs.getTimestamp("istante"));
            alert.setTipoAlert(rs.getString("tipo_alert"));
            alert.setIdAssociato(rs.getLong("id_associato"));
            alert.setDescrizione(rs.getString("descrizione"));
            ret.add(alert);
        }
        if(oconn==null){
            DB.close(conn);
        }
        return ret;
    }
       
}
