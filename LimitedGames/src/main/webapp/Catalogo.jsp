<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="Model.Gioco.GiocoBean" %>
<%@ page import="java.util.*" %>

<%
    Collection<?> catalogo = (Collection<?>) request.getAttribute("giochi");
    if(catalogo == null){
    	response.sendRedirect("./giochi");
    	return;
    }
    GiocoBean dettaglio=(GiocoBean)request.getAttribute("gioco");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Catalogo Giochi</title>
</head>
<body>

<h2>Catalogo Giochi</h2>

<form action="./giochi" method="POST">
    <label for="sort">Ordina per:</label>
    <select name="sort" id="sort">
        <option value="titolo">Titolo</option>
        <option value="prezzo">Prezzo</option>
    </select>
    <input type="submit" value="Ordina" />
</form>

<br/>


<% if (catalogo != null && !catalogo.isEmpty()) { %>
    <ul>
    <%
    	Iterator<?> it=catalogo.iterator();
    while(it.hasNext()){
    	GiocoBean g= (GiocoBean)it.next();
    %>
        <li>
            <img src= "<%=g.getImmagine() %>" alt="<%=g.getTitolo() %>"><br>
            <%= g.getTitolo() %> <%= g.getEdizione() %> Edition<br>
            <%= g.getPrezzo() %> €<br>
            
            
            <a href= "./giochi?action=read&id="+g.getId()>
            	<button >Dettagli</button>
            </a>

            <a href= "./giochi?action=elimina&id="+g.getId()>
            	<button>Elimina</button>
            </a>

        </li>
        <br/>
    <% } %>
    </ul>
<% } else { %>
    <p><em>Nessun gioco disponibile al momento.</em></p>
<% } %>

	<%
		if (dettaglio != null) {
	%>
	<h1>Dettagli gioco:</h1><br>
	
	<% } %>



</body>
</html>
