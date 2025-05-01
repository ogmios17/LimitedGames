package Model.Gioco;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import Connection_pool.DriverManagerConnectionPool;

public class StockDAO implements StockDAOInterface{

	private static final String TABLE_NAME = "Stock";
	
	public void doSave(StockBean stock) throws SQLException{
		Connection connection = null;
		PreparedStatement ps= null;
		String query="INSERT INTO "+TABLE_NAME+"(IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES(?,?,?,?)";
		try {
			connection=DriverManagerConnectionPool.getConnection();
			ps= connection.prepareStatement(query);
			ps.setInt(1, stock.getIdGioco());
			ps.setString(2, stock.getPiattaforma());
			ps.setInt(3, stock.getAcquistati());
			ps.setInt(4, stock.getRimanenti());
			
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
	
	public Collection<StockBean> doRetrieveByGioco(int id) throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		Collection<StockBean> stock = new LinkedList<StockBean>();
		String query = "SELECT * FROM "+TABLE_NAME+" WHERE IdGioco= ?";
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1,id);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				
				StockBean bean = new StockBean();
				
				bean.setIdGioco(result.getInt("IDGioco"));
				bean.setPiattaforma(result.getString("Piattaforma"));
				bean.setAcquistati(result.getInt("Acquistati"));
				bean.setRimanenti(result.getInt("Rimanenti"));
				stock.add(bean);
			}
			connection.commit();
		}finally {
			try {
				if (ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}return stock;
	}
	
	public Collection<StockBean> doRetrieveByPiattaforma(String piattaforma) throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		Collection<StockBean> stock = new LinkedList<StockBean>();
		String query = "SELECT * FROM "+TABLE_NAME+" WHERE Piattaforma= ?";
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1,piattaforma);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				
				StockBean bean = new StockBean();
				
				bean.setIdGioco(result.getInt("IDGioco"));
				bean.setPiattaforma(result.getString("Piattaforma"));
				bean.setAcquistati(result.getInt("Acquistati"));
				bean.setRimanenti(result.getInt("Rimanenti"));
				stock.add(bean);
			}
			connection.commit();
		}finally {
			try {
				if (ps != null)
					ps.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}return stock;
	}
	
	public void doUpdate(StockBean stock) throws SQLException{
		Connection connection = null;
		PreparedStatement ps =  null;
		String query = "UPDATE "+TABLE_NAME+" SET   Acquistati =?, Rimanenti =? WHERE IDGioco=? AND  Piattaforma = ?";
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(query);
			
			ps.setInt(1, stock.getAcquistati());
			ps.setInt(2, stock.getRimanenti());
			ps.setInt(3, stock.getIdGioco());
			ps.setString(4, stock.getPiattaforma());
			
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
	public StockBean doRetrieveByKey(int idGioco, String piattaforma ) throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		StockBean bean = new StockBean();
		String query = "SELECT * FROM "+TABLE_NAME+" WHERE IDGioco= ? AND Piattaforma = ?";
		try {
			connection = DriverManagerConnectionPool.getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1,idGioco);
			ps.setString(2,piattaforma);
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				
				bean.setIdGioco(result.getInt("IDGioco"));
				bean.setPiattaforma(result.getString("Piattaforma"));
				bean.setAcquistati(result.getInt("Acquistati"));
				bean.setRimanenti(result.getInt("Rimanenti"));
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
	
	public void doDelete(int Id) throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		String query = "DELETE FROM "+TABLE_NAME+" WHERE IDGioco=?";
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
}
