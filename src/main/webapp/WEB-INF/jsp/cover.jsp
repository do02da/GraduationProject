<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="fade-in">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="Author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors, 김도영">
	<meta name="generator" content="Jekyll v4.1.1, Eclipse Photon">
    
    <title>(Before + After)Trip</title>
	
	<!-- 후에 수정 -->
    <link rel="canonical" href="http://localhost/cover/">
	
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
    <link href="<c:url value='/css/cover.css'/>" rel="stylesheet">
  </head>
  <body class="text-center" style="background-image:url(<c:url value='/img/bgimg.jpg'/>)">
  <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    
  <header class="masthead mb-auto">
      <h3 class="masthead-brand">(Before + After)Trip</h3>
  </header>

  <main role="main" class="inner cover">
    <h1 class="cover-heading">환영합니다</h1>
    <p class="lead">Cover is a one-page template for building simple and beautiful home pages. Download, edit the text, and add your own fullscreen background photo to make it your own.</p>
    <p class="lead">
      <!-- <a href='<c:url value="/openBoard.do"/>' class='btn btn-lg btn-secondary'>들어가기</a>  -->
      <a href="#" id='openBoard' class='btn btn-lg btn-secondary'>들어가기</a>
    </p>
  </main>

  <footer class="mastfoot mt-auto">
    <div class="inner">
      <p>2020 졸업 작품, by 봄봄봄(<a href="https://github.com/wellcom8">@김도영</a>, <a href="#">@박건우</a>)</p>
    </div>
  </footer>
</div>

<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
	$(document).ready(function(){
		$('#openBoard').on('click', function(e) {
			e.preventDefault();
			$('html').addClass('fade-out');
			
			setTimeout(function() {
				window.location.replace("<c:url value='/menuMove.do?go=AlbumBoard'/>");
			}, 1500);
		});
	});
	

</script>
</body>
</html>
