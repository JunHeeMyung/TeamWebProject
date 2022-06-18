<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="${page}/view/common/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=878435cb63e52c1306f3d3ab856fc153&libraries=services"></script>


<title>기본 디자인</title>
<style>

body, html {
	height:100%;
	width:100%;
	padding: 0px auto;
	margin: 0px auto;
	background-color: #F3F3F3;
}

div {
	padding: 0px;
	margin: 0px;
}


@media (min-width: 800px){

#wrapper {
	height:100%;
	width: 800px;
	margin: 0px auto;
	text-align: center;
	background-color: rgba(255, 255, 255);
}

}

@media (max-width: 800px){

#wrapper {
	height:100%;
	width: 100%;
	margin: 0px auto;
	text-align: center;
	background-color: rgba(255, 255, 255);
}

}

#mainframe {
	width: 100%;
	display : inline-block;
	margin: 0px auto;
	background-color: rgba(255, 255, 255);
	padding-top: 100px;
}





h1,body,header {
  margin: 0 auto;
}
table {
	margin: 0 auto;
	width: 60%;
}

h1 {
	/* background-color: #EF4F4F; */
  color: black;
  text-align: center;
}

h1:hover {
	color: #EF4F4F;
}

footer{
	margin: 0 auto;
	width: 40%;
}

h2 {
	margin: 0 auto;
	width: 60%;
}

.shopcat{
 	display: flex;
	width: 60%;
    margin: 0 auto;
    justify-content: space-around;
}

.hd {
	background-color: skyblue;
}

img {
	width: 80%;
}
.form-group{
display: flex;
justify-content: center
}

.form-control{
width: 30%;
margin-left: 0;
margin-right: 0;
}

</style>
<script type="text/javascript">

</script>
<script>

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

<div id="wrapper" class="shadow">
<div id="mainframe">
<h2>매장 등록</h2>
<!-- 입력 -->
<div id="contents">
<form action="${path}/shop/shopInsert.do"   method="post" enctype="multipart/form-data">

<div class="form-group">
<label>매장이름</label>
<input class="form-control"  type="text" name="shop_name"> 
</div>

<label>주소</label><input id="addr" name="loc_addr" type="text" readonly="readonly"><input id="findaddr" type="button" value="주소검색">
<br>상세주소<input id="detailaddr" name="shop_addr_detail" type="text">
<!-- 위도(hidden): -->	<br> <input id="latitude" name="loc_lat" type="hidden" readonly="readonly">
<!-- 경도(hidden): --> 	<br><input id="longitude" name="loc_lon" type="hidden" readonly="readonly">

<select name="category_code">
<c:forEach var="categoryDTO" items="${categoryDTOs}" varStatus="status">
<option value="${categoryDTO.category_code}">${categoryDTO.category_name}</option>
</c:forEach>
</select>

<div class="form-group" >
 <br>
 <label>매장정보</label>
 <br>
 
<textarea class="form-control" id="content" name="shop_notice" cols="50" rows="8"><c:out value="${content}" /></textarea>
</div>


<!-- 이미지선택  -->
파일: <input type="file" name="photos"> <br> 

<!-- 버튼 선택 -->
<input class="btn btn-primary" type="submit" value="입력하기">
<input class="btn btn-secondary" type="reset" value="취소하기">
<!-- <input class="btn btn-secondary" type="button" value="목록보기" id="reviewAllList">구매내역으로 돌릴 id설정  -->
</form>

<script>


 //마이페이지으로 다시 반환시켜야됨
$(function(){
	$("#reviewAllList").click(function(){
		location.href="reviewAllList";
	});
});



</script>

</div>
</div>
</div>

</body>
</html>