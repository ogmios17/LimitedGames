<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LimitedGames</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Header.css">
</head>
<body>
	
	<nav>	
		<ul>
		    <li class="Logo">
		    <a href="<%= request.getContextPath() %>/pages/Catalogo.jsp">
		    <img src="<%= request.getContextPath() %>/images/system/logo.png" alt="Limited Games"> 
		    </a></li>
		    
			<li class="Menu">
			<div class="item">
				<a href="<%= request.getContextPath() %>/pages/login-form.jsp">
				<img src="<%= request.getContextPath() %>/images/system/user.png" alt="User">
				<span>Area utente</span></a>
			</div>
			<div class="item">
				<a href="<%= request.getContextPath() %>/pages/Carrello.jsp">
				<img src="<%= request.getContextPath() %>/images/system/cart.png" alt="Cart">
				<span>Carrello</span></a>
			</div>
			</li>
		</ul>
	</nav>

</body>
</html>