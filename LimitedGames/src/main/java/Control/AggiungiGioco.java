package Control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Cart;
import Model.Gioco.GiocoDAO;
import Model.Gioco.GiocoBean;
import Model.Gioco.StockDAO;
import Model.Cartable;

@WebServlet("/AggiungiGioco")
public class AggiungiGioco extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AggiungiGioco() {
        super();
}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		GiocoDAO model = new GiocoDAO();
		synchronized(session){
			Cart cart = (Cart) session.getAttribute("cart");
			if(cart==null) {
				cart = new Cart();
				session.setAttribute("cart", cart);
			}
			try {
				GiocoBean game=model.doRetrieveByKey(Integer.parseInt(request.getParameter("id")));
				String piattaforma = request.getParameter("piattaforma");
				int quantita = Integer.parseInt(request.getParameter("quantita"));
				cart.addGame(new Cartable(game,quantita,piattaforma));
				session.setAttribute("cart", cart);
			}catch (SQLException e) {
				e.printStackTrace();
				response.sendRedirect("/LimitedGames/pages/Error.jsp");
			}
		}
		response.sendRedirect(request.getContextPath()+"/ShowDetails?id="+request.getParameter("id"));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
