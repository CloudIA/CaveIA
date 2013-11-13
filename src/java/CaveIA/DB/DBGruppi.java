/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CaveIA.DB;


import static CaveIA.DB.DBUtenti.Load;
import Class.Gruppo;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

/**
 *
 * @author marco.bonamente
 */
public class DBGruppi {
    
    public static LinkedList LoadAll() throws SQLException {
        return Load("SELECT * FROM gruppo order by id_gruppo desc", null);
    }       
    
    public static LinkedList Load(String sql) throws SQLException {
        return Load(sql, null);
    }    
    
    public static LinkedList Load(String sql, Connection oconn) throws SQLException {
        Connection conn = oconn == null ? DB.getConn() : oconn;
        Statement doLoad = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = doLoad.executeQuery(sql);
        LinkedList<Gruppo> ret = new LinkedList();
        while (rs.next()) {
            Gruppo Gruppo = new Gruppo();
            Gruppo.setIdGruppo(rs.getLong("id_gruppo"));
            Gruppo.setDescrizione(rs.getString("descrizione"));
            Gruppo.setPermesso1(rs.getShort("permesso1"));
            Gruppo.setPermesso2(rs.getShort("permesso2"));
            ret.add(Gruppo);
        }
        if (oconn == null) {
            DB.close(conn);
        }
        return ret;
    }        
    
}
