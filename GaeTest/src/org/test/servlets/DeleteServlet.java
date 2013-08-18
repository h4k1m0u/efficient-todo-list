package org.test.servlets;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.test.models.Category;
import org.test.models.Task;

import com.googlecode.objectify.ObjectifyService;

// this servlet is only reachable when the user is logged in
@SuppressWarnings("serial")
public class DeleteServlet extends HttpServlet {
	static {
		ObjectifyService.register(Task.class);
		ObjectifyService.register(Category.class);
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// delete given task, if the connected user is his owner
		String userId = (String)req.getSession().getAttribute("id");
		Long taskId = Long.parseLong(req.getParameter("id"), 10);
		
		Task deletedTask = ofy().load().type(Task.class).id(taskId).now();
		
		if (deletedTask.getUserId().equals(userId))
			ofy().delete().entity(deletedTask).now();
		
		// refresh 'index' view
		String categoryName = (String)req.getParameter("category");
		resp.sendRedirect("/?category=" + categoryName);
	}
}
