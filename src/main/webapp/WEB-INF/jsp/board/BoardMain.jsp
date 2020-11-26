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
	
<<<<<<< HEAD
<main role="main">
	<div class="container text-right">
		<a href="#" class="btn btn-primary" role="button" id="openWritePage">글쓰기</a>
=======
<main role="main" class="bg-light">
	<div class="container text-right	">
			<a href="#" class="btn btn-primary" role="button" id="openWritePage">글쓰기</a>
>>>>>>> branch 'main' of https://github.com/wellcom8/GraduationProject.git
	</div>

	<div class="album py-5">
		<div class="container">
	  	<div class="row">
	  	
				<c:choose>
					<c:when test="${fn:length(list) > 0 }">
						<c:forEach items="${list }" var="row">
							<div class="col-md-4">
			          <div class="card mb-4 shadow-sm">
			          	<!-- 썸네일 여부 확인 -->
			          	<a href="#" class="openBoardDetail">
			          	<c:choose>
				          	<c:when test="${empty row.THUMBNAIL }">
				          		<svg class="bd-placeholder-img card-img-top " width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
				          	</c:when>
				          	<c:otherwise>
				          			<img src="${row.THUMBNAIL }" width="100%" height="225">
				          	</c:otherwise>
				          </c:choose>
			            </a>
			            
			            <div class="card-body">
			            	<table style="width:100%">
			            		<tr>
				            		<td>
				            			<a href="#this" class="openBoardDetail card-text">${row.TITLE }</a>
				            			<input type="hidden" id="B_ID" value="${row.B_ID }">
				            		</td>
				            		<td class="text-right">
				            			<small>
							              <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pen" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
														  <path fill-rule="evenodd" d="M13.498.795l.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z"/>
														</svg>&nbsp; <span class="sr-only">작성자</span> ${row.WRITER }
						              </small>
				            		</td>
			            		</td>
			            	</table>

			              <div class="d-flex justify-content-between align-items-center">
			              	<small class="text-muted">
			              		<!-- 조회수 아이콘 -->
												<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-eye" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
												  <path fill-rule="evenodd" d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.134 13.134 0 0 0 1.66 2.043C4.12 11.332 5.88 12.5 8 12.5c2.12 0 3.879-1.168 5.168-2.457A13.134 13.134 0 0 0 14.828 8a13.133 13.133 0 0 0-1.66-2.043C11.879 4.668 10.119 3.5 8 3.5c-2.12 0-3.879 1.168-5.168 2.457A13.133 13.133 0 0 0 1.172 8z"/>
												  <path fill-rule="evenodd" d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
												</svg>
												<span class="sr-only">조회수</span>
												${row.HIT_CNT }
												<!-- 좋아요 아이콘 -->
												<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-heart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
												  <path fill-rule="evenodd" d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
												</svg>
												<span class="sr-only">좋아요</span>
												${row.LIKE_CNT }
												
												</small>
			                <small class="text-muted">
			               	 	<!-- 시계 아이콘 -->
				                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-smartwatch" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
												  <path d="M14 5h.5a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5H14V5z"/>
												  <path fill-rule="evenodd" d="M8.5 4.5A.5.5 0 0 1 9 5v3.5a.5.5 0 0 1-.5.5H6a.5.5 0 0 1 0-1h2V5a.5.5 0 0 1 .5-.5z"/>
												  <path fill-rule="evenodd" d="M4.5 2h7A2.5 2.5 0 0 1 14 4.5v7a2.5 2.5 0 0 1-2.5 2.5h-7A2.5 2.5 0 0 1 2 11.5v-7A2.5 2.5 0 0 1 4.5 2zm0 1A1.5 1.5 0 0 0 3 4.5v7A1.5 1.5 0 0 0 4.5 13h7a1.5 1.5 0 0 0 1.5-1.5v-7A1.5 1.5 0 0 0 11.5 3h-7z"/>
												  <path d="M4 2.05v-.383C4 .747 4.746 0 5.667 0h4.666C11.253 0 12 .746 12 1.667v.383a2.512 2.512 0 0 0-.5-.05h-7c-.171 0-.338.017-.5.05zm0 11.9c.162.033.329.05.5.05h7c.171 0 .338-.017.5-.05v.383c0 .92-.746 1.667-1.667 1.667H5.667C4.747 16 4 15.254 4 14.333v-.383z"/>
												</svg>
												<span class="sr-only">작성일</span>
				              	${row.CREA_DTM }</small>
			              </div>
			            </div>
			          </div>
			        </div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						등록된 게시글이 없습니다.
					</c:otherwise>
				</c:choose>
	
			</div>
		</div>
	</div>
	
	<c:if test="${not empty paginationInfo }">
		<ui:pagination paginationInfo = "${paginationInfo }" type="text" jsFunction="fn_pagiNation"/>
	</c:if>
	<input type="hidden" id="currentPageNo" name="currentPageNo"/>
</main>

<<<<<<< HEAD

=======
<%@ include file="/WEB-INF/jsp/footer.jsp" %>
>>>>>>> branch 'main' of https://github.com/wellcom8/GraduationProject.git
<script>
	$(document).ready(function() {
		
		// 글 상세 보기
		$(".openBoardDetail").on("click", function(e) {
			e.preventDefault();
			fn_openBoardDetail($(this));
		})
		
		// 글쓰기 버튼
		$("#openWritePage").on("click", function(e){
			e.preventDefault();
			
			if (${not empty sessionScope.login}) {	// 로그인 했으면
				fn_openWritePage();
			} else {																// 비로그인이면
				alert("로그인 후 사용이 가능합니다.");
			}
		});
	});
	
	function fn_openWritePage() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/board/openWritePage.do'/>");
		comSubmit.submit();
	}
	
	function fn_openBoardDetail(obj) {
		var B_ID = obj.parent().find("#B_ID").val();
		
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/board/openBoardDetail.do'/>");
		
		if (${not empty sessionScope.login}) {	// 로그인 했으면
			var userNick = ${login.NICKNAME}
			comSubmit.addParam("NICKNAME", userNick);
		}	
		
		comSubmit.addParam("B_ID", B_ID);
		comSubmit.submit();
	}
	function fn_pagiNation(pageNo){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/board/openBoard.do' />");
		comSubmit.addParam("currentPageNo", pageNo);
		comSubmit.submit();
	}
</script>
</body>
</html>