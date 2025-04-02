package Model.Gioco;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Collection;

public class GiocoDAO implements GiocoDAOInterface{
	
	private static final String TABLE_NAME = "Gioco";
	
	public void doSave(GiocoBean gioco) {
		Connection connection = null;
		PreparedStatement ps= null;
		String query="INSERT INTO "+TABLE_NAME+"(Titolo,Descrizione,Immagine,Edizione,Prezzo,IVA,Sconto,Data_uscita) VALUES(?,?,?,?,?,?,?,?)";
		try {
			connection=ConnectionPool.getConnection();
			ps= connection.prepareStatement(query);
			ps.SetString(1,gioco.getTitolo());
			ps.SetString(2,gioco.getDescrizione());
			ps.setString(3, gioco.getImmagine());
			ps.setString(4, gioco.getEdizione());
			ps.setFloat(5, gioco.getPrezzo());
			ps.setFloat(6, gioco.getIva());
			ps.setFloat(7, gioco.getSconto());
			ps.setDate(5, gioco.getData());
			
			ps.executeUpdate();
			connection.commit();
		}finally {
			try {
				if (ps != null)
					ps.close();
			} finally {
				ConnectionPool.releaseConnection(connection);
			}
		}
	}
	public void doDelete(GiocoBean gioco) {
		Connection connection = null;
		PreparedStatement ps = null;
		String query = "DELETE FROM "+TABLE_NAME+" WHERE Id=?";
		try {
			connection= ConnectionPool.getConnection();
			ps=connection.prepareStatement(query);
			ps.setInt(1, gioco.getId());
			
			ps.executeUpdate();
			connection.commit();
		}finally {
			try {
				if (ps != null)
					ps.close();
			} finally {
				ConnectionPool.releaseConnection(connection);
			}
		}
	}
	public void doUpdate(GiocoBean gioco) {
	}
	public GiocoBean doRetrieveByKey(int id);
	public Collection<GiocoBean> doRetrieveAll(String order);
}
