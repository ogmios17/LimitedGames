package Model.Gioco;

import java.io.Serializable;

public class PiattaformaBean implements Serializable{
	private String piattaforma;

	public PiattaformaBean(String piattaforma) {
		this.piattaforma = piattaforma;
	}
	
	public String getPiattaforma() {
		return piattaforma;
	}

	public void setPiattaforma(String piattaforma) {
		this.piattaforma = piattaforma;
	}
	 public PiattaformaBean() {}
}
