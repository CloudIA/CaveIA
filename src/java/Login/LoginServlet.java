/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Login;

import CaveIA.DB.DBUtenti;
import Class.Utente;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author marco.bonamente
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
            throws ServletException, IOException, NoSuchAlgorithmException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        java.util.Date date= new java.util.Date();

        String UserName = request.getParameter("UserName");
        request.removeAttribute("UserName");
        String Password = request.getParameter("Password");
        request.removeAttribute("Password");
        String Request = request.getParameter("Type");
        request.removeAttribute("Type");

        //Prendo l'indirizzo ip dell'utente che si connette
        String remoteAddr = request.getRemoteAddr();
        //Creo la variabile utente
        Utente utente=null;
       
        String IDSession = request.getSession().getId();
        
        
        
        String Hash = "@$@4&#%^$*" + Password;
        MessageDigest m;
        m = MessageDigest.getInstance("MD5");
        m.reset();
        m.update(Hash.getBytes());
        String PasswordCripted = new BigInteger(1, m.digest()).toString(16);
        while (PasswordCripted.length() < 32) {
            PasswordCripted = "0" + PasswordCripted;
        }
        
        
            utente = DBUtenti.LoadByUserName(UserName);
            switch (Request) {
                case "login":
                    //Se non trovo l'utente
                    if (utente == null) {
                        RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/index.jsp");
                        request.setAttribute("result", "noUserAndPassword");
                        rd.forward(request, response);
                    //Se la password non corrisponde 
                    }else if(!PasswordCripted.equals(utente.getPassword())){
                        RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/index.jsp");
                        request.setAttribute("result", "noUserAndPassword");
                        rd.forward(request, response);                        
                    }
                    //Se la password corrisponde
                    else {
                        utente.setUltimoAccesso(new Timestamp(date.getTime()));
                        utente.setLastSession(IDSession);
                        utente.setUltimoIp(remoteAddr);
                        DBUtenti.Update(utente);
                        request.setAttribute("nome", utente.getNome());
                        request.setAttribute("cognome", utente.getCognome());
                        RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/home.jsp");
                        rd.forward(request, response);
                    }
                    break;
                case "submit":
                    String Nome = request.getParameter("name");
                    request.removeAttribute("name");
                    String Cognome = request.getParameter("cognome");
                    request.removeAttribute("cognome");
                    String Email = request.getParameter("email");
                    request.removeAttribute("email");
                    if (utente==null) {
                        utente = new Utente();
                        utente.setUsername(UserName);
                        utente.setPassword(PasswordCripted);
                        utente.setNome(Nome);
                        utente.setCognome(Cognome);
                        utente.setUltimoAccesso(new Timestamp(date.getTime()));
                        utente.setUltimoIp(remoteAddr);
                        utente.setEmail(Email);
                        utente.setLastSession(IDSession);
                        DBUtenti.Insert(utente);
                        request.setAttribute("result", "UserCreated");
                        RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/index.jsp");
                        rd.forward(request, response);
                    } else {
                        request.setAttribute("result", "UserExist");
                        RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/index.jsp");
                        rd.forward(request, response);
                    }
                    break;
                default:
                    RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/index.jsp");
                    rd.forward(request, response);
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
        } catch (NoSuchAlgorithmException | SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (NoSuchAlgorithmException | SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
