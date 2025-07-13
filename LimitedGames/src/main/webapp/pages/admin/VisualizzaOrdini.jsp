<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="Model.Ordine.*" import ="Model.Utente.*"%>
    <%@ include file="/pages/header.jsp" %>
    <%
    	Collection<OrdineBean> ordini = (Collection<OrdineBean>)request.getAttribute("ordini");
    	if(ordini == null || ordini.isEmpty())
    		if(ordini!= null && ordini.contains(new OrdineBean("empty")));
    	boolean mostraOrdini = false;
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ordini registrati</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Acquisti.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
	<h1>Ordini effettuati: </h1>
	
	<div id="Ordini">
	<% 
		if (ordini != null && !ordini.isEmpty()) {     
    		Iterator<?> it=ordini.iterator();
    		while(it.hasNext()){
    			OrdineBean o= (OrdineBean)it.next();
    			if(o.getNome()!="empty"){
    				mostraOrdini = true;
    %>
    
    	 <%=o.getDataOrdine() %>  <%=String.format("%.2f",o.getPrezzo()) %>€
    	 <form action = "<%=request.getContextPath()%>/pages/admin/VisualizzaAcquistiAdmin" method= "POST">
    	 	<input type = "hidden" name= "destinazione" value="admin/Acquisti.jsp">
    	 	<input type = "hidden" name="id" value="<%=o.getId() %>">
    	 	<input type="submit" value ="Dettagli">
    	 </form>
			
     <%} }
    		if(!mostraOrdini){
    			%>
    				<h1>Non sono ancora stati effettuati ordini.</h1>
    			<% } 
	} else if(!mostraOrdini){
%>
	<h1>Non sono ancora stati effettuati ordini.</h1>
<% } %>
    	
    
   </div>
</body>
</html>