<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="Model.Utente.*"%>
    <%@ include file="/pages/header.jsp" %>
    <% UtenteBean utente = (UtenteBean) session.getAttribute("user");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Limited games</title>
</head>
<body>
	<form action="<%= request.getContextPath()%>/Modifica" method = "POST">
			<label for="nome">Nome:</label>
			<input type="text" id="nome" name="nome" value = "<%=utente.getNome()%>"> <br>
			<label for="cognome">Cognome:</label>
			<input type="text" id="cognome" name="cognome" value = "<%=utente.getCognome()%>"> <br>
			<label for="password">Password:</label>
			<input type="password" id="password" name="password" placeholder="password"> <br>
			<label for="via">Via:</label>
			<input type="text" id="via" name="via" value = "<%=utente.getVia()%>"> <br>
			<label for="cap">CAP:</label>
			<input type="text" id="cap" name="cap" value = "<%=utente.getCAP()%>"> <br>
			<label for="citta">Città:</label>
			<input type="text" id="citta" name="citta" value = "<%=utente.getCitta()%>"> <br>
			<input type = "submit" value="Invia">
		</form>
</body>
</html>