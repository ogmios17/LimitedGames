<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1" import="Model.Gioco.GiocoBean"%>
<%@ include file="header.jsp" %>
<% GiocoBean dettaglio=(GiocoBean)request.getAttribute("gioco"); %>
<!DOCTYPE html>
<html>
<head>
<title>Dettaglio gioco</title>
</head>
<body>
	<h1>Dettagli gioco:</h1><br>
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
	<img src="<%= request.getContextPath() %>/images/<%= dettaglio.getImmagine() %>?v=<%= System.currentTimeMillis() %>" alt="<%= dettaglio.getTitolo() %>"><br>
	<%@ include file="footer.jsp" %>
</body>
</html>