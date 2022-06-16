<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="${page}/view/common/header.jsp"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<!-- JQUERY-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- FONTAWESOME -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

<title>매장 주인</title>
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
	padding-top: 250px;
}

#contents {

/* 알아서 */

}

tr {
	padding: 0px;
	margin: 0px;
}

td {
	padding: 10px;
	margin: 10px;
	border: 2px solid graytext;
}

table {	
	text-align: center;
	border : 1px;
	padding: 0px;
	margin: auto;	
}

</style>


</head>
<body>

<div id="wrapper" class="shadow">
<div id="mainframe">

<!-- 입력 -->
<div id="contents">

<table>
	<tr>	
		<td>리뷰 번호</td>
		<td>멤버 번호</td>
		<td>메뉴 번호</td>
		<td>맛 평가</td>
		<td>양 평가</td>
		<td>서비스 평가</td>
		<td>리뷰 내용</td>
		<td>리뷰 사진</td>
		<td>작성일자</td>
		<td>추천리뷰여부 (1/0)</td>
		<td>매장 번호</td>
		<td>메뉴 카테고리</td>
		<td>메뉴 이름</td>
		<td>메뉴 가격</td>
		<td>메뉴 사진</td>
		<td>메뉴 탑</td>
		<td>메뉴 정보</td>
		<td>메뉴 상태</td>	
	</tr>
	<c:forEach items="${reviewShopManager}" var="reviewShopM">
	<tr>
		<td>${reviewShopM.review_seq}</td>
		<td>${reviewShopM.mem_seq }</td>
		<td>${reviewShopM.menu_seq }</td>
		<td>${reviewShopM.review_taste }</td>
		<td>${reviewShopM.review_amount }</td>
		<td>${reviewShopM.review_service }</td>
		<td>${reviewShopM.review_content }</td>		
		<td><img src="${path}/images/${reviewShopM.review_img}"></td>
		<td>${reviewShopM.review_date }</td>
		<td>${reviewShopM.review_exposure }</td>
		<td>${reviewShopM.shop_seq}</td>
		<td>${reviewShopM.menu_category}</td>
		<td>${reviewShopM.menu_name}</td>
		<td>${reviewShopM.menu_price}</td>
		<td>${reviewShopM.menu_img}</td>
		<td>${reviewShopM.menu_top}</td>
		<td>${reviewShopM.menu_info}</td>
		<td>${reviewShopM.menu_status}</td>		
	
	</tr>
	</c:forEach>

</table>
<br> <br> <input type="button" id="btn1" value="뒤로가기"	onclick="location.href='${path}/';">

</div>
</div>
</div>
</body>
</html>