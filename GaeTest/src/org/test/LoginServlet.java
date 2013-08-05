package org.test;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// initialize user authentification service
		UserService userService = UserServiceFactory.getUserService();
		
		Boolean isConnected = (userService.getCurrentUser() != null);
		if (isConnected) {
			// save credentials in a session
			HttpSession session = req.getSession();
			session.setAttribute("username", userService.getCurrentUser().getNickname());
			session.setAttribute("email", userService.getCurrentUser().getEmail());
			session.setAttribute("isConnected", isConnected);
			
			// forward to login view
			resp.sendRedirect("/");
		}
		else
			// redirect to 'gmail' login page
			resp.sendRedirect(userService.createLoginURL("/"));
		
	}
}
