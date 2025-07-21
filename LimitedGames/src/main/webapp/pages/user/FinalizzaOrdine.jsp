<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Model.Cart" import="Model.Gioco.GiocoBean" import="Model.Cartable" import="java.util.*" import="Model.Utente.*"%>
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
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/FinalizzaOrdine.css?v=<%=System.currentTimeMillis()%>">
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Header.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
<%@ include file="/pages/header.jsp" %>
<% String success = request.getParameter("success"); %>

<% if (success != null) { %>
  <div id="popup-message" class="popup">
    <% if ("add".equals(success)) { %>
      Carta salvata con successo!
    <% } }%>
  </div>

  <script>
    setTimeout(() => {
      const popup = document.getElementById("popup-message");
      if (popup) {
        popup.style.opacity = "0";
        setTimeout(() => popup.remove(), 500);
      }
    }, 1000); 
     
    if (window.history.replaceState) {
        const url = new URL(window.location.href);
        url.searchParams.delete("success");
        window.history.replaceState(null, "", url);
        
        
    }
  </script>
<script src="<%= request.getContextPath() %>/JavaScript/Forms.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        setupCartaForm("numero", "cvv");
        setupFormValidation(); 
    });
</script>
<div class="Dati">
<%
		Cart cart=(Cart)session.getAttribute("cart");
		if(cart==null || cart.isEmpty()){
	%><h1>Carrello vuoto</h1>
	<% }else{
	
		ArrayList<Cartable> games= cart.getGames();
	%>
		<%for(Cartable c: games) {%>
		
			<img class="Immagini" src="<%= request.getContextPath() %>/images/<%= c.getGioco().getImmagine() %>?v=<%= System.currentTimeMillis() %>" alt="<%= c.getGioco().getTitolo() %>">
			
				<%=c.getGioco().getTitolo() %><br>
				<%=c.getPiattaforma() %><br>
				<%=c.getGioco().getEdizione() %><br>
				<%=c.getGioco().getPrezzo() %><br>
            <p> Quantità: <%=c.getQuantita() %> </p>	
				<p>Prezzo Totale: <%= String.format("%.2f", c.getGioco().getPrezzo() * c.getQuantita()) %>€</p>

		<%} %>
		
           </div>
	<% 
	Collection<ProprietaBean> carte= (Collection<ProprietaBean>)request.getAttribute("carte"); 
    Boolean checkedAttr = (Boolean)request.getAttribute("checked");
    boolean checked = (checkedAttr != null) ? checkedAttr : false;
    if((carte == null || carte.isEmpty())&& checked == false){
    	if(success!=null && success.equals("true")){
	    	response.sendRedirect(request.getContextPath()+"/pages/user/CardHandler?success=add");
	    	return;
    	}else {
    		response.sendRedirect(request.getContextPath()+"/pages/user/CardHandler");
	    	return;
    	}
    }%>
    <div class="Bottoni">
	<button type="button" onclick="toggleSection('savedCards')">💳 Usa una delle carte salvate</button>
    <button type="button" onclick="toggleSection('newCard')">➕ Inserisci nuovo metodo di pagamento</button></div>
    
    <div id="savedCards">
        <% if (carte != null && !carte.isEmpty()) { %>
            <form action="<%= request.getContextPath() %>/pages/user/EffettuaOrdine" method="POST">
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
    <form action="<%= request.getContextPath() %>/pages/user/Carte" method="POST" id="form-aggiungi-carta">
        <fieldset>
    <div class="submit-error" id="submit-error"></div>
    	<div class="submit-error" id ="submit-error"></div>
    		Inserisci una nuova carta<br>
    			<input type = "hidden" name="destination" value="/pages/user/Carte.jsp">
    			<label for="nome">Nome:</label>
    			<input type="text" name = "nome" id="nome" required oninvalid="this.setCustomValidity('Inserisci il nome')" 
       oninput="this.setCustomValidity('')"><br>
    			<label for="cognome">Cognome:</label>
    			<input type="text" name = "cognome" id="cognome" required oninvalid="this.setCustomValidity('Inserisci il cognome')" 
       oninput="this.setCustomValidity('')"><br>
    			<label for="tipo">Tipo:</label>
    			<select name="tipo" id="tipo">
    				<option value="mastercard">Mastercard</option>
    				<option value="VISA">VISA </option>
    			</select>
    			<br>
    			<div id="numero-warning" class="warning"></div>
    			<label for="numero">Numero:</label>
    			<input type="text" name = "numero" id="numero" autocomplete="off" required oninvalid="this.setCustomValidity('Inserisci il numero della carta')" 
       oninput="this.setCustomValidity('')"><br>
    			<label for="scadenza">Scadenza:</label>
    			<input type="month" name="scadenza" id="scadenza" required oninvalid="this.setCustomValidity('Inserisci la scadenza')" 
       oninput="this.setCustomValidity('')"><br>
    			<div id="cvv-warning" class="warning"></div>
    			<label for="cvv">CVV:</label>
    			<input type="text" maxlength=3 name="cvv" id="cvv" required oninvalid="this.setCustomValidity('Attenzione: questo campo è obbligatorio')" 
       oninput="this.setCustomValidity('')"><br>
    			<input type="hidden" name="action" value="add">
    			<input type="hidden" name="destinazione" value="CardHandler">
    			<input type="submit" value="Aggiungi">
    		</form>
    	</fieldset>
</div>

    
    <div class="Posizione">
 <%@ include file="/pages/footer.jsp" %>
 </div>
 <%} %>

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
</body>
