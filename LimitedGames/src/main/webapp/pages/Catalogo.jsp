<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="Model.Gioco.GiocoBean" %>
<%@ page import="java.util.*" %>
<%@ include file="header.jsp" %>
<%@ include file="Menu.jsp" %>
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
    <link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Catalogo.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
<% 
		String nome = (String)session.getAttribute("nome");
		if(nome == null) nome = "guest";
	%>
	<%if(nome.equals("guest")) {%> <div id="messaggio">Benvenuto!</div>
	<%}else {%>
	<div id="messaggio">Bentornato, <%=nome %>!</div>
	<%} %>
	<script>
  
    setTimeout(() => {
      const messaggio = document.getElementById('messaggio');
      if (messaggio) {
        messaggio.remove();
      }
    }, 10000);
  </script>
  
 <div id="Video">
  <iframe src="https://www.youtube.com/embed/QdBZY2fkU-0?si=5QAV0c3XauYPyk15&autoplay=1&mute=1&loop=1&playlist=QdBZY2fkU-0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
  </div>
  
  
  <div id="Posizione">
  <div class="Most-Wanted">
<h2> Il gioco più atteso!</h2>
 <jsp:include page="GTAVI.html" />
</div>

<div class="Tendenza">
<h2> Gioco in Evidenza della settimana!</h2>
 <jsp:include page="slideshow.html" />
</div>

 <div id="Pubblicità">
<iframe src="https://www.youtube.com/embed/IVv5YTwfki4?si=IiFp1G5TtrSX6xTL&autoplay=1&mute=1&loop=1&playlist=IVv5YTwfki4" title="YouTube video player"frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
</div>
</div>

  <div id="Griglia">
  
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

<div class="catalogo-giochi">
<% if (catalogo != null && !catalogo.isEmpty()) { %>
    <%
    	Iterator<?> iterator=catalogo.iterator();
    while(iterator.hasNext()){
    	GiocoBean g= (GiocoBean)iterator.next();
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

</div>

	<%@include file="footer.jsp" %>

</body>
</html>
