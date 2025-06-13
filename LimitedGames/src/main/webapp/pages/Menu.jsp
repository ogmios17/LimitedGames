<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "Model.Gioco.*" import = "java.util.*"%>
    <% Collection<?> piattaforme = (Collection<?>)session.getAttribute("piattaforme");
    	if(piattaforme == null || piattaforme.isEmpty()){
    		response.sendRedirect(request.getContextPath()+"/PlatformHandler");
        	return;
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Limited Games</title>
</head>
<body>
	<nav>	
		<ul>
		<li class="platforms">
			<%
				PiattaformaBean piattaformaBean;
				Iterator<?> iter = piattaforme.iterator();
				while(iter.hasNext()){
					piattaformaBean = (PiattaformaBean)iter.next();
					%>
					<div class="singlePlatform">
						<a href="<%=request.getContextPath() %>/CatalogoPiattaforme?piattaforma=<%=piattaformaBean.getPiattaforma() %>">
						<button><%=piattaformaBean.getPiattaforma() %></button>
						</a>
						
					</div>
				<%
					}
				%>
			
			
		</li>
		</ul>
	</nav>
</body>
</html>