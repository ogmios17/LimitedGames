package Model.Utente;

import java.sql.Date;

public class PagamentoBean {

		private String numero;
		private String nome;
		private String cognome;
		private Date scadenza;
		private String CVV;
		private String tipo;
		
		public String getNumero() {
			return numero;
		}
		public void setNumero(String numero) {
			this.numero = numero;
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
		public Date getScadenza() {
			return scadenza;
		}
		public void setScadenza(Date scadenza) {
			this.scadenza = scadenza;
		}
		public String getCVV() {
			return CVV;
		}
		public void setCVV(String cVV) {
			CVV = cVV;
		}
		public String getTipo() {
			return tipo;
		}
		public void setTipo(String tipo) {
			this.tipo = tipo;
		}
		public PagamentoBean() {}
		public PagamentoBean(String numero, String nome, String cognome, Date scadenza, String cVV, String tipo) {
			super();
			this.numero = numero;
			this.nome = nome;
			this.cognome = cognome;
			this.scadenza = scadenza;
			CVV = cVV;
			this.tipo = tipo;
		}
		
		
}
