<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src= "<%= request.getContextPath() %>/JavaScript/RegistrazioneForm.js"></script>
<title>LimitedGames</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Registrazione.css?v=<%=System.currentTimeMillis()%>">
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Header.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
 <%@ include file="header.jsp" %>


<h1>REGISTRATI</h1><br>

	<div id="Registrazione">
	<form action="<%= request.getContextPath()%>/Registrazione" method = "POST" id="registerForm">
		<div id="submit-error"></div>
		<label for="nome">Nome:</label>
		<input type="text" id="nome" name="nome" required> <br>
		<label for="cognome">Cognome:</label>
		<input type="text" id="cognome" name="cognome" required> <br>
		<div id="email-warning" class="warning"></div>
		<label for="email">Email:</label>
		<input type="text" id="email" name="email" required> <br>
		<label for="password">Password:</label>
		<input type="password" id="password" name="password" required> <br>
		<label for="via">Via:</label>
		<input type="text" id="via" name="via" required> <br>
		<div id="cap-warning" class="warning"></div>
		<label for="cap">CAP:</label>
		<input type="text" id="cap" name="cap" required> <br>
		<label for="citta">Città:</label>
		<input type="text" id="citta" name="citta" required> <br>
		<input type = "submit" value="Registrati">
		<% if(Boolean.TRUE.equals(request.getAttribute("logged"))){ %>
			<p>utente già registrato nella piattaforma</p>
		<%} %>
		
	</form>
	
	</div>
	
     <div id="margine">
	<%@include file="footer.jsp" %>
	</div>
	
</body>
</html>