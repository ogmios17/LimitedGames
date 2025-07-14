package Control.Utente;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Utente.*;

@WebServlet("/Registrazione")
public class Registrazione extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Registrazione() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UtenteBean utente = new UtenteBean();
		UtenteDAO model = new UtenteDAO();
		
		String mail = request.getParameter("email");
		try {
			UtenteBean alreadyLogged = model.doRetrieveByKey(mail);
			if(alreadyLogged.getEmail()!= null) {
				request.setAttribute("logged",true);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/Registrazione.jsp");
				dispatcher.forward(request, response);
			}
			utente.setEmail(mail);
			utente.setCAP(request.getParameter("cap"));
			utente.setCitta(request.getParameter("citta"));
			utente.setCognome(request.getParameter("cognome"));
			utente.setNome(request.getParameter("email"));
			utente.setPassword(Hasher.toHash(request.getParameter("password")));
			utente.setTipo("guest");
			utente.setUsername(mail);
			utente.setVia(request.getParameter("via"));
			
			model.doSave(utente);
			request.getSession().setAttribute("userFilterRoles", true);
			request.getSession().setAttribute("nome", utente.getNome());
			request.getSession().setAttribute("user",utente);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/login-form.jsp");
			dispatcher.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath()+"/pages/Error.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
