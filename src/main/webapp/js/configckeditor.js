$(function() {
			$("#editor1").html($(this).html());
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