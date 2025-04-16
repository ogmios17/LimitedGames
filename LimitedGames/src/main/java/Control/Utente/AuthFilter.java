package Control.Utente;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

public class AuthFilter implements Filter{

		public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)throws IOException, ServletException{
			HttpServletRequest hrequest = (HttpServletRequest) request;
			HttpServletResponse hresponse = (HttpServletResponse) response;
			
			String loginURI = hrequest.getContextPath() + "/pages/admin";


			boolean loginRequest = hrequest.getRequestURI().startsWith(loginURI);
			
			if(loginRequest) {
				HttpSession session = hrequest.getSession(false);
				boolean loggedIn = session != null && Boolean.TRUE.equals(session.getAttribute("adminFilterRoles"));
				if(!loggedIn) {
					hresponse.sendRedirect(hrequest.getContextPath()+"/pages/login-form.jsp");			
				} else {
					chain.doFilter(request,  response);
				}
			} else {
				chain.doFilter(request,  response);
			}
		}
}
