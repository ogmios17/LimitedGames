package Control;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Utente.ProprietaBean;
import Model.Utente.ProprietaDAO;
import Model.Utente.UtenteBean;

@WebServlet("/CardHandler")
public class CardHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CardHandler() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UtenteBean utente = (UtenteBean)session.getAttribute("user");
		if(utente == null) {
			request.setAttribute("checked", true);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/Carrello.jsp");
			dispatcher.forward(request, response);
		}
		ProprietaDAO proprietaModel = new ProprietaDAO();
		String user= utente.getUsername();
		Collection<ProprietaBean> carte;
		try {
			carte = proprietaModel.doRetrieveByUsername(user);
			request.setAttribute("carte", carte);
			request.setAttribute("checked", true);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/user/FinalizzaOrdine.jsp");
			dispatcher.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/LimitedGames/pages/Error.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
