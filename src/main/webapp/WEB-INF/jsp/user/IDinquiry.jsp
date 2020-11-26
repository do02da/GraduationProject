<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="fade-in">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="김도영">
    <meta name="generator" content="Jekyll v4.1.1, Eclipse Photon">
    <title>(Before + After)Trip</title>

	<%@ include file="/WEB-INF/include/include-header.jspf" %>
	<link href="<c:url value='/css/user.css'/>" rel="stylesheet">
	    
</head>
<body>

<%@ include file="/WEB-INF/jsp/navbar.jsp" %>

	<main role="main" class="bg-light">
	  <div class="container-fluid">
	    <div id="alertDiv" class="w-100">
		    <c:if test="${not empty error}">
					<div class="alert alert-danger" role="alert" id="isIDalert">
					<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-exclamation-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					<path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
					</svg>&ensp;${error }
					</div>
				</c:if> 
	    </div>
		
	    <div class="content">
	      <form class="form-signin" id="frm">
		    <!-- 로고  <img class="mb-4" src="" alt="" width="72" height="72"> -->
	        <h1 class="h3 mb-3 font-weight-normal"><a href="#this" id="toBoard">(Before + After)Trip</a></h1>
	        <label for="inputEmail" class="sr-only">이메일 주소</label>
	        <input type="email" id="inputEmail" name="EMAIL" class="form-control" placeholder="이메일 주소" required>
	        <label for="inputPassword" class="sr-only">비밀번호</label>
	        <input type="password" id="inputPassword" name="PASSWORD" class="form-control" placeholder="비밀번호" maxlength="20" required>
	        <a class="text-muted" id="openInquiry" href="#this">아이디 찾기</a>&ensp;
	        <a class="text-muted" id="toReg" href="#this">회원가입</a>
	        <div class="checkbox mb-3">
	        </div>
	        <a class="btn btn-lg btn-primary btn-block" id="login_submit" role="button">아이디 찾기</a>
	        <p class="mt-5 mb-3 text-muted">&copy; 2020</p>
	      </form>
	    </div>
	  </div>
  </main>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>

</body>
</html>