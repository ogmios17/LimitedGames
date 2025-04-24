<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LimitedGames</title>
</head>
<body>
	<% 
		String nome = (String)session.getAttribute("nome");
		if(nome == null) nome = "guest";
	%>
	<p>Sei loggato come <%=nome %></p>

	<a href="<%= request.getContextPath() %>/pages/Catalogo.jsp">
		<button>HOME</button>
	</a>

	<a href="<%= request.getContextPath() %>/pages/Carrello.jsp">
		<button>Carrello</button>
	</a>

	
	<a href="<%= request.getContextPath() %>/pages/user/User.jsp">
		<button>Utente</button>
	</a>
</body>
</html>