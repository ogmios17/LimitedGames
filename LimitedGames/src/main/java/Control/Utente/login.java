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
			String hashPassword = Hasher.toHash(password);
			String redirectedPage;
			try {
				UtenteBean utente = checkLogin(username, hashPassword);
				if(utente.getTipo().equals("admin")) {
					request.getSession().setAttribute("adminFilterRoles", true);
					request.getSession().setAttribute("userFilterRoles", false);
					request.getSession().setAttribute("nome", utente.getNome());
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/admin/Admin.jsp");
					dispatcher.forward(request, response);
				}else {
					request.getSession().setAttribute("adminFilterRoles", false);
					request.getSession().setAttribute("userFilterRoles", true);
					request.getSession().setAttribute("nome", utente.getNome());
					request.getSession().setAttribute("user",utente);
					String order = (String)request.getSession().getAttribute("order");
					if(order != null && order.equals("true")) {
						request.getSession().removeAttribute("order");
						response.sendRedirect(request.getContextPath()+"/pages/user/FinalizzaOrdine.jsp");
						return;
					}
					response.sendRedirect(request.getContextPath() + "/pages/user/User.jsp");
					return;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				request.getSession().setAttribute("adminFilterRoles", false);
			    redirectedPage = "/login-form.jsp?failed=true";
			    response.sendRedirect(request.getContextPath() +"/pages"+redirectedPage);
			}
			
		}
	}

	
public UtenteBean checkLogin(String username, String hashPassword) throws Exception{
	
	UtenteDAO model = new UtenteDAO();
	UtenteBean utente;
	
	utente = model.doRetrieveByKey(username);
	
	System.out.println(Hasher.toHash(utente.getPassword())+"  "+ hashPassword);
	if(username.equals(utente.getUsername())&& hashPassword.equals(utente.getPassword())) {
		System.out.println("matching");
	} else {
		System.out.println("Fallimento");
		throw new Exception("Login fallito");		
	}
	return utente;
}}    //non ho idea del pechè io debba chiuderne due, ma se funziona, funziona...