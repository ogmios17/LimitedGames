<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import ="Model.Utente.*"%>
    <% 
    	Collection<?> carte =(Collection<?>)request.getAttribute("carte");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="Utf-8">
<title>LimitedGames</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Utente.css?v=<%=System.currentTimeMillis()%>">
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Header.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
<%@ include file="/pages/header.jsp" %>


<script src="<%= request.getContextPath() %>/JavaScript/Forms.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        setupCartaForm("numero", "cvv");
        setupFormValidation(); 
    });
</script>
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
    	<div class="submit-error" id ="submit-error"></div>
    		Inserisci una nuova carta<br>
    		<form action = "<%= request.getContextPath()%>/Carte" method="POST" id ="form-aggiungi-carta">
    			<input type = "hidden" name="destination" value="/pages/user/Carte.jsp">
    			<label for="nome">Nome:</label>
    			<input type="text" name = "nome" id="nome" required oninvalid="this.setCustomValidity('Inserisci il nome')" 
       oninput="this.setCustomValidity('')"><br>
    			<label for="cognome">Cognome:</label>
    			<input type="text" name = "cognome" id="cognome" required oninvalid="this.setCustomValidity('Inserisci il cognome')" 
       oninput="this.setCustomValidity('')"><br>
    			<label for="tipo">Tipo:</label>
    			<select name="tipo" id="tipo">
    				<option value="mastercard">Mastercard</option>
    				<option value="VISA">VISA </option>
    			</select>
    			<br>
    			<div id="numero-warning" class="warning"></div>
    			<label for="numero">Numero:</label>
    			<input type="text" name = "numero" id="numero"  required oninvalid="this.setCustomValidity('Inserisci il numero della carta')" 
       oninput="this.setCustomValidity('')"><br>
    			<label for="scadenza">Scadenza:</label>
    			<input type="date" name="scadenza" id="scadenza" required oninvalid="this.setCustomValidity('Inserisci la scadenza')" 
       oninput="this.setCustomValidity('')"><br>
    			<div id="cvv-warning" class="warning"></div>
    			<label for="cvv">CVV:</label>
    			<input type="text" maxlength=3 name="cvv" id="cvv" required oninvalid="this.setCustomValidity('Attenzione: questo campo è obbligatorio')" 
       oninput="this.setCustomValidity('')"><br>
    			<input type="hidden" name="action" value="add">
    			<input type="submit" value="Aggiungi">
    		</form>
    	</fieldset>
    </ul>
    </div>
    </div>
    
    
    <div class="posizioneC">
	<%@ include file="/pages/footer.jsp" %>
	</div>
</body>
</html>