package Model.Gioco;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import Connection_pool.DriverManagerConnectionPool;

public class PiattaformaDAO {
	
	private static final String TABLE_NAME = "Piattaforma";
	
	public Collection<PiattaformaBean> doRetrieveAll() throws SQLException{
		Connection connection = null;
		PreparedStatement ps = null;
		Collection<PiattaformaBean> piattaforme = new LinkedList<PiattaformaBean>();
		String query = "SELECT * FROM "+TABLE_NAME;
		try {
			connection=DriverManagerConnectionPool.getConnection();
			ps=connection.prepareStatement(query);
			
			ResultSet result = ps.executeQuery();
			while(result.next()) {
				PiattaformaBean bean = new PiattaformaBean();
				bean.setPiattaforma(result.getString("Piattaforma"));
				piattaforme.add(bean);
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
		return piattaforme;
	}
}
