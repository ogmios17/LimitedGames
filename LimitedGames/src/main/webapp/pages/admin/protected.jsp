<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Protected Page</title>
</head>
<body>
<h1>Benvenuti nella pagina protetta</h1>
Congratulazioni. Hai accesso ai documenti protetti.
<br><br>
<form action="<%= request.getContextPath()%>/Logout" method="get">
<input type="submit" value="Logout"/>
</form>
</body>
</html>