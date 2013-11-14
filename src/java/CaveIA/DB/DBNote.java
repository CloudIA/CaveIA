/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CaveIA.DB;

import Class.Note;
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
public class DBNote {
    
    static PreparedStatement doInsert = null;
    static PreparedStatement doLoadById = null;
    static PreparedStatement doDeleteById = null;
    static PreparedStatement doUpdate = null;   
    
    
    public static LinkedList LoadAll() throws SQLException{
        return Load("SELECT * FROM note order by id_nota desc",null);
    }
    
    public static LinkedList Load(String sql) throws SQLException{
        return Load(sql,null);
    }
    
    
    public static LinkedList Load(String sql, Connection oconn) throws SQLException{
        Connection conn = oconn == null ? DB.getConn() : oconn;
        Statement doLoad = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = doLoad.executeQuery(sql);
        LinkedList<Note> ret = new LinkedList();
        while(rs.next()){
            Note note = new Note();
            note.setIdNota(rs.getLong("id_nota"));
            note.setIdUtente(rs.getLong("id_utente"));
            note.setDescrizione(rs.getString("descrizione"));
            ret.add(note);
        }
        if(oconn==null){
            DB.close(conn);
        }
        return ret;
    }
    
    public static LinkedList LoadByIdUtente(long IdUtente, int number, Connection oconn) throws SQLException{
        Connection conn = oconn == null ? DB.getConn() : oconn;
        String sql = "SELECT * FROM note WHERE (id_utente = ? and not cancellato) limit ? order by id_nota desc;";
        doLoadById = conn.prepareStatement(sql);
        doLoadById.setLong(1, IdUtente);
        doLoadById.setInt(2, number);
        ResultSet rs = doLoadById.executeQuery();
        LinkedList<Note> ret = new LinkedList();
        while(rs.next()){
            Note note = new Note();
            note.setIdNota(rs.getLong("id_nota"));
            note.setIdUtente(rs.getLong("id_utente"));
            note.setDescrizione(rs.getString("descrizione"));
            ret.add(note);
            
        }
        if(oconn==null){
            DB.close(conn);
        }
        return ret;    
    }
    
    public static LinkedList LoadByIdUtenteAndNull(long IdUtente,int number, Connection oconn) throws SQLException{
        Connection conn = oconn == null ? DB.getConn() : oconn;
        String sql = "SELECT * FROM note WHERE ((id_utente = ? or id_utente is NULL) and not cancellato) order by id_nota desc limit ?;";
        doLoadById = conn.prepareStatement(sql);
        doLoadById.setLong(1, IdUtente);
        doLoadById.setInt(2, number);
        ResultSet rs = doLoadById.executeQuery();
        LinkedList<Note> ret = new LinkedList();
        while(rs.next()){
            Note note = new Note();
            note.setIdNota(rs.getLong("id_nota"));
            note.setIdUtente(rs.getLong("id_utente"));
            note.setDescrizione(rs.getString("descrizione"));
            ret.add(note);
            
        }
        if(oconn==null){
            DB.close(conn);
        }
        return ret;            
        
    }
     
    public static LinkedList LoadBySessionAndNull(String session,int number,int offset, Connection oconn) throws SQLException{
    
        Connection conn = oconn == null ? DB.getConn() : oconn;
        String sql = "(SELECT u.nome, u.cognome, n.id_nota, n.data_creazione, n.descrizione, n.titolo from utenti AS u right outer join (select * from note where (id_utente =(select id_utente from utenti where ultima_sessione = ?) or id_utente is null) and not cancellato) AS n on (u.id_utente = n.id_utente)) order by id_nota desc limit ? OFFSET ?";
        doLoadById = conn.prepareStatement(sql);
        doLoadById.setString(1, session);
        doLoadById.setInt(2, number);
        doLoadById.setInt(3,offset);
        ResultSet rs = doLoadById.executeQuery();
        LinkedList<Note> ret = new LinkedList();
        while(rs.next()){
            Note note = new Note();
            note.setNome(rs.getString("nome"));
            note.setCognome(rs.getString("cognome"));
            note.setIdNota(rs.getLong("id_nota"));
            note.setDataCreazione(rs.getTimestamp("data_creazione"));
            note.setDescrizione(rs.getString("descrizione"));
            note.setTitolo(rs.getString("titolo"));
            ret.add(note);
            
        }
        if(oconn==null){
            DB.close(conn);
        }
        return ret;           
        
    } 
    
    public static void DeleteNoteById(Long[] IdNote, Connection oconn) throws SQLException{
        Connection conn = oconn == null ? DB.getConn() : oconn;
        String sql = "UPDATE note set cancellato =? where id_nota = ?;";
        doUpdate = conn.prepareStatement(sql);
        for(int i=0;i<IdNote.length;i++){
            doUpdate.setBoolean(1, true);
            doUpdate.setLong(2, IdNote[i]);
            doUpdate.addBatch();
        }
        doUpdate.executeBatch();
        
        
        if(oconn==null){
            DB.close(conn);
        }

        
    }
    
    
    
    
}
