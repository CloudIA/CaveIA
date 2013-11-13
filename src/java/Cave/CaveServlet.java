/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Cave;

import CaveIA.DB.DBCave;
import Class.Cave;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author marco.bonamente
 */
@WebServlet(name = "CaveServlet", urlPatterns = {"/CaveServlet"})
public class CaveServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        List<Cave> cave;
        String json="";
        String header;
        String footer;
        int totalPage;
        int page;
        int limit;
        String sidx;
        String sord;

        int sEcho = 0;
        int offset = 0;
        String sSearch="";

        switch (request.getParameter("action")) {
            //Se action è fetchDdata prendo i dati del db e li mando alla pagina
            //page = numero di pagina
            //rows = il numero di rows per pagina
            //sidx = la colonna su quale ordinare i dati
            //sord = l'ordinamento ASC oppure DESC
            case "fetchData":
                sEcho = Integer.parseInt(request.getParameter("sEcho"));
                sSearch = request.getParameter("sSearch");
                offset = Integer.parseInt(request.getParameter("iDisplayStart"));
                if("".equals(sSearch)){
                    cave = DBCave.LoadAll();
                }else{
                    cave = DBCave.LoadAndfind(sSearch);
                }
                
                if (cave.size() < offset) {
                    json = "{\"sEcho\": " + sEcho + ", \"iTotalRecords\": 0, \"iTotalDisplayRecords\": 0, \"aaData\": []}";
                } else  {
                    cave = cave.subList(offset, cave.size());
                    json = "{\"sEcho\": " + sEcho + ", \"iTotalRecords\": " + cave.size() + ", \"iTotalDisplayRecords\": " + cave.size() + ", \"aaData\": [";
                    for (int i = 0; i < cave.size(); i++) {
                        json = json + " {";
                        json = (cave.get(i).getIdCava()== null)                             ? (json + "\"idCava\": \"\",")          : (json + "\"idCava\": \""            + cave.get(i).getIdCava()                             + "\",");
                        json = (cave.get(i).getCodiceCavaMadre()== null)                    ? (json + "\"codiceMadre\": \"\",")     : (json + "\"codiceMadre\": \""       + cave.get(i).getCodiceCavaMadre()                    + "\",");
                        json = (cave.get(i).getCodiceCava() == null)                        ? (json + "\"codiceCava\": \"\",")      : (json + "\"codiceCava\": \""        + cave.get(i).getCodiceCava()                         + "\",");
                        json = (cave.get(i).getAnagrafica().getRagioneSociale() == null)    ? (json + "\"ragioneSociale\": \"\",")  : (json + "\"ragioneSociale\": \""    + cave.get(i).getAnagrafica().getRagioneSociale()     + "\",");
                        json = (cave.get(i).getFineVal() == null)                           ? (json + "\"fineVal\": \"\",")         : (json + "\"fineVal\": \""           + cave.get(i).getFineVal()                            + "\","); 
                        json = (cave.get(i).getMateriale()== null)                          ? (json + "\"materiale\": \"\",")       : (json + "\"materiale\": \""         + cave.get(i).getMateriale()                          + "\",");
                        json = (cave.get(i).getGeom()== null)                               ? (json + "\"geometry\": \"\"")             : (json + "\"geometry\": ["              + cave.get(i).getGeom()                                + "] ");

                        if (i == cave.size() - 1) {
                            json = json + "}";
                        } else {
                            json = json + "},";
                        }
                    }
                    json = json + "]}";

                }


                //json = "{\"sEcho\": 1, \"iTotalRecords\": 57, \"iTotalDisplayRecords\": 57, \"aaData\": [ [\"Trident\",\"Internet Explorer 4.0\",\"Win 95+\",\"4\",\"X\"],[\"Trident\",\"Internet Explorer 5.0\",\"Win 95+\",\"5\",\"C\"],[\"Trident\",\"Internet Explorer 5.5\",\"Win 95+\",\"5.5\",\"A\"],[\"Trident\",\"Internet Explorer 6\",\"Win 98+\",\"6\",\"A\"],[\"Trident\",\"Internet Explorer 7\",\"Win XP SP2+\",\"7\",\"A\"],[\"Trident\",\"AOL browser (AOL desktop)\",\"Win XP\",\"6\",\"A\"],[\"Gecko\",\"Firefox 1.0\",\"Win 98+ / OSX.2+\",\"1.7\",\"A\"],[\"Gecko\",\"Firefox 1.5\",\"Win 98+ / OSX.2+\",\"1.8\",\"A\"],[\"Gecko\",\"Firefox 2.0\",\"Win 98+ / OSX.2+\",\"1.8\",\"A\"],[\"Gecko\",\"Firefox 3.0\",\"Win 2k+ / OSX.3+\",\"1.9\",\"A\"],[\"Gecko\",\"Camino 1.0\",\"OSX.2+\",\"1.8\",\"A\"],[\"Gecko\",\"Camino 1.5\",\"OSX.3+\",\"1.8\",\"A\"],[\"Gecko\",\"Netscape 7.2\",\"Win 95+ / Mac OS 8.6-9.2\",\"1.7\",\"A\"],[\"Gecko\",\"Netscape Browser 8\",\"Win 98SE+\",\"1.7\",\"A\"],[\"Gecko\",\"Netscape Navigator 9\",\"Win 98+ / OSX.2+\",\"1.8\",\"A\"],[\"Gecko\",\"Mozilla 1.0\",\"Win 95+ / OSX.1+\",\"1\",\"A\"],[\"Gecko\",\"Mozilla 1.1\",\"Win 95+ / OSX.1+\",\"1.1\",\"A\"],[\"Gecko\",\"Mozilla 1.2\",\"Win 95+ / OSX.1+\",\"1.2\",\"A\"],[\"Gecko\",\"Mozilla 1.3\",\"Win 95+ / OSX.1+\",\"1.3\",\"A\"],[\"Gecko\",\"Mozilla 1.4\",\"Win 95+ / OSX.1+\",\"1.4\",\"A\"],[\"Gecko\",\"Mozilla 1.5\",\"Win 95+ / OSX.1+\",\"1.5\",\"A\"],[\"Gecko\",\"Mozilla 1.6\",\"Win 95+ / OSX.1+\",\"1.6\",\"A\"],[\"Gecko\",\"Mozilla 1.7\",\"Win 98+ / OSX.1+\",\"1.7\",\"A\"],[\"Gecko\",\"Mozilla 1.8\",\"Win 98+ / OSX.1+\",\"1.8\",\"A\"],[\"Gecko\",\"Seamonkey 1.1\",\"Win 98+ / OSX.2+\",\"1.8\",\"A\"],[\"Gecko\",\"Epiphany 2.20\",\"Gnome\",\"1.8\",\"A\"],[\"Webkit\",\"Safari 1.2\",\"OSX.3\",\"125.5\",\"A\"],[\"Webkit\",\"Safari 1.3\",\"OSX.3\",\"312.8\",\"A\"],[\"Webkit\",\"Safari 2.0\",\"OSX.4+\",\"419.3\",\"A\"],[\"Webkit\",\"Safari 3.0\",\"OSX.4+\",\"522.1\",\"A\"],[\"Webkit\",\"OmniWeb 5.5\",\"OSX.4+\",\"420\",\"A\"],[\"Webkit\",\"iPod Touch / iPhone\",\"iPod\",\"420.1\",\"A\"],[\"Webkit\",\"S60\",\"S60\",\"413\",\"A\"],[\"Presto\",\"Opera 7.0\",\"Win 95+ / OSX.1+\",\"-\",\"A\"],[\"Presto\",\"Opera 7.5\",\"Win 95+ / OSX.2+\",\"-\",\"A\"],[\"Presto\",\"Opera 8.0\",\"Win 95+ / OSX.2+\",\"-\",\"A\"],[\"Presto\",\"Opera 8.5\",\"Win 95+ / OSX.2+\",\"-\",\"A\"],[\"Presto\",\"Opera 9.0\",\"Win 95+ / OSX.3+\",\"-\",\"A\"],[\"Presto\",\"Opera 9.2\",\"Win 88+ / OSX.3+\",\"-\",\"A\"],[\"Presto\",\"Opera 9.5\",\"Win 88+ / OSX.3+\",\"-\",\"A\"],[\"Presto\",\"Opera for Wii\",\"Wii\",\"-\",\"A\"],[\"Presto\",\"Nokia N800\",\"N800\",\"-\",\"A\"],[\"Presto\",\"Nintendo DS browser\",\"Nintendo DS\",\"8.5\",\"C/A1\"],[\"KHTML\",\"Konqureror 3.1\",\"KDE 3.1\",\"3.1\",\"C\"],[\"KHTML\",\"Konqureror 3.3\",\"KDE 3.3\",\"3.3\",\"A\"],[\"KHTML\",\"Konqureror 3.5\",\"KDE 3.5\",\"3.5\",\"A\"],[\"Tasman\",\"Internet Explorer 4.5\",\"Mac OS 8-9\",\"-\",\"X\"],[\"Tasman\",\"Internet Explorer 5.1\",\"Mac OS 7.6-9\",\"1\",\"C\"],[\"Tasman\",\"Internet Explorer 5.2\",\"Mac OS 8-X\",\"1\",\"C\"],[\"Misc\",\"NetFront 3.1\",\"Embedded devices\",\"-\",\"C\"],[\"Misc\",\"NetFront 3.4\",\"Embedded devices\",\"-\",\"A\"],[\"Misc\",\"Dillo 0.8\",\"Embedded devices\",\"-\",\"X\"],[\"Misc\",\"Links\",\"Text only\",\"-\",\"X\"],[\"Misc\",\"Lynx\",\"Text only\",\"-\",\"X\"],[\"Misc\",\"IE Mobile\",\"Windows Mobile 6\",\"-\",\"C\"],[\"Misc\",\"PSP browser\",\"PSP\",\"-\",\"C\"],[\"Other browsers\",\"All others\",\"-\",\"-\",\"U\"]] } ";
                //Invio il dato
                response.getWriter().write(json);
                break;
            //Se action è addData aggiungo il campo al database            
            case "addData":

                break;

            //Se action è addDatas aggiungo tutti i campi al database serve per importare i dati da file esterni
            case "addDatas":
                break;

            //Se action è editData cambio i dati presenti nel db prendendo la chiave idAnagrafica
            //e resetto il campo geom ponendolo pari a null
            case "editData":
                break;

            //Se action è searchData cerco i dati nel db           
            case "searchData":
                break;

            //Se action è addPoint aggiunto il punto alla colonna geom sulla base dell'id
            case "addPoint":

                break;

        }            
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CaveServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CaveServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
