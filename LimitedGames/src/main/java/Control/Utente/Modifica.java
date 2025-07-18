package Control.Utente;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Utente.*;

@WebServlet("/pages/user/Modifica")
public class Modifica extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Modifica() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UtenteDAO model = new UtenteDAO();
		try {
			UtenteBean utente = (UtenteBean)request.getSession().getAttribute("user");
			utente.setCAP(request.getParameter("cap"));
			utente.setCitta(request.getParameter("citta"));
			utente.setCognome(request.getParameter("cognome"));
			utente.setNome(request.getParameter("email"));
			utente.setVia(request.getParameter("via"));
			utente.setNome(request.getParameter("nome"));
			
			model.doUpdate(utente);
			response.sendRedirect(request.getContextPath()+"/pages/user/User.jsp?success=true");
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath()+"/pages/Error.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
