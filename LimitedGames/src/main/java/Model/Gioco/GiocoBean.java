package Model.Gioco;

import java.sql.Date;

public class GiocoBean {
    private int id;
    private String titolo;
    private String immagine;
    private String descrizione;
    private String edizione;
    private float prezzo;
    private float iva;
    private Date dataUscita;
    private float sconto;

    public GiocoBean() {}

    public GiocoBean(int id, String titolo, String immagine, String descrizione, String edizione, float prezzo, float iva, Date dataUscita, float sconto) {
        this.id = id;
        this.titolo = titolo;
        this.immagine = immagine;
        this.descrizione = descrizione;
        this.edizione = edizione;
        this.prezzo = prezzo;
        this.iva = iva;
        this.dataUscita = dataUscita;
        this.sconto=sconto;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitolo() {
        return titolo;
    }

    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    public String getImmagine() {
        return immagine;
    }

    public void setImmagine(String immagine) {
        this.immagine = immagine;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public String getEdizione() {
        return edizione;
    }

    public void setEdizione(String edizione) {
        this.edizione = edizione;
    }

    public float getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(float prezzo) {
        this.prezzo = prezzo;
    }

    public float getIva() {
        return iva;
    }

    public void setIva(float iva) {
        this.iva = iva;
    }

    public Date getDataUscita() {
        return dataUscita;
    }

    public void setDataUscita(Date dataUscita) {
        this.dataUscita = dataUscita;
    }
    
    public float getSconto() {
    	return sconto;
    }
    
    public void setSconto(float sconto) {
    	this.sconto=sconto;
    }
}
