<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" import="Model.Gioco.PiattaformaBean"%>
     
    <%
    Collection<PiattaformaBean> piattaforme= (Collection<PiattaformaBean>)request.getAttribute("piattaforme"); 
    Boolean checkedAttr = (Boolean)request.getAttribute("checked");
    boolean checked = (checkedAttr != null) ? checkedAttr : false;
    if((piattaforme == null || piattaforme.isEmpty())&& checked == false){
    	response.sendRedirect(request.getContextPath()+"/pages/admin/PiattaformeHandler?action=view");
    	return;
    }
    %>
    <% String success = request.getParameter("success"); %>

<% if (success != null) { %>
  <div id="popup-message" class="popup">
    <% if ("piattaforma".equals(success)) { %>
      Piattaforma aggiunta con successo!
    <% }} %>
  </div>

  <script>
    setTimeout(() => {
      const popup = document.getElementById("popup-message");
      if (popup) {
        popup.style.opacity = "0";
        setTimeout(() => popup.remove(), 500);
      }
    }, 1000); 
    
    if (window.history.replaceState) {
        const url = new URL(window.location.href);
        url.searchParams.delete("success");
        window.history.replaceState(null, "", url);
        
        
    }
  </script>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AdminLimited</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Modifica-Aggiungi.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
<jsp:include page="/pages/header.jsp" flush="true" />

	<h2>Inserisci un nuovo gioco</h2>
	
  <div class="Dati">
	<form action="<%= request.getContextPath() %>/pages/admin/AggiungiGiocoAdmin" method="post" enctype="multipart/form-data">
			
		<label for="Titolo">Titolo:</label><br> 
		<input name="Titolo" type="text" maxlength="20" required><br> 
		
		<label for="Descrizione">Descrizione:</label><br>
		<textarea name="Descrizione" maxlength="100" rows="3" required></textarea><br>
		
		<label for="piattaforma">Piattaforma:</label><br>
		<select name="piattaforma" id="piattaforma">
			<% 
				if(piattaforme!= null && !piattaforme.isEmpty()){
					Iterator<?> it=piattaforme.iterator();
					while(it.hasNext()){
						PiattaformaBean piattaforma=(PiattaformaBean)it.next();
			%>
				<option value="<%=piattaforma.getPiattaforma()%>"><%=piattaforma.getPiattaforma()%></option>
					<% }
				}
				%>
		</select>
		<br>
		
		<label for="Edizione">Edizione:</label><br> 
		<textarea name="Edizione" maxlength="100" rows="3" required></textarea><br>
		
		<label for="Prezzo">Prezzo:</label><br> 
		<input name="Prezzo" type="number" min="0" value="0" required><br>
		
		<label for="Iva">Iva:</label><br> 
		<input name="Iva" type="number" min="0" value="0" required><br>
	
		<label for="Data">Data di uscita:</label><br>
		<input name="Data" type="date" required><br>
		
		<label for="Quantita">Quantità:</label><br> 
		<input name="Quantita" type="number" min="1" value="1" required><br>
		
		<label for="immagine">Immagine:</label><br>
		<input name="immagine" type="file" required><br>
		
		
		
		<input type="submit" value=" Add"><input type="reset" value=" Reset">
		
	</form>
	
	<form method="POST" action="<%= request.getContextPath() %>/pages/admin/PiattaformeHandler">
		<p>Aggiungi una nuova piattaforma</p>
		<input type = "hidden" name="action" value="insert">
		<label for="piattaforma">Piattaforma:</label><br>
		<input name="piattaforma" type="String" required><br>
		<input type = "submit" value=" Aggiungi">
	</form>
  </div>	
	
</body>
</html>