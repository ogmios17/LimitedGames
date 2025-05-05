package Control.Gioco;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Cartable;
import Model.Gioco.GiocoBean;
import Model.Gioco.GiocoDAO;
import Model.Gioco.StockBean;
import Model.Gioco.StockDAO;

@WebServlet("/ShowDetails")
public class ShowDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShowDetails() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		final GiocoDAO giocoDAO= new GiocoDAO();
		final StockDAO stockDAO = new StockDAO();
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			GiocoBean gioco = giocoDAO.doRetrieveByKey(id);
			Collection<Cartable> cartables = new ArrayList<Cartable>();
			Collection<StockBean> stocks = stockDAO.doRetrieveByGioco(Integer.parseInt(request.getParameter("id")));
			for(StockBean s: stocks) {
				Cartable cartable = new Cartable();
				cartable.setGioco(gioco);
				cartable.setPiattaforma(s.getPiattaforma());
				cartable.setQuantita(s.getRimanenti());
				cartables.add(cartable);
			}
			request.removeAttribute("cartables");
			request.setAttribute("cartables",cartables);
		}catch(SQLException e) {
			System.out.println("Error: "+e.getMessage());
		}
		String admin = request.getParameter("admin");
		if(admin!=null && admin.equals("yes")) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/admin/GameUpdate.jsp");
			dispatcher.forward(request, response);
			return;
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/Dettagli.jsp");
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
