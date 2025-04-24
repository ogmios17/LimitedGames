<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/pages/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LimitedGames</title>
</head>
<body>
<br>
	<a href="<%= request.getContextPath() %>/pages/user/Ordini.jsp">
		<button>Ordini</button>
	</a>
	<a href="<%= request.getContextPath() %>/pages/user/ModificaDati.jsp">
		<button>Modifica dati utente</button>
	</a>
	<form action= "<%= request.getContextPath() %>/Logout" method = POST>
		<input type = "submit" value= "Logout">
	</form>
</body>
</html>