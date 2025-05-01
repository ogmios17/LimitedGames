package Model.Utente;

public class ProprietaBean {
	
	private String utente;
	private String carta;
	
	public String getUtente() {
		return utente;
	}
	public void setUtente(String utente) {
		this.utente = utente;
	}
	public String getCarta() {
		return carta;
	}
	public void setCarta(String carta) {
		this.carta = carta;
	}
	
	public ProprietaBean() {}
	
	public ProprietaBean(String utente, String carta) {
		super();
		this.utente = utente;
		this.carta = carta;
	}
	
	
	
}
