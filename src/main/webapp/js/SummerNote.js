/**
 * 
 */
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