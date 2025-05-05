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

	<nav>
		<ul>
			<li><a href="<%= request.getContextPath() %>/pages/Catalogo.jsp"><img src="<%= request.getContextPath() %>/images/system/logo.png" alt="Limited Games"> </a></li>
			<li><a href="<%= request.getContextPath() %>/pages/Carrello.jsp">Carrello</a></li>
			<li><a href="<%= request.getContextPath() %>/pages/login-form.jsp">Utente</a></li>
		</ul>
	</nav>
	
</body>
</html>