/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Class;

import java.sql.Timestamp;

/**
 *
 * @author marco.bonamente
 */
public class Note {
    Long idNota;
    Long idUtente;
    String descrizione;
    String titolo;
    Timestamp dataCreazione;
    String Nome;
    String Cognome;

    public Note(Long idNota, Long idUtente, String descrizione) {
        this.idNota = idNota;
        this.idUtente = idUtente;
        this.descrizione = descrizione;
        this.titolo="";
        this.dataCreazione=null;
        this.Nome="";
        
    }

    public Note() {
        this.idNota=0L;
        this.idUtente=0L;
        this.descrizione="";
        this.titolo="";
        this.dataCreazione=null;   
        this.Cognome="";
    }

    public Long getIdNota() {
        return idNota;
    }

    public void setIdNota(Long idNota) {
        this.idNota = idNota;
    }

    public Long getIdUtente() {
        return idUtente;
    }

    public void setIdUtente(Long idUtente) {
        this.idUtente = idUtente;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public String getTitolo() {
        return titolo;
    }

    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    public Timestamp getDataCreazione() {
        return dataCreazione;
    }

    public void setDataCreazione(Timestamp dataCreazione) {
        this.dataCreazione = dataCreazione;
    }

    public String getNome() {
        return Nome;
    }

    public void setNome(String Nome) {
        this.Nome = Nome;
    }

    public String getCognome() {
        return Cognome;
    }

    public void setCognome(String Cognome) {
        this.Cognome = Cognome;
    }
    
    
    
}
