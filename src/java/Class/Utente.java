/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Class;

import java.util.Date;


/**
 *
 * @author marco.bonamente
 */
public class Utente {
    
  private static final long serialVersionUID = 1L;             
    private Long idUtente;                                  
    private String username;                                
    private String password;                                
    private String nome;
    private String cognome;                      
    private Date ultimoAccesso;
    private String ultimoIp;
    private String email;
    private String lastSession;   
    
    public Utente(){}

    public Utente(Long idUtente)                          {this.idUtente = idUtente;}

    public Long     getIdUtente()                           {return idUtente;}
    public void     setIdUtente(Long idUtente)              {this.idUtente = idUtente;}   
    
    public String   getUsername()                           {return username;}
    public void     setUsername(String username)            {this.username = username;}
    
    public String   getPassword()                           {return password;}
    public void     setPassword(String password)            {this.password = password;}
    
    public String   getNome()                               {return nome;}
    public void     setNome(String nome)                    {this.nome = nome;}

    public String   getCognome()                            {return cognome;}
    public void     setCognome(String cognome)              {this.cognome = cognome;}
    
    public Date     getUltimoAccesso()                      {return ultimoAccesso;}
    public void     setUltimoAccesso(Date ultimoAccesso)    {this.ultimoAccesso = ultimoAccesso;}

    public String   getUltimoIp()                           {return ultimoIp;}
    public void     setUltimoIp(String ultimoIp)            {this.ultimoIp = ultimoIp;}
   
    public String   getEmail()                              {return email;}
    public void     setEmail(String email)                  {this.email = email;}
    
    public String   getLastSession()                        {return lastSession;}
    public void     setLastSession(String last_session)     {this.lastSession = last_session;}    
 
    

        
    
}
