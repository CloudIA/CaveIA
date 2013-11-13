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
public class Alert {
    Long idAlert;
    Long idUtente;
    Timestamp istante;
    String tipoAlert;
    Long idAssociato;
    String descrizione;

    public Alert() {
        this.idAlert=0L;
        this.idUtente=0L;
        this.istante=null;
        this.tipoAlert="";
        this.idAssociato=0L;
        this.descrizione="";
    }

    public Long getIdAlert() {
        return idAlert;
    }

    public void setIdAlert(Long idAlert) {
        this.idAlert = idAlert;
    }

    public Long getIdUtente() {
        return idUtente;
    }

    public void setIdUtente(Long idUtente) {
        this.idUtente = idUtente;
    }

    public Timestamp getIstante() {
        return istante;
    }

    public void setIstante(Timestamp istante) {
        this.istante = istante;
    }

    public String getTipoAlert() {
        return tipoAlert;
    }

    public void setTipoAlert(String tipoAlert) {
        this.tipoAlert = tipoAlert;
    }

    public Long getIdAssociato() {
        return idAssociato;
    }

    public void setIdAssociato(Long idAssociato) {
        this.idAssociato = idAssociato;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }
    
    
    
}
