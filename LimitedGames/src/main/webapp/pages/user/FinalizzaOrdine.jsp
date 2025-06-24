<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Model.Cart" import="Model.Gioco.GiocoBean" import="Model.Cartable" import="java.util.*" import="Model.Utente.*"%>
    <%@ include file="/pages/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style>
  #savedCards, #newCard {
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.4s ease;
  }
  #savedCards.show, #newCard.show {
    max-height: 500px;
  }
</style>
<meta charset="UTF-8">
<title>Limited Games</title>
</head>
<body>
<h1>Riepilogo ordine:</h1>
<%
		Cart cart=(Cart)session.getAttribute("cart");
		if(cart==null || cart.isEmpty()){
	%><h1>Carrello vuoto</h1>
	<% }else{
	
		ArrayList<Cartable> games= cart.getGames();
	%>
		<%for(Cartable c: games) {%>
			<div class="Cornice">
			<img class="immagine" src="<%= request.getContextPath() %>/images/<%= c.getGioco().getImmagine() %>?v=<%= System.currentTimeMillis() %>" alt="<%= c.getGioco().getTitolo() %>">
			
			<div class="posizione">
				<%=c.getGioco().getTitolo() %><br>
				<%=c.getPiattaforma() %><br>
				<%=c.getGioco().getEdizione() %><br>
				<%=c.getGioco().getPrezzo() %><br></div>
            <div class="spazio">  <p> Quantità: <%=c.getQuantita() %> </p>	
				<p>Prezzo Totale: <%=c.getGioco().getPrezzo()*c.getQuantita() %></p>
		<%} %>
		
		
		
		</div>
		<%} %>
	<div class="posizionef">
	</div>
<% 
	Collection<ProprietaBean> carte= (Collection<ProprietaBean>)request.getAttribute("carte"); 
    Boolean checkedAttr = (Boolean)request.getAttribute("checked");
    boolean checked = (checkedAttr != null) ? checkedAttr : false;
    if((carte == null || carte.isEmpty())&& checked == false){
    	response.sendRedirect(request.getContextPath()+"/CardHandler");
    	return;
    }%>
<div class="Pagamento">
	<button type="button" onclick="toggleSection('savedCards')">💳 Usa una delle carte salvate</button>
    <button type="button" onclick="toggleSection('newCard')">➕ Inserisci nuovo metodo di pagamento</button>
    <div id="savedCards">
        <% if (carte != null && !carte.isEmpty()) { %>
            <form action="<%= request.getContextPath() %>/EffettuaOrdine" method="POST">
                <label for="carta">Seleziona una carta:</label>
                <select name="carta" id="carta" required>
                    <% for (ProprietaBean carta : carte) { %>
                        <option value="<%= carta.getCarta() %>">**** **** **** <%= carta.getCarta().substring(7, 11) %></option>
                    <% } %>
                </select>
                <br><br>
                <input type="submit" value="Completa l'acquisto">
            </form>
        <% } else { %>
            <p>Nessuna carta salvata disponibile.</p>
        <% } %>
    </div>
    <div id="newCard">
        <form action="<%= request.getContextPath() %>/Carte?action=add" method="POST">
    <fieldset>
        <legend>Inserisci dati della nuova carta</legend>

        <label for="nome">Nome:</label>
        <input type="text" name="nome" id="nome" required><br>
		
		<input type = "hidden" name="destination" value="/pages/user/FinalizzaOrdine.jsp">
		
        <label for="cognome">Cognome:</label>
        <input type="text" name="cognome" id="cognome" required><br>

        <label for="tipo">Tipo:</label>
        <input type="text" name="tipo" id="tipo" required><br>

        <label for="numero">Numero:</label>
        <input type="text" maxlength="16" name="numero" id="numero" required><br>

        <label for="scadenza">Scadenza:</label>
        <input type="date" name="scadenza" id="scadenza" required><br>

        <label for="cvv">CVV:</label>
        <input type="text" maxlength="3" name="cvv" id="cvv" required><br><br>

        <input type="submit" value="Salva metodo di pagamento">
    </fieldset>
</form>

    </div>
</div>
 <%@ include file="/pages/footer.jsp" %>

</div>
<script>
function toggleSection(id) {
  const sectionIds = ['savedCards', 'newCard'];

  sectionIds.forEach(sectionId => {
    const sectionElement = document.getElementById(sectionId);
    if (sectionId === id) {
      sectionElement.classList.toggle('show');
    } else {
      sectionElement.classList.remove('show');
    }
  });
}
</script>

</div></body>

