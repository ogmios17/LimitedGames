<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="Model.Gioco.GiocoBean" %>

<%
    List<GiocoBean> giochi = (List<GiocoBean>) request.getAttribute("giochi");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Catalogo Giochi</title>
</head>
<body>

<h2>Catalogo Giochi</h2>

<% if (giochi != null) {
    for (GiocoBean gioco : giochi) { %>
        <hr>
        <p><strong>Titolo:</strong> <%= gioco.getTitolo() %></p>
        <p><strong>Descrizione:</strong> <%= gioco.getDescrizione() %></p>
        <p><strong>Edizione:</strong> <%= gioco.getEdizione() %></p>
        <p><strong>Prezzo:</strong> <%= gioco.getPrezzo() %> €</p>
        <% if (gioco.getSconto() > 0) { %>
            <p><strong>Sconto:</strong> <%= gioco.getSconto() %>%</p>
        <% } %>
        <p><strong>Data di uscita:</strong> <%= gioco.getDataUscita() %></p>
        <p><strong>Immagine:</strong> <img src="<%= gioco.getImmagine() %>" alt="<%= gioco.getTitolo() %>" width="150"></p>
<% }} else { %>
    <p>Nessun gioco disponibile al momento.</p>
<% } %>

</body>
</html>
