<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LimitedGames</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Errori.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
  <div class="Immagine">
   <img src="/LimitedGames/images/system/Mascotte2.PNG" alt="">
	<p>Ops...sembra esserci stato un errore. Niente paura, il nostro tecnico è già al lavoro
	Intanto, ti ha preparato un piccolo pulsante per non perderti, scusa per l'inconvenienza!
	<a href= "<%= request.getContextPath() %>/pages/Catalogo.jsp">
        	<button >Home page</button>
        </a></p>
   </div>
</body>
</html>