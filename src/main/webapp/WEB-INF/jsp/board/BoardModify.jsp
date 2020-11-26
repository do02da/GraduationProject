<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="fade-in">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>(Before + After)Trip</title>

<%@ include file="/WEB-INF/include/include-header.jspf" %>
	<!-- Summernote Editor -->
	<script src="<c:url value='/summernote/summernote-lite.js'/> "></script>
	<script src="<c:url value='/summernote/lang/summernote-ko-KR.js'/> "></script>
	
	<link rel="stylesheet" href="<c:url value='/summernote/summernote-lite.css'/>">
	<style>
		body {
			padding-top: 60px;
		}
	</style>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/navbar.jsp" %>
	
	<main role="main">
		<div class="container">
			<div class="text-right">
				<a href="#this" class="return btn btn-primary" role="button">
					<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-counterclockwise" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M8 3a5 5 0 1 1-4.546 2.914.5.5 0 0 0-.908-.417A6 6 0 1 0 8 2v1z"/>
				  <path d="M8 4.466V.534a.25.25 0 0 0-.41-.192L5.23 2.308a.25.25 0 0 0 0 .384l2.36 1.966A.25.25 0 0 0 8 4.466z"/>
					</svg> 돌아가기</a>
			</div>
			<br/>
			
		<div class="container" id="writeDiv">
			<form method="post" id="frm">
				<div class="form-group">
					<input type="hidden" id="writer" name="writer" value="${login.NICKNAME }">
					<label for="TITLE">제목</label>
					<input type="text" class="form-control" name="title" id="title" maxlength="100" value="${map.TITLE}">
					<input type="hidden" id="B_ID" name="B_ID" value="${map.B_ID }">
				</div>
				<div id="textareaDiv">
					<textarea name="contents" id="editor">${map.CONTENTS}</textarea>
				</div>
				
			</form>
			<p class="text-right">
				<a href="#this" class="btn btn-primary" id="write_submit" role="button">저장</a>
			</p>
		</div>
	</main>
	
	<%@ include file="/WEB-INF/jsp/board/MapModal.jsp" %>
	
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
	
	<script src="<c:url value='/js/SummerNote.js'/>"></script>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$(".return").on("click", function(e) {
			e.preventDefault();
			window.history.back();
		});
		
		// 저장 버튼 클릭
 		$("#write_submit").on("click", function(e){
 			e.preventDefault();
 			fn_submit();
 		});
		
	});
	
	// 게시글 저장
	function fn_submit() {
		if ($("#title").val() === "") {
			alert("제목을 입력하세요");
		} else {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/board/updateBoard.do'/>");
			comSubmit.submit();
		}
	}
	</script>
</body>
</html>