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

	<header>
		<%@ include file="/WEB-INF/jsp/navbar.jsp" %>
	</header>
	
<main role="main">
	<div class="text-right">
		<a href="#" class="btn btn-primary" role="button" id="openWritePage">글쓰기</a>
	</div>

	<div class="album py-5 bg-light">
		<div class="container">
	  	<div class="row">
	  	
				<c:choose>
					<c:when test="${fn:length(list) > 0 }">
						<c:forEach items="${list }" var="row">
							<div class="col-md-4">
			          <div class="card mb-4 shadow-sm">
			            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
			            <div class="card-body">
			              <p class="card-text">${row.TITLE }</p>
			              <div class="d-flex justify-content-between align-items-center">
			              	<small class="text-muted">${row.HIT_CNT }</small>
			                <small class="text-muted">${row.CREA_DTM }</small>
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
</main>

<script>
	$(document).ready(function() {
		$("#openWritePage").on("click", function(e) {
			e.preventDefault();
			fn_menumove("board/writePage");
		});
	});
	
	function fn_menumove(go) {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/menuMove.do?go=" + go + "' />");
		comSubmit.submit();
	}
</script>
</body>
</html>