<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1" import="Model.Gioco.GiocoBean" import= "java.util.*" import= "Model.Gioco.StockBean"%>
<%@ include file="header.jsp" %>
<% 
	GiocoBean dettaglio=(GiocoBean)request.getAttribute("gioco"); 
	Collection<?> piattaforme = (Collection<?>) request.getAttribute("piattaforme");
    	if(piattaforme == null || dettaglio==null){
    		response.sendRedirect(request.getContextPath()+"/ShowDetails?id="+dettaglio.getId());
    		return;
    	}  
%>
<!DOCTYPE html>
<html>
<head>
<title>Dettaglio gioco</title>
</head>
<body>
	<h1>Dettagli gioco:</h1><br>
	<img src="<%= request.getContextPath() %>/images/<%= dettaglio.getImmagine() %>?v=<%= System.currentTimeMillis() %>" alt="<%= dettaglio.getTitolo() %>">
	<table border=1>
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
	<form action="./AggiungiGioco" method="post">
	<Label for=piattaforma>Seleziona la piattaforma</Label>
		<select name="piattaforma" id="piattaforma">
			<% 
				if(piattaforme!= null && !piattaforme.isEmpty()){
					Iterator<?> it=piattaforme.iterator();
					while(it.hasNext()){
						StockBean piattaforma=(StockBean)it.next();
			%>
				<option value= "<%=piattaforma.getPiattaforma() %>"><%=piattaforma.getPiattaforma() %></option>
					<% }
				}
				%>

		</select>
		<input type="hidden" name="id" value="<%=dettaglio.getId() %>">
		<input type="submit" value="Aggiungi al carrello">
		
	</form>
	
	<%@ include file="footer.jsp" %>
</body>
</html>