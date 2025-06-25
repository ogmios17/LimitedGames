<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LimitedGames</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Acquisti.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
	<h1>Ordine effettuato correttamente!</h1>
	
  <div class="Immagine">
  <img src="/LimitedGames/images/system/Mascotte2.PNG" alt="">
  <p> Grazie per averci scelto! <br>
	<a href = "<%= request.getContextPath()%>/pages/Catalogo.jsp">Continua a fare acquisti</a></p>
  </div>
	
</body>
</html>