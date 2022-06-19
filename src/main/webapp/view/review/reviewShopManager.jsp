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
<script src="https://cdnjs.cloudflare.com/ajax/libs/raty/3.1.1/jquery.raty.min.js"></script>



<style type="text/css">
#bestop{
position: static;
left: 0px;
top: 0px;

}



</style>

<script type="text/javascript">


$(()=>{
	$('div#star1').raty({
		score: function(evt) {            
            return $("#starRating1").val();
        }
		,width : 200
		,path : "${path}/view/review/img"
		,readOnly: true		
	});

	$('div#star2').raty({
		score: function(evt) {            
            return $("#starRating2").val();
        }
		,width : 200
		,path : "${path}/view/review/img"
		,readOnly: true
	});

	$('div#star3').raty({
		score: function(evt) {            
            return $("#starRating3").val();
        }
		,width : 200
		,path : "${path}/view/review/img"
		,readOnly: true
	});

	$('div#star4').raty({
		score: function(evt) {            
            return $("#starRating4").val();
        }
		,width : 200
		,path : "${path}/view/review/img"
		,readOnly: true
	});

	$('div#star5').raty({
		score: function(evt) {            
            return $("#starRating5").val();
        }
		,width : 200
		,path : "${path}/view/review/img"
		,readOnly: true
	});
});

/* 
function numberFormat(inputNumber) {
	   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	 */
</script>

</head>
<title>매장 주인</title>
<body> 
<!-- <div id="bestop">
<div id="wrapper" class="shadow">
<div id="mainframe">
<div id="contents"> -->
	<table class="table">	
	<tr>	
		<td>리뷰 번호</td>
		<!-- <td>멤버 번호</td> -->
		<!-- <td>메뉴 번호</td> -->
		<!-- <td>맛 평가</td>
		<td>양 평가</td>
		<td>서비스 평가</td> -->
		<td>리뷰 내용</td>
		<td>리뷰 사진</td>
		<td>작성일자</td>
		<!-- <td>추천리뷰여부 (1/0)</td> -->
		<!-- <td>매장 번호</td> -->
		<!-- <td>메뉴 카테고리</td> -->
		<td>메뉴 이름</td>
		<td>메뉴 가격</td>
		<!-- <td>메뉴 사진</td> -->
		<!-- <td>메뉴 탑</td> -->
		<!-- <td>메뉴 정보</td> -->
		<!-- <td>메뉴 상태</td> -->
		<td>평균별점</td>				
	</tr>
	<c:forEach items="${reviewShopManager}" var="reviewShopM">
	<c:set var="starCnt" value="${starCnt+1}"/>	
	<tr>
		<td>${reviewShopM.review_seq}</td>
		<%-- <td>${reviewShopM.mem_seq }</td> --%>
		<%-- <td>${reviewShopM.menu_seq }</td> --%>
		<%-- <td>${reviewShopM.review_taste }</td>
		<td>${reviewShopM.review_amount }</td>
		<td>${reviewShopM.review_service }</td> --%>
		<td>${reviewShopM.review_content }</td>		
		<td><img src="${path}/images/${reviewShopM.review_img}" width="250" height="250"></td>
		<td>${reviewShopM.review_date }</td>
		<%-- <td>${reviewShopM.review_exposure }</td> --%>
		<%-- <td>${reviewShopM.shop_seq}</td> --%>
		<%-- <td>${reviewShopM.menu_category}</td> --%>
		<td>${reviewShopM.menu_name}</td>
		<td>${reviewShopM.menu_price}</td>
		
	
		<%-- <td><img src="${path}/images/${reviewShopM.menu_img}"></td> --%>
		<%-- <td>${reviewShopM.menu_top}</td> --%>
		<%-- <td>${reviewShopM.menu_info}</td> --%>
		<%-- <td>${reviewShopM.menu_status}</td> --%>		 
		<%-- <td>${(reviewShopM.review_taste+reviewShopM.review_amount+reviewShopM.review_service)/3 }</td> --%>	
	 	<td><div  id="star${starCnt}"><input type="hidden" id="starRating${starCnt}" value="${(reviewShopM.review_taste+reviewShopM.review_amount+reviewShopM.review_service)/3}"/></div></td>
	 	<%-- <td><div class="form-group" id="star${starCnt}" ><input type="hidden" id="starRating${starCnt}" value="3"/></div></td> --%>		
	
	</tr>
	</c:forEach>
</table>
<%-- <br> <br> <input type="button" id="btn1" value="뒤로가기"	onclick="location.href='${path}/';"> --%>
<!-- 
</div>
</div>
</div>
</div> -->
</body>
</html>