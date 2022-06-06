<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌표로주소얻기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=878435cb63e52c1306f3d3ab856fc153&libraries=services"></script>
<script>

$(()=>{
	$("#findaddr").click(()=>{
       	var geocoder = new kakao.maps.services.Geocoder();
       	var latitude = $("#latitude").val();
		var longitude = $("#longitude").val();
       	var coord = new kakao.maps.LatLng(latitude,longitude);
		geocoder.coord2Address(coord.getLng(),coord.getLat(),(result,status)=>{
			if (status === kakao.maps.services.Status.OK) {
				$("#addr").val(result[0].road_address.address_name);
	        };
		});
	});
});

</script>
</head>
<body>

<form>
	위도: <input id="latitude" type="text" value="37.47226015848">
	<br>경도: <input id="longitude" type="text" value="126.88588356963">
	<br>주소: <input id="addr" type="text" readonly="readonly"><input id="findaddr" type="button" value="주소검색">
</form>

</body>
</html>