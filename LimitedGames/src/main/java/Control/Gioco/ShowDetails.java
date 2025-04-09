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
import Model.Gioco.GiocoDAO;
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
			request.removeAttribute("gioco");
			request.setAttribute("gioco", giocoDAO.doRetrieveByKey(id));
			request.removeAttribute("piattaforme");
			request.setAttribute("piattaforme",stockDAO.doRetrieveByGioco(Integer.parseInt(request.getParameter("id"))));
		}catch(SQLException e) {
			System.out.println("Error: "+e.getMessage());
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/Dettagli.jsp");
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
