/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Anagrafica;

import CaveIA.DB.DBAnagrafica;
import Class.Anagrafica;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "AnagraficaServlet", urlPatterns = {"/AnagraficaServlet"})
public class AnagraficaServlet extends HttpServlet {

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
        
        
        List<Anagrafica> anagrafica;
        String json;
        String header;
        String footer;
        int totalPage;
        int page;
        int limit;
        String sidx;
        String sord;

        switch (request.getParameter("action")) {
            //Se action è fetchDdata prendo i dati del db e li mando alla pagina
            //page = numero di pagina
            //rows = il numero di rows per pagina
            //sidx = la colonna su quale ordinare i dati
            //sord = l'ordinamento ASC oppure DESC
            case "fetchData":
                page = Integer.parseInt(request.getParameter("page"));
                limit = Integer.parseInt(request.getParameter("rows"));
                sidx = request.getParameter("sidx");
                sord = request.getParameter("sord");
                response.setContentType("application/json;charset=UTF-8");
                response.setHeader("Cache-Control", "no-cache");
                //Chiamo il beam che mi restituisce la lista dell'anagrafica
                anagrafica = DBAnagrafica.LoadAll();
                //Conto gli elementi
                int count = anagrafica.size();
                //Calcolo quante pagine compongono la tabella
                if (count > 0) {
                    totalPage = (int) java.lang.Math.ceil((float) count / (float) limit);
                } else {
                    totalPage = 0;
                }
                if (page > totalPage) {
                    page = totalPage;
                }
                if (limit < 0) {
                    limit = 0;
                }
                int start = limit * page - limit;
                if (start < 0) {
                    start = 0;
                }
                //Creo la sottolista da inviare al client
                if ((start + limit) > anagrafica.size()) {
                    anagrafica = anagrafica.subList(start, anagrafica.size());
                } else {
                    anagrafica = anagrafica.subList(start, start + limit);
                }
                json="[";
                for(int i=0; i<anagrafica.size();i++){
                    json=json+"{";
                    json = (anagrafica.get(i).getIdAnagrafica() == null)    ? (json + "\"idAnagrafica\": 0 , ")         : (json + "\"idAnagrafica\": "          + anagrafica.get(i).getIdAnagrafica()           + ", ");                    
                    json = (anagrafica.get(i).getRagioneSociale() == null)  ? (json + "\"ragioneSociale\": \"\" , ")    : (json + "\"ragioneSociale\": "        + "\""  + anagrafica.get(i).getRagioneSociale() + "\", ");  
                    json = (anagrafica.get(i).getCf()== null)               ? (json + "\"cf\": \"\" , ")                : (json + "\"cf\": "                    + "\""  + anagrafica.get(i).getCf()             + "\", ");           
                    json = (anagrafica.get(i).getpIva()== null)             ? (json + "\"piva\": \"\" , ")              : (json + "\"piva\": "                  + "\""  + anagrafica.get(i).getpIva()           + "\", ");
                    json = (anagrafica.get(i).getIndirizzo()== null)        ? (json + "\"indirizzo\": \"\" , ")         : (json + "\"indirizzo\": "             + "\""  + anagrafica.get(i).getIndirizzo()      + "\", "); 
                    json = (anagrafica.get(i).getCitta()== null)            ? (json + "\"citta\": \"\" , ")             : (json + "\"citta\": "                 + "\""  + anagrafica.get(i).getCitta()          + "\", ");
                    json = (anagrafica.get(i).getTel()== null)              ? (json + "\"tel\": \"\" , ")               : (json + "\"tel\": "                   + "\""  + anagrafica.get(i).getTel()            + "\", "); 
                    json = (anagrafica.get(i).getCel()== null)              ? (json + "\"cel\": \"\" , ")               : (json + "\"cel\": "                   + "\""  + anagrafica.get(i).getCel()            + "\", "); 
                    json = (anagrafica.get(i).getFax()== null)              ? (json + "\"fax\": \"\" , ")               : (json + "\"fax\": "                   + "\""  + anagrafica.get(i).getFax()            + "\", ");
                    json = (anagrafica.get(i).getEmail()== null)            ? (json + "\"email\": \"\" , ")             : (json + "\"email\": "                 + "\""  + anagrafica.get(i).getEmail()          + "\", ");
                    json = (anagrafica.get(i).getPec()== null)              ? (json + "\"pec\": \"\" ,  ")                : (json + "\"pec\": "                   + "\""  + anagrafica.get(i).getPec()            + "\", ");
                    json = (anagrafica.get(i).getGeom()== null)             ? (json + "\"geom\": \"\"  ")               : (json + "\"geom\": "                    + anagrafica.get(i).getGeom()           + " ");
                    
                    if (i == anagrafica.size() - 1) {
                        json = json + "}";
                    } else {
                        json = json + "},";
                    }
                }
                json=json+"]";
                //Creo l'header da appendere alla stringa json dove all'interno inserisco il numero di record, la pagina, il totale della pagine e i dati
                header = "{";
                header = header + "\"records\": " + "\"" + count + "\",";
                header = header + "\"page\": " + page + ",";
                header = header + "\"total\": " + totalPage + ",";
                header = header + "\"rows\": ";
                footer = "}";
                //Invio il dato
                response.getWriter().write(header + json + footer);
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
                long idAnagrafica = Long.parseLong(request.getParameter("idAnagrafica"));
                float lat = Float.parseFloat(request.getParameter("lat"));
                float lng = Float.parseFloat(request.getParameter("lng"));
                //Aggiungo il punto
                DBAnagrafica.AddPoint(idAnagrafica, lat, lng, null);
                response.setContentType("application/json;charset=UTF-8");
                response.setHeader("Cache-Control", "no-cache");
                response.getWriter().write("{}");
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
            Logger.getLogger(AnagraficaServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AnagraficaServlet.class.getName()).log(Level.SEVERE, null, ex);
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
