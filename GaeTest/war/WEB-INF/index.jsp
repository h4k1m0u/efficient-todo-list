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
	    	<a href="/" title="Efficient Todo List">Efficient <span class="label label-info">Todo-List</span></a>
	    </h1>
		<nav>
			<ul>
				<li><b>Username:</b> ${username}</li>
				<li><b>Email:</b> ${email}</li>
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
			    	<li <c:if test="${param.category == 'Today' or param.category == null}">class="active"</c:if>>
			    		<a href="/?category=Today">
			    			Today
			    			<c:if test="${param.category == 'Today' or param.category == null}">
				    			<span class="badge pull-right">${tasksCount}</span>
		    				</c:if>
		    			</a>
		    		</li>
			    	<li <c:if test="${param.category == 'Important'}">class="active"</c:if>>
			    		<a href="/?category=Important">
			    			Important
			    			<c:if test="${param.category == 'Important'}">
				    			<span class="badge pull-right">${tasksCount}</span>
		    				</c:if>
		    			</a>
		    		</li>
			    	<li <c:if test="${param.category == 'Reminder'}">class="active"</c:if>>
			    		<a href="/?category=Reminder">
			    			Reminder
			    			<c:if test="${param.category == 'Reminder'}">
				    			<span class="badge pull-right">${tasksCount}</span>
		    				</c:if>
		    			</a>
		    		</li>
			    	<li <c:if test="${param.category == 'Life'}">class="active"</c:if>>
			    		<a href="/?category=Life">
			    			Life
			    			<c:if test="${param.category == 'Life'}">
				    			<span class="badge pull-right">${tasksCount}</span>
		    				</c:if>
		    			</a>
		    		</li>
			    	<li <c:if test="${param.category == 'Work'}">class="active"</c:if>>
			    		<a href="/?category=Work">
			    			Work
			    			<c:if test="${param.category == 'Work'}">
				    			<span class="badge pull-right">${tasksCount}</span>
		    				</c:if>
		    			</a>
		    		</li>
			    </ul>
		    </div>
		</aside>
		
		<div class="col-lg-9">
			<header class="panel">
				<div class="panel-body">
				    <form method="post" class="form-horizontal">
				    	<fieldset>
				    		<div class="form-group">
						    	<label for="name" class="col-lg-2">Name</label>
						    	<div class="col-lg-6">
							    	<input type="text" name="name" class="form-control" placeholder="Add a task..."/>
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
		    </header>
		    
		    <section class="panel">
				<header class="panel-heading">
				    <h2>Read tasks</h2>
				</header>
				<div class="list-group">
			    	<c:forEach items="${tasks}" var="task">
			    		<a href="/delete?id=${task.id}&category=${not empty param.category ? param.category : 'Today'}" class="list-group-item">
				    		<article class="panel-body">
				    			<b>${task.category.name}</b>: ${task.name}
				    			<span class="pull-right">${task.deadline}</span>
				   			</article>
			   			</a>
			    	</c:forEach>
		    	</div>
		    </section>
	    </div>
	</main>
	
	<footer>
		Copyright
	</footer>
</body>
</html>