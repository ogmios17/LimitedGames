<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="Model.Gioco.GiocoBean" %>
<%@ page import="java.util.*" %>

<%
    Collection<?> catalogo = (Collection<?>) request.getAttribute("giochi");
    if(catalogo == null){
    	response.sendRedirect(request.getContextPath()+"/giochi");
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
    	
        <img src="<%= request.getContextPath() %>/images/<%= g.getImmagine() %>?v=<%= System.currentTimeMillis() %>" alt="<%= g.getTitolo() %>"><br>
        <%= g.getTitolo() %> <%= g.getEdizione() %> Edition<br>
        <% if(g.getSconto()!=0) {%>
        <s><%=g.getPrezzo() %></s>
        <% } %>
        <%= String.format("%.2f",g.getPrezzo()-g.getPrezzo()*g.getSconto()/100) %> €<br>
            
        <a href= "<%= request.getContextPath() %>/giochi?action=read&id=<%=g.getId()%>">
        	<button >Dettagli</button>
        </a>

        <a href= "<%= request.getContextPath() %>/giochi?action=delete&id=<%=g.getId()%>">
        	<button>Elimina</button>
        </a>
        <br/>
    <% } %>
<% } else { %>
    <p><em>Nessun gioco disponibile al momento.</em></p>
<% } %>

	<%
		if (dettaglio != null) {
	%>
	<h1>Dettagli gioco:</h1><br>
	<table border=1>
		<tr>
			<th>Titolo</th>
			<th>Descrizione</th>
			<th>Edizione</th>
			<th>Prezzo</th>
			<th>Sconto</th>
			<th>IVA</th>
			<th>Data di uscita</th>
		</tr>
		<tr>
			<td><%= dettaglio.getTitolo()%></td>
			<td><%= dettaglio.getDescrizione()%></td>
			<td><%= dettaglio.getEdizione()%></td>
			<td><%= dettaglio.getPrezzo()%></td>
			<td><%= dettaglio.getSconto()%></td>
			<td><%= dettaglio.getIva()%></td>
			<td><%= dettaglio.getDataUscita()%></td>
		</tr>
	</table>
	<% } %>
	
	<h2>Inserisci un nuovo gioco</h2>
	<form action="<%= request.getContextPath() %>/giochi" method="post" enctype="multipart/form-data">
	<!-- DA FARE AGGIUNTA DELLA PIATTAFORMA(Servono le entry nel db) -->
		<input type="hidden" name="action" value="insert"> 
		
		<label for="Titolo">Titolo:</label><br> 
		<input name="Titolo" type="text" maxlength="20" required><br> 
		
		<label for="Descrizione">Descrizione:</label><br>
		<textarea name="Descrizione" maxlength="100" rows="3" required></textarea><br>
		
		<label for="Edizione">Edizione:</label><br> 
		<textarea name="Edizione" maxlength="100" rows="3" required></textarea><br>
		
		<label for="Prezzo">Prezzo:</label><br> 
		<input name="Prezzo" type="number" min="0" value="0" required><br>
		
		<label for="Iva">Iva:</label><br> 
		<input name="Iva" type="number" min="0" value="0" required><br>
	
		<label for="Data">Data di uscita:</label><br>
		<input name="Data" type="date" required><br>
		
		<label for="immagine">Immagine:</label><br>
		<input name="immagine" type="file" required><br>
		
		<input type="submit" value="Add"><input type="reset" value="Reset">

	</form>



</body>
</html>
