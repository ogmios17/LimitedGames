package Control.Protect;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Ordine.*;

@WebServlet("/pages/user/VisualizzaAcquisti")
public class VisualizzaAcquisti extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public VisualizzaAcquisti() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AcquistoDAO modelAcquisto = new AcquistoDAO();
		String destinazione = request.getParameter("destinazione");
		int id = Integer.parseInt(request.getParameter("id"));
		try {
			Collection<AcquistoBean> acquisti = (Collection<AcquistoBean>)modelAcquisto.doRetrieveByOrdine(id);
			request.removeAttribute("acquisti");
			request.setAttribute("acquisti", acquisti);
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/LimitedGames/pages/Error.jsp");
			return;
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/"+destinazione);
		dispatcher.forward(request, response);
	}

}
