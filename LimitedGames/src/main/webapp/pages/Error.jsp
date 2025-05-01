<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LimitedGames</title>
</head>
<body>
	<h1>Ops...sembra esserci stato un errore. Niente paura, il nostro tecnico è già al lavoro
	Intanto, ti ha preparato un piccolo pulsante per non perderti, scusa per l'inconvenienza!</h1>
	<a href= "<%= request.getContextPath() %>/pages/Catalogo.jsp">
        	<button >Home page</button>
        </a>
</body>
</html>