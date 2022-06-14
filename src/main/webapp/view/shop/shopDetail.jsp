<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="${page}/view/common/header.jsp"/>
<style>
h1,
body *  {
	outline: 1px solid lightblue;
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

.search{
	width: 422px;
	margin: 0 auto;
}

.hd {
	background-color: skyblue;
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
   
   $("allmenu").click(()=>{
	   
	   $.ajax({
			url: getContextPath()+"/보류",
			type: "get",
			data: { "shop_seq":"" },
			dataType: "text",
			success: data => {
				if (data == "인증성공") {
					clearInterval(timer);
					$("#mem_email").val(email_addr);
					$("#radio4").prop('checked', true).trigger('change');

				} else {

					$('#myModalTitle').html("인증 번호 확인");
					$('#myModalContent').html(data);
					$('#myModal').modal('show');

				}
				$('#confirm_btn').attr('disabled', false);
			},
			error: () => {
				alert("요청실패");
				$('#confirm_btn').attr('disabled', false);
			}
		})
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
   });
   
   
   
   
   
   
   
   
   
   
   
   
   
   
})
</script>
</head>
<body>
<div class="hd">
<h1>ZUMUNIYO</h1>
</div>
<form action="/shopList.do" method="get" class="search">
		<input type="text" id="latitude" name="latitude">
		<input type="text" id="longitude" name="longitude">
		<input type="submit" value="검색하기">
</form>
<h2>매장상세</h2>

	<div class="shopcat">
		<div class="topmenu">
			추천메뉴
		</div>
		<div class="allmenu">
			전체메뉴
		</div>
		<div class="review">
			리뷰
		</div>
		<div class="info">
			매장정보
		</div>
	</div>

	

<div id="hall">
<div class="shop-menu">
<table class = "mtbl">
<tr>
	<td>순서</td>
	<td>메뉴이미지</td>
	<td>메뉴이름</td>
	<td>메뉴가격</td>
	<td>메뉴소개</td>
</tr>
<c:forEach items="${menulist}" var="menu" varStatus="status">
		<tr>
		<td>${menu.menu_seq}</td>
		<td>${menu.menu_img}</td>
		<td>${menu.menu_name}</td>
		<td>${menu.menu_price}</td>
		<td>${menu.menu_info}</td>	
		</tr>
		</c:forEach>
</table>
</div>
<div class= "review-detail">
<table class = "rtbl">
<tr>
	<td>맛</td>
	<td>양</td>
	<td>서비스</td>
	<td>사진</td>
	<td>내용</td>
</tr>
<c:forEach items="${reviewShopList}" var="review" varStatus="status">
		<tr>
		<td>${review.review_taste}</td>
		<td>${review.review_amount}</td>
		<td>${review.review_service}</td>
		<td><img src="${path}/images/${review.review_img}"></td>
		<td>${review.review_content}</td>
		</tr>
		</c:forEach>
</table>
</div>
</div>




 <%-- <c:forEach items="${shopdetail}" var="detail" varStatus="status">
		<tr>
		<td>${detail.shop_seq}</td>
		<td>${detail.shop_name}</td>
		<td>${detail.loc_addr}</td>
		<td>${detail.shop_addr_detail}</td>
		<td>${detail.category_code}</td>
		<td>${detail.shop_img}</td>		
		</tr>
		</c:forEach>  --%>
</body>
</html>