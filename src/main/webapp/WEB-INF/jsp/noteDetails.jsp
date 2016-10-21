<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="headerDP.jsp" />

	<div class="row">

		<!-- Blog Post Content Column -->
		<div class="col-lg-8">

			<!-- Blog Post -->

			<!-- Title -->
			<h1>${note.title}</h1>

			<!-- Author -->
			<p class="lead">
				by <a href="#">${note.author}</a>
			</p>

			<hr>

			<!-- Date/Time -->
			<p>
				<span class="glyphicon glyphicon-time"></span> Posted on August 24,
				2013 at 9:00 PM
			</p>

			<hr>

			<!-- Preview Image -->
			<img class="img-responsive" src="http://placehold.it/900x300" alt="" style="width:100%;height: 300%;" >

			<hr>

			<!-- Post Content -->
			${note.content}
			<c:forEach items="${note.tags }" var="tag">
				<a href="/notes/tag/${tag.name}#disqus_thread" class="btn btn-info btn-xs">${ tag.name}</a>
			</c:forEach>

			<hr>
			<!-- Blog Comments -->
			<jsp:include page="disqus.jsp" />

		</div>

		<jsp:include page="rightSidebarColumn.jsp" />

	</div>
	<!-- /.row -->



<jsp:include page="footer.jsp" />
