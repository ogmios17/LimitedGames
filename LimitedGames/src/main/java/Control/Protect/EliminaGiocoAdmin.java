package Control.Protect;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Gioco.*;

@WebServlet("/pages/admin/EliminaGiocoAdmin")
public class EliminaGiocoAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EliminaGiocoAdmin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GiocoDAO model = new GiocoDAO();
		StockDAO stockModel = new StockDAO();
		int id=Integer.parseInt(request.getParameter("id"));
		try {			
			model.doDelete(id);
			stockModel.doDelete(id);
			response.sendRedirect(request.getContextPath()+"/giochi");
		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/LimitedGames/pages/Error.jsp");
		}
		return;
	}

}
