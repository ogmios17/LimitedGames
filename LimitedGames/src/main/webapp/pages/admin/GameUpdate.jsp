<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Model.Gioco.GiocoBean" import= "java.util.*" import= "Model.Gioco.StockBean" import ="Model.Cartable"%>
    
<% 
	ArrayList<Cartable> products = (ArrayList<Cartable>) request.getAttribute("cartables");
	if(products == null || products==null){
		response.sendRedirect(request.getContextPath()+"/ShowDetails?id="+request.getParameter("id")+"&admin=yes");
		return;
	}  
	Cartable selected = (Cartable)request.getAttribute("selected");
	GiocoBean dettaglio=products.get(0).getGioco(); 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Limited Admin</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Modifica-Aggiungi.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
  
  <div class="Dati">
	<form action="./pages/admin/ModificaGiocoAdmin" method="post">
	<input type="hidden" name="action" value="find">
	<input type="hidden" name="id" value="<%=request.getParameter("id") %>">
	<input type="hidden" name="cartables" value="<%=products %>">
		<Label for=piattaforma>Seleziona la piattaforma</Label>
		<select name="piattaforma" id="piattaforma">
			<% 	
				Iterator<?> it=products.iterator();
				while(it.hasNext()){
					Cartable c = (Cartable) it.next();
					String piattaforma = c.getPiattaforma();
			%>
				<option value= "<%=piattaforma%>"><%=piattaforma%></option>
					<% }
				
				%>

		</select>
		<input type="submit" value="Seleziona">
	 </form>
	<% if(selected!=null){ %>
	 <form action ="./pages/admin/ModificaGiocoAdmin" method="post" enctype="multipart/form-data">
	
		<input type="hidden" name="id" value="<%=request.getParameter("id") %>">
	
		<label for="titolo">Titolo:</label><br> 
		<input name="titolo" type="text" maxlength="20" required value="<%=selected.getGioco().getTitolo()%>"><br> 
		
		<label for="descrizione">Descrizione:</label><br>
		<textarea name="descrizione" maxlength="400" rows="3" required><%=selected.getGioco().getDescrizione()%></textarea><br>
	
		<label for="edizione">Edizione:</label><br> 
		<textarea name="edizione" maxlength="100" rows="2" required ><%=selected.getGioco().getEdizione()%></textarea><br>
		
		<label for="prezzo">Prezzo:</label><br> 
		<input name="prezzo" type="number" step="0.01" min="0"  required value="<%=selected.getGioco().getPrezzo()%>"><br>
		
		<label for="sconto">Sconto:</label><br> 
		<input name="sconto" type="number" step="0.01" min="0"  required value="<%=selected.getGioco().getSconto()%>"><br>
		
		<label for="iva">Iva:</label><br> 
		<input name="iva" type="number" step="0.01" min="0"  required value="<%=selected.getGioco().getIva()%>"><br>
	
		<label for="data">Data di uscita:</label><br>
		<input name="data" type="date" required value="<%=selected.getGioco().getDataUscita()%>"><br>
		
		<label for="quantita">Quantità:</label><br> 
		<input name="quantita" type="number" min="1" required value="<%=selected.getQuantita()%>"><br>
		
		<label for="immagine">Immagine:</label><br>
		<input name="immagine" type="file"><br>
		
		<input type= "submit" value="Invia">
	 </form>
	 <%}%>
  </div>
	
</body>
</html>