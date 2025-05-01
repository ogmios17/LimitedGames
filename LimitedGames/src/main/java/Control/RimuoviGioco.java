package Control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Cart;
import Model.Cartable;
import Model.Gioco.GiocoBean;
import Model.Gioco.GiocoDAO;
import Model.Gioco.StockDAO;

@WebServlet("/RimuoviGioco")
public class RimuoviGioco extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RimuoviGioco() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		GiocoDAO model = new GiocoDAO();
		StockDAO stockModel = new StockDAO();
		synchronized(session){
			Cart cart = (Cart) session.getAttribute("cart");
			if(cart==null) {
				cart = new Cart();
				session.setAttribute("cart", cart);
			}
			try {
				if(request.getParameter("action").equals("subtract")) {
					GiocoBean game=model.doRetrieveByKey(Integer.parseInt(request.getParameter("id")));
					String piattaforma = request.getParameter("piattaforma");
					cart.subtractGame(new Cartable(game,1,piattaforma));
					session.setAttribute("cart", cart);
				}
			}catch (SQLException e) {
				e.printStackTrace();
				response.sendRedirect("/LimitedGames/pages/Error.jsp");
			}
		}
		response.sendRedirect(request.getContextPath()+"/pages/Carrello.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
