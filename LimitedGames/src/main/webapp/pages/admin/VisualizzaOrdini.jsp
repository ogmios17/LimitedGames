<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="Model.Ordine.*" import ="Model.Utente.*"%>
    <%@ include file="/pages/header.jsp" %>
    <%
    	UtenteBean utente = (UtenteBean)session.getAttribute("user");
    	Collection<OrdineBean> ordini = (Collection<OrdineBean>)request.getAttribute("ordini");
    	if(ordini == null || ordini.isEmpty()){
    		if(ordini!= null && ordini.contains(new OrdineBean("empty")));
    		else{
	    		response.sendRedirect(request.getContextPath()+"/VisualizzaOrdini?destinazione=user/Ordini.jsp&username="+utente.getUsername());
	        	return;
    		}
    	}	
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
    %>
    
    	 <%=o.getDataOrdine() %>  <%=String.format("%.2f",o.getPrezzo()) %>€
    	 <form action = "<%=request.getContextPath()%>/VisualizzaAcquisti" method= "POST">
    	 	<input type = "hidden" name= "destinazione" value="user/Acquisti.jsp">
    	 	<input type = "hidden" name="id" value="<%=o.getId() %>">
    	 	<input type="submit" value ="Dettagli">
    	 </form>
			
     <%} %>
    		
    <%
    	}else{
    %>
    <h1>Non sono ancora stati effettuati ordini.</h1>
      <%} %>
    
   </div>
</body>
</html>