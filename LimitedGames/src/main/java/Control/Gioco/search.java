package Control.Gioco;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import Model.Gioco.*;

@WebServlet("/search")
public class search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public search() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String substring = request.getParameter("searchbox");
		GiocoDAO model = new GiocoDAO();
		Collection<GiocoBean> giochi = null;
		try {
			 giochi = model.searchByTitolo(substring);
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/LimitedGames/pages/Error.jsp");
			return;
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String requestedWith = request.getHeader("X-Requested-With");
		if ("XMLHttpRequest".equals(requestedWith)) {
			Gson gson = new Gson();
			String json = gson.toJson(giochi);
	
			response.getWriter().write(json);
			request.setAttribute("giochi",giochi);
		}else {
			request.setAttribute("giochi", giochi);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/Catalogo.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
