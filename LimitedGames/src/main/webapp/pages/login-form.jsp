<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pagina Login</title>
<link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/Login.css?v=<%=System.currentTimeMillis()%>">
<style>
body {
            margin: 0;
            height: 100vh;
            position: relative;
            background-color: #ffffff;
        }

        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 60vh;
            background-image: url('<%= request.getContextPath() %>/images/system/logo.png');
            background-repeat: no-repeat;
            background-position: center;
            background-size: 400px 200px;
            pointer-events: none;
        }

        .contenuto {
            position: relative;
            z-index: 1;
            text-align: center;
            padding-top: 100px;
            font-size: 24px;
            color: #000;
        }

    fieldset {
      border: none;
    }
</style>
</head>
<body> 
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

     
     
  	<a href="<%= request.getContextPath() %>/pages/Registrazione.jsp">Non sei registrato? Registrati!</a>
	</div>
	
	
	<%@include file="footer.jsp" %>
	
</body>
</html>