/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Note;

import CaveIA.DB.DBNote;
import CaveIA.DB.DBUtenti;
import Class.Note;
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
@WebServlet(name = "NoteServlet", urlPatterns = {"/NoteServlet"})
public class NoteServlet extends HttpServlet {

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
        
        
        int length;
        int offset;
        List<Note> note;
        String json;
        
        
        switch(request.getParameter("action")){
            
            case "fetchData":
                response.setContentType("application/json;charset=UTF-8");
                response.setHeader("Cache-Control", "no-cache");
                json = "{\"result\": [";
                length = Integer.parseInt(request.getParameter("length"));
                offset = Integer.parseInt(request.getParameter("offset"));
                
                note = DBNote.LoadBySessionAndNull(request.getSession().getId(), length,offset, null);

                for (int i = 0; i < note.size(); i++) {
                    json = json + "{";
                    json = (note.get(i).getIdNota()== null) ? (json + "\"idNota\": 0 , ") : (json + "\"idNota\": " + note.get(i).getIdNota().toString() + ", ");
                    json = (note.get(i).getNome()== null) ? (json + "\"nome\": \"\" , ") : (json + "\"nome\": " + "\"" + note.get(i).getNome()+ "\"" + ", ");
                    json = (note.get(i).getCognome()== null) ? (json + "\"cognome\": \"\" , ") : (json + "\"cognome\": " + "\"" + note.get(i).getCognome()+ "\"" + ", ");
                    json = (note.get(i).getDescrizione() == null) ? (json + "\"descrizione\": \"\" , ") : (json + "\"descrizione\": " + "\"" + note.get(i).getDescrizione() + "\"" + ", ");
                    json = (note.get(i).getDataCreazione() == null) ? (json + "\"data_creazione\": 0 , ") : (json + "\"data_creazione\": " + "\"" + note.get(i).getDataCreazione() + "\"" + ", ");
                    json = (note.get(i).getTitolo() == null) ? (json + "\"titolo\": \"\" ") : (json + "\"titolo\": " + "\"" + note.get(i).getTitolo() + "\"");
                    if (i == note.size() - 1) {
                        json = json + "}";
                    } else {
                        json = json + "},";
                    }
                }                
                json = json + "]}";
                response.getWriter().write(json);

                break;
                
            case "deleteNote":
                response.setContentType("application/json;charset=UTF-8");
                response.setHeader("Cache-Control", "no-cache");
                String[] tmp = request.getParameterValues("idNote[]");
                length = Integer.parseInt(request.getParameter("length"));
                Long[] tmpLong = new Long[tmp.length];
                for (int i = 0; i < tmp.length; i++) {
                    tmpLong[i] =  Long.parseLong(tmp[i]);
                }
                DBNote.DeleteNoteById(tmpLong, null);

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
            Logger.getLogger(NoteServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(NoteServlet.class.getName()).log(Level.SEVERE, null, ex);
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
