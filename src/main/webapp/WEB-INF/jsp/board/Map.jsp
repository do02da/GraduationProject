<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta name="author" content="박건우">
    <meta name="generator" content="Eclipse Photon">
	<title>(Before + After)Trip</title>
	
	<%@ include file="/WEB-INF/include/include-header.jspf" %>
	<style>
		html, body{
			height: 100%;
		}
		
		body {
			padding-top:50px;
		}
		
		div.container {
			height: 80%;
		}
		
		footer {
			position: absolute;
			bottom: 0;
		}
		
		#map {
			width: 100%;
			height: 100%;
		}
	</style>
	<!-- 네이버맵 클라이언트 아이디 입력 -->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=s56b4f2jk4"></script>
</head>

<body>
	<%@ include file="/WEB-INF/jsp/navbar.jsp" %>
	
	<div class="container">
		<div id="map"></div>
	</div>
	
	${test.result }
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
	
		<script>
		var mapOptions = {
			center: new naver.maps.LatLng(37.3595704, 127.105399),
			zoom: 10,
		    
		    zoomControl: true,
		    zoomControlOptions: {
		        position: naver.maps.Position.TOP_RIGHT
		    }
		};
		var map = new naver.maps.Map(document.getElementById('map'), mapOptions);
		

		var Markers = [];
	</script>
	
	<script>
		var dataArr = [], dataObj;
	
		$(document).ready(function() {
			fn_setMarkers();
		});
		
		function fn_setMarkers() {
			<c:forEach var="data" items="${data.result}">
			var marker = new naver.maps.Marker({
				position: naver.maps.LatLng(${data.LAT_1}, ${data.LNG_1}),
				map: map
			});
			
			if (${data.LNG_2} != '0.0') {
				var marker = new naver.maps.Marker({
					position: naver.maps.LatLng(${data.LAT_2}, ${data.LNG_2}),
					map: map
				});
			}
			
			if (${data.LNG_3} != '0.0') {
				var marker = new naver.maps.Marker({
					position: naver.maps.LatLng(${data.LAT_3}, ${data.LNG_3}),
					map: map
				});
			}
			
			if (${data.LNG_4} != '0.0') {
				var marker = new naver.maps.Marker({
					position: naver.maps.LatLng(${data.LAT_4}, ${data.LNG_4}),
					map: map
				});
			}
			
			if (${data.LNG_5} != '0.0') {
				var marker = new naver.maps.Marker({
					position: naver.maps.LatLng(${data.LAT_5}, ${data.LNG_5}),
					map: map
				});
			}

			</c:forEach>
		}
	</script>
</body>
</html>	