<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="fade-in">
<head>
<meta charset="UTF-8">
<title>(Before + After)Trip</title>

<%@ include file="/WEB-INF/include/include-header.jspf" %>

</head>
<body>
	<%@ include file="/WEB-INF/jsp/navbar.jsp" %>
	
	<main role="main">
		<div class="container">
			<div class="text-right">
				<a href="#this" class="list btn btn-primary" role="button">목록으로</a>
			</div>
			<table class="table table-bordered">
				<caption class="sr-only">게시글 상세</caption>
				<colgroup>
					<col width="15%"/>
					<col width="35%"/>
					<col width="15%"/>
					<col width="35%"/>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">글 번호</th>
						<td><input type="hidden" id="B_ID" value="${map.B_ID }">${map.B_ID }</td>
						<th scope="row">조회수</th>
						<td>${map.HIT_CNT }</td>
					</tr>
					<tr>
						<th scope="row">작성자</th>
						<td>${map.WRITER }</td>
						<th scope="row">작성시간</th>
						<td>${map.CREA_DTM }</td>
					</tr>
					<tr>
						<th scope="row">제목</th>
						<td colspan="3">${map.TITLE }</td>
					</tr>
					<tr>
						<td colspan="4">${map.CONTENTS }</td>
					</tr>
				</tbody>
			</table>
			
			<div class="text-center">
				<c:choose>
					<c:when test="${isLike }">
						<!-- 좋아요 버튼 -->
						<a href="#this" class="btn btn-success" id="likebtn" role="button">
							<!-- Like 아이콘 -->
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
							</svg>
							Like ${map.LIKE_CNT }
						</a>
					</c:when>
					<c:otherwise>
						<!-- 좋아요 취소 버튼 -->
						<a href="#this" class="btn btn-danger" id="Dislikebtn" role="button">
							<!-- DisLike 아이콘 -->
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
							</svg>
							DisLike ${map.LIKE_CNT }
						</a>
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
<script>
	$(document).ready(function() {
		// 목록으로 버튼
		$(".list").on("click", function(e) {
			e.preventDefault();
			fn_openBoardList();
		});
		
		// 좋아요 버튼
		$("#likebtn").on("click", function(e) {
			e.preventDefault();
			
			if (${not empty sessionScope.login}) {
				fn_likeit();
			} else {
				alert("로그인 후 사용이 가능합니다.");
			}
		});
		
		// 좋아요 취소 버튼
		$("#Dislikebtn").on("click", function(e) {
			e.preventDefault();
			fn_DisLikeIt();
		});
		
		
	});
	
	// 목록으로
	function fn_openBoardList() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/board/openBoard.do' />");
		comSubmit.submit();
	}
	
	// 좋아요
	function fn_likeit() {
		var comSubmit = new ComSubmit();
		comSubmit.addParam("B_ID", $("#B_ID").val());
		
		comSubmit.setUrl("<c:url value='/board/LikeIt.do' />");
		comSubmit.submit();
	}
	
	// 좋아요 취소
	function fn_DisLikeIt() {
		var comSubmit = new ComSubmit();
		comSubmit.addParam("B_ID", $("#B_ID").val());
		
		comSubmit.setUrl("<c:url value='/board/DisLikeIt.do' />");
		comSubmit.submit();
	}
	
</script>
</body>
</html>