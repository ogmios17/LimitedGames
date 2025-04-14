package Model.Ordine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import Connection_pool.DriverManagerConnectionPool;
import Model.Ordine.OrdineBean;

public class OrdineDAO {
	
	private static final String TABLE_NAME = "Ordine";
	
	public void doSave(OrdineBean ordine)throws SQLException{
		
		Connection connection = null;
		PreparedStatement ps = null;
		String query = "INSERT INTO "+TABLE_NAME+
				"(IDOrdine,Nome,Cognome,Via,CAP,Citta,Prezzo,Data_Ordine,Data_Conesegna,Username) VALUES(?,?,?,?,?,?,?,?,?,?)";
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(query);
			
			ps.setString(1,ordine.getNome());
			ps.setString(2,ordine.getCognome());
			ps.setString(3,ordine.getVia());
			ps.setString(4,ordine.getCAP());
			ps.setString(5,ordine.getCitta());
			ps.setFloat(6,ordine.getPrezzo());
			ps.setDate(7,ordine.getDataOrdine());
			ps.setDate(8,ordine.getDataConsegna());
			ps.setString(9,ordine.getUsername());
			
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
	
	public void doDelete(int id)throws SQLException{
		
		Connection connection = null;
		PreparedStatement ps = null;
		String query = "DELETE FROM "+TABLE_NAME+ "IDOrdine = ?";
		try {
			connection=DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(query);
			
			ps.setInt(1, id);
			
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
	
	public void doUpdate(OrdineBean ordine)throws SQLException{		
	}
	
	public OrdineBean doRetrieveByKey(int id)throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		OrdineBean bean = new OrdineBean();
		String query = "SELECT * FROM "+TABLE_NAME+" WHERE IDOrdine = ?";
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(query);
			
			ps.setInt(1, id);
			ResultSet result = ps.executeQuery();
			connection.commit();
			while(result.next()) {
				bean.setId(result.getInt("IDOrdine"));
				bean.setNome(result.getString("Nome"));
				bean.setCognome(result.getString("Cognome"));
				bean.setVia(result.getString("Via"));
				bean.setCAP(result.getString("CAP"));
				bean.setCitta(result.getString("Citta"));
				bean.setPrezzo(result.getFloat("Prezzo"));
				bean.setDataOrdine(result.getDate("Data_Ordine"));
				bean.setDataConsegna(result.getDate("Data_Consegna"));
				bean.setUsername(result.getString("Username"));
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
	public Collection<OrdineBean> doRetrieveAll(String order)throws SQLException{
		Connection connection = null;
		Collection<OrdineBean> ordini = new LinkedList<OrdineBean>();
		PreparedStatement ps = null;
		String query = "SELECT * FROM "+TABLE_NAME;
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(query);
			
			ResultSet result = ps.executeQuery();
			connection.commit();
			while(result.next()) {
				OrdineBean bean = new OrdineBean();
				bean.setId(result.getInt("IDOrdine"));
				bean.setNome(result.getString("Nome"));
				bean.setCognome(result.getString("Cognome"));
				bean.setVia(result.getString("Via"));
				bean.setCAP(result.getString("CAP"));
				bean.setCitta(result.getString("Citta"));
				bean.setPrezzo(result.getFloat("Prezzo"));
				bean.setDataOrdine(result.getDate("Data_Ordine"));
				bean.setDataConsegna(result.getDate("Data_Consegna"));
				bean.setUsername(result.getString("Username"));
				ordini.add(bean);
			}
			connection.commit();
		}finally {
			try {
				if (ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}return ordini;
	}
}
