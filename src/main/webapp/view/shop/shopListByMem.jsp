<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	width: 100%;
}

.tbl{
	width: 100%;
}

table {
     border-collapse: collapse;
     width: 100%;
}
 tr, td {
     padding: 10px;
     border-bottom: 1px solid #CD5C5C;
}
tr:hover { background-color: #F5F5F5; }

.tblname{
	width: 100px;
}

</style>
</head>
<body>

<div id="wrapper" class="shadow">
<div id="mainframe">
<h2>나의 매장 목록</h2>
<!-- 입력 -->
<div id="contents">

<table class="tbl">
<tr>
	<!-- <td>shop_seq</td>  -->
	<td class="tblname">매장이름</td>
	<td class="tblname">매장주소</td>
	<td class="tblname">상세주소</td>
	<!-- <td>mem_seq</td> -->
	<td class="tblname">매장사진</td>
	<td class="tblname">매장정보</td>
	<!-- <td>shop_status</td> -->
	<td class="tblname">수정</td>
	<td class="tblname">삭제</td>
	<td class="tblname">메뉴관리</td>
</tr>
<c:forEach items="${shopLists}" var="shoplist">
<tr>
	<%-- <td><a href="${path}/shop/shopDetail.do?shop_seq=${shoplist.shop_seq}">클릭</a></td> --%>
	<td>${shoplist.shop_name}</td>
	<td>${shoplist.loc_addr}</td>
	<td>${shoplist.shop_addr_detail}</td>
<%--<td>${shoplist.mem_seq}</td> --%>
	<td class="shopimg"><img src="${path}/images/${shoplist.shop_img}"></td>
	<%-- <td>${shoplist.shop_img}</td> --%>
	<td>${shoplist.shop_notice}</td>
	<td><input type="button" value="수정하기" onClick="location.href='${path}/shop/shopUpdate.do?shop_seq=${shoplist.shop_seq}'"></td>
<%--<td>${shoplist.shop_status}</td> --%>
	<td><input type="button" value="삭제하기" onClick="location.href='${path}/shop/shopDelete.do?shop_seq=${shoplist.shop_seq}'"> </td>	
	<td><input type="button" value="관리" onClick="location.href='${path}/menu/menuManage.do?shop_seq=${shoplist.shop_seq}'"></td>
</tr>
</c:forEach>
</table>









</div>
</div>
</div>

</body>
</html>