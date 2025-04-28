<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminLimited</title>
</head>
<body>

	<a href="<%= request.getContextPath() %>/pages/admin/CatalogoAdmin.jsp">
		<button>Catalogo</button>
	</a>
	<a href="<%= request.getContextPath() %>/pages/admin/GameInsert.jsp">
		<button>Aggiungi prodotti</button>
	</a>
	<form action= "<%= request.getContextPath() %>/Logout" method = POST>
		<input type = "submit" value= "Logout">
	</form>
</body>
</html>