package Control.Utente;

import java.io.IOException;
import java.util.logging.Filter;
import java.util.logging.LogRecord;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AuthFilter")
public class AuthFilter implements Filter  {

    public void destroy() {
    }
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest hrequest = (HttpServletRequest) request;
		HttpServletResponse hresponse = (HttpServletResponse) response;
		
		String loginURI = hrequest.getContextPath() + "/adminFilter";
		boolean loginRequest = hrequest.getRequestURI().startsWith(loginURI);
		
		if(loginRequest) {
			System.out.println("Check role in the session");
			HttpSession session = hrequest.getSession(false);
			boolean loggedIn = session != null && session.getAttribute("filtroRuoliAdmin") != null;
			
			if(!loggedIn) {
				System.out.println("Redirect to login form");
				hresponse.sendRedirect(hrequest.getContextPath()+ "/login-form-filter.jsp");
			} else {
				chain.doFilter(request, response);
			}
		} else {
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig fconfig) throws ServletException {
		System.out.println("Init the filter");
	}
	@Override
	public boolean isLoggable(LogRecord record) {
		// TODO Auto-generated method stub
		return false;
	}
}
