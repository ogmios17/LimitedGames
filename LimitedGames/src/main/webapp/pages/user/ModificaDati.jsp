<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="Model.Utente.*"%>
    <% UtenteBean utente = (UtenteBean) session.getAttribute("user");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Limited games</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Utente.css?v=<%=System.currentTimeMillis()%>">
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Header.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
<%@ include file="/pages/header.jsp" %>


<% String success = request.getParameter("success"); %>

<% if (success != null) { %>
  <div id="popup-message" class="popup">
    <% if ("add".equals(success)) { %>
      Carta salvata con successo!
    <% } else if ("delete".equals(success)) { %>
      Carta eliminata con successo!
    <% } %>
  </div>

  <script>
    setTimeout(() => {
      const popup = document.getElementById("popup-message");
      if (popup) {
        popup.style.opacity = "0";
        setTimeout(() => popup.remove(), 500);
      }
    }, 1000); 
  </script>
<% } %>
  <div class="Box">
  <div class="Tasti">
  <div class="Dimensione">
	<form action="<%= request.getContextPath()%>/pages/user/Modifica" method="POST">
		<label for="nome">Nome:</label>
		<input type="text" id="nome" name="nome" required value="<%=utente.getNome()%>"> <br>

		<label for="cognome">Cognome:</label>
		<input type="text" id="cognome" name="cognome" required value="<%=utente.getCognome()%>"> <br>
		

		<label for="via">Via:</label>
		<input type="text" id="via" name="via" required value="<%=utente.getVia()%>"> <br>

		<label for="cap">CAP:</label>
		<input type="text" id="cap" name="cap" required value="<%=utente.getCAP()%>"> <br>

		<label for="citta">Città:</label>
		<input type="text" id="citta" name="citta" required value="<%=utente.getCitta()%>"> <br>
	</form>
	</div>
	
		<div class="azione-riga">
			<input type="submit" value="Invia" id="btn">
			<a href="<%= request.getContextPath() %>/pages/user/Carte?action=view" id="btn">Le tue carte</a>
		</div>
</div>
</div>
	<div class="posizioneMD">
	<%@ include file="/pages/footer.jsp" %>
	</div>
</body>
</html>