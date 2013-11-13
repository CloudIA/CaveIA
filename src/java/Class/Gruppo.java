/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Class;

import java.util.LinkedList;

/**
 *
 * @author marco.bonamente
 */
public class Gruppo {
    private Long idGruppo;
    private String descrizione;
    private Short permesso1;
    private Short permesso2;
    private LinkedList<Utente> DBUtentiList;   
    
    public                  Gruppo()                              {}
    public                  Gruppo(Long idGruppo)                 {this.idGruppo = idGruppo;}

    public Long             getIdGruppo()                           {return idGruppo;}
    public void             setIdGruppo(Long idGruppo)              {this.idGruppo = idGruppo;}

    public String           getDescrizione()                        {return descrizione;}
    public void             setDescrizione(String descrizione)      {this.descrizione = descrizione;}

    public Short            getPermesso1()                          {return permesso1;}
    public void             setPermesso1(Short permesso1)           {this.permesso1 = permesso1;}

    public Short            getPermesso2()                          {return permesso2;}
    public void             setPermesso2(Short permesso2)           {this.permesso2 = permesso2;}

    public LinkedList<Utente>   getUtenti()                             {return DBUtentiList;}
    public void             setUtenti(LinkedList<Utente> DBUtentiList)  {this.DBUtentiList = DBUtentiList;}    
    
    
    
    
    
}
