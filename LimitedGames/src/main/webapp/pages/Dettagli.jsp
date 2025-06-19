<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Model.Gioco.GiocoBean" import= "java.util.*" import= "Model.Gioco.StockBean" import ="Model.Cartable"%>
<%@ include file="header.jsp" %>
<%@ include file="Menu.jsp" %>
<% 
	ArrayList<Cartable> products = (ArrayList<Cartable>) request.getAttribute("cartables");
	if(products == null || products==null){
		response.sendRedirect(request.getContextPath()+"/ShowDetails?id="+request.getParameter("id"));
		return;
	}  
	GiocoBean dettaglio=products.get(0).getGioco(); 

%>
<!DOCTYPE html>
<html>
<head>
<title>Dettaglio gioco</title>
 <link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Dettagli.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
	<h1>Dettagli gioco:</h1><br>
	
	<img class="Copertina" src="<%= request.getContextPath() %>/images/<%= dettaglio.getImmagine() %>?v=<%= System.currentTimeMillis() %>" alt="<%= dettaglio.getTitolo() %>">

	<table class="Informazioni" border=1>
		<tr>
			<th>Titolo</th>
			<th>Descrizione</th>
			<th>Edizione</th>
			<th>Prezzo</th>
			<th>Sconto</th>
			<th>IVA</th>
			<th>Data di uscita</th>
		</tr>
		<tr>
			<td><%= dettaglio.getTitolo()%></td>
			<td><%= dettaglio.getDescrizione()%></td>
			<td><%= dettaglio.getEdizione()%></td>
			<td><%= dettaglio.getPrezzo()%></td>
			<td><%= dettaglio.getSconto()%></td>
			<td><%= dettaglio.getIva()%></td>
			<td><%= dettaglio.getDataUscita()%></td>
		</tr>
	</table>
	
	<div id="Bottoni">
	<form action="./AggiungiGioco" method="post">
	<Label for=piattaforma>Seleziona la piattaforma</Label>
		<select name="piattaforma" id="piattaforma">
			<% 	
				Iterator<?> it=products.iterator();
				while(it.hasNext()){
					Cartable c = (Cartable) it.next();
					String piattaforma = c.getPiattaforma();
			%>
				<option value= "<%=piattaforma%>"><%=piattaforma%></option>
					<% }
				
				%>

		</select>
		<input type="hidden" name="id" value="<%=dettaglio.getId() %>">
		<label for="quantita">Quantità:</label>
		<select name="quantita" id="quantita">
  			<option value="1">1</option>
  			<option value="2">2</option>
  			<option value="3">3</option>
  			<option value="4">4</option>
  			<option value="5">5</option>
  			<option value="6">6</option>
  			<option value="7">7</option>
  			<option value="8">8</option>
  			<option value="9">9</option>
  			<option value="10">10</option>
		</select>
		<input type="submit" value="Aggiungi al carrello">
	</form>
</div>
	<div class="posizione">
	<%@ include file="footer.jsp" %>
	</div>
	
</body>
</html>