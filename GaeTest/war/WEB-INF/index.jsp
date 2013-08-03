<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="org.test.model.Message" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- The HTML 4.01 Transitional DOCTYPE declaration-->
<!-- above set at the top of the file will set     -->
<!-- the browser's rendering engine into           -->
<!-- "Quirks Mode". Replacing this declaration     -->
<!-- with a "Standards Mode" doctype is supported, -->
<!-- but may lead to some differences in layout.   -->

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Guestbook</title>
  </head>

  <body>
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
