package Control.Utente;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Collection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Utente.*;

@WebServlet("/pages/user/Carte")
public class Carte extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Carte() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		String destinazione = request.getParameter("destinazione");
		ProprietaDAO proprietaModel = new ProprietaDAO();
		PagamentoDAO pagamentoModel = new PagamentoDAO();
		HttpSession session = request.getSession();
		UtenteBean utente= (UtenteBean)session.getAttribute("user");
		String username = utente.getUsername();
		if(destinazione == null) destinazione = "/pages/user/Carte.jsp";
		Collection<PagamentoBean> carte = new ArrayList<PagamentoBean>();
		try {
			
			Collection<ProprietaBean> proprieta = proprietaModel.doRetrieveByUsername(username);
			for(ProprietaBean p: proprieta) {
				String numero = p.getCarta();
				PagamentoBean carta = pagamentoModel.doRetrieveByKey(numero);
				carte.add(carta);
			}
			if(action.equals("add")) {
				PagamentoBean pagamento = new PagamentoBean();
				pagamento.setCognome(request.getParameter("cognome"));
				pagamento.setCVV(request.getParameter("cvv"));
				pagamento.setNome(request.getParameter("nome"));
				pagamento.setNumero(request.getParameter("numero"));
				String scadenzaParam = request.getParameter("scadenza");
				if (scadenzaParam != null && scadenzaParam.matches("\\d{4}-\\d{2}")) {  //purtroppo è poco elegante ma era l'unico modo
				    pagamento.setScadenza(Date.valueOf(scadenzaParam + "-01"));
				} else {
				    throw new IllegalArgumentException("Formato scadenza non valido: " + scadenzaParam);
				}
				pagamento.setTipo(request.getParameter("tipo"));
				
				PagamentoBean giaRegistrata = pagamentoModel.doRetrieveByKey(pagamento.getNumero());
				if(giaRegistrata.getNumero()==null) {
					pagamentoModel.doSave(pagamento);
				}
				proprietaModel.doSave(new ProprietaBean(username,pagamento.getNumero()));	
				response.sendRedirect(request.getContextPath() + "/pages/user/"+destinazione+"?success=add");
				return;
				
			}else if(action.equals("delete")) {
				proprietaModel.doDelete(request.getParameter("carta"),username);
				Collection<ProprietaBean> rimanenti = proprietaModel.doRetrieveByCarta(request.getParameter("carta"));
				if(rimanenti == null || rimanenti.isEmpty()) {
					pagamentoModel.doDelete(request.getParameter("carta"));
				}
				response.sendRedirect(request.getContextPath() + "/pages/user/"+destinazione+"?action=view");
				return;
			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() +"/pages/Error.jsp");
			return;
		}
		
		request.removeAttribute("carte");
		request.setAttribute("carte", carte);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(destinazione);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
