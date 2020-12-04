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
		
		div.container-fluid {
			height: 90vh;
		}
		
		footer {
			position: absolute;
			bottom: 0;
		}
		
		#map {
			width: 100%;
			height: 100%;
		}
		
		#list_wrap {
			visibility:hidden;
			position:absolute;
			top:0;
			left:0;
			bottom:0;
			width:250px;
			margin:70px 0 70px 20px;
			padding:5px;
			overflow-y:auto;
			background:rgba(255, 255, 255, 0.7);
			z-index: 1;
			font-size:12px;
			border-radius: 10px;}
	</style>
	<!-- 네이버맵 클라이언트 아이디 입력 -->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=s56b4f2jk4"></script>
</head>

<body>
	<%@ include file="/WEB-INF/jsp/navbar.jsp" %>

	<div class="container-fluid">
		<div id="map"></div>
		
		<div id="list_wrap" id="list_wrap">
			<div class="list-group" id="Place_list"></div>
		</div>
	</div>
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
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	
	<script>
		$(document).ready(function() {
			fn_setMarkers();
			fn_setMarkerEvent();
		});
		
		function fn_setMarkers() {
			<c:forEach var="data" items="${data.result}">
				var marker = new naver.maps.Marker({
					position: naver.maps.LatLng(${data.LAT_1}, ${data.LNG_1}),
					map: map
				});
				Markers.push(marker);
				
				if (${data.LNG_2} != '0.0') {
					var marker = new naver.maps.Marker({
						position: naver.maps.LatLng(${data.LAT_2}, ${data.LNG_2}),
						map: map
					});
					Markers.push(marker);
				}
				
				if (${data.LNG_3} != '0.0') {
					var marker = new naver.maps.Marker({
						position: naver.maps.LatLng(${data.LAT_3}, ${data.LNG_3}),
						map: map
					});
					Markers.push(marker);
				}
				
				if (${data.LNG_4} != '0.0') {
					var marker = new naver.maps.Marker({
						position: naver.maps.LatLng(${data.LAT_4}, ${data.LNG_4}),
						map: map
					});
					Markers.push(marker);
				}
				
				if (${data.LNG_5} != '0.0') {
					var marker = new naver.maps.Marker({
						position: naver.maps.LatLng(${data.LAT_5}, ${data.LNG_5}),
						map: map
					});
					Markers.push(marker);
				}
			</c:forEach>
		}
		
		function fn_setMarkerEvent() {
			for (var i=0, ii=Markers.length; i<ii; i++) {
			    naver.maps.Event.addListener(Markers[i], 'click', function(e) {
					var listStr = "";
					
					for (m=0; m<Markers.length; m++) {
						Markers[m].setAnimation(null);
					}
					
					e.overlay.setAnimation(naver.maps.Animation.BOUNCE);
					
					var lat = e.overlay.getPosition().lat();
					var lng = e.overlay.getPosition().lng();
					
					$.ajax({
					      type: 'POST',
					      url : "<c:url value='/map/getItemList.do'/>",
					      data: {
					   	  	lat:lat,
					    	lng:lng
					      },
					      success : function(data){
					    	  if (data.length > 0) {
					    		  $("#Place_list").empty();
					    		  
					    		  for (j=0; j < data.length; j++) {
					    			  fn_writeLItemToList(data[j], j);
					    		  }
					 		     
					 		     $(".list-Item-Event").on("click", function(e) {
					 		    	console.log($(this).find($(".B_ID")).val());
					 		 		var comSubmit = new ComSubmit();
					 				comSubmit.setUrl("<c:url value='/board/openBoardDetail.do' />");
					 		 		comSubmit.addParam("B_ID", $(this).find($(".B_ID")).val());
					 				comSubmit.submit();
					 		     });
					    	  }
					      }
					});
				     
			    });
			}
		}
		
		function fn_writeLItemToList(item, j) {
			var listStr = "";
			
			listStr += "<a href='#' class='list-Item-Event list-group-item list-group-item-action'>"
			     + "<input type='hidden' class='B_ID' name='PARENT_ID' value='" + item.PARENT_ID + "'>"
			     + "<div class='d-flex w-100 justify-content-between'>"
			     + "<h5 class='mb-1'>" + item.TITLE + "</h5>"
			     + "</div>"
			     + "</a>";
			     
		     $("#list_wrap").css("visibility", "visible");
		     $("#Place_list").append(listStr);
		}
		
	</script>
</body>
</html>	