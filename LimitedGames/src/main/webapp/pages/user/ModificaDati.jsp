<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="Model.Utente.*"%>
    <%@ include file="/pages/header.jsp" %>
    <% UtenteBean utente = (UtenteBean) session.getAttribute("user");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Limited games</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Utente.css?v=<%=System.currentTimeMillis()%>">
<style>
      .posizione {
	margin-top: 360px;
}

.Dimensione{
    font-size: 170%;
}

.Box {
   border: none;
   border-radius: 12px;
   box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
   width: 24%;
   height: 32%;
   margin-left: 40%;
   margin-top: 7%;
   background-color: white;
}

.btn {
    font-size: 110%;
}

</style>
</head>
<body>
  <div class="Box">
  <div class="Tasti">
  <div class="Dimensione">
	<form action="<%= request.getContextPath()%>/Modifica" method="POST">
		<label for="nome">Nome:</label>
		<input type="text" id="nome" name="nome" required value="<%=utente.getNome()%>"> <br>

		<label for="cognome">Cognome:</label>
		<input type="text" id="cognome" name="cognome" required value="<%=utente.getCognome()%>"> <br>

		<label for="password">Password:</label>
		<input type="password" id="password" name="password" required placeholder="password"> <br>

		<label for="via">Via:</label>
		<input type="text" id="via" name="via" required value="<%=utente.getVia()%>"> <br>

		<label for="cap">CAP:</label>
		<input type="text" id="cap" name="cap" required value="<%=utente.getCAP()%>"> <br>

		<label for="citta">Città:</label>
		<input type="text" id="citta" name="citta" required value="<%=utente.getCitta()%>"> <br>
	</form>
	</div>
	
		<div class="azione-riga">
			<input type="submit" value="Invia" class="btn">
			<a href="<%= request.getContextPath() %>/Carte?action=view" class="btn">Le tue carte</a>
		</div>
</div>
</div>
	<div class="posizione">
	<%@ include file="/pages/footer.jsp" %>
	</div>
</body>
</html>