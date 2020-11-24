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
				<div id="textareaDiv">
					<textarea name="contents" id="editor"></textarea>
				</div>
				
			</form>
			<p class="text-right">
				<a href="#this" class="btn btn-primary" id="write_submit" role="button">저장</a>
			</p>
		</div>
	</main>
	
	<!-- 지도 Modal -->
	<div class="modal fade" id="MapModal" tabindex="-1" aria-labelledby="MapModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title sr-only" id="MapModalLabel">장소 선택</h5>
	        <div class="input-group">
	        	<div class="input-group-prepend">
	        		<button class="btn btn-outline-secondary">
		        	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
							  <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
							</svg>
							</button>
	        	</div>
		        <input type="text" class="form-control">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
	        </div>
	      </div>
	      <div class="modal-body">
	      	<div class="container-fluid">
	      		<div class="row">
	      			<table style="width:200px; height:500px"class="col-4">
	      				<tbody>
		      				<tr>
		      					<td class="text-center">
		      						<svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-geo-alt" fill="#AAAAAA" xmlns="http://www.w3.org/2000/svg">
											  <path fill-rule="evenodd" d="M12.166 8.94C12.696 7.867 13 6.862 13 6A5 5 0 0 0 3 6c0 .862.305 1.867.834 2.94.524 1.062 1.234 2.12 1.96 3.07A31.481 31.481 0 0 0 8 14.58l.208-.22a31.493 31.493 0 0 0 1.998-2.35c.726-.95 1.436-2.008 1.96-3.07zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
											  <path fill-rule="evenodd" d="M8 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
											</svg><br/>
			      					<small class="text-muted" class="col-4">
					      				장소를 검색하거나, 마커를 이용해 직접 장소를 표시해주세요.
					      			</small>
		      					</td>
		      				</tr>
	      				</tbody>
	      			</table>

	      			<div style="width:500px; height:500px;" class="col-8" id="map">
	      			</div>
	      		</div>
	      	</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
	
	<!-- 네이버맵 클라이언트 아이디 입력 -->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=s56b4f2jk4"></script>
	<script>
		var mapOptions = {
			center: new naver.maps.LatLng(37.3595704, 127.105399),
			zoom: 10
		};
		var map = new naver.maps.Map(document.getElementById('map'), mapOptions);
	</script>
	
	<script type="text/javascript">
	var MapButton = function (context) {
		  var ui = $.summernote.ui;

		  // create button
		  var button = ui.button({
		    contents: '<i class="fa fa-child"/><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-geo-alt-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/></svg> 장소',
		    tooltip: '장소',
		    click: function () {
		    	$('#MapModal').modal('show')
		    }
		  });

		  return button.render();   // return button as jquery object
		}

	$(document).ready(function() {
		// 저장 버튼 클릭
 		$("#write_submit").on("click", function(e){
 			e.preventDefault();
 			fn_submit();
 		});
		
		// 목록으로 버튼
		$(".list").on("click", function(e) {
			e.preventDefault();
			window.history.back();
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
			    ['customBtn', ['Map']],
			    ['view', ['help']]

			  ],
			fontNames: ['맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			buttons: {
			    Map: MapButton
			},
			
			
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