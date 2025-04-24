package Control.Utente;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

public class UserFilter implements Filter{

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)throws IOException, ServletException{
		HttpServletRequest hrequest = (HttpServletRequest) request;
		HttpServletResponse hresponse = (HttpServletResponse) response;
		
		String loginURIUser = hrequest.getContextPath() + "/pages/user";

		boolean loginRequest = hrequest.getRequestURI().startsWith(loginURIUser);
		
		if(loginRequest) {
			HttpSession session = hrequest.getSession(false);
			boolean userLoggedIn = session != null && (Boolean.TRUE.equals(session.getAttribute("userFilterRoles")));
			if(!userLoggedIn) {
				hresponse.sendRedirect(hrequest.getContextPath()+"/pages/login-form.jsp");			
			} else {
				chain.doFilter(request,  response);
			}
		} else {
			chain.doFilter(request,  response);
		}
	}
}

