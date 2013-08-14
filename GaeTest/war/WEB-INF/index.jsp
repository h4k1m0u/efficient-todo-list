<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Efficient Todo List</title>
	<link rel="stylesheet" href="static/css/bootstrap.min.css" />
	<link rel="stylesheet" href="static/css/style.css" />
</head>
<body class="container">
	<header class="main">
	    <h1>
	    	<a href="/" title="Efficient Todo List">Efficient Todo List</a>
	    </h1>
		<nav>
			<ul>
				<li><b>Username:</b> ${isConnected ? username : "you aren't connected"}</li>
				<li><b>Email:</b> ${isConnected ? email : "you aren't connected"}</li>
			</ul>
		</nav>
	</header>
	
	<main class="row">
		<aside class="panel col-lg-3">
			<header class="panel-heading">
			    <h2>Filter by Category</h2>
			</header>
			<div class="panel-body">
			    <ul class="nav nav-pills nav-stacked">
			    	<li><a href="/">All</a></li>
			    	<li <c:if test="${param.category == 'Today'}">class="active"</c:if>>
			    		<a href="/?category=Today">Today</a>
		    		</li>
			    	<li <c:if test="${param.category == 'Important'}">class="active"</c:if>>
			    		<a href="/?category=Important">Important</a>
		    		</li>
			    	<li <c:if test="${param.category == 'Reminder'}">class="active"</c:if>>
			    		<a href="/?category=Reminder">Reminder</a>
		    		</li>
			    	<li <c:if test="${param.category == 'Life'}">class="active"</c:if>>
			    		<a href="/?category=Life">Life</a>
		    		</li>
			    	<li <c:if test="${param.category == 'Work'}">class="active"</c:if>>
			    		<a href="/?category=Work">Work</a>
		    		</li>
			    </ul>
		    </div>
		</aside>
		
		<div class="col-lg-9">
			<section class="panel">
				<header class="panel-heading">
				    <h2>Enter a task</h2>
				</header>
				<div class="panel-body">
				    <form action="/" method="post" class="form-horizontal">
				    	<fieldset>
				    		<div class="form-group">
						    	<label for="name" class="col-lg-2">Name</label>
						    	<div class="col-lg-6">
							    	<input type="text" name="name" class="form-control"/>
						    	</div>
					    	</div>
				    		<div class="form-group">
						    	<label for="category" class="col-lg-2">Category</label>
						    	<div class="col-lg-6">
							    	<select name="category" class="form-control" multiple>
							    		<option value="Today" selected="selected">Today</option>
							    		<option value="Important">Important</option>
							    		<option value="Reminder">Reminder</option>
							    		<option value="Life">Life</option>
							    		<option value="Work">Work</option>
							    	</select>
						    	</div>
					    	</div>
					    	<div class="form-group">
					    		<div class="col-lg-offset-2 col-lg-6">
							    	<button type="submit" class="btn btn-primary">Create a Task</button>
						    	</div>
					    	</div>
				    	</fieldset>
				    </form>
			    </div>
		    </section>
		    
		    <section class="panel">
				<header class="panel-heading">
				    <h2>Read tasks</h2>
				</header>
		    	<c:forEach items="${tasks}" var="task">
		    		<article class="panel-body">
		    			<b>${task.category.name}:</b> ${task.name}
		   			</article>
		    	</c:forEach>
		    </section>
	    </div>
	</main>
	
	<footer>
		Copyright
	</footer>
</body>
</html>