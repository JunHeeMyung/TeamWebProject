<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>주변지도보기</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>

		$(() => {

			/* 카카오지도 설정 */
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(37.47226015848,126.88588356963), level: 3
			};
			var map = new kakao.maps.Map(container, options);


			
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(pos => {

					/* 위도 경도 받기 */
					var latitude = pos.coords.latitude, longitude = pos.coords.longitude;
					var location = new kakao.maps.LatLng(latitude, longitude);

					/* 중심이동 */
					map.setCenter(location)
				})
			} else {
				alert("지원하지않는 브라우져입니다");
			}

			/* 주변정보 마커 불러오기 */

			/*
					var markerPosition = new kakao.maps.LatLng(location.latitude, location.longitude);
					var marker = new kakao.maps.Marker({ position: markerPosition });
					marker.setMap(map);
			*/

		});

	</script>
</head>

<body>

	<div id="map" style="width:100%;height:97vh;"></div>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=878435cb63e52c1306f3d3ab856fc153"></script>

</body>

</html>