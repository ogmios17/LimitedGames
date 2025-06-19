package Model.Gioco;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import Connection_pool.DriverManagerConnectionPool;


public class GiocoDAO implements GiocoDAOInterface{
	
	private static final String TABLE_NAME = "Gioco";
	
	public int doSave(GiocoBean gioco) throws SQLException{
		Connection connection = null;
		PreparedStatement ps= null;
		String query="INSERT INTO "+TABLE_NAME+"(Titolo,Descrizione,Immagine,Edizione,Prezzo,IVA,Sconto,Data_uscita) VALUES(?,?,?,?,?,?,?,?)";
		try {
			connection=DriverManagerConnectionPool.getConnection();
			ps= connection.prepareStatement(query);
			ps.setString(1, gioco.getTitolo());
			ps.setString(2, gioco.getDescrizione());
			ps.setString(3, gioco.getImmagine());
			ps.setString(4, gioco.getEdizione());
			ps.setDouble(5, gioco.getPrezzo());
			ps.setDouble(6, gioco.getIva());
			ps.setDouble(7, gioco.getSconto());
			ps.setDate(8, gioco.getDataUscita());
			
			ps.executeUpdate();
			connection.commit();
			
			ResultSet rs = ps.getGeneratedKeys();
		    if (rs.next()) {
		        return rs.getInt(1); 
		    }
		    return -1;
		}finally {
			try {
				if (ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
	}
	public void doDelete(int Id) throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		String query = "DELETE FROM "+TABLE_NAME+" WHERE Id=?";
		try {
			connection= DriverManagerConnectionPool.getConnection();
			ps=connection.prepareStatement(query);
			ps.setInt(1, Id);
			
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
	public void doUpdate(GiocoBean gioco) throws SQLException{
		Connection connection = null;
		PreparedStatement ps =  null;
		String query = "UPDATE "+TABLE_NAME+" SET  Prezzo = ?, IVA = ?, Data_uscita =?, Descrizione =?, Titolo=?,Immagine=?, Edizione=?, Sconto=? WHERE ID = ?";
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(query);
			
			ps.setString(5, gioco.getTitolo());
			ps.setString(4, gioco.getDescrizione());
			ps.setString(6, gioco.getImmagine());
			ps.setString(7, gioco.getEdizione());
			ps.setDouble(1, gioco.getPrezzo());
			ps.setDouble(2, gioco.getIva());
			ps.setDouble(8, gioco.getSconto());
			ps.setDate(3, gioco.getDataUscita());
			ps.setInt(9, gioco.getId());
			
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
	
	public GiocoBean doRetrieveByKey(int id) throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		GiocoBean bean = new GiocoBean();
		String query = "SELECT * FROM "+TABLE_NAME+" WHERE Id=?";
		try {
			connection=DriverManagerConnectionPool.getConnection();
			ps=connection.prepareStatement(query);
			ps.setInt(1, id);
			
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				
				bean.setId(result.getInt("Id"));
				bean.setTitolo(result.getString("Titolo"));
				bean.setDescrizione(result.getString("Descrizione"));
				bean.setImmagine(result.getString("Immagine"));
				bean.setEdizione(result.getString("Edizione"));
				bean.setPrezzo(result.getFloat("Prezzo"));
				bean.setIva(result.getFloat("Iva"));
				bean.setSconto(result.getFloat("Sconto"));
				bean.setDataUscita(result.getDate("Data_uscita"));
			}
			connection.commit();
		}finally {
			try {
				if (ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}return bean;
	}
	
	public Collection<GiocoBean> doRetrieveAll(String order) throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		Collection<GiocoBean> giochi = new LinkedList<GiocoBean>();
		String query = "SELECT * FROM "+TABLE_NAME;
		try {
			connection=DriverManagerConnectionPool.getConnection();
			if(order!=null && !order.equals("")) {
				query+=" ORDER BY ?";
			}
			ps=connection.prepareStatement(query);
			if(order!=null && !order.equals("")) {
				ps.setString(1, order);
			}
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				GiocoBean bean = new GiocoBean();
				bean.setId(result.getInt("Id"));
				bean.setTitolo(result.getString("Titolo"));
				bean.setDescrizione(result.getString("Descrizione"));
				bean.setImmagine(result.getString("Immagine"));
				bean.setEdizione(result.getString("Edizione"));
				bean.setPrezzo(result.getFloat("Prezzo"));
				bean.setIva(result.getFloat("Iva"));
				bean.setSconto(result.getFloat("Sconto"));
				bean.setDataUscita(result.getDate("Data_uscita"));
				giochi.add(bean);
			}
			connection.commit();
		}finally {
			try {
				if (ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return giochi;
	}
	
	public Collection<GiocoBean> searchByTitolo(String substring) throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		Collection<GiocoBean> giochi = new LinkedList<GiocoBean>();
		String query = "SELECT * FROM "+TABLE_NAME+" WHERE Titolo LIKE ?";
		try {
			connection=DriverManagerConnectionPool.getConnection();
			
			ps=connection.prepareStatement(query);
			ps.setString(1, "%" + substring + "%");
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				GiocoBean bean = new GiocoBean();
				bean.setId(result.getInt("Id"));
				bean.setTitolo(result.getString("Titolo"));
				bean.setDescrizione(result.getString("Descrizione"));
				bean.setImmagine(result.getString("Immagine"));
				bean.setEdizione(result.getString("Edizione"));
				bean.setPrezzo(result.getFloat("Prezzo"));
				bean.setIva(result.getFloat("Iva"));
				bean.setSconto(result.getFloat("Sconto"));
				bean.setDataUscita(result.getDate("Data_uscita"));
				giochi.add(bean);
			}
			connection.commit();
		}finally {
			try {
				if (ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return giochi;
	}
}
