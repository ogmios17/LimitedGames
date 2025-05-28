<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LimitedGames</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Login.css?v=<%=System.currentTimeMillis()%>">
<style>
body {
            margin: 0;
            height: 100vh;
            position: relative;
            background-color: #ffffff;
        }

        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
            background-image: url('<%= request.getContextPath() %>/images/system/logo.png');
            background-repeat: no-repeat;
            background-position: right center;
            background-size: 400px 200px;
            pointer-events: none;
        }

        .contenuto {
            position: relative;
            z-index: 1;
            text-align: center;
            padding-top: 100px;
            font-size: 24px;
            color: #000;
            }
           #margine {
            margin-top: 50px;
            }
</style>
</head>
<body>
<h1>REGISTRATI</h1>

	<div id="Registrazione">
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
	</div>
	
	<div id="margine">
	<div id="footer">
	<%@include file="footer.jsp" %>
	</div>
	</div>
</body>
</html>