<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="Model.Ordine.*" import ="Model.Utente.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Limited Games</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Acquisti.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
<%@ include file="/pages/header.jsp" %>
	<h1>Elenco prodotti relativi all'ordine: </h1>
	
	
   <div class="Lista">
	<ul>
	    	<% 
	    		Collection<?> acquisti = (Collection<?>)request.getAttribute("acquisti");
		    	if(acquisti == null ||acquisti.isEmpty()){
		    		response.sendRedirect(request.getContextPath()+"/pages/user/VisualizzaAcquisti?destinazione=user/Ordini.jsp");
		        	return;
		    	}
	    		Iterator<?> iter = acquisti.iterator();
	    		while(iter.hasNext()){
	    			AcquistoBean a = (AcquistoBean)iter.next();
	    	%>
	    
	    		<li><%=a.getTitolo() %> <%=a.getPiattaforma() %> <%=a.getEdizione() %> <%=String.format("%.2f",a.getPrezzo()) %>€ <%=a.getQuantita() %></li>
	    	<%} %>
			</ul>
	</div>
</body>
</html>