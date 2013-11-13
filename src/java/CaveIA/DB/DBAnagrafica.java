/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CaveIA.DB;

import Class.Anagrafica;
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
public class DBAnagrafica {
    static PreparedStatement doInsert = null;
    static PreparedStatement doLoadById = null;
    static PreparedStatement doDeleteById = null;
    static PreparedStatement doUpdate = null;     
    
    public static LinkedList LoadAll() throws SQLException{
        return Load("select id_anagrafica, ragione_sociale, cf, piva, indirizzo, tel, cel, fax, email, pec, citta, ST_AsGeoJSON(geom) as geom from anagrafica where not cancellato order by id_anagrafica desc",null);
    }
    
    public static LinkedList Load(String sql) throws SQLException{
        return Load(sql,null);
    }
    
    
    public static LinkedList Load(String sql, Connection oconn) throws SQLException{
        Connection conn = oconn == null ? DB.getConn() : oconn;
        Statement doLoad = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = doLoad.executeQuery(sql);
        LinkedList<Anagrafica> ret = new LinkedList();
        while(rs.next()){
            Anagrafica anagrafica = new Anagrafica();
            anagrafica.setIdAnagrafica(rs.getLong("id_anagrafica"));
            anagrafica.setRagioneSociale(rs.getString("ragione_sociale"));
            anagrafica.setCf(rs.getString("cf"));
            anagrafica.setpIva(rs.getString("piva"));
            anagrafica.setIndirizzo(rs.getString("indirizzo"));
            anagrafica.setTel(rs.getString("tel"));
            anagrafica.setCel(rs.getString("cel"));
            anagrafica.setFax(rs.getString("fax"));
            anagrafica.setEmail(rs.getString("email"));
            anagrafica.setPec(rs.getString("pec"));
            anagrafica.setCitta(rs.getString("citta"));
            anagrafica.setGeom(rs.getString("geom"));
            ret.add(anagrafica);
        }
        if(oconn==null){
            DB.close(conn);
        }
        return ret;
    }    
    
    
    public static void AddPoint(long id, float lat, float lng, Connection oconn) throws SQLException{
        Connection conn = oconn == null ? DB.getConn() : oconn;
        String sql = "update anagrafica set geom= ST_GeomFromText('POINT("+lat+" "+lng+")', 3004) where id_anagrafica=?";
        doUpdate = conn.prepareStatement(sql);
        doUpdate.setLong(1, id);
        doUpdate.executeUpdate();
        if(oconn==null){
            DB.close(conn);
        }
                
        
        
        
    }
    
}
