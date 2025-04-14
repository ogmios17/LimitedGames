<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LimitedGames</title>
</head>
<body>
	<h1>Ops...sembra esserci stato un errore. Niente paura, il nostro tecnico è già al lavoro
	Intanto, ti ha preparato un piccolo pulsante per non perderti, scusa per l'inconvenienza!</h1>
	<a href= "<%= request.getContextPath() %>/Catalogo.jsp">
        	<button >Home page</button>
        </a>
</body>
</html>