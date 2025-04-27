<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="Model.Ordine.*" import ="Model.Utente.*"%>
    <%@ include file="/pages/header.jsp" %>
    <%
    	UtenteBean utente = (UtenteBean)session.getAttribute("user");
    	String username = utente.getUsername();
    	OrdineDAO model = new OrdineDAO();
    	AcquistoDAO modelAcquisto = new AcquistoDAO();
    	Collection<?> ordini = model.doRetrieveByUsername(username);    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ordini registrati</title>
</head>
<body>
	<h1>Elenco ordini effettuati: </h1>
	<% 
		if (ordini != null && !ordini.isEmpty()) {     
    		Iterator<?> it=ordini.iterator();
    		while(it.hasNext()){
    			OrdineBean o= (OrdineBean)it.next();
    %>
    
    	 <%=o.getDataOrdine() %>  <%=String.format("%.2f",o.getPrezzo()) %>€</li>
			<ul>
	    	<% 
	    		Collection<?> acquisti = modelAcquisto.doRetrieveByOrdine(o.getId());
	    		Iterator<?> iter = acquisti.iterator();
	    		while(iter.hasNext()){
	    			AcquistoBean a = (AcquistoBean)iter.next();
	    	%>
	    	
	    		<li><%=a.getTitolo() %> <%=a.getPiattaforma() %> <%=a.getEdizione() %> <%=String.format("%.2f",a.getPrezzo()) %>€ <%=a.getQuantita() %></li>
	    	<%} %>
			</ul>
    <%		} %>
    		
    <%
    	}else{
    %>
    <h1>Non sono ancora stati effettuati ordini.</h1>
    <%} %>
    
   
</body>
</html>