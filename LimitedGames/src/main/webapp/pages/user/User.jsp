<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LimitedGames</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Utente.css?v=<%=System.currentTimeMillis()%>">
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Header.css?v=<%=System.currentTimeMillis()%>">
<style>
 body::before {
            content: "";
            position: absolute;
            left: 0;
            width: 100%;
            height: 300px;
            background-image: url('<%= request.getContextPath() %>/images/system/logo.png');
            background-repeat: no-repeat;
            background-position: center;
            background-size: 400px 200px;
            margin-top: 5%;
        }
 @media screen and (max-width: 1220px) {
          body::before {
            margin-top: 10%;
          }
 }

 @media screen and (max-width: 1050px) {
         
          body::before {
            margin-top: 15%;
          }           
}

 @media screen and (max-width: 850px) {
         
          body::before {
            margin-top: 20%;
          }           
}

 @media screen and (max-width: 650px) {
         
          body::before {
            margin-top: 25%;
          }           
}

@media screen and (max-width: 530px) {
         
          body::before {
            margin-top: 35%;
          }           
}
</style>
</head>
<body class="User">
<%@ include file="/pages/header.jsp" %>


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