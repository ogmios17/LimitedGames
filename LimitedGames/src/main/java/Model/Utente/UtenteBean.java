package Model.Utente;

public class UtenteBean {
	
	private String username;
	private String password;
	private String nome;
	private String cognome;
	private String email;
	private String via;
	private String CAP;
	private String citta;
	private String tipo;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
	public UtenteBean() {}
	public UtenteBean(String username, String password, String nome, String cognome, String email, String via,
			String CAP, String citta, String tipo) {
		super();
		this.username = username;
		this.password = password;
		this.nome = nome;
		this.cognome = cognome;
		this.email = email;
		this.via = via;
		this.CAP = CAP;
		this.citta = citta;
		this.tipo = tipo;
	}
	
	
}
