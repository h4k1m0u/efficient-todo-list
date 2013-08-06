package org.test.servlets;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.test.models.Task;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.ObjectifyService;

// this servlet is only reachable when the user is logged in
@SuppressWarnings("serial")
public class TodoServlet extends HttpServlet {
	static {
		ObjectifyService.register(Task.class);
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		try {
			// save user credentials, if the session doesnt exist yet
			if (req.getSession(false) == null) {
				UserService userService = UserServiceFactory.getUserService();
				HttpSession session = req.getSession();
				session.setAttribute("id", userService.getCurrentUser().getUserId());
				session.setAttribute("username", userService.getCurrentUser().getNickname());
				session.setAttribute("email", userService.getCurrentUser().getEmail());
				session.setAttribute("isConnected", (userService.getCurrentUser() != null));
			}
		
			// get connected user's tasks
			List<Task> tasks = ofy().load().type(Task.class).list();
			
			// forward 'tasks' to index view
			req.setAttribute("tasks", tasks);
			this.getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// save entered view in the datastore
		Task tasks = new Task(req.getParameter("name"), (String)req.getSession().getAttribute("id"));
		ofy().save().entity(tasks).now();
		
		// refresh 'index' view
		resp.sendRedirect("/");
	}
}
