<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	    Boolean adminAttr = (Boolean) request.getSession().getAttribute("adminFilterRoles");
	    boolean admin = (adminAttr != null) ? adminAttr : false;
	
	    Boolean userAttr = (Boolean) request.getSession().getAttribute("userFilterRoles");
	    boolean user = (userAttr != null) ? userAttr : false;
    	if(admin){
    		response.sendRedirect(request.getContextPath()+"/pages/admin/Admin.jsp");
    	}else if(user){
    		response.sendRedirect(request.getContextPath()+"/pages/user/User.jsp");
    	}
	%>
<!DOCTYPE html>
<html>
<head>
<script src= "<%= request.getContextPath() %>/JavaScript/Forms"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pagina Login</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Login.css?v=<%=System.currentTimeMillis()%>">
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Header.css?v=<%=System.currentTimeMillis()%>">
</head>
<body> 
<%@ include file="header.jsp" %>




<h1>ACCEDI</h1>

<div id="Registrazione">
<form action="<%= request.getContextPath() %>/login" method="post">
<fieldset>

<label for="username">Username</label>
<input id="username" type="text" name="username" placeholder="enter login"><br>

<label for="password">Password</label>
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

  	<a href="<%= request.getContextPath() %>/pages/Registrazione.jsp">
  <span class="testo">Non sei registrato?</span>
  <span class="Link"> Registrati!</span>
</a>
	</div>
	
	<div class="margine">
	<%@include file="footer.jsp" %>
	</div>
	
</body>
</html>