<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "Model.Cart"%>
    
    <% Cart carrello=(Cart) session.getAttribute("cart"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LimitedGames</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Header.css">
</head>
<body>
	<script src= "<%= request.getContextPath() %>/JavaScript/AJAXSearch.js"></script>
	<nav>	
		<ul>
		    <li class="Logo">
		    <a href="<%= request.getContextPath() %>/pages/Catalogo.jsp#ordina">
		    <img src="<%= request.getContextPath() %>/images/system/logo.png" alt="Limited Games"> 
		    </a></li>
		    
		    <li class = "searchbar">
		    <div class = "item">
				<form action = "<%= request.getContextPath() %>/search">
					<input type = "text" id ="searchbox" name ="searchbox">
					<div id="suggestions" class = "suggestions-list"></div>
				</form>
			</div>
			</li>
			<li class="Menu">
			
			<div class="item">
				<a href="<%= request.getContextPath() %>/pages/login-form.jsp">
				<img src="<%= request.getContextPath() %>/images/system/user.png" alt="User">
				<span>Area utente</span></a>
			</div>
			<div class="item">
				<a href="<%= request.getContextPath() %>/pages/Carrello.jsp">

				
				<span id="cart-count"><%= (carrello != null) ? carrello.getObjects() : 0 %></span>
				
				<img src="<%= request.getContextPath() %>/images/system/cart.png" alt="Cart">
				Carrello</a>
			</div>
			</li>
		</ul>
	</nav>
<script>
	
</script>

</body>
</html>
