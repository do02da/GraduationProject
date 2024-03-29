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

    <!-- Custom styles for this page -->
    <link href="<c:url value='/css/user.css'/>" rel="stylesheet">
  </head>
  <body class="text-center">

<%@ include file="/WEB-INF/jsp/navbar.jsp" %>

	<main role="main">
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
	        <!-- <a class="text-muted" id="openInquiry" href="#this">아이디 찾기</a>&ensp;  -->
	        <a class="text-muted" id="toReg" href="#this">회원가입</a>
	        <!-- <div class="checkbox mb-3">
		      <label>
		        <input type="checkbox" value="remember-me"> Remember me
		      </label>
	        </div> -->
	        <a class="btn btn-lg btn-primary btn-block mt-3" id="login_submit" role="button">로그인</a>
	        <p class="mt-5 mb-3 text-muted">&copy; 2020</p>
	      </form>
	    </div>
	  </div>
  </main>
  
  <%@ include file="/WEB-INF/jsp/footer.jsp" %>
  
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
    	const str_dangerAlert = "<div class='alert alert-danger' role='alert' id='dangerAlert'><svg width='1em' height='1em' viewBox='0 0 16 16' class='bi bi-exclamation-circle-fill' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z'/></svg>&nbsp;";
		
			var isNotEmailEmpty = false;
			var isNotPWEmpty = false;
			
    	$(document).ready(function() {
    		$("#toBoard").on("click", function(e) {
    			e.preventDefault();
    			fn_openBoard();
    		});
    		
    		// 아이디찾기
    		$("#openInquiry").on("click", function(e) {
    			e.preventDefault();
    			fn_menumove("user/IDinquiry");
    		});
    		
    		// 회원가입
    		$("#toReg").on("click", function(e) {
    			e.preventDefault();
    			fn_menumove("user/reg");
    		});
    		
				$("#inputPassword").keypress(function (e){
						if (e.which === 13) {	// Enter 키 눌렸을 때
							e.preventDefault();
							fn_pwVaildation(this);
							fn_validation();
						}
				});
    		
    		// 이메일 포커스가 해제 됬을 때
       		$("#inputEmail").blur(function() {
       			const emailReg = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;	// 이메일 정규표현식
       			var str_fail = str_dangerAlert;
       			
       			$("#alertDiv").children().remove();
       			if ($(this).val() == "") {	// 이메일이 비어있을 때
    					str_fail += "이메일을 입력해주세요</div>";
       			} else if (!emailReg.test($("#inputEmail").val())) {	// 이메일 양식에 맞지 않으면
       				str_fail += "이메일을 확인해주세요</div>";
    				} else {
    					isNotEmailEmpty = true;
    					return true;
    				}
       			
       			$("#alertDiv").append(str_fail);
       			isNotEmailEmpty = false;
       		});
        		
     		// 비밀번호 포커스 해제
     		$("#inputPassword").blur(function() {
					fn_pwVaildation(this);
     		});
    		
    		$("#login_submit").on("click", function(e){
    			e.preventDefault();
    			fn_validation()
    		});
    		
    	});	// document ready end
    	
			function fn_openBoard() {
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/openAlbumBoard.do' />");
				comSubmit.submit();
			}
    	
    	function fn_pwVaildation(form){
   			// 비밀번호가 비어있으면
				if ($(form).val() == "") {
					$("#alertDiv").children().remove();
					var str = str_dangerAlert + "비밀번호를 입력해주세요</div>";
					$("#alertDiv").append(str);
				} else {
					isNotPWEmpty = true;
					return true;
				}
    	}
    	
    	function fn_validation() {
    		if (isNotEmailEmpty) {
    			if (isNotPWEmpty) {
    				var comSubmit = new ComSubmit("frm");
						comSubmit.setUrl("<c:url value='/user/userLogin.do' />");
						comSubmit.submit();
    			} else {	// isNotPWEmpty == false
    				alert("비밀번호를 입력해주세요");
    			}
    		} else {	// isNotEmailEmpty == false
    			alert("이메일을 입력해주세요");
    		}
    	}
    	
			function fn_menumove(go) {
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/menuMove.do?go=" + go + "' />");
				comSubmit.submit();
			}
    </script>
</body>
</html>
