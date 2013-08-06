package org.test.servlets;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// initialize user authentification service
		UserService userService = UserServiceFactory.getUserService();
		Boolean isConnected = (userService.getCurrentUser() != null);
		
		if (!isConnected)
			// redirect to 'gmail' login page
			resp.sendRedirect(userService.createLoginURL("/todo"));
		else 
			// redirect to 'index' view
			resp.sendRedirect("/todo");
	}
}
