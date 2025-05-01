package Control;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.SQLException;
import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Model.Gioco.*;

@WebServlet("/giochi")
@MultipartConfig
public class Catalogo extends HttpServlet {
	
	private static GiocoDAO model = new GiocoDAO();
	
    public Catalogo() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		final GiocoDAO model = new GiocoDAO();
		try {
			request.removeAttribute("giochi");
			request.setAttribute("giochi",model.doRetrieveAll(request.getParameter("sort")));
		}catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("/LimitedGames/pages/Error.jsp");
		}
		String path ="/pages/";
		HttpSession session = request.getSession();
		Boolean adminAttr = (Boolean) session.getAttribute("adminFilterRoles");
	    boolean admin = (adminAttr != null) ? adminAttr : false;
	    if(admin) path+="admin/CatalogoAdmin.jsp";
	    else path+="Catalogo.jsp";
	    
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
