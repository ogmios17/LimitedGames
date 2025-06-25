<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Model.Cart" import="Model.Gioco.GiocoBean" import="Model.Cartable" import="java.util.*" import="Model.Utente.*"%>
    <%@ include file="/pages/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Limited Games</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Dettagli.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
<h1>Riepilogo ordine</h1>
<%
		Cart cart=(Cart)session.getAttribute("cart");
		if(cart==null || cart.isEmpty()){
	%><h1>Carrello vuoto</h1>
	<% }else{
	
		ArrayList<Cartable> games= cart.getGames();
	%>
		<%for(Cartable c: games) {%>
		
		
			<div id="Riepilogo">
			<div class="Ordine">
			<img class="CopertinaOF" src="<%= request.getContextPath() %>/images/<%= c.getGioco().getImmagine() %>?v=<%= System.currentTimeMillis() %>" alt="<%= c.getGioco().getTitolo() %>">
			
	       <div class="Informazioni">
				<%=c.getGioco().getTitolo() %><br>
				<%=c.getPiattaforma() %><br>
				<%=c.getGioco().getEdizione() %><br>
				<%=c.getGioco().getPrezzo() %><br>
             <p> Quantità: <%=c.getQuantita() %> </p>	
				<p>Prezzo Totale: <%=c.getGioco().getPrezzo()*c.getQuantita() %></p>
		<%} %>   
	<%} %>
	      </div>
	      </div>
<% 
	Collection<ProprietaBean> carte= (Collection<ProprietaBean>)request.getAttribute("carte"); 
    Boolean checkedAttr = (Boolean)request.getAttribute("checked");
    boolean checked = (checkedAttr != null) ? checkedAttr : false;
    if((carte == null || carte.isEmpty())&& checked == false){
    	response.sendRedirect(request.getContextPath()+"/CardHandler");
    	return;
    }%>

<% if(carte!= null && !carte.isEmpty()){ %>
		<label for=carta>Seleziona il metodo di pagamento</label>
		
			<select name="carta" id="carta">
		<%} %>
			<% 
				if(carte!= null && !carte.isEmpty()){
					Iterator<?> it=carte.iterator();
					while(it.hasNext()){
						ProprietaBean carta=(ProprietaBean)it.next();
			%>
				<option value="<%=carta.getCarta()%>">**** **** ****<%=carta.getCarta().substring(7,11) %></option>
					<% }
				}else{
				%>
				
		<div class ="Pagamento">
				<fieldset>
    		<legend>Inserisci metodo di pagamento</legend>
    		<form action = "<%= request.getContextPath()%>/Carte" method="POST">
    			<label for="nome">Nome:</label>
    			<input type="text" name = "nome" id="nome" required><br>
    			<label for="cognome">Cognome:</label>
    			<input type="text" name = "cognome" id="cognome" required><br>
    			<label for="tipo">Tipo:</label>
    			<input type="text" name="tipo" id="tipo" required><br>
    			<label for="numero">Numero:</label>
    			<input type="text" maxlength=16 name = "numero" id="numero"  required><br>
    			<label for="scadenza">Scadenza:</label>
    			<input type="date" name="scadenza" id="scadenza" required><br>
    			<label for="cvv">CVV:</label>
    			<input type="text" maxlength=3 name="cvv" id="cvv" required><br>
    		</form>
    	</fieldset>
    	<%} %>

		</select>
		<form action = "<%= request.getContextPath()%>/EffettuaOrdine" method = POST>
			<input type = "submit" value="Completa l'acquisto"> 
		</form>
    </div>   
 <div class="PosizioneOF">
<%@include file="/pages/footer.jsp" %>
</div>

</body>
</html>