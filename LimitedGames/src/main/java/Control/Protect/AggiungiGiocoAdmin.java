package Control.Protect;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Model.Gioco.*;

@WebServlet("/pages/admin/AggiungiGiocoAdmin")
@MultipartConfig
public class AggiungiGiocoAdmin extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	final GiocoDAO model = new GiocoDAO();
	final StockDAO stock = new StockDAO();
	
    public AggiungiGiocoAdmin() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part filePart = request.getPart("immagine");
		String nomeFile= filePart.getSubmittedFileName();
		GiocoBean bean = new GiocoBean();
		String piattaforma = request.getParameter("piattaforma");
		int quantita = Integer.parseInt(request.getParameter("Quantita"));
		bean.setTitolo(request.getParameter("Titolo"));
		bean.setDescrizione(request.getParameter("Descrizione"));
		bean.setImmagine(nomeFile);
		bean.setEdizione(request.getParameter("Edizione"));
		bean.setPrezzo(Float.parseFloat(request.getParameter("Prezzo")));
		bean.setIva(Float.parseFloat(request.getParameter("Iva")));
		bean.setSconto(0);
		bean.setDataUscita(Date.valueOf(request.getParameter("Data")));
		try (OutputStream outputStream = new FileOutputStream(request.getServletContext().getInitParameter("LIMITED_ROOT") + File.separator + "images"+ File.separator + nomeFile); 
			    InputStream inputStream = filePart.getInputStream()) {
			    inputStream.transferTo(outputStream);
			}
		try {
			StockBean stockBean = new StockBean();
			GiocoBean giaPresente =	model.doRetrieveByTitolo(request.getParameter("Titolo"));
			int idGioco;
			if(giaPresente.getTitolo()!=null)
				idGioco =giaPresente.getId();
			else idGioco = model.doSave(bean);
			stockBean.setAcquistati(0);
			stockBean.setIdGioco(idGioco);
			stockBean.setPiattaforma(piattaforma);
			stockBean.setRimanenti(quantita);
			stock.doSave(stockBean);
			
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/LimitedGames/pages/Error.jsp");
			return;
		}
		response.sendRedirect(request.getContextPath()+"/giochi?success=add");
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
