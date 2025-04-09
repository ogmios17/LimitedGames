package Model.Gioco;

public class StockBean {
	
	private int idGioco;
	private String piattaforma;
	private int acquistati;
	private int rimanenti;
	
	public StockBean() {
	}
	
	public StockBean(int idGioco, String piattaforma, int acquistati, int rimanenti) {
		this.idGioco=idGioco;
		this.piattaforma=piattaforma;
		this.acquistati=acquistati;
		this.rimanenti=rimanenti;
	}
	
	public int getIdGioco() {
		return idGioco;
	}
	public void setIdGioco(int idGioco) {
		this.idGioco = idGioco;
	}
	public String getPiattaforma() {
		return piattaforma;
	}
	public void setPiattaforma(String piattaforma) {
		this.piattaforma = piattaforma;
	}
	public int getAcquistati() {
		return acquistati;
	}
	public void setAcquistati(int acquistati) {
		this.acquistati = acquistati;
	}
	public int getRimanenti() {
		return rimanenti;
	}
	public void setRimanenti(int rimanenti) {
		this.rimanenti = rimanenti;
	}
	
}
