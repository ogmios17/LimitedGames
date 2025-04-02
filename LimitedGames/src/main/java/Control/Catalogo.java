package Control;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.Gioco.*;


@WebServlet("/Catalogo")
public class Catalogo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static GiocoDAO model;
	
    public Catalogo() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action=request.getParameter("action");
		try {
			if(action != null) {
				if(action.equals("read")) {
					int id=Integer.parseInt(request.getParameter("id"));
					request.removeAttribute("gioco");
					request.setAttribute("gioco", model.doRetrieveByKey(id));
				}
				else if(action.equals("delete")) {
					int id=Integer.parseInt(request.getParameter("id"));
					model.doDelete(id);
				}else if(action.equals("insert")) {
					GiocoBean bean = new GiocoBean();
					bean.setTitolo(request.getParameter("Titolo"));
					bean.setDescrizione(request.getParameter("Descrizione"));
					bean.setImmagine(request.getParameter("Immagine"));
					bean.setEdizione(request.getParameter("Edizione"));
					bean.setPrezzo(Double.parseDouble(request.getParameter("Prezzo")));
					bean.setIva(Double.parseDouble(request.getParameter("Iva")));
					bean.setSconto(Double.parseDouble(request.getParameter("Sconto")));
					bean.setDataUscita(Date.valueOf(request.getParameter("Data_uscita")));
				}
			}
		}catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		try {
			request.removeAttribute("giochi");
			request.setAttribute("giochi",model.doRetrieveAll(request.getParameter("sort")));
		}catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Catalogo.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
