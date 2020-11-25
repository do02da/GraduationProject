<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

	<!-- 지도 Modal -->
	<div class="modal fade" id="MapModal" tabindex="-1" aria-labelledby="MapModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title sr-only" id="MapModalLabel">장소 선택</h5>
	        <div class="input-group">
	        	<div class="input-group-prepend">
	        		<button class="btn btn-outline-secondary">
		        	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
							  <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
							</svg>
							</button>
	        	</div>
		        <input type="text" class="form-control">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
	        </div>
	      </div>
	      <div class="modal-body">
	      	<div class="container-fluid">
	      		<div class="row">
	      			<div class="col-md-8 order-md-2" style="height:500px;">
								<div id="Modal_Map_Panel" style="width:100%; height:100%;">
		      			</div>
							</div>
	      			
	      			<table class="col-md-4" style="width:100%; height:500px">
	      				<tbody>
		      				<tr>
		      					<td class="text-center">
		      						<svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-geo-alt" fill="#AAAAAA" xmlns="http://www.w3.org/2000/svg">
											  <path fill-rule="evenodd" d="M12.166 8.94C12.696 7.867 13 6.862 13 6A5 5 0 0 0 3 6c0 .862.305 1.867.834 2.94.524 1.062 1.234 2.12 1.96 3.07A31.481 31.481 0 0 0 8 14.58l.208-.22a31.493 31.493 0 0 0 1.998-2.35c.726-.95 1.436-2.008 1.96-3.07zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
											  <path fill-rule="evenodd" d="M8 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
											</svg><br/>
			      					<small class="text-muted">
					      				장소를 검색하거나, 마커를 이용해 직접 장소를 표시해주세요.
					      			</small>
		      					</td>
		      				</tr>
	      				</tbody>
	      			</table>
	      			
	      		</div>
	      	</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="Map_Confirm">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 네이버맵 클라이언트 아이디 입력 -->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=s56b4f2jk4&submodules=geocoder"></script>
	<script>
	var mapOptions = {
			center: new naver.maps.LatLng(37.3595704, 127.105399),
			zoom: 10,
			logoControlOptions: naver.maps.Position.CENTER
		};
	
		var ModalMap;
		
		var Markers = [];
		
		var marker = new naver.maps.Marker();
		
		var infoWindow = new naver.maps.InfoWindow({
				borderColor: "#AAAAAA",	// 정보 창의 테두리 색상
		});
	</script>
	
	<script>
		$("#Map_Confirm").on("click", function(e) {
			if (marker.getPosition() !== null) {
					User_Place_LatLng = new naver.maps.LatLng(marker.getPosition().lat(), marker.getPosition().lng());
					
					// $("#Map_Shown_Div").css("height", "10rem");
					$("#Lat").val(marker.getPosition().lat());
					$("#Lng").val(marker.getPosition().lng());
					
					var Post_mapOptions= {
						center: User_Place_LatLng,
					  draggable: false,							// 마우스 또는 손가락을 이용한 지도 이동 여부
						zoom: 12
					};
					
					// $("#test").html("<img src='https://naveropenapi.apigw.ntruss.com/map-static/v2/raster-cors?w=1024&h=300&markers=type:a|pos:" + marker.getPosition().lng() + "%20" + marker.getPosition().lat() + "|label=a&X-NCP-APIGW-API-KEY-ID=s56b4f2jk4' style='width:100%;'>");
					/*
					var Map_In_Shown_Div = new naver.maps.Map(document.getElementById('Map_Shown_Div'), Post_mapOptions);
					
					var Post_Marker = new naver.maps.Marker({
							position: User_Place_LatLng,
					    map: Map_In_Shown_Div,
					});
					*/
			}
			
			// Modal 사라지게 하기. 사라지면 이벤트 발생.
			$('#MapModal').modal('hide')
		});
		
		// Modal 열릴 때
		$('#MapModal').on('shown.bs.modal', function (e) {
				ModalMap = new naver.maps.Map(document.getElementById('Modal_Map_Panel'), mapOptions);
				
				naver.maps.Event.addListener(ModalMap, 'click', function(e) {
						marker.setMap(ModalMap);		// 마커 맵에 등록
				    marker.setPosition(e.coord);

				    searchCoordinateToAddress(e.coord);
				});
		});
		
		// Modal 사라질 때 : 확인 버튼 누를 때, Modal 외 화면 누를 때
		$('#MapModal').on('hidden.bs.modal', function (e) {
			// 마커 초기화
			marker.setMap(null);				// 마커 지도에서 제거
			infoWindow.close();					// 정보 창 닫기
			marker.setPosition(null);		// 마커 좌표 삭제
		});
		
		function searchCoordinateToAddress(latlng){
		    naver.maps.Service.reverseGeocode({
		        coords: latlng,
		        orders: [
		            naver.maps.Service.OrderType.ADDR,
		            naver.maps.Service.OrderType.ROAD_ADDR
		        ].join(',')
		    }, function(status, response) {
		        if (status === naver.maps.Service.Status.ERROR) {
		            return alert('Something Wrong!');
		        }

		        var items = response.v2.results,
		            address = '',
		            htmlAddresses = [];

		        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
		            item = items[i];
		            address = makeAddress(item) || '';
		            addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';

		            htmlAddresses.push(addrType +' '+ address);
		        }

		        infoWindow.setContent([
		        		'<div class="p-2">',
		            '<div class="input-group">',
				        '<input class="form-control" type="text" id="Place" placeholder="위치명을 입력하세요.">',
				        '<button class="btn btn-light input-group-append" id="Marker_Add">추가</button></div>',
				        '<small class="text-muted">',
		            htmlAddresses.join('<br />'),
		            '</small></div>'
		        ].join('\n'));

		        infoWindow.open(ModalMap, marker);
		        
						$("#Marker_Add").on("click", function(e) {
							if (!$("#Place").val()) {
								
							}
						});
		    });
		}
		

		function makeAddress(item) {
		    if (!item) {
		        return;
		    }

		    var name = item.name,
		        region = item.region,
		        land = item.land,
		        isRoadAddress = name === 'roadaddr';

		    var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';

		    if (hasArea(region.area1)) {
		        sido = region.area1.name;
		    }

		    if (hasArea(region.area2)) {
		        sigugun = region.area2.name;
		    }

		    if (hasArea(region.area3)) {
		        dongmyun = region.area3.name;
		    }

		    if (hasArea(region.area4)) {
		        ri = region.area4.name;
		    }

		    if (land) {
		        if (hasData(land.number1)) {
		            if (hasData(land.type) && land.type === '2') {
		                rest += '산';
		            }

		            rest += land.number1;

		            if (hasData(land.number2)) {
		                rest += ('-' + land.number2);
		            }
		        }

		        if (isRoadAddress === true) {
		            if (checkLastString(dongmyun, '면')) {
		                ri = land.name;
		            } else {
		                dongmyun = land.name;
		                ri = '';
		            }

		            if (hasAddition(land.addition0)) {
		                rest += ' ' + land.addition0.value;
		            }
		        }
		    }

		    return [sido, sigugun, dongmyun, ri, rest].join(' ');
		}

		function hasArea(area) {
		    return !!(area && area.name && area.name !== '');
		}

		function hasData(data) {
		    return !!(data && data !== '');
		}

		function checkLastString (word, lastString) {
		    return new RegExp(lastString + '$').test(word);
		}

		function hasAddition (addition) {
		    return !!(addition && addition.value);
		}
	</script>