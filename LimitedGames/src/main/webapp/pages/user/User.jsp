<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/pages/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LimitedGames</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Utente.css?v=<%=System.currentTimeMillis()%>">
<style>
 body::before {
            content: "";
            position: absolute;
            left: 0;
            width: 100%;
            height: 60vh;
            background-image: url('<%= request.getContextPath() %>/images/system/logo.png');
            background-repeat: no-repeat;
            background-position: center;
            background-size: 400px 200px;
        }

 @media screen and (max-width: 830px) {
         
          body::before {
             height: 68vh;
          }           
}

@media screen and (max-height: 750px) {
          
           body::before {
            display: none;
            content: none;
          }
}
</style>
</head>
<body class="User">
<br>
    <div class="TastiU">
     <div class="Tasti">
	<a class="colore" href="<%= request.getContextPath() %>/pages/user/Ordini.jsp">
		<button>Ordini</button>
	</a>
	<a  class="colore" href="<%= request.getContextPath() %>/pages/user/ModificaDati.jsp">
		<button>Modifica dati utente</button>
	</a>
	<form action= "<%= request.getContextPath() %>/Logout" method = POST>
		<input type = "submit" value= "Logout">
	</form>
	</div>
	</div>
	
	<div class="posizioneU">
	<%@ include file="/pages/footer.jsp" %>
	</div>
</body>
</html>