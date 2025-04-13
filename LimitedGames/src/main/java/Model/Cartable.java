package Model;
import Model.Gioco.GiocoBean;

public class Cartable {
	GiocoBean gioco;
	int quantita;
	String piattaforma;
	public GiocoBean getGioco() {
		return gioco;
	}
	public void setGioco(GiocoBean gioco) {
		this.gioco = gioco;
	}
	public int getQuantita() {
		return quantita;
	}
	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}
	public String getPiattaforma() {
		return piattaforma;
	}
	public void setPiattaforma(String piattaforma) {
		this.piattaforma = piattaforma;
	}
	public Cartable(GiocoBean gioco, int quantita, String piattaforma) {
		super();
		this.gioco = gioco;
		this.quantita = quantita;
		this.piattaforma = piattaforma;
	}
	public Cartable() {}
	
	public void aggiungiGioco() {
		quantita++;
	}
	
	
}
