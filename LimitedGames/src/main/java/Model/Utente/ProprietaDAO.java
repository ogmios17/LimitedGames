package Model.Utente;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import Connection_pool.DriverManagerConnectionPool;

public class ProprietaDAO {
	
	private static final String TABLE_NAME = "Proprieta";
	
	public void doSave(ProprietaBean proprieta)throws SQLException{
		Connection connection = null;
		PreparedStatement ps= null;
		String query="INSERT INTO "+TABLE_NAME+"(Utente,Carta) VALUES(?,?)";
		try {
			connection=DriverManagerConnectionPool.getConnection();
			ps= connection.prepareStatement(query);
			ps.setString(1, proprieta.getUtente());
			ps.setString(2, proprieta.getCarta());
			
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
	public void doDelete(String numero, String username)throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		String query = "DELETE FROM "+TABLE_NAME+" WHERE Carta=? AND Utente=?";
		try {
			connection= DriverManagerConnectionPool.getConnection();
			ps=connection.prepareStatement(query);
			ps.setString(1, numero);
			ps.setString(2, username);
			
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
	
	public Collection<ProprietaBean> doRetrieveByUsername(String username)throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		Collection<ProprietaBean> carte = new LinkedList<ProprietaBean>();
		String query = "SELECT * FROM "+TABLE_NAME+" WHERE Utente = ?";
		try {
			connection=DriverManagerConnectionPool.getConnection();
			ps=connection.prepareStatement(query);
			ps.setString(1, username);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				ProprietaBean bean = new ProprietaBean();
				bean.setUtente(result.getString("Utente"));
				bean.setCarta(result.getString("Carta"));				
				carte.add(bean);
			}
		}finally {
			try {
				if (ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return carte;
	}
	
	public Collection<ProprietaBean> doRetrieveByCarta(String numero)throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		Collection<ProprietaBean> carte = new LinkedList<ProprietaBean>();
		String query = "SELECT * FROM "+TABLE_NAME+" WHERE Carta = ?";
		try {
			connection=DriverManagerConnectionPool.getConnection();
			ps=connection.prepareStatement(query);
			ps.setString(1, numero);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				ProprietaBean bean = new ProprietaBean();
				bean.setUtente(result.getString("Utente"));
				bean.setCarta(result.getString("Carta"));				
				carte.add(bean);
			}
		}finally {
			try {
				if (ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return carte;
	}
}
