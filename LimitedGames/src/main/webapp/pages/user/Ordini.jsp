<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="Model.Ordine.*" import ="Model.Utente.*"%>
    <%
    	UtenteBean utente = (UtenteBean)session.getAttribute("user");
    	Collection<OrdineBean> ordini = (Collection<OrdineBean>)request.getAttribute("ordini");
    	if(ordini == null || ordini.isEmpty()){
    		if(ordini!= null && ordini.contains(new OrdineBean("empty")));
    		else{
	    		response.sendRedirect(request.getContextPath()+"/pages/user/VisualizzaOrdini?destinazione=user/Ordini.jsp&username="+utente.getUsername());
	        	return;
    		}
    	}
    	
    	 	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ordini registrati</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Utente.css?v=<%=System.currentTimeMillis()%>">
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Header.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
<%@ include file="/pages/header.jsp" %>


	<h1>Elenco ordini effettuati: </h1>


	<div class="Tasti">
	<% 
		if (ordini != null && !ordini.isEmpty()) {     
    		Iterator<?> it=ordini.iterator();
    		while(it.hasNext()){
    			OrdineBean o= (OrdineBean)it.next();
    %>
    
	<div class="ordine-card">
		<div class="ordine-info">
			<strong>Data ordine:</strong> <%= o.getDataOrdine() %><br>
			<strong>Prezzo:</strong> <%= String.format("%.2f", o.getPrezzo()) %>€
		</div>
		<form action="<%= request.getContextPath() %>/StampaFattura" method="POST">
			<input type="hidden" name="ordine" value="<%= o.getId() %>">
			<input type="submit" value="Stampa fattura">
		</form>
		<form action="<%= request.getContextPath() %>/pages/user/VisualizzaAcquisti" method="POST">
			<input type="hidden" name="destinazione" value="user/Acquisti.jsp">
			<input type="hidden" name="id" value="<%= o.getId() %>">
			<input type="submit" value="Dettagli">
		</form>
	</div>
<%
		}
	} else {
%>
	<h1>Non sono ancora stati effettuati ordini.</h1>
<% } %>
</div>
    
  <div class="posizioneU">
	<%@ include file="/pages/footer.jsp" %>
	</div>
</body>
</html>