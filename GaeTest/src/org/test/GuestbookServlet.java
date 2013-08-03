package org.test;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.test.model.Message;

import com.googlecode.objectify.ObjectifyService;

@SuppressWarnings("serial")
public class GuestbookServlet extends HttpServlet {
	static {
		ObjectifyService.register(Message.class);
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		try {
			List<Message> messages = ofy().load().type(Message.class).list();
			req.setAttribute("messages", messages);
			
			this.getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Message message = new Message(req.getParameter("name"), req.getParameter("message"));
		ofy().save().entity(message).now();
		resp.sendRedirect("/");
	}
}
