package Control.Protect;

import java.io.IOException;
import java.sql.Date;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.Ordine.*;

@WebServlet("/VisualizzaOrdini")
public class VisualizzaOrdini extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public VisualizzaOrdini() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String utente = request.getParameter("username");
		String destinazione = request.getParameter("destinazione");
		OrdineDAO model = new OrdineDAO();
		try {
			Collection<OrdineBean> ordini = model.doRetrieveByUsername(utente);
			if(ordini == null || ordini.isEmpty()) {
				ordini.add(new OrdineBean("empty"));
			}
			request.removeAttribute("ordini");
			request.setAttribute("ordini", ordini);
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/LimitedGames/pages/Error.jsp");
			return;
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/"+destinazione);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
