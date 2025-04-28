<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="Model.Gioco.GiocoBean" %>
<%@ page import="java.util.*" %>
<%@ include file="header.jsp" %>

<%
    Collection<?> catalogo = (Collection<?>) request.getAttribute("giochi");
    if(catalogo == null){
    	response.sendRedirect(request.getContextPath()+"/giochi");
    	return;
    }    
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Catalogo Giochi</title>
</head>
<body>

<h2>Catalogo Giochi</h2>

<form action="<%= request.getContextPath() %>/giochi" method="POST">
    <label for="sort">Ordina per:</label>
    <select name="sort" id="sort">
        <option value="titolo">Titolo</option>
        <option value="prezzo">Prezzo</option>
    </select>
    <input type="submit" value="Ordina" />
</form>

<br/>


<% if (catalogo != null && !catalogo.isEmpty()) { %>
    <%
    	Iterator<?> it=catalogo.iterator();
    while(it.hasNext()){
    	GiocoBean g= (GiocoBean)it.next();
    %>
        <img height=200 width=160 src="<%= request.getContextPath() %>/images/<%= g.getImmagine() %>?v=<%= System.currentTimeMillis() %>" alt="<%= g.getTitolo() %>"><br>
        <%= g.getTitolo() %> <%= g.getEdizione() %> Edition<br>
        <% if(g.getSconto()!=0) {%>
        <s><%=g.getPrezzo() %></s>
        <% } %>
        <%= String.format("%.2f",g.getPrezzo()-g.getPrezzo()*g.getSconto()/100) %> €<br>
            
        <a href= "<%= request.getContextPath() %>/ShowDetails?id=<%=g.getId()%>">
        	<button >Dettagli</button>
        </a>

        <a href= "<%= request.getContextPath() %>/giochi?action=delete&id=<%=g.getId()%>">
        	<button>Elimina</button>
        </a>
        <br>
    <% } %>
<% } else { %>
    <p><em>Nessun gioco disponibile al momento.</em></p>
<% } %>
	
	<%@include file="footer.jsp" %>



</body>
</html>
