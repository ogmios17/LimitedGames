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
    <link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Catalogo.css?v=<%=System.currentTimeMillis()%>">;
</head>
<body>

<h1>Catalogo Giochi</h1>

<form action="<%= request.getContextPath() %>/giochi" method="POST">
    <label for="sort">Ordina per:</label>
    <select name="sort" id="sort">
        <option value="titolo">Titolo</option>
        <option value="prezzo">Prezzo</option>
    </select>
    <input type="submit" value="Ordina" />
</form>

<br/>

<div id="Tendenza">
<h2> Gioco in Evidenza della settimana!</h2>
 <jsp:include page="slideshow.html" />
</div>

<div id="Pubblicità">
<iframe width="250" height="600" src="https://www.youtube.com/embed/IVv5YTwfki4?si=IiFp1G5TtrSX6xTL?autoplay=1&mute=1" title="YouTube video player"frameborder="0" allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
</div>

<div class="catalogo-giochi">
<% if (catalogo != null && !catalogo.isEmpty()) { %>
    <%
    	Iterator<?> it=catalogo.iterator();
    while(it.hasNext()){
    	GiocoBean g= (GiocoBean)it.next();
    %>
    <div class="images">
    	<a href= "<%= request.getContextPath() %>/ShowDetails?id=<%=g.getId()%>">
        	<img src="<%= request.getContextPath() %>/images/<%= g.getImmagine() %>?v=<%= System.currentTimeMillis() %>" alt="<%= g.getTitolo() %>">
        </a>
        <%= g.getTitolo() %> <%= g.getEdizione() %> Edition<br>
        <% if(g.getSconto()!=0) {%>
        <s><%=g.getPrezzo() %></s>
        <% } %>
        <%= String.format("%.2f",g.getPrezzo()-g.getPrezzo()*g.getSconto()/100) %> €<br>
          
</div>

    <% } %>  
<% } else { %>
    <p><em>Nessun gioco disponibile al momento.</em></p>
<% } %>
</div> 



<div id="footer">
	<%@include file="footer.jsp" %>
	</div>

	

</body>
</html>
