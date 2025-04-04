package Connection_pool;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class DriverManagerConnectionPool {
	private static List<Connection> freeDbConnections;
	
	static {
		freeDbConnections = new LinkedList<Connection>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(ClassNotFoundException e) {
			System.out.println("Db driver not found!");
		}
	}
	private static Connection createDBConnection() throws SQLException {
		Connection newConnection = null;
		String ip= "localhost";
		String db = "LimitedGames";
		String username = "root";
		String password = "passwordfortsw";
		
		newConnection = DriverManager.getConnection("jdbc:mysql://"+ ip+":"+ 3306+"/"+db+"?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", username, password);
	
		newConnection.setAutoCommit(false);
		
		return newConnection;
	}
	
	public static synchronized Connection getConnection() throws SQLException {
		Connection connection;
		
		if(! freeDbConnections.isEmpty()) {
			connection = (Connection) freeDbConnections.get(0);
			DriverManagerConnectionPool.freeDbConnections.remove(0);
			try {
				if (connection==null || connection.isClosed())
					connection = DriverManagerConnectionPool.getConnection();
			} catch (SQLException e) {
				connection = DriverManagerConnectionPool.getConnection();
			}
		} else connection = DriverManagerConnectionPool.createDBConnection();
		return connection;
	}
	
	public static synchronized void releaseConnection(Connection connection)  {
		DriverManagerConnectionPool.freeDbConnections.add(connection);
		}
}