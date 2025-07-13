<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.*" import ="Model.Utente.*"%>
<%
    Collection<UtenteBean> utenti = (Collection<UtenteBean>)request.getAttribute("utenti");
	if(utenti == null || utenti.isEmpty()){
		response.sendRedirect(request.getContextPath()+"/pages/admin/FetchUtenti");
    	return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Limited Admin</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/VISUT.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
	<h1>Elenco utenti:</h1> <br>
	<table class="Tavolo">
		<tr>
			<th>Nome</th>
			<th>Cognome</th>
			<th>Mail</th>
			<th>CAP</th>
			<th>Città</th>
			<th>Tipo</th>
			<th>Ordini</th>
		</tr>
		<%
		Iterator<?> it = utenti.iterator(); 
		while(it.hasNext()){
			UtenteBean user = (UtenteBean)it.next();		
		%>
		<tr>
			<td><%=user.getNome() %></td>
			<td><%=user.getCognome()%></td>
			<td><%=user.getEmail()%></td>
			<td><%=user.getCAP() %></td>
			<td><%=user.getCitta() %></td>
			<td><%=user.getTipo()%></td>
			<td><a href="<%=request.getContextPath() %>/VisualizzaOrdini?username=<%=user.getUsername()%>&destinazione=admin/VisualizzaOrdini.jsp">
			<button>Ordini</button></a></td>
		</tr>
		<%} %>
	</table>
</body>
</html>