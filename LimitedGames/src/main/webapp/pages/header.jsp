<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LimitedGames</title>
<style>
#messaggio{
  font-size: 18px;
  padding: 10px;
  text-align: center;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #000000;;
}

li a {
  display: block;
  color: white;
  text-align: center;
  text-decoration: none;
}

li.Menu {
float: right;
font-size: 25px;
padding: 14px 16px;
}

li a:hover {
  background-color: #555;
  }
  
  li.Logo{
  float: left;
  }
  
  ul img {
  padding: 0px;
  width: 147px;
  height: 85px;
  display: block;
  }
</style>
</head>
<body>
	
	<nav>	
		<ul>
		    <li class="Logo"><a href="<%= request.getContextPath() %>/pages/Catalogo.jsp"><img src="<%= request.getContextPath() %>/images/system/logo.png" alt="Limited Games"> </a></li>
		    
			<li class="Menu"><a href="<%= request.getContextPath() %>/pages/Carrello.jsp">Carrello</a></li>
			<li class="Menu"><a href="<%= request.getContextPath() %>/pages/login-form.jsp">Utente</a></li>
		</ul>
	</nav>

</body>
</html>