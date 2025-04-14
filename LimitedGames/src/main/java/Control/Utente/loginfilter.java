package Control.Utente;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Connection_pool.DriverManagerConnectionPool;
import Model.Utente.UtenteBean;


@WebServlet("/login")
public class loginfilter extends HttpServlet {
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
				request.getSession().setAttribute("filtroRuoliAdmin", true);
				redirectedPage = "/";
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(redirectedPage);
				dispatcher.forward(request, response);
			} catch (Exception e) {
				request.getSession().removeAttribute("filtroRuoliAdmin");
			    redirectedPage = "/login-form-filter.jsp";
			}
			response.sendRedirect(request.getContextPath() + redirectedPage);
		}
	}
private void checkLogin(String username, String password) throws Exception{
	if ("root".equals(username) && "admin".equals(password)) {
		
	} else 
		throw new Exception("Invalid login password");
}
private static final long serialVersionUID1 = 1L;

public void LoginFilter() {
	super();
}
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
}
}
