<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.google.appengine.api.users.*" %>
<% UserService userService = UserServiceFactory.getUserService(); %>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Efficient Todo List</title>
	<link rel="stylesheet" href="static/css/bootstrap.min.css" />
	<link rel="stylesheet" href="static/css/style.css" />
</head>
<body>
	<div class="row">
		<div class="col-lg-4"><b>Username:</b> ${isConnected ? username : "you aren't connected"}</div>
		<div class="col-lg-8"><b>Email:</b> ${isConnected ? email : "you aren't connected"}</div>
	</div>

    <h2>Enter a task</h2>
    <form action="/" method="post">
    	<label for="name">Name:</label><input type="text" name="name"/>
    	<input type="submit" />
    </form>
    
    <h2>Read tasks</h2>
    <ul>
    	<c:forEach items="${tasks}" var="message">
    		<li>${task.name}</li>
    	</c:forEach>
    </ul>
</body>
</html>