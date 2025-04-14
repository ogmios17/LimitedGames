<%Boolean ruoliAdmin = (Boolean) session.getAttribute("ruoliAdmin");
if ((ruoliAdmin == null) || (!ruoliAdmin.booleanValue())) {
response.sendRedirect("./login-form.jsp");
return;
}
%>

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
<form action="Logout" method="get">
<input type="submit" value="Logout"/>
</form>
</body>
</html>