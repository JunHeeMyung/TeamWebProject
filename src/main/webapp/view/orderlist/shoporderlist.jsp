<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>매장 주문 내역</title>
<style>

.ordertable{
width: 100%;
border: 1px solid orange;
}
.ordertable td{
border: 1px solid white;
}

.grouptable{
border: 1px solid black;
}

.ready{
background-color: pink;
}

.confirm{
background-color: green;
}

.done{
display: none;
}

.order_group{
width: 7%;
}

.table_num{
width: 8%;
}

.menu_name{
width: 30%;
}
.menu_price{
width: 10%;
}
.menu_count{
width: 5%;
}
.total{
width: 20%;
}
.order_status{
width: 20%;
}

.ordertable[orderstatus="주문대기"]{
background-color: white;
}
.ordertable[orderstatus="주문대기"] td{
border: 1px solid lightgray;
}

.ordertable[orderstatus="주문확인"]{
background-color: #FFCFCC;
}

#headerbox td{
border: 1px solid white;
}



.ordertable[choosed="true"]{
background-color: blue;
color: white;
}

.ordertable:hover{
cursor: pointer;
border: 1px solid blue;
}
#orderbox {
width: 100%;
height: 100%;
}





</style>
<script>

var choosedordergroup = -1;

$(()=>{
	
	$("table").click(function(){
	
		$("*").attr("choosed","false");
		$(this).attr("choosed","true");
		choosedordergroup = $(this).attr("ordergroup")*1;
		
	})
	

	
	
})



</script>
</head>
<body>


<div id="orderbox">
<c:set var="lastgroup" value="-1"/>
<c:forEach items="${orderlist}" var="order">

<c:choose>
<c:when test="${order.ORDER_GROUP ne lastgroup}">
<table class ="ordertable" ordergroup="${order.ORDER_GROUP}" choosed="false" orderstatus="${order.ORDER_STATUS}">
<c:set var="lastgroup" value="${order.ORDER_GROUP}"/>
<c:set var="listidx" value="0"/>
<tr>
<td class="order_group" rowspan="${order.CNT}">#${order.ORDER_GROUP}</td>
<td class="table_num" rowspan="${order.CNT}">${order.ORDER_TABLENUM} 번</td>
<td class="menu_name">[${order.MENU_CATEGORY}] ${order.MENU_NAME}</td><td class="menu_price">${order.MENU_PRICE} 원</td><td class="menu_count">${order.ORDER_COUNT} 개</td>
<td class="total" rowspan="${order.CNT}">${order.TOTAL} 원</td>
<td class="order_status" rowspan="${order.CNT}">${order.ORDER_DATE}<br>${order.ORDER_STATUS}</td>

</tr>
</c:when>	
<c:otherwise>
<c:set var="listidx" value="${listidx+1}"/>
<tr><td>[${order.MENU_CATEGORY}] ${order.MENU_NAME}</td><td>${order.MENU_PRICE} 원</td><td>${order.ORDER_COUNT} 개</td></tr>
</c:otherwise>
</c:choose>
<c:if test="${listidx eq order.CNT}">
</table>
</c:if>

</c:forEach>

</div>

</body>
</html>