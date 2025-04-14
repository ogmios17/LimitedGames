<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="Model.Cart" import="Model.Cartable" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Carrello</title>
</head>
<body>
	<%
		session.setAttribute("username","ogham");
		Cart cart=(Cart)session.getAttribute("cart");
		if(cart==null || cart.isEmpty()){
	%><h1>Carrello vuoto</h1>
	<% }else{
	
		ArrayList<Cartable> games= cart.getGames();
	%>
	<table>
		<tr>
			<th>Prodotto</th>
			<th>Piattaforma</th>
			<th>Edizione</th>
			<th>Prezzo</th>
			<th>Quantità</th>
			<th>Prezzo totale</th>
			<th></th>
		</tr>
		<%for(Cartable c: games) {%>
			<tr>
				<td><%=c.getGioco().getTitolo() %></td>
				<td><%=c.getPiattaforma() %></td>
				<td><%=c.getGioco().getEdizione() %></td>
				<td><%=c.getGioco().getPrezzo() %></td>
				<td><%=c.getQuantita() %></td>
				<td><%=c.getGioco().getPrezzo()*c.getQuantita() %></td>
				<td><a href= "<%= request.getContextPath() %>/RimuoviGioco?id=<%=c.getGioco().getId()%>&action=subtract&piattaforma=<%=c.getPiattaforma() %>"><button>-</button></a></td>
		<%} %>
		</table>
		<form action="<%= request.getContextPath()%>/EffettuaOrdine" method="POST">
			<input type="submit" value="Effettua acquisto">
		</form>
		<%}%>
		
			
	</table>
</body>
</html>