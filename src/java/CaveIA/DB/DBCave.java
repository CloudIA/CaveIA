/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CaveIA.DB;

import static CaveIA.DB.DBCave.Load;
import static CaveIA.DB.DBCave.LoadAndFind;
import Class.Cave;
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
public class DBCave {

    static PreparedStatement doInsert = null;
    static PreparedStatement doLoadById = null;
    static PreparedStatement doDeleteById = null;
    static PreparedStatement doUpdate = null;

    public static LinkedList LoadAll() throws SQLException {
        return Load("select id_cave,mother_id_cave,mother_codice_cava,codice_cava,a_ragione_sociale as ragione_sociale,fine_val,m_tipo as tipo,ST_AsGeoJSON(ar_geom) as geom from (select * from cave as c\n"
                + "LEFT OUTER JOIN (select id_proprietari_cave as p_id_propretari_cave, id_anagrafica as p_id_anagrafica, id_cava as p_id_cava, inizio_val as p_inizio_val, fine_val as p_fine_val from propretari_cave) as p on c.id_cave = p.p_id_cava\n"
                + "LEFT OUTER JOIN (select id_anagrafica as a_id_anagrafica, ragione_sociale as a_ragione_sociale, cf as a_cf, piva as a_piva, indirizzo as a_indirizzo, tel as a_tel, cel as a_cel, fax as a_fax, email as a_email, pec as a_pec, citta as a_citta, ST_AsGeoJSON(geom) as a_geom from anagrafica) as a on p.p_id_anagrafica = a.a_id_anagrafica\n"
                + "LEFT OUTER JOIN (select id_materiale as m_id_materiale, tipo as m_tipo from materiale) as m on c.id_materiale = m.m_id_materiale\n"
                + "LEFT OUTER JOIN (select codice_cava as mother_codice_cava,id_cave as mother_id_cave from cave) as cm on c.cava_madre = cm.mother_id_cave\n"
                + "LEFT OUTER JOIN (select id_area as ar_id_area, id_cava as ar_id_cava, geom as ar_geom, inizio_val as ar_inizio_val, fine_val as ar_fine_val from aree ) as ar on ar.ar_id_cava = c.id_cave) as foo", null);
    }

    public static LinkedList Load(String sql) throws SQLException {
        return Load(sql, null);
    }

    public static LinkedList Load(String sql, Connection oconn) throws SQLException {
        Connection conn = oconn == null ? DB.getConn() : oconn;
        Statement doLoad = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = doLoad.executeQuery(sql);
        LinkedList<Cave> ret = new LinkedList();
        while (rs.next()) {
            Cave cave = new Cave();
            cave.setIdCava(rs.getLong("id_cave"));
            cave.setIdCavaMadre(rs.getLong("mother_id_cave"));
            cave.setCodiceCavaMadre(rs.getString("mother_codice_cava"));
            cave.setCodiceCava(rs.getString("codice_cava"));
            cave.getAnagrafica().setRagioneSociale(rs.getString("ragione_sociale"));
            cave.setFineVal(rs.getDate("fine_val"));
            cave.setMateriale(rs.getString("tipo"));
            cave.setGeom(rs.getString("geom"));            
            ret.add(cave);
        }
        if (oconn == null) {
            DB.close(conn);
        }
        return ret;
    }

    public static LinkedList LoadAndfind(String string) throws SQLException {
        return LoadAndFind("select id_cave,mother_id_cave,mother_codice_cava,codice_cava,a_ragione_sociale as ragione_sociale,fine_val,m_tipo as tipo,ST_AsGeoJSON(ar_geom) as geom from (select * from cave as c\n"
                + "LEFT OUTER JOIN (select id_proprietari_cave as p_id_propretari_cave, id_anagrafica as p_id_anagrafica, id_cava as p_id_cava, inizio_val as p_inizio_val, fine_val as p_fine_val from propretari_cave) as p on c.id_cave = p.p_id_cava\n"
                + "LEFT OUTER JOIN (select id_anagrafica as a_id_anagrafica, ragione_sociale as a_ragione_sociale, cf as a_cf, piva as a_piva, indirizzo as a_indirizzo, tel as a_tel, cel as a_cel, fax as a_fax, email as a_email, pec as a_pec, citta as a_citta, ST_AsGeoJSON(geom) as a_geom from anagrafica) as a on p.p_id_anagrafica = a.a_id_anagrafica\n"
                + "LEFT OUTER JOIN (select id_materiale as m_id_materiale, tipo as m_tipo from materiale) as m on c.id_materiale = m.m_id_materiale\n"
                + "LEFT OUTER JOIN (select codice_cava as mother_codice_cava,id_cave as mother_id_cave from cave) as cm on c.cava_madre = cm.mother_id_cave\n"
                + "LEFT OUTER JOIN (select id_area as ar_id_area, id_cava as ar_id_cava, geom as ar_geom, inizio_val as ar_inizio_val, fine_val as ar_fine_val from aree ) as ar on ar.ar_id_cava = c.id_cave) as foo\n"
                + "where (mother_codice_cava LIKE ? OR codice_cava LIKE ? OR a_ragione_sociale LIKE ?);", null, string);
    }

    public static LinkedList LoadAndFind(String sql, String string) throws SQLException {
        return LoadAndFind(sql, null, string);
    }

    public static LinkedList LoadAndFind(String sql, Connection oconn, String string) throws SQLException {
        Connection conn = oconn == null ? DB.getConn() : oconn;
        PreparedStatement doLoad = conn.prepareStatement(sql);
        doLoad.setString(1, "%" + string + "%");
        doLoad.setString(2, "%" + string + "%");
        doLoad.setString(3, "%" + string + "%");
        ResultSet rs = doLoad.executeQuery();
        LinkedList<Cave> ret = new LinkedList();
        while (rs.next()) {
            Cave cave = new Cave();
            cave.setIdCava(rs.getLong("id_cave"));
            cave.setIdCavaMadre(rs.getLong("mother_id_cave"));
            cave.setCodiceCavaMadre(rs.getString("mother_codice_cava"));
            cave.setCodiceCava(rs.getString("codice_cava"));
            cave.getAnagrafica().setRagioneSociale(rs.getString("ragione_sociale"));
            cave.setFineVal(rs.getDate("fine_val"));
            cave.setMateriale(rs.getString("tipo"));
            cave.setGeom(rs.getString("geom"));
            ret.add(cave);
        }
        if (oconn == null) {
            DB.close(conn);
        }
        return ret;
    }

}
