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
				checkLogin(username, hashPassword);
				request.getSession().setAttribute("adminFilterRoles", true);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/admin/protected.jsp");
				dispatcher.forward(request, response);
			} catch (Exception e) {
				request.getSession().setAttribute("adminFilterRoles", false);
			    redirectedPage = "/login-form.jsp";
			    response.sendRedirect(request.getContextPath() +"/pages"+redirectedPage);
			}
			
		}
	}
	
	protected String toHash(String pwd) {
	    try {
	        java.security.MessageDigest digest = java.security.MessageDigest.getInstance("SHA-512");
	        byte[] hash = digest.digest(pwd.getBytes(StandardCharsets.UTF_8));

	        StringBuilder hashString = new StringBuilder();
	        for (byte b : hash) {
	            hashString.append(String.format("%02x", b));
	        }

	        return hashString.toString();

	    } catch (java.security.NoSuchAlgorithmException e) {
	        e.printStackTrace();
	        return null;
	    }
	}

	
public void checkLogin(String username, String hashPassword) throws Exception{
	
	UtenteDAO model = new UtenteDAO();
	UtenteBean utente;
	
	utente = model.doRetrieveByKey(username);
	
	System.out.println(toHash(utente.getPassword())+"  "+ hashPassword);
	if(username.equals(utente.getUsername())&& hashPassword.equals(toHash(utente.getPassword()))) {
		System.out.println("matching");
	} else {
		System.out.println("Fallimento");
		throw new Exception("Login fallito");		
	}
}}    //non ho idea del pechè io debba chiuderne due, ma se funziona, funziona...

