<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Model.Cart" import="Model.Gioco.GiocoBean" import="Model.Cartable" import="java.util.*" import="Model.Utente.*"%>
    <%@ include file="header.jsp" %>
    
    <%
    Collection<ProprietaBean> carte= (Collection<ProprietaBean>)request.getAttribute("carte"); 
    Boolean checkedAttr = (Boolean)request.getAttribute("checked");
    boolean checked = (checkedAttr != null) ? checkedAttr : false;
    if((carte == null || carte.isEmpty())&& checked == false){
    	response.sendRedirect(request.getContextPath()+"/CardHandler");
    	return;
    }
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carrello</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Carrello.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>

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
            <div class="spazio">  <p> Quantità: <%=c.getQuantita() %> </p>	
				<p>Prezzo Totale: <%=c.getGioco().getPrezzo()*c.getQuantita() %></p>
	       </div>
				<a id="bottone" href= "<%= request.getContextPath() %>/RimuoviGioco?id=<%=c.getGioco().getId()%>&action=subtract&piattaforma=<%=c.getPiattaforma() %>">RIMUOVI</a>
			</div>
		<%} %>
		
		
		<div class="Pagamento">
		<label for=carta>Seleziona il metodo di pagamento</label>
		<select name="carta" id="carta">
			<% 
				if(carte!= null && !carte.isEmpty()){
					Iterator<?> it=carte.iterator();
					while(it.hasNext()){
						ProprietaBean carta=(ProprietaBean)it.next();
			%>
				<option value="<%=carta.getCarta()%>">**** **** ****<%=carta.getCarta().substring(7,11) %></option>
					<% }
				}
				%>

		</select>
		<form action="<%= request.getContextPath()%>/EffettuaOrdine" method="POST">
			<input type="submit" value="Effettua acquisto">
		</form>
		<%}%>
		</div>
		
	<div class="posizionef">
	<%@include file="footer.jsp" %>
	</div>
		
</body>
</html>