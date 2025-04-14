package Control.Utente;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Connection_pool.DriverManagerConnectionPool;
import Model.Utente.UtenteBean;


@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		{
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String redirectedPage;
			try {
				checkLogin(username, password);
				request.getSession().setAttribute("ruoliAdmin", new Boolean(true));
				redirectedPage = "/";
			} catch (Exception e) {
				request.getSession().setAttribute("ruoliAdmin", new Boolean(false));
			    redirectedPage = "/login-form.jsp";
			}
			response.sendRedirect(request.getContextPath() + redirectedPage);
		}
	}
public UtenteBean checkLogin(String username, String password) throws Exception{
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	
	UtenteBean bean = new UtenteBean();
	String selectByUsernameSQL = "SELECT * FROM " + UtenteBean.getPassword() + " WHERE username = ?";
	String selectByPasswordSQL = "SELECT * FROM utente WHERE password = ?";

	
	try {
		connection = DriverManagerConnectionPool.getConnection();
		preparedStatement = connection.prepareStatement(selectByUsernameSQL);
		preparedStatement = connection.prepareStatement(selectByPasswordSQL);
		preparedStatement.setString(1, username);
		preparedStatement.setString(2, password);
		
		ResultSet rs = preparedStatement.executeQuery();
		
		while (rs.next()) {
			bean.setUsername(rs.getString("username"));
			bean.setPassword(rs.getString("password"));
		}
		
	} finally {
		try {
			if(preparedStatement != null)
				preparedStatement.close();
		} finally {
			DriverManagerConnectionPool.releaseConnection(connection);
		}
	}
	return bean;
}
}
