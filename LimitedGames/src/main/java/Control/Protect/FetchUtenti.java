package Control.Protect;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.Utente.*;

@WebServlet("/pages/admin/FetchUtenti")
public class FetchUtenti extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FetchUtenti() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UtenteDAO model = new UtenteDAO();
		Collection<UtenteBean> utenti = null;
		try {
			utenti = model.doRetrieveAll("Nome");
			request.removeAttribute("utenti");
			request.setAttribute("utenti", utenti);
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/LimitedGames/pages/Error.jsp");
			return;
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/admin/VisualizzaUtenti.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
