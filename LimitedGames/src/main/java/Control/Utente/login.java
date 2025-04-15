package Control.Utente;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
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
import Model.Utente.UtenteDAO;


@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		{
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String hashPassword = toHash(password);
			String redirectedPage;
			try {
				checkLogin(username, password);
				request.getSession().setAttribute("adminFilterRoles", true);
				redirectedPage = "/";
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(redirectedPage);
				dispatcher.forward(request, response);
			} catch (Exception e) {
				request.getSession().setAttribute("adminFilterRoles", false);
			    redirectedPage = "/login-form.jsp";
			    response.sendRedirect(request.getContextPath() + redirectedPage);
			}
			
		}
	}
	
	protected String toHash(String pwd) {
		String hashString = null;
		try {
			java.security.MessageDigest digest = java.security.MessageDigest.getInstance("SHA-512");
			byte[] hash = digest.digest(pwd.getBytes(StandardCharsets.UTF_8));
			hashString = "";
			for(int i=0; i<hash.length; i++) {
				hashString += Integer.toHexString((hash[i] & 0xFF) | 0x100).toLowerCase().substring(1,3);
			}
		}catch(java.security.NoSuchAlgorithmException e){
			e.printStackTrace();
		}
		return hashString;
	}
	
public void checkLogin(String username, String hashPassword) throws Exception{
	
	UtenteDAO model = new UtenteDAO();
	UtenteBean utente;
	
	utente = model.doRetrieveByKey(username);
	if(username.equals(utente.getUsername())&& hashPassword.equals(utente.getPassword())) {
		//
	} else throw new Exception("Login fallito");
}}    //non ho idea del pechè io debba chiuderne due, ma se funziona, funziona...

