<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZUMUNIYO</title>
</head>
<body>
 
 
 
index.jsp
<ul>
<li><a href="view/shop/shopList">모든 매장 조회</a></li>
</ul>
<ul>
<li><a href="${ path }/review/reviewAllList.zmny?shop_seq=3">모든 리뷰 조회</a></li>
</ul>

<ul>
<li><a href="view/menu/menuList.do">모든 메뉴 조회(관리자)</a></li>
</ul>

<ul>
<li><a href="view/menu/menuListShop.do">매장별 메뉴 조회</a></li>
</ul>

<hr>

<ul>
<li><a href="${ path }/menu/menuListAll.zmny?shop_seq=201&order_tablenum=1">QR찍었을때 처음가는 메뉴</a></li>
</ul>


<ul>
<li><a href="${ path }/menu/menuManage.do?shop_seq=201">메뉴관리 페이지</a></li>
</ul>





<%-- <ul>
<li><a href="${ path }/menu/menuInsert.do?shop_seq=3">메뉴추가 페이지</a></li>
</ul>
 --%>



</body>
</html>