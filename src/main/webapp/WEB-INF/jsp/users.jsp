<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html lang="en" ng-app="app" class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html lang="en" ng-app="app" class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html lang="en" ng-app="app" class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Spring boot and Angularjs Tutorial</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/webjars/bootstrap/3.3.6/css/bootstrap.css">
<link rel="stylesheet" href="/css/blog.css">
</head>
	<body>
		 <div class="blog-masthead">
	      <div class="container">
	        <nav class="blog-nav">
	          <a class="blog-nav-item active" href="#">Home</a>
	          <a class="blog-nav-item" href="/notes">New features</a>
	          <a class="blog-nav-item" href="#">Press</a>
	          <a class="blog-nav-item" href="#">New hires</a>
	          <a class="blog-nav-item" href="#">About</a>
	          <ul class="nav navbar-nav navbar-right ">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-user"></span> 
                        <strong><sec:authentication property="principal.user.firstname" /></strong>
                        <span class="glyphicon glyphicon-chevron-down"></span>
                    </a>
                     <ul class="dropdown-menu">
                        <li>
                            <div class="navbar-login">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <p class="text-center">
                                            <span class="glyphicon glyphicon-user icon-size"></span>
                                        </p>
                                    </div>
                                    <div class="col-lg-8">
                                        <p class="text-left"><strong><sec:authentication property="principal.user.firstname" /> <sec:authentication property="principal.user.lastname" /></strong></p>
                                        <p class="text-left small"><sec:authentication property="principal.user.email" /></p>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="navbar-login navbar-login-session">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <p>
                                            <a class="btn btn-danger btn-block" onClick="$('#logoutForm' ).submit()" href="#">logout</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul> 
                </li>
            </ul>
	        </nav>
	      </div>
	    </div>
		<div class="container">
			<div class="blog-header">
	        <h1 class="blog-title">Spring boot jsp View </h1>
	        <p class="lead blog-description">An example application with spring boot, mysql , jsp view and with bootstrap</p>
	      </div>
      		<form id="logoutForm" method="post" action="/logout" class="form-horizontal" role="form">
					 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			</form>
			<div class="col-sm-8 blog-main">
		 	<div class="panel panel-primary">
		    	<div class="panel-heading">Registered Users</div>
		   		<div class="panel-body">
		   			<table class="table table-striped">
						<thead>
							<tr>
								<th>Email</th>
								<th>Firstname</th>
								<th>Lastname</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${users}" var="user" >
							<tr>
								<td>${user.email}</td>
								 <td>${user.firstname}</td>
								<td>${user.lastname}</td> 
							</tr>
						</c:forEach>
						</tbody>
					</table>
		   		</div>
		  	</div>
		  	</div>
		  	<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
          <div class="sidebar-module sidebar-module-inset">
            <h4>About</h4>
            <p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>
          </div>
          <div class="sidebar-module">
            <h4>Archives</h4>
            <ol class="list-unstyled">
              <li><a href="#">March 2014</a></li>
              <li><a href="#">February 2014</a></li>
              <li><a href="#">January 2014</a></li>
              <li><a href="#">December 2013</a></li>
              <li><a href="#">November 2013</a></li>
              <li><a href="#">October 2013</a></li>
              <li><a href="#">September 2013</a></li>
              <li><a href="#">August 2013</a></li>
              <li><a href="#">July 2013</a></li>
              <li><a href="#">June 2013</a></li>
              <li><a href="#">May 2013</a></li>
              <li><a href="#">April 2013</a></li>
            </ol>
          </div>
          <div class="sidebar-module">
            <h4>Elsewhere</h4>
            <ol class="list-unstyled">
              <li><a href="#">GitHub</a></li>
              <li><a href="#">Twitter</a></li>
              <li><a href="#">Facebook</a></li>
            </ol>
          </div>
          
        </div>
		</div>
		<script src="/webjars/jquery/2.0.3/jquery.min.js"></script>
		<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"> </script>
	</body>
</html>