<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LimitedGames</title>
</head>
<body>
	
	<form action="<%= request.getContextPath()%>/Registrazione" method = "POST">
		<label for="nome">Nome:</label>
		<input type="text" id="nome" name="nome" required> <br>
		<label for="cognome">Cognome:</label>
		<input type="text" id="cognome" name="cognome" required> <br>
		<label for="email">Email:</label>
		<input type="text" id="email" name="email" required> <br>
		<label for="password">Password:</label>
		<input type="password" id="password" name="password" required> <br>
		<label for="via">Via:</label>
		<input type="text" id="via" name="via" required> <br>
		<label for="cap">CAP:</label>
		<input type="text" id="cap" name="cap" required> <br>
		<label for="citta">Città:</label>
		<input type="text" id="citta" name="citta" required> <br>
		<input type = "submit" value="Registrati">
		<% if(Boolean.TRUE.equals(request.getAttribute("logged"))){ %>
			<p>utente già registrato nella piattaforma</p>
		<%} %>
	</form>
</body>
</html>