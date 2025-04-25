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

@WebServlet("/Carte")
public class Carte extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Carte() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		ProprietaDAO proprietaModel = new ProprietaDAO();
		PagamentoDAO pagamentoModel = new PagamentoDAO();
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("user");
		Collection<PagamentoBean> carte = new ArrayList<PagamentoBean>();
		try {
			if(action == "view") {
				Collection<ProprietaBean> proprieta = proprietaModel.doRetrieveByUsername(username);
				for(ProprietaBean p: proprieta) {
					String numero = p.getCarta();
					PagamentoBean carta = pagamentoModel.doRetrieveByKey(numero);
					carte.add(carta);
				}
			}else if(action == "add") {
				PagamentoBean pagamento = new PagamentoBean();
				pagamento.setCognome(request.getParameter("Cognome"));
				pagamento.setCVV(request.getParameter("CVV"));
				pagamento.setNome(request.getParameter("Nome"));
				pagamento.setNumero(request.getParameter("Numero"));
				pagamento.setScadenza(Date.valueOf(request.getParameter("Scadenza")));
				pagamento.setTipo(request.getParameter("Tipo"));
				pagamentoModel.doSave(pagamento);
				proprietaModel.doSave(new ProprietaBean(username,pagamento.getNumero()));				
			}else if(action == "delete") {
				PagamentoBean pagamento = new PagamentoBean();
				proprietaModel.doDelete(request.getParameter("carta"),username);
			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() +"/pages/Error.jsp");
		}
		
		request.removeAttribute("carte");
		request.setAttribute("carte", carte);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/pages/User/Carte.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
