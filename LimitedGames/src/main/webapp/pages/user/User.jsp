<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/pages/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LimitedGames</title>
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
            pointer-events: none;
        }
        
        .Tasti {
        display: flex;
        flex-direction: column;
        margin-top: 380px;
        align-items: center;
        }
        
        .Tasti button{
        padding: 12px 72px;
        border-radius: 15px;
        display: block;
        margin-bottom: 25px;
        }
        
        input[type=submit]{
        padding: 12px 72px;
        border-radius: 15px;
        display: block;
        margin-bottom: 25px;
        }
        
        .posizione {
	margin-top: 150px;
}
</style>
</head>
<body>
<br>
     <div class="Tasti">
	<a href="<%= request.getContextPath() %>/pages/user/Ordini.jsp">
		<button>Ordini</button>
	</a>
	<a href="<%= request.getContextPath() %>/pages/user/ModificaDati.jsp">
		<button>Modifica dati utente</button>
	</a>
	<form action= "<%= request.getContextPath() %>/Logout" method = POST>
		<input type = "submit" value= "Logout">
	</form>
	</div>
	
	<div class="posizione">
	<%@ include file="/pages/footer.jsp" %>
	</div>
</body>
</html>