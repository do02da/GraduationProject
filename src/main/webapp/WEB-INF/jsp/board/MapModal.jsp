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
	      <div>
	      
		      <div class="container">
		     		<div id="Markers_Div" class="row"></div>
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
	
		var ModalMap;								// Modal 맵
		
		var Markers = [];						// 마커 목록
		var Markers_Pin = [];
		
		var marker = new naver.maps.Marker();	// 마커
		
		var infoWindow = new naver.maps.InfoWindow({
				borderColor: "#AAAAAA",	// 정보 창의 테두리 색상
		});
	
	var j = 0;
	</script>
	
	<script>
		$("#Map_Confirm").on("click", function(e) {
					// Static Map
					var static_Map_Str = "<img src='https://naveropenapi.apigw.ntruss.com/map-static/v2/raster-cors?w=1024&h=300&"
					for (var a=1; a < Markers.length+1; a++) {
						static_Map_Str += "markers=type:n|size:mid|pos:";
						static_Map_Str += Markers[a-1].getPosition().lng() + "%20";	// %20 == 공백
						static_Map_Str += Markers[a-1].getPosition().lat();
						static_Map_Str += "|label:" + a + "&";
					}
					static_Map_Str += "X-NCP-APIGW-API-KEY-ID=s56b4f2jk4' style='width:100%;'>"
					$("#test").html(static_Map_Str);
					
			// Modal 사라지게 하기. 사라지면 이벤트 발생.
			$('#MapModal').modal('hide')
		});
		
		// Modal 열릴 때
		$('#MapModal').on('shown.bs.modal', function (e) {
				j = 0;
				Markers = [];
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
			$("#Markers_Div").empty();	// 마커 목록 다이브 초기화
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
		        
		        $("#Place").keypress(function (e){
								if (e.which === 13) {	// Enter 키 눌렸을 때
									e.preventDefault();
									Marker_tb_set();
								}
						});
		        
		        // 추가 버튼 클릭
						$("#Marker_Add").on("click", function(e) {
							Marker_tb_set();
						});
		    });
		}
		
		function Marker_tb_set() {
			if (Markers.length < 5) {
				if ($("#Place").val()) {
					var tbStr = "<table class='col-2 border m-2' id='tb_" + j + "'><tr><td class='pl-2 text-truncate' style='max-width: 150px;'>"
					+ "<svg width='1em' height='1em' viewBox='0 0 16 16' class='bi bi-geo-alt-fill' fill='currentColor' xmlns='http://www.w3.org/2000/svg'>"
					+ "<path fill-rule='evenodd' d='M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 0 0-6 3 3 0 0 0 0 6z'/>"
					+ "</svg> <small>"
					+ $("#Place").val() + "</small></td>"
					+ "<td class='text-right'><button class='btn Xbtn' role='button' id='XBtn_" + j + "' value='" + j + "'>"
					+ "<svg width='1em' height='1em' viewBox='0 0 16 16' class='bi bi-x' fill='currentColor' xmlns='http://www.w3.org/2000/svg'>"
					+ "<path fill-rule='evenodd' d='M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z'/>"
					+	"</svg></button></td>"
					+ "</tr></table>";
						
					$("#Markers_Div").append(tbStr);
					
					var NewMarker = new naver.maps.Marker({
						map: ModalMap,
						position: marker.getPosition(),
						title: $("#Place").val()
					});
					Markers_Pin.push(NewMarker);
					Markers.push(NewMarker);
					
					marker.setMap(null);
					marker.setPosition(null);
					infoWindow.close();
					
					$("#XBtn_" + j++).on("click", function(e) {
						e.preventDefault();
						fn_Xbtn($(this));
					});
				}
			} else {
				alert("마커는 5개까지만 만들 수 있습니다.");
			}
		}
		
		function fn_Xbtn(obj) {
			var tbId = obj.parent().find(".Xbtn").val();
			
			$("#tb_" + tbId).remove();			// 뷰에 목록 삭제
			
			delete Markers[tbId];						// tbId번 마커 삭제
			Markers_Pin[tbId].setMap(null);	// 맵에 찍혀있는 마커 삭제
			
			if (Markers.length > 1) {
				Markers = Markers.filter(function (item) {
					return item !== null && item !== undefined && item !== '';
					
				});
			} else {
				Markers = [];
			}
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