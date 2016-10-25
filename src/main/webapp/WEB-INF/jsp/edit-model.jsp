<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">
		<div id="noteId" style="display: none;"></div>
		<form id="updateNoteForm" action="#" method="post">
			<!-- Modal content-->
			<div class="modal-content">
				<div id="UpdateMessage" class="alert alert-success" style="display: none"></div>
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<div class="modal-title">
						<input class="form-control" id="noteTitle" type="text" name="title">
					</div>
				</div>
				<div class="modal-body">
					<div id="editor1"></div>
				</div>
				<div class="modal-footer">
					<button id="UdpateNoteButton" type="button" class="btn btn-default">Update</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
			<input id="tokenValue" type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> 
			<input id="noteContent" type="hidden" name="content">
		</form>

	</div>
</div>