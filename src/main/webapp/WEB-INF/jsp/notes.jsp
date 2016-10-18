<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp" />

<!-- Page Content -->
<div class="container">

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
			<c:forEach items="${notes }" var="note">
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
				<hr>
				<!-- <img class="img-responsive" src="http://placehold.it/900x300" alt=""> -->
				<hr>
				<p>${note.content}</p>
				<h5>
				<c:forEach items="${note.tags }" var="tag">
					<a href="/notes/tag/${tag.name}" class="btn btn-info btn-xs">${ tag.name}</a>
				</c:forEach>
				</h5>
				<a class="btn btn-primary" href="/note/${note.id}">Read More <span
					class="glyphicon glyphicon-chevron-right"></span></a>
				<hr>
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

	<hr>

	<!-- Footer -->
	<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>Copyright &copy; bonkaula.in 2016</p>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
	</footer>

</div>
<!-- /.container -->
<jsp:include page="footer.jsp" />