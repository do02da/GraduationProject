<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

</head>
<body>
	<form id="comment-frm">
		<table class="table">
			<colgroup>
				<col width="100%">
			</colgroup>
			<tbody id="commentList">
			</tbody>
			<tfoot>
				<tr>
					<td>
						${login.NICKNAME}
						<input type="hidden" id="LOGIN_NICK" value="${login.NICKNAME}"/>
						<textarea rows="5" style="width:100%" id="comment_contents" name="comment_contents"></textarea>
						<p class="text-right"><a class="btn btn-primary" href="#this" id="comment_write" role="button">등록</a></p>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
	
	<script>
	var PARENT_ID = ${map.B_ID};
	var CREA_NICK = $("#LOGIN_NICK").val();
	
	$(document).ready(function(){
		fn_getCommentList();
		
		$(document).ready(function(){
			$("#comment_write").on("click", function(e){	
				e.preventDefault();
	
				if (${not empty sessionScope.login}) {
					if ($("#comment_contents").val() != '') {
						fn_commentWrite();
						$("#comment_contents").val("")
					} else {
						alert("댓글을 입력해주세요");
					}
				} else {
					alert("로그인 후 사용이 가능합니다.");
				}
			});
		});
	});
	

	// 댓글 불러오기
	function fn_getCommentList() {
    $.ajax({
      type: 'POST',
      url : "<c:url value='/comment/commentList.do'/>",
      data: {PARENT_ID:PARENT_ID},
      success : function(data){
      	var html = "";
      	
      	if (data.length > 0) {
      		for (i=0; i <data.length; i++) {
						html += commentDetail(data[i]);
      		}
      	} else {
	        html += "<td colspan='2'>";
	        html += "<strong>등록된 댓글이 없습니다.</strong>";
	        html += "</td>";
        }
      	
      	$("#commentList").html(html);
      	
      	// 삭제하기 버튼
      	$(".delete").on("click", function(e) {
					e.preventDefault();
      		
					var result = confirm('정말 삭제하겠습니까?');
		
					if (result) {
						fn_commentDelete($(this));
					} else {
						return false;
					}
      	});
      	
      	// 수정하기 버튼
      	$(".update").on("click", function(e) {
      		fn_commentModify($(this));
      	});
      }
		});
	}
	
	// 댓글 상세 내용
	function commentDetail(data) {
		var tmphtml = "";
		
		tmphtml += "<tr><td>";
		tmphtml += "<strong>" + data.CREA_NICK + "</strong>";
		tmphtml += "&ensp;" + data.CREA_DTM;
		tmphtml += "<p><div id='comment_div' name='comment_div'>"
		
    if (data.DEL_GB == 'Y') {
    	tmphtml += "<p class='text-secondary'>삭제된 댓글입니다.</p>";
		} else {
			tmphtml += "<input type='hidden' value='" + data.CONTENTS + "' id='comment' name='comment'>"
			tmphtml += data.CONTENTS;
		}
		
		tmphtml += "</div>";
   
    if (CREA_NICK == data.CREA_NICK && data.DEL_GB == 'N') {
    	tmphtml += "<p class='text-right'>";
    	tmphtml += "<a href='#this' class='update text-muted' id='update_" + data.C_ID + "'  role='button'>[수정]</a> ";
    	tmphtml += "<a href='#this' class='delete text-muted' id='delete_" + data.C_ID + "' role='button'>[삭제]</a>";
    	tmphtml += "</p>";
    }
    
    tmphtml += "</td></tr>";
		
		return tmphtml;
	}
	
	// 댓글 등록
	function fn_commentWrite() {
		var CONTENTS = $("#comment_contents").val();
		
		$.ajax({
			type: 'POST',
			data: {
				PARENT_ID:PARENT_ID,
				CONTENTS:CONTENTS,
				CREA_NICK:CREA_NICK
			},
			url: "<c:url value='/comment/commentWrite.do'/>",
			success: function(data){
				fn_getCommentList();
				$("#comment_contents").val("");
			},
			error: function(request, status) {
				alert("ERROR : " + request.status)
				fn_getCommentList();
				$("#comment_contents").val("");
			}
		});
	}
	
	// 댓글 삭제
	function fn_commentDelete(obj) {
		var tmp = obj.attr('ID');		// obj.id = delete_C_ID
		var C_ID = tmp.split('_');	// delete, C_ID
		
		$.ajax({
			type: 'POST',
			data: {
				C_ID:C_ID[1],
				PARENT_ID:PARENT_ID
			},
			url: "<c:url value='/comment/commentDelete.do'/>",
			success: function(){
				fn_getCommentList();
			},
			error: function(request, status) {
				alert("ERROR : " + request.status)
				fn_getCommentList();
			}
		})
	}

	// 수정하기
	function fn_commentModify(obj) {
		var tmp = obj.attr('ID');		// obj.id = update_C_ID
		var C_ID = tmp.split('_');	// delete, C_ID
		
		var con = obj.parent().parent().find("#comment_div").find("#comment").val();
		var str = "<textarea  rows='5' style='width:100%' id='contents_modify' name='contents_modify'>" + con + "</textarea>";
		var div = obj.parent().parent().find("#comment_div");
		
		var btn = " <a href='#this' name='comment_update' class='text-muted'>[저장]</a> "
						+ "<a href='#this' name='update_cancel' class='text-muted'>[취소]</a>"
		obj.parent().append(btn);
		obj.hide();
		
		div.empty();
		div.append(str);
		
		// 수정 저장
		$("a[name=update_cancel]").on("click", function(e){
			fn_getCommentList();
		});
		
		// 수정 취소
		$("a[name=comment_update]").on("click", function(e){
			fn_commentUpdate($("#contents_modify").val(), C_ID[1]);
		});
	}
	
	// 수정 저장
	function fn_commentUpdate(CONTENTS, C_ID) {
		$.ajax({
			type: 'POST',
			data: {
				CONTENTS:CONTENTS,
				C_ID:C_ID
			},
			url: "<c:url value='/comment/commentUpdate.do'/>",
			success: function(data){
				fn_getCommentList();
			},
			error: function(request, status) {
				alert("ERROR : " + request.status)
				fn_getCommentList();
			}
		})
	}
	</script>
		
</body>
</html>