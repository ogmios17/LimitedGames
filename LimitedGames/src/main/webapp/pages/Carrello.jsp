<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Model.Cart" import="Model.Cartable" import="java.util.*" import="Model.Utente.*"%>
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
</head>
<body>
	<%
		Cart cart=(Cart)session.getAttribute("cart");
		if(cart==null || cart.isEmpty()){
	%><h1>Carrello vuoto</h1>
	<% }else{
	
		ArrayList<Cartable> games= cart.getGames();
	%>
	<table>
		<tr>
			<th>Prodotto</th>
			<th>Piattaforma</th>
			<th>Edizione</th>
			<th>Prezzo</th>
			<th>Quantità</th>
			<th>Prezzo totale</th>
			<th></th>
		</tr>
		<%for(Cartable c: games) {%>
			<tr>
				<td><%=c.getGioco().getTitolo() %></td>
				<td><%=c.getPiattaforma() %></td>
				<td><%=c.getGioco().getEdizione() %></td>
				<td><%=c.getGioco().getPrezzo() %></td>
				<td><%=c.getQuantita() %></td>
				<td><%=c.getGioco().getPrezzo()*c.getQuantita() %></td>
				<td><a href= "<%= request.getContextPath() %>/RimuoviGioco?id=<%=c.getGioco().getId()%>&action=subtract&piattaforma=<%=c.getPiattaforma() %>"><button>-</button></a></td>
		<%} %>
		</table>
		<Label for=carta>Seleziona il metodo di pagamento</Label>
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
		
			
	</table>
</body>
</html>