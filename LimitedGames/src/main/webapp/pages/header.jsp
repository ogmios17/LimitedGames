<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Header</title>
</head>
<body>
	<a href="<%= request.getContextPath() %>/pages/Carrello.jsp">
		<button>Visualizza carrello</button>
	</a>
	<a href="<%= request.getContextPath() %>/pages/Ordini.jsp">
		<button>Visualizza ordini</button>
	</a>
	
	<a href="<%= request.getContextPath() %>/pages/admin/protected.jsp">
		<button>Accedi da admin</button>
	</a>
	
	<a href="<%= request.getContextPath() %>/pages/login-form.jsp">
		<button>Effettua il login</button>
	</a>
</body>
</html>