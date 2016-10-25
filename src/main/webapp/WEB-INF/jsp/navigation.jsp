<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- Page Content -->
<div class="container">

<!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/">Start Today</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="/hybris">Hybris</a>
                    </li>
                    <li>
                        <a href="/spring">Spring</a>
                    </li>
                    <li>
                        <a href="/java">Java</a>
                    </li>
                    <li>
                        <a href="/users">Contact</a>
                    </li>
                </ul>
                <div class="col-sm-3 col-md-3">
			        <form class="navbar-form" action="/notes/search" role="search">
			        <div class="input-group">
			            <input type="hidden" name="tag">
						<input type="text" name="text" placeholder="Search" class="form-control" value="${text}" >
			            <div class="input-group-btn">
			                <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
			            </div>
			        </div>
			        </form>
			    </div>
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
                             <form id="logoutForm" method="post" action="/logout" class="form-horizontal" role="form">
									 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							</form>
                        </li>
                    </ul> 
                </li>
            </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>