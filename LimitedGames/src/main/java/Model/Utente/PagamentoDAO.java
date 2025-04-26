package Model.Utente;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import Connection_pool.DriverManagerConnectionPool;

public class PagamentoDAO implements PagamentoDAOInterface{
	
	private static final String TABLE_NAME = "Pagamento";
	
	public void doSave(PagamentoBean pagamento)throws SQLException{
		
		Connection connection = null;
		PreparedStatement ps= null;
		String query="INSERT INTO "+TABLE_NAME+"(Numero, Nome, Cognome, Scadenza, CVV, Tipo) VALUES(?,?,?,?,?,?)";
		try {
			connection=DriverManagerConnectionPool.getConnection();
			ps= connection.prepareStatement(query);
			ps.setString(1, pagamento.getNumero());
			ps.setString(2, pagamento.getNome());
			ps.setString(3, pagamento.getCognome());
			ps.setDate(4, pagamento.getScadenza());
			ps.setString(5, pagamento.getCVV());
			ps.setString(6, pagamento.getTipo());
			
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
	public void doDelete(String numero)throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		String query = "DELETE FROM "+TABLE_NAME+" WHERE Numero=?";
		try {
			connection= DriverManagerConnectionPool.getConnection();
			ps=connection.prepareStatement(query);
			ps.setString(1, numero);
			
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
	public void doUpdate(PagamentoBean pagamento)throws SQLException{		
	}
	
	public PagamentoBean doRetrieveByKey(String numero)throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		PagamentoBean bean = new PagamentoBean();
		String query = "SELECT * FROM "+TABLE_NAME+" WHERE Numero=?";
		try {
			connection=DriverManagerConnectionPool.getConnection();
			ps=connection.prepareStatement(query);
			ps.setString(1, numero);
			
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				
				bean.setNumero(result.getString("Numero"));
				bean.setNome(result.getString("Nome"));
				bean.setCognome(result.getString("Cognome"));
				bean.setScadenza(result.getDate("Scadenza"));
				bean.setCVV(result.getString("Cvv"));
				bean.setTipo(result.getString("Tipo"));
				
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
	public Collection<PagamentoBean> doRetrieveAll(String order)throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		Collection<PagamentoBean> carte = new LinkedList<PagamentoBean>();
		String query = "SELECT * FROM "+TABLE_NAME;
		try {
			connection=DriverManagerConnectionPool.getConnection();
			if(order!=null && !order.equals("")) {
				query+=" ORDER BY "+order;
			}
			ps=connection.prepareStatement(query);
			
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				PagamentoBean bean = new PagamentoBean();
				bean.setNumero(result.getString("Numero"));
				bean.setNome(result.getString("Nome"));
				bean.setCognome(result.getString("Cognome"));
				bean.setScadenza(result.getDate("Scadenza"));
				bean.setCVV(result.getString("Edizione"));
				bean.setTipo(result.getString("Tipo"));
				
				carte.add(bean);
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
		return carte;
	}
}	


