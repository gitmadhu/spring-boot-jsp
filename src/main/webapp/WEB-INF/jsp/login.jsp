<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
</head>
<body>
	<div class="container">
		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">Login</div>
					<div
						style="float: right; font-size: 80%; position: relative; top: -10px">
						<a href="#">Forgot my password?</a>
					</div>
				</div>
				<div style="padding-top: 30px" class="panel-body">
					<c:if test="${error.isPresent() }">
					<div id="login-alert"
						class="alert alert-danger col-sm-12">
						<p>The email or password you have entered is invalid, try again.</p>
					</div>
					</c:if>	
					
					<c:if test="${logout }">
					<div id="login-alert"
						class="alert alert-danger col-sm-12">
						<p>You have been logged out successfully.</p>
					</div>
					</c:if>

					<form id="loginform" method="post" action="/login" class="form-horizontal" role="form">
						 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> 
								<input id="login-username" 	type="text" class="form-control" name="email" value=""
								placeholder="usuário">
						</div>

						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> 
								<input id="login-password" type="password" class="form-control" name="password"
								placeholder="senha">
						</div>

						<div style="margin-top: 10px" class="form-group">
							<div class="col-sm-12 controls">
								<a id="btn-login" href="#" class="btn btn-success"  onClick="$('#loginform' ).submit()">Login </a>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12 control">
								<div
									style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
									Don't have an account! <a href="#"
										onClick="$('#loginbox').hide(); $('#signupbox').show()">
										Register </a>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div id="signupbox" style="display: none; margin-top: 50px"
			class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">Sign Up</div>
					<div
						style="float: right; font-size: 85%; position: relative; top: -10px">
						<a id="signinlink" href="#"
							onclick="$('#signupbox').hide(); $('#loginbox').show()">Sign
							In</a>
					</div>
				</div>
				<div class="panel-body">
					<form:form action="register" method="post" id="signupform" modelAttribute="userForm"
						class="form-horizontal" role="form">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<div id="signupalert" style="display: none"
							class="alert alert-danger">
							<p>Error:</p>
							<span></span>
						</div>

						<div class="form-group">
							<label for="email" class="col-md-3 control-label">Email</label>
							<div class="col-md-9">
								<form:input type="text" path="email" class="form-control"
									name="email" placeholder="Email Address" />
								<form:errors path="email"></form:errors>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-md-3 control-label">First
								Name</label>
							<div class="col-md-9">
								<form:input type="text" path="firstname" name="firstname" class="form-control"
									placeholder="First Name" />
								<form:errors path="firstname"></form:errors>
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-md-3 control-label">Last
								Name</label>
							<div class="col-md-9">
								<form:input type="text" path="lastname" class="form-control"
									name="lastname" placeholder="Last Name" />
									<form:errors path="lastname"></form:errors>
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-md-3 control-label">Password</label>
							<div class="col-md-9">
								<form:input type="password" path="password" class="form-control"
									name="password" placeholder="Password" />
								<form:errors path="password"></form:errors>
							</div>
						</div>

						<!--  <div class="form-group">
                                    <label for="icode" class="col-md-3 control-label">Invitation Code</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="icode" placeholder="">
                                    </div>
                                </div> -->
						<div class="form-group">
							<label for="icode" class="col-md-3 control-label"></label>
							<div class="col-md-9">
								<a id="btn-signup" href="#"  onClick="$('#signupform' ).submit()" class="btn btn-success">Sign up
								</a>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<script src="/webjars/jquery/2.0.3/jquery.min.js"></script>
	<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"> </script>
</body>
</html>
