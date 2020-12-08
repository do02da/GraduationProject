<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>(Before + After)Trip</title>
</head>
<body>
<header>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
		<div class="container">
		  <h5 class="font-weight-normal">
	      <a href="<c:url value='/openAlbumBoard.do'/>" class="navbar-brand align-items-center">
	      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="mr-2" viewBox="0 0 24 24" focusable="false"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
	      <strong>TRIP</strong>
	    	</a>
			</h5>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
   		  </button>
		  <div class="justify-content-md-end collapse navbar-collapse" id="navbarCollapse">
		    <ul class="navbar-nav me-auto mb-2 mb-md-0">
		   	  <li class="nav-item">
		   	    <a class="nav-link text-white" href="#" id="openBoard">Board</a>
		      </li>
		      <li class="nav-item">
		     	 <a class="nav-link text-white" href="#" id="openMap">Map</a>
		      </li>
		    
		    <c:choose>
		    	<c:when test="${empty login}">
		    		<li class="nav-item">
		    		  <a class="nav-link text-white" href="#" id="openLogin">Sign in</a>
		    		</li>
		    		<li class="nav-item">
		  			  <a class="btn btn-outline-primary" href="#" id="openReg">Sign up</a>
		  			</li>
		  		</c:when>
		  		<c:otherwise>
		  		  <li class="nav-item">
		  			<span class="text-white nav-link">Hello!, ${login.NICKNAME } <a href="#" id="logout">Sign Out</a></span>
		  		  </li>
		  		</c:otherwise>
		  	</c:choose>
		  	</ul>
		  </div>
	  	</div>
	</nav>
</header>

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
			window.history.back();
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