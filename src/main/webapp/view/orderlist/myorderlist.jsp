<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
margin-bottom: 30px;
margin-top: 30px;
}

#ordertable td{


}

.orderdata td{
background-color: #ebddcc;
border-top: 1px solid black;
}

.orderdata{
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
margin-bottom: 30px;
}

.pagination {
 justify-content: center; 
}

.page-link{
 color : orange; 
}
#pagebtn5{
background-color: orange;
border: 1px solid orange;
}


</style>

<script>

var orderperpage = 5;
var maxpage = 1;
var curpage = 1;


function getContextPath() {
	  var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	  return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1));
};

function gopage(pagen){
	
	curpage=pagen;
	
	$("#pagebtn0").off("click");
	$("#pagebtn0").click(()=>{
		if(pagen-1<=0){
			alert("첫페이지 입니다.");
			return;
		}
		gopage(pagen-1);
	})
	$("#pagebtn1").off("click");
	$("#pagebtn1").html(pagen-4);
	$("#pagebtn1").click(()=>{
		gopage(pagen-4);
	})
	$("#pagebtn2").off("click");
	$("#pagebtn2").html(pagen-3);
	$("#pagebtn2").click(()=>{
		gopage(pagen-3);
	})
	$("#pagebtn3").off("click");
	$("#pagebtn3").html(pagen-2);
	$("#pagebtn3").click(()=>{
		gopage(pagen-2);
	})
	$("#pagebtn4").off("click");
	$("#pagebtn4").html(pagen-1);
	$("#pagebtn4").click(()=>{
		gopage(pagen-1);
	})
	$("#pagebtn5").off("click");
	$("#pagebtn5").html(pagen);
	$("#pagebtn5").click(()=>{
		gopage(pagen);
	})
	$("#pagebtn6").off("click");
	$("#pagebtn6").html(pagen+1);
	$("#pagebtn6").click(()=>{
		gopage(pagen+1);
	})
	$("#pagebtn7").off("click");
	$("#pagebtn7").html(pagen+2);
	$("#pagebtn7").click(()=>{
		gopage(pagen+2);
	})
	$("#pagebtn8").off("click");
	$("#pagebtn8").html(pagen+3);
	$("#pagebtn8").click(()=>{
		gopage(pagen+3);
	})
	$("#pagebtn9").off("click");
	$("#pagebtn9").html(pagen+4);
	$("#pagebtn9").click(()=>{
		gopage(pagen+4);
	})
	$("#pagebtn10").off("click");
	$("#pagebtn10").click(()=>{
		if(pagen+1>maxpage){
			alert("마지막페이지 입니다.");
			return;
		}
		gopage(pagen+1);
	})

	if($("#pagebtn1").html()*1<=0){
		$("#pagebtn1").css("display","none");
	}else{
		$("#pagebtn1").css('display','inline-block');
	}
	
	if($("#pagebtn2").html()*1<=0){
		$("#pagebtn2").css("display","none");
	}else{
		$("#pagebtn2").css('display','inline-block');
	}
	
	if($("#pagebtn3").html()*1<=0){
		$("#pagebtn3").css("display","none");
	}else{
		$("#pagebtn3").css('display','inline-block');
	}
	
	if($("#pagebtn4").html()*1<=0){
		$("#pagebtn4").css("display","none");
	}else{
		$("#pagebtn4").css('display','inline-block');
	}
	
	if($("#pagebtn6").html()*1>maxpage){
		$("#pagebtn6").css("display","none");
	}else{
		$("#pagebtn6").css('display','inline-block');
	}
	
	if($("#pagebtn7").html()*1>maxpage){
		$("#pagebtn7").css("display","none");
	}else{
		$("#pagebtn7").css('display','inline-block');
	}
	
	if($("#pagebtn7").html()*1>maxpage){
		$("#pagebtn7").css("display","none");
	}else{
		$("#pagebtn7").css('display','inline-block');
	}
	
	if($("#pagebtn8").html()*1>maxpage){
		$("#pagebtn8").css("display","none");
	}else{
		$("#pagebtn8").css('display','inline-block');
	}
	
	if($("#pagebtn9").html()*1>maxpage){
		$("#pagebtn9").css("display","none");
	}else{
		$("#pagebtn9").css('display','inline-block');
	}
	
	$("tr").css("display","none")
	$(".grouptr"+(5*(pagen-1)+1)).css("display","");
	$(".grouptr"+(5*(pagen-1)+2)).css("display","");
	$(".grouptr"+(5*(pagen-1)+3)).css("display","");
	$(".grouptr"+(5*(pagen-1)+4)).css("display","");
	$(".grouptr"+(5*(pagen-1)+5)).css("display","");
	
	
/* 	grouptr${cnt} */
	
}



$(()=>{
	$("#confirmbtn").click(()=>{
	
		location.href=getContextPath();
		
	})
	
	
	maxpage = (($("#maxtr").val()*1+4)/orderperpage);
	gopage(1);
	
	//alert(curpage+":"+maxpage);

	
})



</script>


</head>
<body>
<c:set var="page" value="1"/>


<c:set var="total" value="0"/>
<c:set var="isnotfirst" value="0"/>
<c:set var="group_seq" value="-1"/>
<c:set var="cnt" value="0"/>
<div id="wrapper" class="shadow">
<div id="mainframe">


<h2>내 주문 목록 보기</h2>

<table id="ordertable">
<c:forEach items="${orderlist}" var="order">
<c:if test="${group_seq ne order.ORDER_GROUP}">
<c:set var="cnt" value="${cnt+1}"/>
<c:if test="${isnotfirst eq 1}">
<tr class="grouptr${cnt-1}">
<td colspan="3" id="total">합계: <c:out value="${total}"/> 원</td>
</tr>
</c:if>
<c:set var="isnotfirst" value="1"/>
<c:set var="total" value="0"/>
<c:set var="group_seq" value="${order.ORDER_GROUP}"/>
<tr class="orderdata grouptr${cnt}">
<td id="lefttd">${order.SHOP_NAME}</td><td id="midtd">${order.ORDER_TABLENUM}번 테이블 (${order.ORDER_STATUS})</td><td id="righttd">${order.ORDER_DATE}</td>
</tr>
</c:if>
<tr class = "tabletop grouptr${cnt}">
<td rowspan="3"><img src='${path}/images/${order.MENU_IMG}' class="orderimg"></td><td colspan="1">[${order.MENU_CATEGORY}] ${order.MENU_NAME}<td rowspan="3"><a href='${path}/review/reviewInsert.do?menu_seq=${order.MENU_SEQ}'> [리뷰작성] </a></td>
</tr>
<tr class="grouptr${cnt}">
<td colspan="1">단가: ${order.MENU_PRICE} 원</td>
</tr>
<tr class="grouptr${cnt}">
<td colspan="1">수량: ${order.ORDER_COUNT} 개</td>
</tr>
<c:set var="total" value="${total+(order.MENU_PRICE*order.ORDER_COUNT)}"/>
</c:forEach>
<tr class="grouptr${cnt}">
<td colspan="3" id="total">합계: <c:out value="${total}"/> 원</td>
</tr>
</table>
<br>
<button id="confirmbtn" type="button" class="btn btn-dark">확인</button>
<ul class="pagination">
  <li class="page-item"><a id="pagebtn0" class="page-link" href="#" id="goprepage">Previous</a></li>
  <li class="page-item"><a id="pagebtn1" class="page-link" href="#"></a></li>
  <li class="page-item"><a id="pagebtn2" class="page-link" href="#"></a></li>
  <li class="page-item"><a id="pagebtn3" class="page-link" href="#"></a></li>
  <li class="page-item"><a id="pagebtn4" class="page-link" href="#"></a></li>
  <li class="page-item active"><a id="pagebtn5" class="page-link" href="#"></a></li>
  <li class="page-item"><a id="pagebtn6" class="page-link" href="#"></a></li>
  <li class="page-item"><a id="pagebtn7" class="page-link" href="#"></a></li>
  <li class="page-item"><a id="pagebtn8" class="page-link" href="#"></a></li>
  <li class="page-item"><a id="pagebtn9" class="page-link" href="#"></a></li>
  <li class="page-item"><a id="pagebtn10" class="page-link" href="#" id="gonextpage">Next</a></li>
</ul> 

<input type="hidden" id="maxtr" value="${cnt}">

</div>
</div>

</body>
</html>