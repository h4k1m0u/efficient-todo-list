<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.google.appengine.api.users.*" %>
<% UserService userService = UserServiceFactory.getUserService(); %>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Guestbook</title>
	<link rel="stylesheet" href="static/css/bootstrap.min.css" />
	<link rel="stylesheet" href="static/css/style.css" />
</head>
<body>
	<div class="row">
		<div class="col-lg-4">${isConnected ? username : "you aren't connected"}</div>
		<div class="col-lg-8">${isConnected ? email : "you aren't connected"}</div>
	</div>

    <h2>Send a message</h2>
    <form action="/" method="post">
    	<label for="name">Name:</label><input type="text" name="name"/>
    	<label for="message">Message:</label><textarea type="text" name="message"></textarea>
    	<input type="submit" />
    </form>
    
    <h2>Read messages</h2>
    <ul>
    	<c:forEach items="${messages}" var="message">
    		<li><b>${message.name}:</b> ${message.message}</li>
    	</c:forEach>
    </ul>
</body>
</html>