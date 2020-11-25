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
	      			<table style="width:200px; height:500px"class="col-4">
	      				<tbody>
		      				<tr>
		      					<td class="text-center">
		      						<svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-geo-alt" fill="#AAAAAA" xmlns="http://www.w3.org/2000/svg">
											  <path fill-rule="evenodd" d="M12.166 8.94C12.696 7.867 13 6.862 13 6A5 5 0 0 0 3 6c0 .862.305 1.867.834 2.94.524 1.062 1.234 2.12 1.96 3.07A31.481 31.481 0 0 0 8 14.58l.208-.22a31.493 31.493 0 0 0 1.998-2.35c.726-.95 1.436-2.008 1.96-3.07zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
											  <path fill-rule="evenodd" d="M8 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
											</svg><br/>
			      					<small class="text-muted" class="col-4">
					      				장소를 검색하거나, 마커를 이용해 직접 장소를 표시해주세요.
					      			</small>
		      					</td>
		      				</tr>
	      				</tbody>
	      			</table>

	      			<div style="width:500px; height:500px;" class="col-8" id="map">
	      			</div>
	      		</div>
	      	</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 네이버맵 클라이언트 아이디 입력 -->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=s56b4f2jk4"></script>
	<script>
		var mapOptions = {
			center: new naver.maps.LatLng(37.3595704, 127.105399),
			zoom: 10
		};
		var map = new naver.maps.Map(document.getElementById('map'), mapOptions);
	</script>