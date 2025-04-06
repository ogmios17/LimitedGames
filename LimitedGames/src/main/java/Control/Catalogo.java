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
					Part filePart = request.getPart("immagine");
					String nomeFile= filePart.getSubmittedFileName();
					GiocoBean bean = new GiocoBean();
					bean.setTitolo(request.getParameter("Titolo"));
					bean.setDescrizione(request.getParameter("Descrizione"));
					bean.setImmagine(nomeFile);
					bean.setEdizione(request.getParameter("Edizione"));
					bean.setPrezzo(Double.parseDouble(request.getParameter("Prezzo")));
					bean.setIva(Double.parseDouble(request.getParameter("Iva")));
					bean.setSconto(0);
					bean.setDataUscita(Date.valueOf(request.getParameter("Data")));
					try (OutputStream outputStream = new FileOutputStream(request.getServletContext().getInitParameter("LIMITED_ROOT") + File.separator + "images"+ File.separator + nomeFile); 
						    InputStream inputStream = filePart.getInputStream()) {
						    inputStream.transferTo(outputStream);
						}
					model.doSave(bean);
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
