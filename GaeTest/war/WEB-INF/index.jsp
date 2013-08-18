<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Efficient Todo List</title>
	<link rel="stylesheet" href="static/css/bootstrap.min.css" />
	<link rel="stylesheet" href="static/css/bootstrap.icon-large.min.css">
	<link rel="stylesheet" href="static/css/style.css">
</head>
<body>
	<header class="main">
	    <h1>
	    	<i class="icon-large icon-notes"></i>
    		<a href="/" title="Efficient Todo List">Efficient Todo-List</a>
	    </h1>
		<nav>
			<ul>
				<li><b>Username:</b> ${username}</li>
				<li><b>Email:</b> ${email}</li>
			</ul>
		</nav>
		<a href="https://github.com/h4k1m0u">
			<img style="position: absolute; top: 0; right: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_right_gray_6d6d6d.png" alt="Fork me on GitHub">
		</a>
	</header>
	
	<div class="container">
		<main class="row">
			<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
				<aside class="panel">
					<header class="panel-heading">
					    <h2 class="text-center">
						    <i class="icon-large icon-filter"></i>
					    	Filter by Category
				    	</h2>
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
			</div>
			
			<div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
				<header class="panel">
					<div class="panel-body">
					    <form method="post" class="form-inline">
					    	<fieldset>
					    		<div class="form-group">
									<i class="icon-large icon-pencil"></i>
							    	<label for="name" class="sr-only">Task name</label>
							    	<input type="text" name="name" class="form-control" placeholder="Add a task..."/>
						    	</div>
						    	<button type="submit" class="btn btn-primary">Create a Task</button>
					    	</fieldset>
					    </form>
				    </div>
			    </header>
			    
			    <section class="panel tasks">
					<header class="panel-heading">
					    <h2><span class="label">${not empty param.category ? param.category : 'Today'}</span> tasks</h2>
					</header>
					<ul class="list-group">
				    	<c:forEach items="${tasks}" var="task">
				    		<li class="list-group-item">
					    		<article class="panel-body">
					    			<b>${task.category.name}</b>: ${task.name}
					    			<span class="pull-right">
					    				${task.deadline}
							    		<a href="/delete?id=${task.id}&category=${not empty param.category ? param.category : 'Today'}">
											<i class="icon-large icon-remove"></i>    			
							    		</a>
				    				</span>
					   			</article>
				   			</li>
				    	</c:forEach>
			    	</ul>
			    </section>
		    </div>
		</main>
		
		<footer class="main">
			<p class="text-center">
				2013, 
		    	<i class="icon-large icon-github icon-small"></i>
				<a target="_blank" href="https://github.com/h4k1m0u/efficient-todo-list">View the source on Github</a>
			</p>
			<ul>
				<li>
			    	<i class="icon-large icon-embed-close icon-small"></i>
					<small>Beautiful and inspiring uses of</small>
					<a target="_blank" href="http://www.getbootstrap.com">Bootstrap</a>
				</li>
				<li>
			    	<i class="icon-large icon-picture icon-small"></i>
					<small>Icons graciously provided by</small>
					<a target="_blank" href="http://glyphicons.com">Glyphicons</a>
				</li>
			</ul>
		</footer>
	</div>
</body>
</html>