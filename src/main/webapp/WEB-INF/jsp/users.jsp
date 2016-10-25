<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
<title>Todo App</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/webjars/bootstrap/3.3.6/css/bootstrap.css">
<link rel="stylesheet" href="/css/blog.css">
<link href="/css/prism.css" rel="stylesheet">
<script src="/js/ckeditor/ckeditor.js"></script>
</head>
<body>
	<form id="importForm" action="/load-notes" method="get">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		<input type="hidden" name="original" value="true" >
	</form>
	<div class="blog-masthead">
		<div class="container">
			<nav class="blog-nav">
				<a class="blog-nav-item active" href="/users">Home</a> 
				<a class="blog-nav-item" href="/notes">Notes</a> 
				<a class="blog-nav-item" href="#" onclick="loadNotes()">Import Notes</a> 
					<a class="blog-nav-item" href="/export-notes">Export Notes</a> 
					<a class="blog-nav-item" href="#">About</a>
				<ul class="nav navbar-nav navbar-right ">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <span class="glyphicon glyphicon-user"></span> 
							<strong><sec:authentication
									property="principal.user.firstname" /></strong> <span
							class="glyphicon glyphicon-chevron-down"></span>
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
											<p class="text-left">
												<strong><sec:authentication
														property="principal.user.firstname" /> <sec:authentication
														property="principal.user.lastname" /></strong>
											</p>
											<p class="text-left small">
												<sec:authentication property="principal.user.email" />
											</p>
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
												<a class="btn btn-danger btn-block"
													onClick="$('#logoutForm' ).submit()" href="#">logout</a>
											</p>
										</div>
									</div>
								</div>
							</li>
						</ul></li>
				</ul>
			</nav>
		</div>
	</div>

	<div class="container">
		<div class="blog-header">
			<h1 class="blog-title">Application users</h1>
			<p class="lead blog-description">An example application with
				spring boot, mysql , jsp view and with bootstrap</p>
		</div>
		<form id="logoutForm" method="post" action="/logout"
			class="form-horizontal" role="form">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
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
							<c:forEach items="${users}" var="user">
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
			<%-- Model example --%>
			<hr>
			<h2>Modal Example</h2>
			<!-- Trigger the modal with a button -->
			<div id="dataId">Edit this text</div>

			<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
				data-target="#myModal">Open Modal</button>

			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Modal Header</h4>
						</div>
						<div class="modal-body">
							<div id="editor1"></div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>
			<%--Model edit end --%>
		</div>
		<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
			<div class="sidebar-module sidebar-module-inset">
				<h4>About</h4>
				<p>
					Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras
					mattis consectetur purus sit amet fermentum. Aenean lacinia
					bibendum nulla sed consectetur.
				</p>
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
	<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js">
		
	</script>
	<script src="/js/prism.js"></script>
	<script type="text/javascript">
		$(function() {
			console.log("ready!");
			$("#editor1").html($("#dataId").html());
			var editor = CKEDITOR.replace('editor1')

			editor.on('change', function(evt) {
				// getData() returns CKEditor's HTML content.
				$("#dataId").html(evt.editor.getData());
			});

			editor.config.allowedContent = true

			var writer = editor.dataProcessor.writer;

			// The character sequence to use for every indentation step.
			writer.indentationChars = '\t';

			// The way to close self closing tags, like <br />.
			writer.selfClosingEnd = ' />';

			// The character sequence to be used for line breaks.
			writer.lineBreakChars = '\n';

			// The writing rules for the <p> tag.
			writer.setRules('p', {
				// Indicates that this tag causes indentation on line breaks inside of it.
				indent : true,

				// Inserts a line break before the <p> opening tag.
				breakBeforeOpen : true,

				// Inserts a line break after the <p> opening tag.
				breakAfterOpen : true,

				// Inserts a line break before the </p> closing tag.
				breakBeforeClose : false,

				// Inserts a line break after the </p> closing tag.
				breakAfterClose : true
			});
		});

		function loadNotes() {
			$("#importForm").submit();
		}
	</script>
</body>
</html>