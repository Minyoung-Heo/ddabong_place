<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.maint1 {
	border: 1px solid #FF8C00;
	border-radius: 40px !important;
	width: 500px;
}

.cname {
	font-size: 2.5em;
	margin-bottom: 20px;
}

.cdate {
	color: red;
}

.timg {
	width: 120px;
	height: 120px;
	margin-left: 20px;
	overflow: hidden;
}

.timg img {
	max-width: 100%;
	max-height: 100%;
}

.cont {
	width: 350px;
	height: 150px;
	margin-left: 50px;
	padding: 0;
}

.cont th {
	margin: 0;
	padding: 0;
}

.buttons {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 10px;
}

.buttons input[type="button"] {
	background-color: gray;
	border: none;
	border-radius: 5px;
	color: white;
	padding: 10px 20px;
	cursor: pointer;
	font-weight: bold;
	width: 100px;
	margin-right: 10px;
}

.buttons input[type="button"]:hover {
	background-color: #FF8C00;
}

#map-container {
	text-align: center;
}

#map {
	width: 500px;
	height: 400px;
	display: none;
	margin: 20px auto;
	margin-top: 20px;
}

h2 {
	margin-top: 20px;
	display: none;
}

h5 {
	margin-top: 20px;
	display: none;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="BZ">
	<c:forEach items="${ReservationList}" var="reserv">
		<h1>예약 현황</h1>
				<table class="maint1" align="center">
					<tr>
						<th>
							<div class="timg">
								<img src="/dda/image/스벅.png" alt="스벅 이미지">
							</div>
						</th>
						<th>
							<table class="cont">
								<tr>
									<th class="cname">${personal.name}</th>
								</tr>
								<tr>
									<th class="cdate">2023.10.18 · 오후 7시 · 4명</th>
								</tr>
								<tr>
									<th>예약 번호 : [01234567]</th>
								</tr>
								<tr>
									<th>전화번호 : 02-333-8161</th>
								</tr>
							</table>
						</th>
						<th>
							<div class="buttons">
								<input type="button" value="매장 보기"> <input type="button"
									value="지도 보기"> <input type="button" value="예약 취소">
							</div>
						</th>
					</tr>
				</table>
				<div id="map-container">
					<h2>매장 위치 확인</h2>
					<div id="map" style="width: 500px; height: 400px; display: none;"></div>
					<h5>서울 마포구 동교로 23길 64</h5>
				</div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8fc3585ad5a21392e7cb628332db3e4c&libraries=services"></script>

				<script>
					var mapVisible = false;
					var map;

					function toggleMap() {
						var mapContainer = document.getElementById('map');
						var h2 = document.querySelector('h2');
						var h5 = document.querySelector('h5');
						if (!mapVisible) {
							mapContainer.style.display = 'block';
							h2.style.display = 'block';
							h5.style.display = 'block';
							mapVisible = true;
							initMap();
						} else {
							mapContainer.style.display = 'none';
							h2.style.display = 'none';
							h5.style.display = 'none';
							mapVisible = false;
						}
					}
					var findStoreButton = document
							.querySelector('input[value="지도 보기"]');
					findStoreButton.addEventListener('click', toggleMap);

					var infowindow = new kakao.maps.InfoWindow({
						zIndex : 1
					});

					var mapContainer = document.getElementById('map');
					var mapOption = {
						center : new kakao.maps.LatLng(37.566826, 126.9786567),
						level : 3
					};

					function initMap() {
						map = new kakao.maps.Map(mapContainer, mapOption);
						var ps = new kakao.maps.services.Places();

						ps.keywordSearch('연남5701', placesSearchCB);
					}

					function placesSearchCB(data, status, pagination) {
						if (status === kakao.maps.services.Status.OK) {
							var bounds = new kakao.maps.LatLngBounds();

							for (var i = 0; i < data.length; i++) {
								displayMarker(data[i]);
								bounds.extend(new kakao.maps.LatLng(data[i].y,
										data[i].x));
							}

							map.setBounds(bounds);
						}
					}

					function displayMarker(place) {
						var marker = new kakao.maps.Marker({
							map : map,
							position : new kakao.maps.LatLng(place.y, place.x)
						});

						kakao.maps.event
								.addListener(
										marker,
										'click',
										function() {
											infowindow
													.setContent('<div style="padding:5px;font-size:12px;">'
															+ place.place_name
															+ '</div>');
											infowindow.open(map, marker);
										});
					}

					initMap();
				</script>
		</c:forEach>
	</div>
</body>
</html>