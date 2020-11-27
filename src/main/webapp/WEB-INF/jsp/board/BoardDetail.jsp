<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="fade-in">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>(Before + After)Trip</title>

<%@ include file="/WEB-INF/include/include-header.jspf" %>
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
				<a href="#this" class="list btn btn-primary" role="button">
					<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-counterclockwise" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M8 3a5 5 0 1 1-4.546 2.914.5.5 0 0 0-.908-.417A6 6 0 1 0 8 2v1z"/>
				  <path d="M8 4.466V.534a.25.25 0 0 0-.41-.192L5.23 2.308a.25.25 0 0 0 0 .384l2.36 1.966A.25.25 0 0 0 8 4.466z"/>
					</svg> 목록으로</a>
			</div>
			<br/>
			
			<table class="table">
				<caption class="sr-only">게시글 상세</caption>
				<colgroup>
					<col width="15%"/>
					<col width="35%"/>
					<col width="15%"/>
					<col width="35%"/>
				</colgroup>
				<tbody>
					<tr>
						<th class="table-active" scope="row">글 번호</th>
						<td><input type="hidden" id="B_ID" value="${map.B_ID }">${map.B_ID }</td>
						<th class="table-active" scope="row">조회수</th>
						<td>${map.HIT_CNT }</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">작성자</th>
						<td>${map.WRITER }</td>
						<th class="table-active" scope="row">작성시간</th>
						<td>${map.CREA_DTM }
							<c:if test="${map.CREA_DTM ne map.MOD_DTM}">
								<small>[${map.MOD_DTM}]</small>
							</c:if>
						</td>
					</tr>
					<tr>
						<th class="table-active" scope="row">제목</th>
						<td colspan="3">${map.TITLE }</td>
					</tr>
					<c:if test="${map.MAP_SRC != 'undefined' }">
						<tr>
							<td class="text-center" colspan="4">
								<img src='${map.MAP_SRC }'>
							</td>
						</tr>
					</c:if>
					<tr>
						<td colspan="4">${map.CONTENTS }</td>
					</tr>
				</tbody>
			</table>
			
			<div class="text-right">
					<c:if test="${login.NICKNAME == map.WRITER}">
						<a href="#" class="btn btn-secondary" id="updateBtn">수정하기</a>
						<a href="#" class="btn btn-danger" id="deleteBtn">삭제하기</a>
					</c:if>
			</div>
			
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
			
			<br/>
			
			<%@ include file="/WEB-INF/jsp/board/BoardComment.jsp" %>
			
		</div>
	</main>

	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
<script>
	$(document).ready(function() {
		// 목록으로 버튼
		$(".list").on("click", function(e) {
			e.preventDefault();
			window.history.back();
			// fn_openBoardList();
		});
		
		// 수정하기 버튼
		$("#updateBtn").on("click", function(e) {
			e.preventDefault();
			fn_Modify();
		});
		
		// 삭제하기 버튼
		$("#deleteBtn").on("click", function(e) {
			e.preventDefault();
			if (confirm("정말 삭제하시겠습니까?")) {
				fn_delete();
			} else {
				return false;
			}

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
	
	// 수정하기
	function fn_Modify() {
		var comSubmit = new ComSubmit();
		comSubmit.addParam("B_ID", $("#B_ID").val());
		comSubmit.setUrl("<c:url value='/board/openModify.do' />");
		comSubmit.submit();
	}

	// 삭제하기
	function fn_delete() {
		var comSubmit = new ComSubmit();
		comSubmit.addParam("B_ID", $("#B_ID").val());
		comSubmit.setUrl("<c:url value='/board/Delete.do' />");
		comSubmit.submit();
	}
	
	// 좋아요
	function fn_likeit() {
		var comSubmit = new ComSubmit();
		comSubmit.addParam("B_ID", $("#B_ID").val());
		
		var userNick = ${login.NICKNAME}
		comSubmit.addParam("NICKNAME", userNick);
			
		comSubmit.setUrl("<c:url value='/board/LikeIt.do' />");
		comSubmit.submit();
	}
	
	// 좋아요 취소
	function fn_DisLikeIt() {
		var comSubmit = new ComSubmit();
		comSubmit.addParam("B_ID", $("#B_ID").val());
		
		var userNick = ${login.NICKNAME}
		comSubmit.addParam("NICKNAME", userNick);
		
		comSubmit.setUrl("<c:url value='/board/DisLikeIt.do' />");
		comSubmit.submit();
	}
	
</script>
</body>
</html>