/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Alert;

import CaveIA.DB.DBAlert;
import Class.Alert;
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
@WebServlet(name = "AlertServlet", urlPatterns = {"/AlertServlet"})
public class AlertServlet extends HttpServlet {

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
        switch (request.getParameter("action")) {
            //Se acrion è fetchData prendo i dati dal db e li mando alla pagina

            case "fetchData":
                response.setContentType("application/json;charset=UTF-8");
                response.setHeader("Cache-Control", "no-cache");
                String json = "{\"result\": [";

                List<Alert> alert = DBAlert.LoadAll();

                for (int i = 0; i < alert.size(); i++) {
                    json = json + "{";
                    json = json + "\"idAlert\": " + alert.get(i).getIdAlert().toString() + ", ";
                    json = json + "\"idUtente\": " + alert.get(i).getIdUtente() + ", ";
                    json = json + "\"istante\": " +"\"" +alert.get(i).getIstante()+"\"" + ", ";
                    json = json + "\"tipoAlert\": " +"\"" +alert.get(i).getTipoAlert()+"\"" + ", ";
                    json = json + "\"idAssociato\": "+"\"" + alert.get(i).getIdAssociato()+"\"" + ", ";
                    json = json + "\"descrizione\": "+"\"" + alert.get(i).getDescrizione()+"\"";
                    if (i == alert.size() - 1) {
                        json = json + "}";
                    } else {
                        json = json + "},";
                    }
                }

                json = json + "]}";
                response.getWriter().write(json);

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
            Logger.getLogger(AlertServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AlertServlet.class.getName()).log(Level.SEVERE, null, ex);
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
