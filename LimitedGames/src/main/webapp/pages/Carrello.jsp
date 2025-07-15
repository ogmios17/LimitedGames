<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Model.Cart" import="Model.Gioco.GiocoBean" import="Model.Cartable" import="java.util.*" import="Model.Utente.*"%>
    
    <%
    Boolean userAttr = (Boolean) request.getSession().getAttribute("userFilterRoles");
    boolean user = (userAttr != null) ? userAttr : false;
    
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carrello</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Carrello.css?v=<%=System.currentTimeMillis()%>">
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Header.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
<%@ include file="header.jsp" %>

	<%
		Cart cart=(Cart)session.getAttribute("cart");
		if(cart==null || cart.isEmpty()){
	%><h1>Carrello vuoto</h1>
	<% }else{
	
		ArrayList<Cartable> games= cart.getGames();
	%>
		<%for(Cartable c: games) {%>
			<div class="Cornice">
			<img class="immagine" src="<%= request.getContextPath() %>/images/<%= c.getGioco().getImmagine() %>?v=<%= System.currentTimeMillis() %>" alt="<%= c.getGioco().getTitolo() %>">
			
			<div class="posizione">
				<%=c.getGioco().getTitolo() %><br>
				<%=c.getPiattaforma() %><br>
				<%=c.getGioco().getEdizione() %><br>
				<%=c.getGioco().getPrezzo() %><br></div>
            <div class="spazio"> <div id="Aggiungi">  <p> Quantità: <form action = "<%= request.getContextPath() %>/RimuoviGioco?id=<%=c.getGioco().getId()%>&action=subtract&piattaforma=<%=c.getPiattaforma() %>" method="POST">
	       			<input type="submit" value="-">
	       		</form> <%=c.getQuantita() %> <form action = "<%= request.getContextPath() %>/RimuoviGioco?id=<%=c.getGioco().getId()%>&action=add&piattaforma=<%=c.getPiattaforma() %>" method="POST">
    <input type="submit" value="+">
</form> </div> 	
				<p>Prezzo Totale: <%=c.getGioco().getPrezzo()*c.getQuantita() %></p>
	       			</div>
	       		<form action = "<%= request.getContextPath() %>/RimuoviGioco?id=<%=c.getGioco().getId()%>&action=delete&piattaforma=<%=c.getPiattaforma() %>" method="POST">
	       			<input type="submit" value="RIMUOVI" class="bottone">
	       			<input type = "hidden" value= "<%=c.getQuantita() %>" name="quantita">
	       		</form>
				
			</div>
		<%} %>
		
		
		<div class="Pagamento">
		<a href = "<%= request.getContextPath()%>/pages/user/FinalizzaOrdine.jsp">	
			<%
			if(!user){
				session.setAttribute("order","true");
			}else session.setAttribute("order","false");
		
			%>		
			<button>Effettua acquisto</button>
		</a>
		
		</div>
		
		<%} %>
	<div class="posizionef">
	<%@include file="footer.jsp" %>
	</div>
		
</body>
</html>