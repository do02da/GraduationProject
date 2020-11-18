<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>(Before + After)Trip</title>
</head>
<body>
<div class="collapse bg-dark" id="navbarHeader">
    <div class="container">
      <div class="row">
        <div class="col-sm-8 col-md-7 py-4">
          <h4 class="text-white" >About</h4>
          <p class="text-muted">Add some information about the album below, the author, or any other background context. Make it a few sentences long so folks can pick up some informative tidbits. Then, link them off to some social networking sites or contact information.</p>
        </div>
        <div class="col-sm-4 offset-md-1 py-4">
          <ul class="list-unstyled">
	          <c:choose>
							<c:when test="${empty login }">
		            <li><a href="#" id="openLogin" class="text-white">로그인</a></li>
		            <li><a href="#" id="openReg" class="text-white">회원가입</a></li>
	            </c:when>
							<c:otherwise>
								<li class="text-white">${login.NICKNAME } 님 환영합니다. <a href="#" id="logout"> 로그아웃</a></li>
								<li><a href="#" id="write" class="text-white">글쓰기</a></li> 
							</c:otherwise>
						</c:choose>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container d-flex justify-content-between">
      <a href="<c:url value='/menuMove.do?go=AlbumBoard'/>" class="navbar-brand d-flex align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="mr-2" viewBox="0 0 24 24" focusable="false"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
        <strong>Board</strong>
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </div>
  
  <%@ include file="/WEB-INF/include/include-body.jspf" %>
  <script type="text/javascript">
	$(document).ready(function() {
		$("#logout").on("click", function(e) {
			e.preventDefault();
			fn_logout();
		});
		
		$("#write").on("click", function(e) {
			e.preventDefault();
			fn_menumove("writePage");
		});
		
		$("#openLogin").on("click", function(e) {
			e.preventDefault();
			fn_menumove("user/login");
		});
		
		$("#openReg").on("click", function(e) {
			e.preventDefault();
			fn_menumove("user/reg");
		});
	});
	
		function fn_logout() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/user/logout.do' />");
			comSubmit.submit();
		}
		
		function fn_menumove(go) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/menuMove.do?go=" + go + "' />");
			comSubmit.submit();
		}
		
</script>
</body>
</html>