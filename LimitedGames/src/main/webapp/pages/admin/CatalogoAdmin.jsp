<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Model.Gioco.GiocoBean" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LimitedAdmin</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Catalogo.css?v=<%=System.currentTimeMillis()%>">
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Header.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
<%@ include file="/pages/header.jsp" %>




<%
    Collection<?> catalogo = (Collection<?>) request.getAttribute("giochi");
    if(catalogo == null){
    	response.sendRedirect(request.getContextPath()+"/giochi");
    	return;
    }    
%>

<h2>Catalogo Giochi</h2>
<div class="Ordina"> 
<form action="<%= request.getContextPath() %>/giochi" method="POST">
    <label for="sort">Ordina per:</label>
    <select name="sort" id="sort">
        <option value="titolo">Titolo</option>
        <option value="prezzo">Prezzo</option>
    </select>
    <input type="submit" value="Ordina" />
</form>

<br/>
</div>

 <div id="Griglia">

<div class="catalogo-admin">
<% if (catalogo != null && !catalogo.isEmpty()) { %>
    <%
    	Iterator<?> it=catalogo.iterator();
    while(it.hasNext()){
    	GiocoBean g= (GiocoBean)it.next();
    %>
      <div class="images">   
        <img src="<%= request.getContextPath() %>/images/<%= g.getImmagine() %>?v=<%= System.currentTimeMillis() %>" alt="<%= g.getTitolo() %>"><br>
        <%= g.getTitolo() %> <%= g.getEdizione() %> Edition<br>
        <% if(g.getSconto()!=0) {%>
        <s><%=g.getPrezzo() %></s>
        <% } %>
        <%= String.format("%.2f",g.getPrezzo()-g.getPrezzo()*g.getSconto()/100) %> €<br>
      </div>
       
       <div id="Colonna">
        <a href= "<%= request.getContextPath() %>/ShowDetails?id=<%=g.getId()%>">
        	<button >Dettagli</button>
        </a>

		<form action = "<%= request.getContextPath() %>/pages/admin/EliminaGiocoAdmin" method="POST">
			<input type = "hidden" name = "id" value= "<%=g.getId()%>">
			<input type = "submit" value = "Elimina">
		</form>
        <a href= "<%= request.getContextPath() %>/pages/admin/GameUpdate.jsp?id=<%=g.getId()%>">
        	<button>Modifica</button>
        </a>
        </div>
        
        <br/>
    <% } %>
<% } else { %>
    <p><em>Nessun gioco disponibile al momento.</em></p>
<% } %>
   </div>
	
	</div>
	
	<%@include file="/pages/footer.jsp" %>


</body>
</html>