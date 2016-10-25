<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="headerDP.jsp" />

	<div class="row">

		<!-- Blog Post Content Column -->
		<div class="col-lg-8">

			<!-- Blog Post -->

			<!-- Title -->
			<h1 id="note-title-${note.id}" >${note.title}</h1>
			<button type="button" class="btn btn-default pull-right" onclick="return loadCkeditor(${note.id});" data-toggle="modal"
				data-target="#myModal">Edit</button>

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
			<div id="blog-content-${note.id}" > ${note.content} </div>
			<c:forEach items="${note.tags }" var="tag">
				<a href="/notes/tag/${tag.name}#disqus_thread" class="btn btn-info btn-xs">${ tag.name}</a>
			</c:forEach>

			<hr>
			<div class="row">
			<c:forEach items="${note.tags}" var="firstTag" begin="0" end="0" >
				<c:set var="endVar" value="${fn:length(firstTag.notes) < 2? fn:length(firstTag.notes): 2}" /> 
				<c:forEach items="${firstTag.notes}" var="relNote" begin="0" end="${endVar}" >
					<c:if test="${relNote.id != note.id }"> 
						<div class="col-sm-6 col-md-4">
						    <div class="thumbnail">
						      <div class="caption">
						        <h3>${relNote.title}</h3>
						        <p>... </p>
						        <p><a href="/note/${relNote.id}" class="btn btn-primary" role="button">Read on..</a></p>
						      </div>
						    </div>
						  </div>
					 </c:if> 
				</c:forEach>
			</c:forEach>
			</div>
			<hr>
			<!-- Blog Comments -->
			<jsp:include page="disqus.jsp" />

		</div>

		<jsp:include page="rightSidebarColumn.jsp" />

	</div>
	<!-- /.row -->



<jsp:include page="footer.jsp" />
