<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import ="Model.Utente.*"%>
    <%@ include file="/pages/header.jsp" %>
    <% 
    	Collection<?> carte =(Collection<?>)request.getAttribute("carte");
    	if(carte == null || carte.isEmpty()){
    		response.sendRedirect(request.getContextPath()+"/Carte?action=view");
        	return;
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="Utf-8">
<title>LimitedGames</title>
</head>
<body>
	<h1>Le tue carte</h1>
	<ul>
	<% if (carte != null && !carte.isEmpty()) { %>
    <%
    	Iterator<?> it=carte.iterator();
    	while(it.hasNext()){
    		PagamentoBean p= (PagamentoBean)it.next();
    %>
    	<li>**** **** **** <%=p.getNumero().substring(7) %><br>
    	<%=p.getScadenza() %>  
    	
    	<%} }%>  	
    </ul>
</body>
</html>