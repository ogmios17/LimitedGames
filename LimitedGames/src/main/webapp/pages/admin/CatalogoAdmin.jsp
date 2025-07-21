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
<div id="custom-confirm" class="modal" style="display: none;">
  <div class="modal-content">
    <p>Sei sicuro di voler eliminare il prodotto?</p>
    <div class="modal-buttons">
      <button id="confirm-yes">Sì</button>
      <button id="confirm-no">No</button>
    </div>
  </div>
</div>

<%@ include file="/pages/header.jsp" %>




<%
    Collection<?> catalogo = (Collection<?>) request.getAttribute("giochi");
    if(catalogo == null){
    	response.sendRedirect(request.getContextPath()+"/giochi");
    	return;
    }    
%>
<% String success = request.getParameter("success"); %>

<% if (success != null) { %>
  <div id="popup-message" class="popup">
    <% if ("add".equals(success)) { %>
      Gioco aggiunto con successo!
    <% } else if("true".equals(success)){%>
    Gioco modificato con successo!
    <%} %>
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
  
  
<% } %>

	<script>
	  let pendingForm = null;
	
	  function confermaEliminazione(e, form) {
	    e.preventDefault(); 
	    pendingForm = form;
	    document.getElementById('custom-confirm').style.display = 'flex';
	  }
	
	  document.getElementById('confirm-yes').addEventListener('click', () => {
	    if (pendingForm) pendingForm.submit();
	  });
	
	  document.getElementById('confirm-no').addEventListener('click', () => {
	    document.getElementById('custom-confirm').style.display = 'none';
	    pendingForm = null;
	  });
	</script>
<h2>Catalogo Giochi</h2>
<div class="Ordina"> 
<form action="<%= request.getContextPath() %>/giochi" method="POST">
    <label for="sort">Ordina per:</label>
    <select name="sort" id="sort">
        <option value="titolo">Titolo</option>
        <option value="prezzo">Prezzo</option>
        <option value="Data_uscita">Data</option>
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
      	<a href= "<%= request.getContextPath() %>/ShowDetails?id=<%=g.getId()%>">
        <img src="<%= request.getContextPath() %>/images/<%= g.getImmagine() %>?v=<%= System.currentTimeMillis() %>" alt="<%= g.getTitolo() %>"><br>
        </a>
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

		<form action = "<%= request.getContextPath() %>/pages/admin/EliminaGiocoAdmin" method="POST" onSubmit="return confermaEliminazione(event,this);">
			<input type = "hidden" name = "id" value= "<%=g.getId()%>">
			<input type = "submit" value = "Elimina">
		</form>
        <a href= "<%= request.getContextPath() %>/ShowDetails?id=<%=g.getId()%>&admin=yes&platformSelected=false">
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