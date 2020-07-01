<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<div class="container">
		<form> <!-- action="noticeWrite" method="post" enctype="multipart/form-data" -->
			<div class="form-group">
				<label for="title">Title:</label> <input type="text"
					class="form-control" id="notitle" name="notitle">
			</div>
			<div class="form-group">
				<label for="contents">Contents:</label>
				<textarea rows="" cols="" class="form-control" id="summernote"
					name="no_contents"></textarea>
			</div>
	
			<button type="submit" id="noticeSubmit" class="btn btn-default">Submit</button>
		</form>
	</div>

<script>
		$('#summernote').summernote(
				{
					
					tabsize : 2,
					height : 500,
					toolbar : [ [ 'style', [ 'style' ] ],
							[ 'font', [ 'bold', 'underline', 'clear' ] ],
							[ 'color', [ 'color' ] ],
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							[ 'table', [ 'table' ] ],
							[ 'insert', [ 'link', 'picture', 'video' ] ],
							[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ]
				});
	</script>