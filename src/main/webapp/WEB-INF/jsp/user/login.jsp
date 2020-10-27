<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko" class="fade-in">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.1.1">
    <title>(Before + After)Trip</title>

	<%@ include file="/WEB-INF/include/include-header.jspf" %>
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this page -->
    <link href="<c:url value='/css/user.css'/>" rel="stylesheet">
  </head>
  <body class="text-center">

  <div class="container-fluid">
    <div class="alertDiv" id="alertDiv"></div>
	
    <div class="content">
      <form class="form-signin">
	    <!-- 로고  <img class="mb-4" src="" alt="" width="72" height="72"> -->
        <h1 class="h3 mb-3 font-weight-normal"><a href="<c:url value='/menuMove.do?go=AlbumBoard'/>">(Before + After)Trip</a></h1>
        <label for="inputEmail" class="sr-only">이메일 주소</label>
        <input type="email" id="inputEmail" class="form-control" placeholder="이메일 주소" required>
        <label for="inputPassword" class="sr-only">비밀번호</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="비밀번호" required>
        <a class="text-muted" href="<c:url value='/menuMove.do?go=AlbumBoard'/>">아이디 찾기</a>
        <a class="text-muted" href="<c:url value='/menuMove.do?go=user/reg'/>">회원가입</a>
        <div class="checkbox mb-3">
	      <label>
	        <input type="checkbox" value="remember-me"> Remember me
	      </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit" id="login_submit">로그인</button>
        <p class="mt-5 mb-3 text-muted">&copy; 2020</p>
      </form>
    </div>
  </div>    
    
    <script type="text/javascript">
    	$(document).ready(function() {
    		$("#login_submit").on("click", function(e){
    			e.preventDefault();
    			fn_validation()
    		});
    	});
    	
    	function fn_validation() {
    		var str_dangerAlert = "<div class='alert alert-danger' role='alert' id='dangerAlert'><svg width='1em' height='1em' viewBox='0 0 16 16' class='bi bi-exclamation-circle-fill' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z'/></svg>&nbsp;";
    		var emailReg = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
    		
				// 이메일이 비어있으면
				if ($("#inputEmail").val() == "") {
					$("#alertDiv").children().remove();
					var str = str_dangerAlert + "이메일을 입력해주세요</div>";
					$("#alertDiv").append(str);
					$("#inputEmail").focus();
					return false;
				} else if (!emailReg.test($("#inputEmail").val())) {	// 이메일 양식에 맞지 않으면
					$("#alertDiv").children().remove();
					var str = str_dangerAlert + "이메일을 확인해주세요</div>";
					$("#alertDiv").append(str);
					$("#inputEmail").focus();
					return false;
				}
				
				// 비밀번호가 비어있으면
				if ($("#inputPassword").val() == "") {
					$("#alertDiv").children().remove();
					var str = str_dangerAlert + "비밀번호를 입력해주세요</div>";
					$("#alertDiv").append(str);
					$("#inputPassword").focus();
					return false;
				}
				
				
    	}
    </script>
</body>
</html>
