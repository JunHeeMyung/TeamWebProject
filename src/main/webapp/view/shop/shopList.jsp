<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <jsp:include page="${page}/view/common/header.jsp" /> --%>
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
h1,
body *  {
	outline: 1px solid lightblue;
}

h1,h2,body,header {
  margin: 0;
  padding: 0;
 
}

table {
	margin: 0 auto;
	width: 60%;
}

header {
height: 15%,
	/* background-color: #EF4F4F; */
  	position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    background-color: #fff;
   	
   	  color: #EF4F4F;
  	text-align: center;
}

h1:hover {
	color: #e91515;
}

footer{
	margin-top: auto;
	text-align: center;
}

form {
	 /* height: (padding값으로 줄것) */
	 width: fit-content;
	 margin: 0 auto;
}


</style>

<script>

/* $(()=>{
	  $("header").hover(()=>{
		 $("h1").css({
			 font-color: "#EF4F4F"; 
	        }); */ 

</script>

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
	<header>
	<div class="hd"><h1>ZUMUNIYO</h1></div>
	</header>
	
<form action="/shopList.do" method="get">
		<input type="text" id="latitude" name="latitude">
		<input type="text" id="longitude" name="longitude">
		<input type="submit" value="검색하기">
</form>

	<h2>매장정보</h2>
	<br>
	<br>
	<table class= "cl">
		<tr>
			<td>순서</td>
			<td>매장사진</td>
			<td>매장이름</td>
			<td>상세보기</td>
			
		</tr>
		<tr>
		<td>${shoplists.shop_name}</td>
		</tr>
		<c:forEach items="${shoplist}" var="shop" varStatus="status">
		<tr>
		<td>${shop.shop_seq}</td>
		<td>${shop.shop_img}</td>
		<td>${shop.shop_name}</td>
		<td><input type="button" id="btn1" value="상세보기" onclick="location.href = '${path}/shop/shopDetail.do?shop_seq=${shop.shop_seq}'"></td>
		</tr>
		</c:forEach>
	</table>

<div id="test"></div>
 <footer id="info">
        <address>
           zumuniyo 개발팀 - 명준희 정영훈 이덕수 이정우
        </address>
    </footer>
</body>
</html>