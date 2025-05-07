<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="Model.Ordine.*" import ="Model.Utente.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Limited Games</title>
</head>
<body>
	<h1>Elenco prodotti relativi all'ordine: </h1>
	<ul>
	    	<% 
	    		Collection<?> acquisti = (Collection<?>)request.getAttribute("acquisti");
		    	if(acquisti == null ||acquisti.isEmpty()){
		    		response.sendRedirect(request.getContextPath()+"/VisualizzaAcquisti?destinazione=user/Ordini.jsp");
		        	return;
		    	}
	    		Iterator<?> iter = acquisti.iterator();
	    		while(iter.hasNext()){
	    			AcquistoBean a = (AcquistoBean)iter.next();
	    	%>
	    	
	    		<li><%=a.getTitolo() %> <%=a.getPiattaforma() %> <%=a.getEdizione() %> <%=String.format("%.2f",a.getPrezzo()) %>€ <%=a.getQuantita() %></li>
	    	<%} %>
			</ul>
</body>
</html>