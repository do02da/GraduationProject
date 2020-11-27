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
	html, body, #writeDiv, #textareaDiv  {
		height:100%;
	}
	
	body {
		padding-top: 60px;
	}
	
	main {
		height: 500;
	}
	
	.h-100 {
		height:100%;
	}
</style>
</head>
<body>

<%@ include file="/WEB-INF/jsp/navbar.jsp" %>
	
	<main role="main">
		<div class="container" id="writeDiv">
			<div class="text-right">
				<a href="#this" class="list btn btn-primary" role="button">
					<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-counterclockwise" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M8 3a5 5 0 1 1-4.546 2.914.5.5 0 0 0-.908-.417A6 6 0 1 0 8 2v1z"/>
				  <path d="M8 4.466V.534a.25.25 0 0 0-.41-.192L5.23 2.308a.25.25 0 0 0 0 .384l2.36 1.966A.25.25 0 0 0 8 4.466z"/>
					</svg> 목록으로</a>
			</div>
			<br/>
		
			<form method="post" id="frm">
				<div class="form-group">
					<input type="hidden" id="writer" name="writer" value="${login.NICKNAME }">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="title" id="title" maxlength="100">
				</div>
			
				<div id="Map_Shown_Div"></div>
				<div id="test">
				</div>
				<div id="textareaDiv">
					<textarea name="contents" id="editor"></textarea>
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
	
	<script>
	$(document).ready(function() {
		// 저장 버튼 클릭
 		$("#write_submit").on("click", function(e){
 			e.preventDefault();
 			fn_submit();
 		});

		// SummerNote 에디터 설정
		$("#editor").summernote({
			toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			
		  height: 500,							// 에디터 높이
		  minHeight: null,					// 최소 높이
		  maxHeight: null,					// 최대 높이
		  focus: false,							// 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",						// 한글 설정
		  
		  callbacks: {				// 이미지를 첨부
				onImageUpload : function(files) {
					uploadSummernoteImageFile(files[0], this);
				},
				onPaste: function (e) {
					var clipboardData = e.originalEvent.clipboardData;
					if (clipboardData && clipboardData.items && clipboardData.items.length) {
						var item = clipboardData.items[0];
						if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
							e.preventDefault();
						}
					}
				}
		  }
		// 목록으로 버튼
		$(".list").on("click", function(e) {
			e.preventDefault();
			window.history.back();
		});
	});
	
	// 게시글 저장
	function fn_submit() {
		if ($("#title").val() === "") {
			alert("제목을 입력하세요");
		} else {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/board/insertBoard.do'/>");
			comSubmit.submit();
		}
	}
	
	// SummerNote 이미지 업로드
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "<c:url value='/board/uploadImage.do'/>",
			contentType : false,
			processData : false,
			success : function(data) {
        // 항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', data.url);
			}
		});
	}
	</script>
</body>
</html>