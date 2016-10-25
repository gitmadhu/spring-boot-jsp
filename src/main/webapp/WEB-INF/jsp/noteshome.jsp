<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="header.jsp" />


<div class="row">

	<!-- Blog Entries Column -->
	<div class="col-md-8">

		<h1 class="page-header">
			<c:choose>
				<c:when test="${tag != null }">
					Notes for Tag <b>${tag}</b>
					<small> found ${fn:length(notePage.content)} note(s) </small>
				</c:when>
				<c:when test="${text != null }">
					Notes for Text <b>${text}</b>
					<small> found ${fn:length(notePage.content)} note(s) </small>
				</c:when>
				<c:otherwise>
					Notes from ${notePage.number * notePage.numberOfElements + 1} to ${notePage.number * notePage.numberOfElements + notePage.numberOfElements  } <small>
						out of ${notePage.totalElements} note(s) </small>
				</c:otherwise>
			</c:choose>
		</h1>
		<c:if test="${not empty message}">
			<div class="alert alert-success">
				<strong>Success!</strong> ${message} .
			</div>
		</c:if>
		<c:forEach items="${notePage.content }" var="note">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title pull-left">
						<a href="#" id="note-title-${note.id}" >${note.title}</a>
					</h3>
					<button type="button" class="btn btn-default pull-right" onclick="return loadCkeditor(${note.id});" data-toggle="modal"
				data-target="#myModal">Edit</button>
				<div class="clearfix"></div>
				</div>
				<div class="panel-body">
					<div id="blog-content-${note.id}">${note.content}</div>
					<h5>
						<c:forEach items="${note.tags }" var="tag">
							<a href="/notes/tag/${tag.name}" class="btn btn-info btn-xs">${ tag.name}</a>
						</c:forEach>
					</h5>
					<a class="btn btn-primary" href="/note/${note.id}">Read More <span
						class="glyphicon glyphicon-chevron-right"></span></a>
					<hr>
					<h5>
						by <a href="index.php"><b>${note.author}</b></a>
						<span class="glyphicon glyphicon-time"></span> Posted on
						${note.date}
					</h5>
				</div>
			</div>
		</c:forEach>
		<hr>

		<!-- Pager -->
		<ul class="pager">
			<%-- <c:if test="${notePage.previous}">
					<li class="previous"><a href="/notes?page=${notePage.number-1}&size=${notePage.numberOfElements}">&larr; Older</a></li>
				</c:if>
				<c:if test="${notePage.next}">
					<li class="next"><a href="/notes?page=${notePage.number+1}&size=${notePage.numberOfElements}">Newer &rarr;</a></li>
				</c:if> --%>

			<li class="previous"><a
				href="/notes?page=${notePage.number-1}&size=${notePage.numberOfElements}">&larr;
					Previous</a></li>
			<c:if test="${notePage.totalPages > 0 }">
				<c:forEach begin="0" end="${notePage.totalPages-1}" var="varStatus" >
					<li>
					<c:if test="${varStatus == notePage.number}">
						${varStatus}
					</c:if>
					<c:if test="${varStatus != notePage.number}">
						<a href="/notes?page=${varStatus}&size=${notePage.numberOfElements}">${varStatus}</a>
					</c:if>
					</li>
				</c:forEach>
			</c:if>
			<li class="next"><a
				href="/notes?page=${notePage.number+1}&size=${notePage.numberOfElements}">Next
					&rarr;</a></li>
		</ul>

	</div>

	<jsp:include page="rightSidebarColumn.jsp" />
</div>
<!-- /.row -->
<jsp:include page="footer.jsp" />