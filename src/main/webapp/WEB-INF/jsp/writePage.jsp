<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="fade-in">
<head>
<meta charset="UTF-8">
<title>(Before + After)Trip</title>

<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script src="<c:url value='/ckeditor/ckeditor.js'/>" charset="utf-8"></script>

<style>
	html, body, #writeDiv, #textareaDiv  {
		height:100%;
	}
	
	main {
		height: 80%;
	}
</style>
</head>
<body>

	<header>
		<%@ include file="/WEB-INF/jsp/navbar.jsp" %>
	</header>
	
	<main role="main">
		<div class="container" id="writeDiv">
			<div class="form-group">
				<label for="title">제목</label>
				<input type="text" class="form-control" name="title" id="title" maxlength="100">
			</div>
			<div id="textareaDiv">
				<textarea name="content" id="editor"></textarea>
			</div>
		</div>
	</main>
	
	
	<script>
	// CKEditor 사용 -> CKFinder도 사용?
		CKEDITOR.replace('editor', {
			filebrowserUploadUrl : "<c:url value='/board/imageUpload.do'/> ",
			
			on : {
			    // maximize the editor on startup
			    'instanceReady' : function( evt ) {
			      evt.editor.resize("100%", $("#textareaDiv").height());
			    }
			}
		});
	</script>
	
</body>
</html>