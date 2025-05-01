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
	<h1>Ordine effettuato correttamente. Grazie per averci scelto!</h1>
	<a href = "<%= request.getContextPath()%>/pages/Catalogo.jsp">Continua a fare acquisti</a>
</body>
</html>