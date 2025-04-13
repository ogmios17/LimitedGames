package Model.Ordine;

import java.sql.Date;

public class AcquistoBean {
	
	private int idAcquisto;
	private int idOrdine;
	private int idGioco;
	private int quantita;
	private Date data;
	private String titolo;
	private float prezzo;
	private float iva;
	private String edizione;
	private String piattaforma;
	public int getIdAcquisto() {
		return idAcquisto;
	}
	public void setIdAcquisto(int idAcquisto) {
		this.idAcquisto = idAcquisto;
	}
	public int getIdOrdine() {
		return idOrdine;
	}
	public void setIdOrdine(int idOrdine) {
		this.idOrdine = idOrdine;
	}
	public int getIdGioco() {
		return idGioco;
	}
	public void setIdGioco(int idGioco) {
		this.idGioco = idGioco;
	}
	public int getQuantita() {
		return quantita;
	}
	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public String getTitolo() {
		return titolo;
	}
	public void setTitolo(String titolo) {
		this.titolo = titolo;
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
	public String getEdizione() {
		return edizione;
	}
	public void setEdizione(String edizione) {
		this.edizione = edizione;
	}
	public String getPiattaforma() {
		return piattaforma;
	}
	public void setPiattaforma(String piattaforma) {
		this.piattaforma = piattaforma;
	}
	
	public AcquistoBean() {}
	
	public AcquistoBean(int idAcquisto, int idOrdine, int idGioco, int quantita, Date data, String titolo, float prezzo,
			float iva, String edizione, String piattaforma) {
		super();
		this.idAcquisto = idAcquisto;
		this.idOrdine = idOrdine;
		this.idGioco = idGioco;
		this.quantita = quantita;
		this.data = data;
		this.titolo = titolo;
		this.prezzo = prezzo;
		this.iva = iva;
		this.edizione = edizione;
		this.piattaforma = piattaforma;
	}
	
	
}
