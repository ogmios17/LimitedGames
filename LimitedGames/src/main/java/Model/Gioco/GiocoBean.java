package Model.Gioco;

public class GiocoBean {
    private int id;
    private String titolo;
    private String immagine;
    private String descrizione;
    private String edizione;
    private double prezzo;
    private double iva;
    private String dataUscita;

    public GiocoBean() {}

    public GiocoBean(int id, String titolo, String immagine, String descrizione, String edizione, double prezzo, double iva, String dataUscita) {
        this.id = id;
        this.titolo = titolo;
        this.immagine = immagine;
        this.descrizione = descrizione;
        this.edizione = edizione;
        this.prezzo = prezzo;
        this.iva = iva;
        this.dataUscita = dataUscita;
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

    public double getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(double prezzo) {
        this.prezzo = prezzo;
    }

    public double getIva() {
        return iva;
    }

    public void setIva(double iva) {
        this.iva = iva;
    }

    public String getDataUscita() {
        return dataUscita;
    }

    public void setDataUscita(String dataUscita) {
        this.dataUscita = dataUscita;
    }
}
