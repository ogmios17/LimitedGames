package Control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.Gioco.*;

@WebServlet("/CatalogoPiattaforme")
public class CatalogoPiattaforme extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CatalogoPiattaforme() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StockDAO stockModel = new StockDAO();
		GiocoDAO giocoModel = new GiocoDAO();
		Collection<StockBean> giochiDaTrovare;
		StockBean giocoDaSalvare;
		ArrayList<GiocoBean> giochi = new ArrayList<GiocoBean>();
		String piattaforma = request.getParameter("piattaforma");
		try {
			giochiDaTrovare = stockModel.doRetrieveByPiattaforma(piattaforma);
			Iterator<?> it = giochiDaTrovare.iterator();
			while(it.hasNext()) {
				giocoDaSalvare = (StockBean)it.next();
				giochi.add(giocoModel.doRetrieveByKey(giocoDaSalvare.getIdGioco()));
			}
			request.removeAttribute("giochi");
			request.setAttribute("giochi", giochi);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/Catalogo.jsp");
			dispatcher.forward(request, response);
		}catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("/LimitedGames/pages/Error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);	
	}

}
