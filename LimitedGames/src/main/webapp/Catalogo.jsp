<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="Model.Gioco.GiocoBean" %>
<%@ page import="java.util.*" %>

<%
    List<GiocoBean> giochi = (List<GiocoBean>) request.getAttribute("giochi");
    GiocoBean giocoDettaglio = (GiocoBean) request.getAttribute("gioco");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Catalogo Giochi</title>
</head>
<body>

<h2>Catalogo Giochi</h2>

<!-- Ordinamento dei giochi -->
<form method="get" action="Catalogo">
    <label for="sort">Ordina per:</label>
    <select name="sort" id="sort">
        <option value="">-- Nessun ordinamento --</option>
        <option value="titolo">Titolo</option>
        <option value="prezzo">Prezzo</option>
        <option value="data_uscita">Data di uscita</option>
    </select>
    <input type="submit" value="Ordina" />
</form>

<br/>

<!-- Form per inserire un nuovo gioco -->
<h3>Inserisci un nuovo gioco</h3>
<form method="get" action="Catalogo">
    <input type="hidden" name="action" value="insert" />
    Titolo: <input type="text" name="Titolo" required /><br/>
    Descrizione: <input type="text" name="Descrizione" required /><br/>
    Immagine (URL): <input type="text" name="Immagine" required /><br/>
    Edizione: <input type="text" name="Edizione" required /><br/>
    Prezzo: <input type="number" name="Prezzo" step="0.01" required /><br/>
    IVA: <input type="number" name="Iva" step="0.01" required /><br/>
    Sconto: <input type="number" name="Sconto" step="0.01" /><br/>
    Data di uscita: <input type="date" name="Data_uscita" required /><br/>
    <input type="submit" value="Aggiungi gioco" />
</form>

<br/><hr/><br/>

<!-- Visualizzazione dei giochi -->
<% if (giochi != null && !giochi.isEmpty()) { %>
    <ul>
    <% for (GiocoBean gioco : giochi) { %>
        <li>
            <strong>Titolo:</strong> <%= gioco.getTitolo() %><br/>
            <strong>Prezzo:</strong> <%= gioco.getPrezzo() %> €<br/>
            <strong>Edizione:</strong> <%= gioco.getEdizione() %><br/>
            <strong>Data di uscita:</strong> <%= gioco.getDataUscita() %><br/>

            <!-- Pulsante per vedere i dettagli -->
            <form method="get" action="Catalogo" style="display:inline;">
                <input type="hidden" name="action" value="read" />
                <input type="hidden" name="id" value="<%= gioco.getId() %>" />
                <input type="submit" value="Dettagli" />
            </form>

            <!-- Pulsante per eliminare -->
            <form method="get" action="Catalogo" style="display:inline;">
                <input type="hidden" name="action" value="delete" />
                <input type="hidden" name="id" value="<%= gioco.getId() %>" />
                <input type="submit" value="Elimina" />
            </form>
        </li>
        <br/>
    <% } %>
    </ul>
<% } else { %>
    <p><em>Nessun gioco disponibile al momento.</em></p>
<% } %>

<!-- Visualizzazione dettagli del gioco selezionato -->
<% if (giocoDettaglio != null) { %>
    <hr/>
    <h3>Dettaglio Gioco</h3>
    <p><strong>Titolo:</strong> <%= giocoDettaglio.getTitolo() %></p>
    <p><strong>Descrizione:</strong> <%= giocoDettaglio.getDescrizione() %></p>
    <p><strong>Prezzo:</strong> <%= giocoDettaglio.getPrezzo() %> €</p>
    <p><strong>IVA:</strong> <%= giocoDettaglio.getIva() %></p>
    <p><strong>Sconto:</strong> <%= giocoDettaglio.getSconto() %></p>
    <p><strong>Data uscita:</strong> <%= giocoDettaglio.getDataUscita() %></p>
    <p><strong>Edizione:</strong> <%= giocoDettaglio.getEdizione() %></p>
<% } %>

</body>
</html>
