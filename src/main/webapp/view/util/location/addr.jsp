<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소검색</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=878435cb63e52c1306f3d3ab856fc153&libraries=services"></script>
<script>
/* 참고 : https://postcode.map.daum.net/guide */
$(()=>{
	$("#findaddr").click(()=>{
		new daum.Postcode({
	        oncomplete: data=>{
	        	var geocoder = new daum.maps.services.Geocoder();
	        	var address = data.roadAddress||data.autoRoadAddress; 
	        	geocoder.addressSearch(address, (result, status)=> {
	   		     if (status === kakao.maps.services.Status.OK) {
	   		    	$("#addr").val(address);
	   		        $("#latitude").val(result[0].y);
	   		        $("#longitude").val(result[0].x);
	   		     };
	        });
	    }}).open();
	});
});

</script>
</head>
<body>

<form>
	주소: <input id="addr" type="text" readonly="readonly"><input id="findaddr" type="button" value="주소검색">
	<br>상세주소: <input id="detailaddr" type="text">
	<br>위도(hidden): <input id="latitude" type="text" readonly="readonly">
	<br>경도(hidden): <input id="longitude" type="text" readonly="readonly">
</form>

</body>
</html>