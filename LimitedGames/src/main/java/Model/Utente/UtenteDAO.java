package Model.Utente;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import Connection_pool.DriverManagerConnectionPool;
import Model.Gioco.GiocoBean;

public class UtenteDAO {

	private static final String TABLE_NAME = "Utente";
	
	public void doSave(UtenteBean utente)throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		String query = "INSERT INTO "+TABLE_NAME+"(Username,Pwd,Nome,Cognome,Email,Via,CAP,Citta,Tipo) VALUES (?,?,?,?,?,?,?,?,?) ";
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, utente.getUsername());
			ps.setString(2, utente.getPassword());
			ps.setString(3, utente.getNome());
			ps.setString(4, utente.getCognome());
			ps.setString(5, utente.getEmail());
			ps.setString(6, utente.getVia());
			ps.setString(7, utente.getCAP());
			ps.setString(8, utente.getCitta());
			ps.setString(9, utente.getTipo());
			
			ps.executeUpdate();
			connection.commit();
			
		}finally {
			try {
				if (ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
	}
	public void doDelete(String username)throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		String query = "DELETE FROM "+TABLE_NAME+" WHERE Username = ?";
		try {
			connection=DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, username);
			
			ps.executeUpdate();
			connection.commit();
		}finally {
			try {
				if (ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
	}
	public void doUpdate(UtenteBean utente)throws SQLException{		
	}
	
	public UtenteBean doRetrieveByKey(String username)throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		UtenteBean bean = new UtenteBean();
		String query = "SELECT * FROM "+TABLE_NAME+" WHERE Username = ?";
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(query);
			
			ps.setString(1, username);
			
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				bean.setUsername(result.getString("Username"));
				bean.setPassword(result.getString("Pwd"));
				bean.setNome(result.getString("Nome"));
				bean.setCognome(result.getString("Cognome"));
				bean.setEmail(result.getString("Email"));
				bean.setVia(result.getString("Via"));
				bean.setCAP(result.getString("CAP"));
				bean.setCitta(result.getString("Citta"));
				bean.setTipo(result.getString("Tipo"));
				
			}
		}finally {
			try {
				if (ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}return bean;
	}
	public Collection<UtenteBean> doRetrieveAll(String order)throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		Collection<UtenteBean> utenti = new LinkedList<UtenteBean>();
		String query = "SELECT * FROM "+TABLE_NAME;
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(query);
			
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				UtenteBean bean = new UtenteBean();
				bean.setUsername(result.getString("Username"));
				bean.setPassword(result.getString("Password"));
				bean.setNome(result.getString("Nome"));
				bean.setCognome(result.getString("Cognome"));
				bean.setEmail(result.getString("Email"));
				bean.setVia(result.getString("Via"));
				bean.setCAP(result.getString("CAP"));
				bean.setCitta(result.getString("Citta"));
				bean.setTipo(result.getString("Tipo"));
				utenti.add(bean);
			}
		}finally {
			try {
				if (ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}return utenti;
	}
}
