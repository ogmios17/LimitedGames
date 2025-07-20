<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/pages/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminLimited</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Admin.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>

  <div class="Opzioni">
	<a href="<%= request.getContextPath() %>/pages/admin/CatalogoAdmin.jsp">
		<button>Catalogo</button>
	</a>
	<a href="<%= request.getContextPath() %>/pages/admin/GameInsert.jsp">
		<button>Aggiungi prodotti</button>
	</a>
	<a href="<%= request.getContextPath() %>/pages/admin/VisualizzaUtenti.jsp">
		<button>Visualizza utenti</button>
	</a>
	<form action= "<%= request.getContextPath() %>/Logout" method = POST>
		<input type = "submit" value= "Logout">
	</form>
  </div>
  
</body>
</html>