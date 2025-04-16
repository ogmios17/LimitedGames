<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pagina Login</title>
</head>
<body>
<form action="<%= request.getContextPath() %>/login" method="post">
<fieldset>
<legend>Login Filter Custom</legend>
<label for="username">Login</label>
<input id="username" type="text" name="username" placeholder="enter login"><br>

<label for="password">Login</label>
<input id="password" type="password" name="password" placeholder="enter password"><br>

<input type="submit" value="Login"/>
<input type="reset" value="Reset"/>
</fieldset>
<% 
	String failed=request.getParameter("failed");
		if(failed!=null && failed.equals("true")){
%>	
	<p>Username e/o password errati</p>
	<%} %>
</form>
	<a href="<%= request.getContextPath() %>/pages/Registrazione.jsp">Non sei registrato? Registrati!</a>
</body>
</html>