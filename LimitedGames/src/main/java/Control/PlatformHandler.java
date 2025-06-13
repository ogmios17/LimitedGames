package Control;

import java.io.IOException;import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Gioco.*;

@WebServlet("/PlatformHandler")
public class PlatformHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PlatformHandler() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PiattaformaDAO piattaformaDAO = new PiattaformaDAO();
		Collection<PiattaformaBean> piattaforme;
		HttpSession session = request.getSession();
		try {
			piattaforme = piattaformaDAO.doRetrieveAll();
			session.setAttribute("piattaforme",piattaforme);
			response.sendRedirect(request.getContextPath()+"/pages/Catalogo.jsp");
		}catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("/LimitedGames/pages/Error.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
