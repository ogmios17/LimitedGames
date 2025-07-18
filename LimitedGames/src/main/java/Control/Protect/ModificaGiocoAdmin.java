package Control.Protect;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Model.Gioco.*;
import Model.Cartable;
import java.util.*;

@WebServlet("/pages/admin/ModificaGiocoAdmin")
@MultipartConfig
public class ModificaGiocoAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ModificaGiocoAdmin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
		
		GiocoDAO giocoModel = new GiocoDAO();
		StockDAO stockModel = new StockDAO();
		int id= Integer.parseInt(request.getParameter("id"));
		String action = request.getParameter("action");
		if(action!= null && action.equals("find")) {
			try {
				GiocoBean gioco = giocoModel.doRetrieveByKey(id);
				StockBean stock = stockModel.doRetrieveByKey(id, request.getParameter("piattaforma"));
				Cartable cartable = new Cartable();
				cartable.setGioco(gioco);
				cartable.setPiattaforma(request.getParameter("piattaforma"));
				cartable.setQuantita(stock.getRimanenti());
				request.removeAttribute("selected");
				request.setAttribute("selected", cartable);
				Collection<Cartable> cartables = new ArrayList<>();
		        Collection<StockBean> stocks = stockModel.doRetrieveByGioco(id);
		        for(StockBean s: stocks) {
		            Cartable c = new Cartable();
		            c.setGioco(gioco);
		            c.setPiattaforma(s.getPiattaforma());
		            c.setQuantita(s.getRimanenti());
		            cartables.add(c);
		        }
		        request.setAttribute("cartables", cartables);
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect(request.getContextPath()+"/pages/Error.jsp");
				return;
			}
		} else {
			try {
				Part filePart = request.getPart("immagine");
				String nomeFile= filePart.getSubmittedFileName();
				GiocoBean gioco = giocoModel.doRetrieveByKey(id);
				StockBean stock = stockModel.doRetrieveByKey(id, request.getParameter("piattaforma"));
				gioco.setDataUscita(Date.valueOf(request.getParameter("data")));
				gioco.setDescrizione(request.getParameter("descrizione"));
				gioco.setEdizione(request.getParameter("edizione"));
				if(nomeFile!=null && !nomeFile.trim().isEmpty()) {
					gioco.setImmagine(nomeFile);
					try (OutputStream outputStream = new FileOutputStream(request.getServletContext().getInitParameter("LIMITED_ROOT") + File.separator + "images"+ File.separator + nomeFile); 
						    InputStream inputStream = filePart.getInputStream()) {
						System.out.println(request.getServletContext().getInitParameter("LIMITED_ROOT") + File.separator + "images"+ File.separator + nomeFile);
						    inputStream.transferTo(outputStream);
						}
				}
				gioco.setIva(Float.parseFloat(request.getParameter("iva")));
				gioco.setPrezzo(Float.parseFloat(request.getParameter("prezzo")));
				gioco.setSconto(Float.parseFloat(request.getParameter("sconto")));
				gioco.setTitolo(request.getParameter("titolo"));
				stock.setRimanenti(Integer.parseInt(request.getParameter("quantita")));
				stockModel.doUpdate(stock);
				giocoModel.doUpdate(gioco);
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect(request.getContextPath()+"/pages/Error.jsp");
				return;
			}
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/admin/GameUpdate.jsp?success=true");
		dispatcher.forward(request, response);
	}

}
