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

<title>주문결과</title>
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
	background-color: rgba(234, 228, 223);
}

}

@media (max-width: 800px){

#wrapper {
	height:100%;
	width: 100%;
	margin: 0px auto;
	text-align: center;
	background-color: rgba(234, 228, 223);
}

}

#mainframe {
	width: 100%;
	display : inline-block;
	margin: 0px auto;
	background-color: rgba(234, 228, 223);
	padding-top: 100px;
	text-align: center;
}
#ordertable{
display:inline-block;
border: none;
text-align: center;
padding: 30px;
border-radius: 30px;
background-color: rgba(255, 255, 255);
margin-bottom: 60px;
}

#ordertable td{


}

#orderdata td{
background-color: #ebddcc;
border-top: 1px solid black;
}

#orderdata{
height: 50px;
}
.tabletop{
border-top: 1px solid black;
}
#total{
border-top: 1px solid black;
height: 50px;
border-bottom: 1px solid black;
font-size: 20px;
}


#contents {

/* 알아서 */

}


#lefttd{
width: 200px;
}
#midtd{
width: 200px;
}
#righttd{
width: 200px;
}
.orderimg{
height: 100px;
width :100px;
}
#confirmbtn{
margin-top: 30px;
}

</style>

<script>

function getContextPath() {
	  var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	  return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1));
};

$(()=>{
	$("#confirmbtn").click(()=>{
	
		location.href=getContextPath();
		
	})
})



</script>


</head>
<body>
<c:set var="total" value="0"/>
<c:set var="cnt" value="1"/>
<div id="wrapper" class="shadow">
<div id="mainframe">

<h2>주문내역</h2>
<table id="ordertable">
<c:forEach items="${orderlist}" var="order">
<c:if test="${cnt eq 1}">
<tr id="orderdata">
<td id="lefttd">${order.SHOP_NAME}</td><td id="midtd">테이블: ${order.ORDER_TABLENUM}</td><td id="righttd">주문일: ${order.ORDER_DATE}</td>
</tr>
</c:if>
<tr class = "tabletop">
<td rowspan="3"><img src='${path}/images/${order.MENU_IMG}' class="orderimg"></td><td colspan="2">[${order.MENU_CATEGORY}] ${order.MENU_NAME}</td>
</tr>
<tr>
<td colspan="2">단가: ${order.MENU_PRICE} 원</td>
</tr>
<tr>
<td colspan="2">수량: ${order.ORDER_COUNT} 개</td>
</tr>
<c:set var="total" value="${total+(order.MENU_PRICE*order.ORDER_COUNT)}"/>
<c:set var="cnt" value="${cnt+1}"/>
</c:forEach>
<tr>
<td colspan="3" id="total">합계: <c:out value="${total}"/> 원</td>
</tr>
<tr><td colspan="3">
<button id="confirmbtn" type="button" class="btn btn-dark">확인</button>
</td>
</tr>
</table>
<br>


</div>
</div>

</body>
</html>