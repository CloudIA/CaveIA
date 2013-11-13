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
public class Cave {
    private Long idCava;
    private Date inizioVal;
    private Date fineVal;
    private String codiceCava;
    private Anagrafica anagrafica;
    private boolean attiva;
    private String materiale;
    private String codiceCavaMadre;
    private Long idCavaMadre;
    private String geom;

    public Cave() {
        this.idCava=0L;
        this.inizioVal=null;
        this.fineVal=null;
        this.codiceCava="";
        this.anagrafica=new Anagrafica();
        this.attiva=false;
        this.materiale="";
        this.codiceCavaMadre="";
        this.idCavaMadre=0L;
        this.geom="";
    }

    public Long getIdCava() {
        return idCava;
    }

    public void setIdCava(Long idCava) {
        this.idCava = idCava;
    }

    public Date getInizioVal() {
        return inizioVal;
    }

    public void setInizioVal(Date inizioVal) {
        this.inizioVal = inizioVal;
    }

    public Date getFineVal() {
        return fineVal;
    }

    public void setFineVal(Date fineVal) {
        this.fineVal = fineVal;
    }

    public String getCodiceCava() {
        return codiceCava;
    }

    public void setCodiceCava(String codiceCava) {
        this.codiceCava = codiceCava;
    }

    public Anagrafica getAnagrafica() {
        return anagrafica;
    }

    public void setAnagrafica(Anagrafica anagrafica) {
        this.anagrafica = anagrafica;
    }

    public boolean isAttiva() {
        return attiva;
    }

    public void setAttiva(boolean attiva) {
        this.attiva = attiva;
    }

    public String getMateriale() {
        return materiale;
    }

    public void setMateriale(String materiale) {
        this.materiale = materiale;
    }

    public String getCodiceCavaMadre() {
        return codiceCavaMadre;
    }

    public void setCodiceCavaMadre(String codiceCavaMadre) {
        this.codiceCavaMadre = codiceCavaMadre;
    }

    public Long getIdCavaMadre() {
        return idCavaMadre;
    }

    public void setIdCavaMadre(Long idCavaMadre) {
        this.idCavaMadre = idCavaMadre;
    }

    public String getGeom() {
        return geom;
    }

    public void setGeom(String geom) {
        this.geom = geom;
    }
    
    
    
    
}
