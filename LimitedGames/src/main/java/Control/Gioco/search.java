package Control.Gioco;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.Gioco.*;

@WebServlet("/search")
public class search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public search() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String substring = request.getParameter("query");
		GiocoDAO model = new GiocoDAO();
		Collection<GiocoBean> giochi = null;
		try {
			 giochi = model.searchByTitolo(substring);
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/LimitedGames/pages/Error.jsp");
			return;
		}
		request.setAttribute("giochi",giochi);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
