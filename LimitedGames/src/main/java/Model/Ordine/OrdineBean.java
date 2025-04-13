package Model.Ordine;

import java.sql.Date;

public class OrdineBean {
	
	private int id;
	private String nome;
	private String cognome;
	private String via;
	private String CAP;
	private String citta;
	private float prezzo;
	private Date dataOrdine;
	private Date dataConsegna;
	private String username;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getVia() {
		return via;
	}
	public void setVia(String via) {
		this.via = via;
	}
	public String getCAP() {
		return CAP;
	}
	public void setCAP(String CAP) {
		this.CAP = CAP;
	}
	public String getCitta() {
		return citta;
	}
	public void setCitta(String citta) {
		this.citta = citta;
	}
	public float getPrezzo() {
		return prezzo;
	}
	public void setPrezzo(float prezzo) {
		this.prezzo = prezzo;
	}
	public Date getDataOrdine() {
		return dataOrdine;
	}
	public void setDataOrdine(Date dataOrdine) {
		this.dataOrdine = dataOrdine;
	}
	public Date getDataConsegna() {
		return dataConsegna;
	}
	public void setDataConsegna(Date dataConsegna) {
		this.dataConsegna = dataConsegna;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public OrdineBean() {}
	
	public OrdineBean(int id, String nome, String cognome, String via, String CAP, String citta, float prezzo,
			Date dataOrdine, Date dataConsegna, String username) {
		super();
		this.id = id;
		this.nome = nome;
		this.cognome = cognome;
		this.via = via;
		this.CAP = CAP;
		this.citta = citta;
		this.prezzo = prezzo;
		this.dataOrdine = dataOrdine;
		this.dataConsegna = dataConsegna;
		this.username = username;
	}
	
	
}
