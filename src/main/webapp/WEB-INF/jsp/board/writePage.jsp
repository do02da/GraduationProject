<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="fade-in">
<head>
<meta charset="UTF-8">
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
	
	main {
		height: 80%;
	}
	
</style>
</head>
<body>

<%@ include file="/WEB-INF/jsp/navbar.jsp" %>
	
	<main role="main">
		<div class="container" id="writeDiv">
			<form method="post" id="frm">
				<div class="form-group">
					<input type="hidden" id="writer" name="writer" value="${login.NICKNAME }">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="title" id="title" maxlength="100">
				</div>
				<div id="textareaDiv">
					<textarea name="contents" id="editor"></textarea>
				</div>
				
			</form>
			<p class="text-right">
				<a href="#this" class="btn btn-primary" id="write_submit" role="button">저장</a>
				<a href="#this" class="btn btn-primary" id="list_submit" role="button">목록</a>
			</p>
		</div>
	</main>
	
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
	
	<script type="text/javascript">
	$(document).ready(function() {
		// 저장 버튼 클릭
 		$("#write_submit").on("click", function(e){
 			e.preventDefault();
 			fn_submit();
 		});
		
		//목록으로 버튼 클릭 
		$("#list_submit").on("click", function(e){
 			e.preventDefault();
 			fn_list();
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
	
	//게시물 목록으로
	function fn_list() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/board/openBoard.do'/>");
		comSubmit.submit();
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