package Control;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.Gioco.*;

@WebServlet("/pages/admin/PiattaformeHandler")
public class PiattaformeHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PiattaformeHandler() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action= request.getParameter("action");
		PiattaformaDAO model = new PiattaformaDAO();
		
		if(action.equals("view")) {
			try {
				Collection<PiattaformaBean> piattaforme = model.doRetrieveAll();
				request.setAttribute("piattaforme", piattaforme);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/admin/GameInsert.jsp");
				dispatcher.forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("/LimitedGames/pages/Error.jsp");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
