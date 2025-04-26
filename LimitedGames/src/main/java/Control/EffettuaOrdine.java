package Control;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Cart;
import Model.Cartable;
import Model.Ordine.*;
import Model.Utente.*;

@WebServlet("/EffettuaOrdine")
public class EffettuaOrdine extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EffettuaOrdine() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UtenteBean utente = (UtenteBean)session.getAttribute("user");
		String user= utente.getUsername();
		if(user == null) {
			session.setAttribute("order", "true");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/login-form.jsp");
			dispatcher.forward(request, response);
			
		}
		Cart cart = (Cart)session.getAttribute("cart");
		ArrayList<Cartable> games= cart.getGames();
		AcquistoDAO acquistoModel = new AcquistoDAO();
		OrdineDAO ordineModel = new OrdineDAO();
		UtenteDAO utenteModel = new UtenteDAO();
		float prezzoTot=0;
		try {
			OrdineBean ordine = new OrdineBean();
			ordine.setCAP(utente.getCAP());
			ordine.setCitta(utente.getCitta());
			ordine.setCognome(utente.getCognome());
			ordine.setDataConsegna(Date.valueOf(LocalDate.now()));
			ordine.setDataOrdine(Date.valueOf(LocalDate.now()));
			ordine.setNome(utente.getNome());
			ordine.setUsername(user);
			ordine.setVia(utente.getVia());
			for(Cartable c: games) {
				float prezzo = c.getGioco().getPrezzo()-c.getGioco().getPrezzo()*c.getGioco().getSconto()/100;
				prezzoTot+=prezzo;
			}
			ordine.setPrezzo(prezzoTot);
			int idOrdine= ordineModel.doSave(ordine);
			for(Cartable c: games) {
				AcquistoBean acquisto = new AcquistoBean();
				acquisto.setData(Date.valueOf(LocalDate.now()));
				acquisto.setEdizione(c.getGioco().getEdizione());
				acquisto.setIdGioco(c.getGioco().getId());
				acquisto.setIdOrdine(idOrdine);
				acquisto.setIva(c.getGioco().getIva());
				acquisto.setPiattaforma(c.getPiattaforma());
				float prezzo = c.getGioco().getPrezzo()-c.getGioco().getPrezzo()*c.getGioco().getSconto()/100;
				acquisto.setPrezzo(prezzo);
				acquisto.setQuantita(c.getQuantita());
				acquisto.setTitolo(c.getGioco().getTitolo());
				
				acquistoModel.doSave(acquisto);
				session.removeAttribute("cart");
				session.removeAttribute("order");
				response.sendRedirect("/LimitedGames/pages/OrdineEffettuato.jsp");
			}
		}catch (SQLException e) {
			System.out.println("Error: "+e);
			e.printStackTrace();
			response.sendRedirect("/LimitedGames/pages/Error.jsp");
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
