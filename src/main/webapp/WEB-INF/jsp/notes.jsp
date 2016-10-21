<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp" />


	<div class="row">

		<!-- Blog Entries Column -->
		<div class="col-md-8">

			<h1 class="page-header">
			<c:choose>
				<c:when test="${tag != null }">
					Notes for Tag <b>${tag}</b> <small> found ${fn:length(notes)} note(s) </small>
				</c:when>
				<c:when test="${text != null }">
					Notes for Text <b>${text}</b> <small> found ${fn:length(notes)} note(s) </small>
				</c:when>
				<c:otherwise>
					Notes <small> found ${fn:length(notes)} note(s) </small>
				</c:otherwise>
			</c:choose>
			</h1>
			<c:if test="${not empty message}">
				<div class="alert alert-success">
				  <strong>Success!</strong> ${message} .
				</div>
			</c:if>
			<c:forEach items="${notes }" var="note">
			<div class="panel panel-default">
				<div class="panel-body">
				<h2>
					<a href="#">${note.title}</a>
				</h2>
				<p class="lead">
					by <a href="index.php">${note.author}</a>
				</p>
				<p>
					<span class="glyphicon glyphicon-time"></span> Posted on
					${note.date}
				</p>
				<!-- <img class="img-responsive" src="http://placehold.it/900x300" alt=""> -->
				<hr>
				<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
				data-target="#myModal">Edit</button>
					<div id="blog-content-${note.id}">${note.content}</div>
				<h5>
				<c:forEach items="${note.tags }" var="tag">
					<a href="/notes/tag/${tag.name}" class="btn btn-info btn-xs">${ tag.name}</a>
				</c:forEach>
				</h5>
				<a class="btn btn-primary" href="/note/${note.id}">Read More <span
					class="glyphicon glyphicon-chevron-right"></span></a>
				<hr>
				</div>
				</div>
			</c:forEach>
			<hr>

			<!-- Pager -->
			<ul class="pager">
				<li class="previous"><a href="#">&larr; Older</a></li>
				<li class="next"><a href="#">Newer &rarr;</a></li>
			</ul>

		</div>

		<jsp:include page="rightSidebarColumn.jsp" />
	</div>
	<!-- /.row -->
<jsp:include page="footer.jsp" />