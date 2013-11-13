/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Class;

/**
 *
 * @author marco.bonamente
 */
public class Anagrafica {
    
    private Long idAnagrafica;
    private String ragioneSociale;
    private String cf;
    private String pIva;
    private String indirizzo;
    private String tel;
    private String cel;
    private String fax;
    private String email;
    private String pec;
    private boolean cancellato;
    private String citta;
    private String geom;

    public Anagrafica() {
        this.idAnagrafica=0L;
        this.ragioneSociale="";
        this.cf="";
        this.pIva="";
        this.indirizzo="";
        this.tel="";
        this.cel="";
        this.fax="";
        this.email="";
        this.pec="";
        this.cancellato=false;
        this.citta="";
        this.geom="";
        
    }

    public Long getIdAnagrafica() {
        return idAnagrafica;
    }

    public void setIdAnagrafica(Long idAnagrafica) {
        this.idAnagrafica = idAnagrafica;
    }

    public String getRagioneSociale() {
        return ragioneSociale;
    }

    public void setRagioneSociale(String ragioneSociale) {
        this.ragioneSociale = ragioneSociale;
    }

    public String getCf() {
        return cf;
    }

    public void setCf(String cf) {
        this.cf = cf;
    }

    public String getpIva() {
        return pIva;
    }

    public void setpIva(String pIva) {
        this.pIva = pIva;
    }

    public String getIndirizzo() {
        return indirizzo;
    }

    public void setIndirizzo(String indirizzo) {
        this.indirizzo = indirizzo;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getCel() {
        return cel;
    }

    public void setCel(String cel) {
        this.cel = cel;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPec() {
        return pec;
    }

    public void setPec(String pec) {
        this.pec = pec;
    }

    public boolean isCancellato() {
        return cancellato;
    }

    public void setCancellato(boolean cancellato) {
        this.cancellato = cancellato;
    }

    public String getCitta() {
        return citta;
    }

    public void setCitta(String citta) {
        this.citta = citta;
    }

    public String getGeom() {
        return geom;
    }

    public void setGeom(String geom) {
        this.geom = geom;
    }
    
    
    
    
}
