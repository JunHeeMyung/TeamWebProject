<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=878435cb63e52c1306f3d3ab856fc153"></script>
<style>
h1 {
	text-align: center;
}
</style>
<script>
$(()=>{
   if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(pos => {

         /* 위도 경도 받기 */
         var latitude = pos.coords.latitude, longitude = pos.coords.longitude;
         var location = new kakao.maps.LatLng(latitude, longitude);
         
         $("#latitude").val(latitude);
         $("#longitude").val(longitude);
      })
   } else {
      alert("지원하지않는 브라우져입니다");
   }
})



</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>ZUMUNIYO</h1>
	<hr>
	<form action="/shopList.do" method="get">
		<input type="text" id="latitude" name="latitude">
		<input type="text" id="longitude" name="longitude">
		<input type="submit" value="검색하기">
	</form>
	<h2>매장정보</h2>
	<br>
	<br>
	<table>
		<tr>
			<td>순서</td>
			<td>매장이름</td>
			<td>상세보기</td>
			
		</tr>
		<tr>
		<td>${shoplists.shop_name}</td>
		</tr>
		<c:forEach items="${shoplist}" var="shop" varStatus="status">
		<tr>
		<td>${shop.shop_seq}</td>
		<td>${shop.shop_name}</td>
		<td><input type="button" id="btn1" value="상세보기"></td>
		</tr>
		</c:forEach>
	</table>


</body>
</html>