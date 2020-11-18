<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>(Before + After)Trip</title>
</head>
<body>
	<div class="navbar navbar-dark d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-dark border-bottom shadow-sm">
		<div class="container">
		  <h5 class="my-0 mr-md-auto font-weight-normal">
	      <a href="<c:url value='/menuMove.do?go=AlbumBoard'/>" class="navbar-brand d-flex align-items-center">
	      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="mr-2" viewBox="0 0 24 24" focusable="false"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
	      <strong>TEST</strong>
	    	</a>
			</h5>
		  <nav class="my-2 my-md-0 mr-md-3">
		    <a class="p-2 text-white" href="#" id="openBoard">Board</a>
		    <a class="p-2 text-white" href="#" id="openMap">Map</a>
		    <c:choose>
		    	<c:when test="${empty login}">
		    		<a class="p-2 text-white" href="#" id="openLogin">Sign in</a>
		  			</nav>
		  			<a class="btn btn-outline-primary" href="#" id="openReg">Sign up</a>
		  		</c:when>
		  		<c:otherwise>
		  			<small class="text-white">${login.NICKNAME } 님 환영합니다. <a href="#" id="logout"> 로그아웃</a></small>
		  		</c:otherwise>
		  	</c:choose>
	  	</div>
	</div>
  
  <%@ include file="/WEB-INF/include/include-body.jspf" %>
  <script type="text/javascript">
	$(document).ready(function() {
		$("#logout").on("click", function(e) {
			e.preventDefault();
			fn_logout();
		});
		
		$("#openBoard").on("click", function(e) {
			e.preventDefault();
			fn_openBoard();
		});
		
		$("#openMap").on("click", function(e) {
			e.preventDefault();
			fn_openMap();
		})
		
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
		
		function fn_openBoard() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openBoard.do' />");
			comSubmit.submit();
		}
		
		function fn_openMap() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openMap.do' />");
			comSubmit.submit();
		}
</script>
</body>
</html>