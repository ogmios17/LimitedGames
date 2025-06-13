<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import ="Model.Utente.*"%>
    <%@ include file="/pages/header.jsp" %>
    <% 
    	Collection<?> carte =(Collection<?>)request.getAttribute("carte");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="Utf-8">
<title>LimitedGames</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Utente.css?v=<%=System.currentTimeMillis()%>">
<style>
.posizione {
	 margin-top: 250px;
}

h2{
  font-size: 180;
  text-align: center;
}

.Colore ul {
     color: black;
     background-color:  #f4f6f8;
}


.Colore fieldset {
     color: black;
     background-color: white;
     border-radius: 12px;
     font-size: 150%;
}

</style>
</head>
<body>
	<h1>Le tue carte</h1>
	
	
	<div class="Colore">
	<div class="Tasti">
	<ul>
	<% if (carte != null && !carte.isEmpty()) { %>
    <%
    	Iterator<?> it=carte.iterator();
    	while(it.hasNext()){
    		PagamentoBean p= (PagamentoBean)it.next();
    %>
    	<li>**** **** **** <%=p.getNumero().substring(7,11) %><br>
    	<%=p.getScadenza() %>  
    	<form action = "<%= request.getContextPath()%>/Carte" method="POST">
    		<input type = "hidden" name= "action" value="delete">
    		<input type = "hidden" name= "carta" value="<%=p.getNumero() %>">
    		<input type = "submit" value="Elimina">
    	</form>
    	<%} }else{%>  	
    		<h2>Non sono presenti carte</h2>
    	<%} %>
    	<fieldset>
    		<legend>Inserisci una nuova carta</legend>
    		<form action = "<%= request.getContextPath()%>/Carte" method="POST">
    			<label for="nome">Nome:</label>
    			<input type="text" name = "nome" id="nome" required><br>
    			<label for="cognome">Cognome:</label>
    			<input type="text" name = "cognome" id="cognome" required><br>
    			<label for="tipo">Tipo:</label>
    			<input type="text" name="tipo" id="tipo" required><br>
    			<label for="numero">Numero:</label>
    			<input type="text" maxlength=16 name = "numero" id="numero"  required><br>
    			<label for="scadenza">Scadenza:</label>
    			<input type="date" name="scadenza" id="scadenza" required><br>
    			<label for="cvv">CVV:</label>
    			<input type="text" maxlength=3 name="cvv" id="cvv" required><br>
    			<input type="hidden" name="action" value="add">
    			<input type="submit" value="Aggiungi">
    		</form>
    	</fieldset>
    </ul>
    </div>
    </div>
    
    
    <div class="posizione">
	<%@ include file="/pages/footer.jsp" %>
	</div>
</body>
</html>