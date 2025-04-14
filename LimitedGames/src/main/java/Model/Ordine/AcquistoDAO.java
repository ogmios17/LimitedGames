package Model.Ordine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import Connection_pool.DriverManagerConnectionPool;

public class AcquistoDAO {

	private static final String TABLE_NAME = "Acquisto";
	
	public void doSave(AcquistoBean acquisto)throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		String query = "INSERT INTO "+TABLE_NAME+
				"(IDOrdine,IDGioco,Quantita,DataAcquisto,Titolo,Prezzo,IVA,Edizione,Piattaforma) VALUES (?,?,?,?,?,?,?,?,?)";
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(query);
			
			ps.setInt(1, acquisto.getIdOrdine());
			ps.setInt(2, acquisto.getIdGioco());
			ps.setInt(3, acquisto.getQuantita());
			ps.setDate(4, acquisto.getData());
			ps.setString(5, acquisto.getTitolo());
			ps.setFloat(6, acquisto.getPrezzo());
			ps.setFloat(7, acquisto.getIva());
			ps.setString(8, acquisto.getEdizione());
			ps.setString(9, acquisto.getPiattaforma());
			
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
		String query = "DELETE FROM "+TABLE_NAME+" WHERE IDAcquisto = ?";
		try {
			connection = DriverManagerConnectionPool.getConnection();
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
	
	public void doUpdate(AcquistoBean acquisto)throws SQLException{
	}
	
	public AcquistoBean doRetrieveByKey(int id)throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		AcquistoBean bean = new AcquistoBean();
		String query = "SELECT * FROM "+TABLE_NAME+" WHERE IDAcquisto = ?";
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(query);
			
			ps.setInt(1, id);
			
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				
				bean.setIdAcquisto(result.getInt("IDAcquisto"));
				bean.setIdGioco(result.getInt("IDGioco"));
				bean.setIdOrdine(result.getInt("IDOrdine"));
				bean.setQuantita(result.getInt("Quantita"));
				bean.setData(result.getDate("DataAcquisto"));
				bean.setTitolo(result.getString("Titolo"));
				bean.setPrezzo(result.getFloat("Prezzo"));
				bean.setIva(result.getFloat("IVA"));
				bean.setEdizione(result.getString("Edizione"));
				bean.setPiattaforma(result.getString("Piattaforma"));
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
	
	public Collection<AcquistoBean> doRetrieveByOrdine(int id)throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		Collection<AcquistoBean> acquisti = new LinkedList<AcquistoBean>();
		String query = "SELECT * FROM "+TABLE_NAME+" WHERE IDOrdine = ?";
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet result = ps.executeQuery();
			while(result.next()) {		
				
				AcquistoBean bean = new AcquistoBean();				
				bean.setIdAcquisto(result.getInt("IDAcquisto"));
				bean.setIdGioco(result.getInt("IDGioco"));
				bean.setIdOrdine(result.getInt("IDOrdine"));
				bean.setQuantita(result.getInt("Quantita"));
				bean.setData(result.getDate("DataAcquisto"));
				bean.setTitolo(result.getString("Titolo"));
				bean.setPrezzo(result.getFloat("Prezzo"));
				bean.setIva(result.getFloat("IVA"));
				bean.setEdizione(result.getString("Edizione"));
				bean.setPiattaforma(result.getString("Piattaforma"));
				
				acquisti.add(bean);
			}
			
		}finally {
			try {
				if (ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}return acquisti;
	}

	
	public Collection<AcquistoBean> doRetrieveAll(String order)throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		Collection<AcquistoBean> acquisti = new LinkedList<AcquistoBean>();
		String query = "SELECT * FROM "+TABLE_NAME;
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(query);
			ResultSet result = ps.executeQuery();
			while(result.next()) {		
				
				AcquistoBean bean = new AcquistoBean();				
				bean.setIdAcquisto(result.getInt("IDAcquisto"));
				bean.setIdGioco(result.getInt("IDGioco"));
				bean.setIdOrdine(result.getInt("IDOrdine"));
				bean.setQuantita(result.getInt("Quantita"));
				bean.setData(result.getDate("DataAcquisto"));
				bean.setTitolo(result.getString("Titolo"));
				bean.setPrezzo(result.getFloat("Prezzo"));
				bean.setIva(result.getFloat("IVA"));
				bean.setEdizione(result.getString("Edizione"));
				bean.setPiattaforma(result.getString("Piattaforma"));
				
				acquisti.add(bean);
			}
			
		}finally {
			try {
				if (ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}return acquisti;
	}
}
