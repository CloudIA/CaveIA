/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CaveIA.DB;

import Class.Utente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.LinkedList;




/**
 *
 * @author marco.bonamente
 */
public class DBUtenti{
    
    
    static PreparedStatement doInsert = null;
    static PreparedStatement doLoadById = null;
    static PreparedStatement doDeleteById = null;
    static PreparedStatement doUpdate = null;    
    
    public static LinkedList LoadAll() throws SQLException {
        return Load("SELECT * FROM utenti order by id_utente desc", null);
    }    
    
    public static LinkedList Load(String sql) throws SQLException {
        return Load(sql, null);
    }    
    
    public static LinkedList Load(String sql, Connection oconn) throws SQLException {
        Connection conn = oconn == null ? DB.getConn() : oconn;
        Statement doLoad = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = doLoad.executeQuery(sql);
        LinkedList<Utente> ret = new LinkedList();
        while (rs.next()) {
            Utente Utente = new Utente();
            Utente.setIdUtente(rs.getLong("id_utente"));
            Utente.setUsername(rs.getString("username"));
            Utente.setPassword(rs.getString("password"));
            Utente.setNome(rs.getString("nome"));
            Utente.setCognome(rs.getString("cognome"));
            Utente.setUltimoAccesso(rs.getTimestamp("ultimo_accesso"));
            Utente.setUltimoIp(rs.getString("ultimo_ip"));
            Utente.setEmail(rs.getString("email"));
            Utente.setLastSession(rs.getString("last_session"));
            ret.add(Utente);
        }
        if (oconn == null) {
            DB.close(conn);
        }
        return ret;
    }    
  
    public static Utente LoadById(long idUtente) throws SQLException {
        return LoadById(idUtente, null);
    }    
    
    public static Utente LoadById(long idUtente, Connection oconn) throws SQLException {
        Connection conn = oconn == null ? DB.getConn() : oconn;
        Utente Utente = new Utente();
        Utente.setIdUtente(idUtente);
        String sql = "SELECT * FROM utenti WHERE id_utente=? limit 1";
        doLoadById = conn.prepareStatement(sql);
        doLoadById.setLong(1, idUtente);
        ResultSet rs = doLoadById.executeQuery();
        if (rs.next()) {
            Utente.setIdUtente(rs.getLong("id_utente"));
            Utente.setUsername(rs.getString("username"));
            Utente.setPassword(rs.getString("password"));
            Utente.setNome(rs.getString("nome"));
            Utente.setCognome(rs.getString("cognome"));
            Utente.setUltimoAccesso(rs.getTimestamp("ultimo_accesso"));
            Utente.setUltimoIp(rs.getString("ultimo_ip"));
            Utente.setEmail(rs.getString("email"));
            Utente.setLastSession(rs.getString("last_session"));          
        } else {
            Utente = null;
        }
        if (oconn == null) {
            DB.close(conn);
        }
        return Utente;
    }    
    
    public static Utente LoadByUserName(String UserName) throws SQLException {
        return LoadByUserName(UserName, null);
    }        
    
    public static Utente LoadByUserName(String UserName, Connection oconn) throws SQLException {
        Connection conn = oconn == null ? DB.getConn() : oconn;
        Utente Utente = new Utente();
        Utente.setUsername(UserName);
        String sql = "SELECT * FROM utenti WHERE username= ?;";
        doLoadById = conn.prepareStatement(sql);
        doLoadById.setString(1, UserName);
        ResultSet rs = doLoadById.executeQuery();
        if(rs.next()) {
            Utente.setIdUtente(rs.getLong("id_utente"));
            Utente.setUsername(rs.getString("username"));
            Utente.setPassword(rs.getString("password"));
            Utente.setNome(rs.getString("nome"));
            Utente.setCognome(rs.getString("cognome"));
            Utente.setUltimoAccesso(rs.getTimestamp("ultimo_accesso"));
            Utente.setUltimoIp(rs.getString("ultimo_ip"));
            Utente.setEmail(rs.getString("email"));
            Utente.setLastSession(rs.getString("ultima_sessione"));          
        } else {
            Utente = null;
        }
        if (oconn == null) {
            DB.close(conn);
        }
        return Utente;
    }  
    
    public static Utente LoadBySession(String session) throws SQLException {
        return LoadBySession(session, null);
    }        
    
    public static Utente LoadBySession(String session, Connection oconn) throws SQLException {
        Connection conn = oconn == null ? DB.getConn() : oconn;
        Utente Utente = new Utente();
        String sql = "SELECT * FROM utenti WHERE ultima_sessione= ?;";
        doLoadById = conn.prepareStatement(sql);
        doLoadById.setString(1, session);
        ResultSet rs = doLoadById.executeQuery();
        if(rs.next()) {
            Utente.setIdUtente(rs.getLong("id_utente"));
            Utente.setUsername(rs.getString("username"));
            Utente.setPassword(rs.getString("password"));
            Utente.setNome(rs.getString("nome"));
            Utente.setCognome(rs.getString("cognome"));
            Utente.setUltimoAccesso(rs.getTimestamp("ultimo_accesso"));
            Utente.setUltimoIp(rs.getString("ultimo_ip"));
            Utente.setEmail(rs.getString("email"));
            Utente.setLastSession(rs.getString("ultima_sessione"));          
        } else {
            Utente = null;
        }
        if (oconn == null) {
            DB.close(conn);
        }
        return Utente;
    }      
    
    public static boolean Insert(Utente Utente) throws SQLException {
        return Insert(Utente, null);
    }

    public static boolean Insert(Utente Utente, Connection oconn) throws SQLException {
        boolean ret = false;
        Connection conn = oconn == null ? DB.getConn() : oconn;
        String sql = "INSERT into utenti (username,password,nome,cognome,ultimo_accesso,ultimo_ip,email,ultima_sessione) values (?,?,?,?,?,?,?,?);";
        
        doInsert = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
        doInsert.setString(1, Utente.getUsername());
        doInsert.setString(2, Utente.getPassword());
        doInsert.setString(3, Utente.getNome());
        doInsert.setString(4, Utente.getCognome());
        doInsert.setTimestamp(5, new Timestamp(Utente.getUltimoAccesso().getTime()));
        doInsert.setString(6, Utente.getUltimoIp());
        doInsert.setString(7, Utente.getEmail());
        doInsert.setString(8, Utente.getLastSession());
        doInsert.executeUpdate();
        ResultSet rs = doInsert.getGeneratedKeys();
        if (rs.next()) {
            Utente.setIdUtente(rs.getLong(1));
            ret = true;
        } else {
            ret = false;
        }
        if (oconn == null) {
            DB.close(conn);
        }
        return ret;
    }    
    
    public static boolean Update(Utente Utente) throws SQLException {
        return Update(Utente, null);
    }

    public static boolean Update(Utente Utente, Connection oconn) throws SQLException {
        boolean ret = false;
        Connection conn = oconn == null ? DB.getConn() : oconn;
        String sql = "UPDATE utenti set id_utente=?, username=?, password=?, nome=?, cognome=?, ultimo_accesso=?, ultimo_ip=?, email=?, ultima_sessione=?  where id_utente=?;";
        doUpdate = conn.prepareStatement(sql);
        doUpdate.setLong(1, Utente.getIdUtente());
        doUpdate.setString(2, Utente.getUsername());
        doUpdate.setString(3, Utente.getPassword());        
        doUpdate.setString(4, Utente.getNome());     
        doUpdate.setString(5, Utente.getCognome());              
        doUpdate.setTimestamp(6, new Timestamp(Utente.getUltimoAccesso().getTime()));
        doUpdate.setString(7, Utente.getUltimoIp());     
        doUpdate.setString(8, Utente.getEmail());    
        doUpdate.setString(9, Utente.getLastSession());         
        doUpdate.setLong(10, Utente.getIdUtente());
        ret = doUpdate.execute();
        if (oconn == null) {
            DB.close(conn);
        }
        return ret;
    }    
   
    
}
