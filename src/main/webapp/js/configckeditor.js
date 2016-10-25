$(function() {

	$("#UdpateNoteButton").click(function(event) {
		formUrl = $("#updateNoteForm").attr("action");
		$.post(formUrl, $("#updateNoteForm").serialize(),

		function(data) {
			$('#UpdateMessage').html(data);
			$('#UpdateMessage').show();
		});

	});
	
	$('#noteTitle').change(function () {
		var noteId = $("#noteId").text();
	    $("#note-title-"+noteId).html($("#noteTitle").val());
	});
	
});

function loadCkeditor(noteId) {

	var contentId = "#blog-content-"+noteId;
	var tittleId = "#note-title-"+noteId;

	//for content 
	$("#editor1").html($(contentId).html());
	$("#noteId").html(noteId);

	var editorName = "editor1";

	var editor = CKEDITOR.instances[editorName];
	if (editor) {
		editor.destroy(true);
		$("#editor1").html($(contentId).html());
	}
	editor = CKEDITOR.replace(editorName);

	editor.config.allowedContent = true;
	editor.config.enterMode = CKEDITOR.ENTER_BR;

	editor.on('change', function(evt) {
		// getData() returns CKEditor's HTML content.
		$(contentId).html(evt.editor.getData());
		$('#noteContent').attr('value', evt.editor.getData());
	});
	
	//for title
	$("#noteTitle").attr('value',$(tittleId).text());
	
	$('#updateNoteForm').attr('action', '/udpate/note/' + noteId);
	
	return true;
}