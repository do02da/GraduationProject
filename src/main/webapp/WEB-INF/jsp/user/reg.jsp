<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko" class="fade-in">
  <head>
  	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors, 김도영">
    <meta name="generator" content="Jekyll v4.1.1, Eclipse Photon">
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
  
	<%@ include file="/WEB-INF/jsp/navbar.jsp" %>
  
  	<main role="main">
		  <div class="container-fluid">
		  	<div id="alertDiv"></div>
			
		    <div class="content">
		   	  <form class="form-signin" id="frm">
			    <!-- 로고  <img class="mb-4" src="" alt="" width="72" height="72"> -->
		        <h1 class="h3 mb-3 font-weight-normal"><a href="<c:url value='/menuMove.do?go=AlbumBoard'/>">(Before + After)Trip</a></h1>
		        <label for="inputEmail" class="sr-only">이메일 주소</label>
		        <input type="email" id="inputEmail" name="EMAIL" class="form-control" placeholder="이메일 주소" required>
		        <label for="inputPassword" class="sr-only">비밀번호</label>
		        <input type="password" id="inputPassword" name="PASSWORD" class="form-control" placeholder="비밀번호" maxlength="20" required>
		        <input type="password" id="inputPasswordCheck" class="form-control" placeholder="비밀번호확인" maxlength="20" required>
		        <label for="inputNick" class="sr-only">닉네임</label>
		        <input type="text" id="inputNick" name="NICKNAME" class="form-control" placeholder="닉네임" required>
		        <br/>
		        <a href="#" class="btn btn-lg btn-primary btn-block" id="reg_submit" role="button">회원가입</a>
		        <p class="mt-5 mb-3 text-muted">&copy; 2020</p>
		      </form>
		    </div>
			</div>
		</main>
		
		<%@ include file="/WEB-INF/jsp/footer.jsp" %>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		const str_dangerAlert = "<div class='alert alert-danger' role='alert' id='dangerAlert'><svg width='1em' height='1em' viewBox='0 0 16 16' class='bi bi-exclamation-circle-fill' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z'/></svg>&nbsp;";
		const str_successAlert = "<div class='alert alert-success' role='alert' id='Alert'><svg width='1em' height='1em' viewBox='0 0 16 16' class='bi bi-check-circle-fill' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z'/></svg>&nbsp;";
		
		var isEmailChk = false;
		var isPWChk = false;
		var isNickChk = false;
		
		$(document).ready(function() {
 			// 이메일 포커스가 해제 됬을 때
   		$("#inputEmail").blur(function() {
   			var emailReg = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;	// 이메일 정규표현식
   			var emailValue = $(this).val();
   			var str_fail = str_dangerAlert;
   			$("#alertDiv").children().remove();
   			if (emailValue == "") {	// 이메일이 비어있을 때
					str_fail += "이메일을 입력해주세요</div>";
   			} else if (!emailReg.test(emailValue)) {	// 이메일 양식에 맞지 않으면
   				str_fail += "이메일을 확인해주세요</div>";
				} else if (fn_CheckEmail(emailValue) == false){
					str_fail += "중복된 이메일입니다.</div>";
				} else {
					var str_success = str_successAlert + "사용 가능한 이메일입니다.</div>";
					$("#alertDiv").append(str_success);
					isEmailChk = true;
					return true;
				}
   			
   			$("#alertDiv").append(str_fail);
				isEmailChk = false;
   		});
    		
   	// 비밀번호 포커스 해제
   		$("#inputPassword").blur(function() {
   			// 비밀번호가 비어있으면
				if ($(this).val() == "") {
					$("#alertDiv").children().remove();
					var str = str_dangerAlert + "비밀번호를 입력해주세요</div>";
					$("#alertDiv").append(str);
					return false;
				}
   		});
   		
   	// 비밀번호 확인 포커스 해제
   		$("#inputPasswordCheck").blur(function() {
   			// 비밀번호 확인이 비어있으면
   			if ($(this).val() == "") {
	   			$("#alertDiv").children().remove();
					var str = str_dangerAlert + "비밀번호 확인을 입력해주세요</div>";
					$("#alertDiv").append(str);
					isPWChk = false;
					return false;
   			} else if ($(this).val() != $("#inputPasswordCheck").val() ) {	// 비밀번호와 비밀번호 확인이 일치하지 않으면
   				$("#alertDiv").children().remove();
					var str = str_dangerAlert + "비밀번호가 일치하지 않습니다.</div>";
					$("#alertDiv").append(str);
					isPWChk = false;
					return false;
   			} else {
   				isPWChk = true;
   			}
   			
   		});
   		
   		$("#inputNick").blur(function() {
   			var str_fail = str_dangerAlert;
   			
   			$("#alertDiv").children().remove();
   			if ($(this).val() == "") {	// 닉네임이 비어있을 때
					str_fail += "닉네임을 입력해주세요</div>";
				} else if (fn_CheckNick($(this).val()) == false){
					str_fail += "중복된 닉네임입니다.</div>";
				} else {
					var str_success = str_successAlert + "사용 가능한 닉네임입니다.</div>";
					$("#alertDiv").append(str_success);
					isNickChk = true;
					return true;
				}
   			$("#alertDiv").append(str_fail);
				isNickChk = false;
   		});
    		
   		$("#reg_submit").on("click", function(e){
   			e.preventDefault();
   			fn_validation();
   		});
   		
   	});
    	
    	function fn_CheckEmail(Email) {
    		var isChecked;
    		
				// 이메일 중복체크
				$.ajax({
					type: "POST",
					data: {Email:Email},
					url: "<c:url value='/user/CheckEmail.do'/>",
					async: false,	// 동기식으로 처리
					success: function(GetIsChecked) {
						isChecked = GetIsChecked;
					},
					error: function() {
						alert("error");
					}
				});
				
				return isChecked;
    	}
    	
    	function fn_CheckNick(Nick) {
    		var isChecked;
    		
				// 닉네임 중복체크
				$.ajax({
					type: "POST",
					data: {Nick:Nick},
					url: "<c:url value='/user/CheckNick.do'/>",
					async: false,	// 동기식으로 처리
					success: function(GetIsChecked) {
						isChecked = GetIsChecked;
					},
					error: function() {
						alert("error");
					}
				});
				
				return isChecked;
    	}
			
			function fn_validation() {
				if (isEmailChk) {
					if (isPWChk) {
						if (isNickChk) {
							var comSubmit = new ComSubmit("frm");
							comSubmit.setUrl("<c:url value='/user/userReg.do' />");
							comSubmit.submit();
						} else {	// isNickChk == false
							alert("닉네임을 확인해주세요");
						}
					} else {	// isPWChk == false
						alert("비밀번호를 확인해주세요");
					}
				} else {	// isEmailChk == false
					alert("이메일을 확인해주세요");
				}
				
			}
	</script>
</body>
</html>
