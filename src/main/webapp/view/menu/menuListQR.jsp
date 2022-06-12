<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>menuListQR</title>


<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- <link rel="stylesheet" href="../css/common.css"> -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>




<style>
	table , td {
		border: 1px solid black; 
		border-collapse: collapse; 
		padding: 10px; 
	}
	h1 { text-align: center; padding: 20px; margin: 10px; }
	
	

</style>

<script>

$(function(){
	$(".menuDetailView").click(function(){
		
		var menuid = $(this).attr("data-menuid");
		
		$("#menu_id").val(menuid);
		
		$.ajax({
			url: "menuDetail2.do", 
			data: { "menuid":menuid }, 
			type: "get", 
			success: function(responseData){
				
				// JSON 받기 
				var obj = JSON.parse(responseData);
				$("#menu_id").val(obj["menu_id"]);
				$("#menu_name").val(obj["menu_name"]);
				$("#menu_info").val(obj["menu_info"]);
				$("#menu_img").val(obj["menu_img"]);
				$("#menu_price").val(obj["menu_price"]);
			
			}
			
		});
		
	});
	
});

$(function(){
	$(".btnUpdate").click(function(){
		
		var menuid = $(this).attr("data-menuid");
		
		location.href = "menuDetail.do?menuid=" + menuid;
	});
	
});

$(function(){
	$(".btnDel").click(function(){
		
		var menuid = $(this).attr("data-menuid");
		if(confirm(menuid + "번 메뉴를 삭제하시겠습니까?")){
			
			location.href = "menuDelete.do?menuid=" + menuid;
		}
	});
});



</script>





</head>
<body>

<div class="menuView" >
	<div class="shop_info" >
		<div class="shop_title">
			<span class="shop_name"> </span>
		</div>
		<div class="shop_content">
			<div class="shop_img" style="background-image:url(image/default_shop_img.png); height: 200px; width: 200px; border: 1px solid black;"></div>
		<ul class="list">
			<li>
			<span class="stars star-point ">
				<span></span>
			</span>	
			</li>
			<li>
				매장이름
				<span></span>
			</li>
			<li>
				<span> 매장소개문구 </span>
			</li>
			<li>
				<button type="button" id="btn_favorites" class="btn btn-warning">즐겨찾기</button>
			</li>
		</ul>	
		</div>
		<div class="event_info">
		<strong>쿠폰증정이벤트</strong>
			<span class="coupon_info">
			"3만원이상 주문시 3000원 할인쿠폰 증정! "
			</span>
		
		</div>
	<ul class="nav nav-tabs menu_tap">
	  <li class="nav-item">
	    <a class="nav-link active" data-toggle="tab">추천메뉴</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" data-toggle="tab">전체보기</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" data-toggle="tab">리뷰</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" data-toggle="tab">매장정보</a>
	  </li>
	</ul>
	
	<div id="menu" class="menuList" >
	 <div class="panel-group">
	  <div class="panel-default">
	   
	   
    <div id="accordion">
    <div class="card">
      <div class="card-header">
        <a class="btn_category clearfix" data-bs-toggle="collapse" href="#collapseOne">
          <span class="menu_category_name pull-left">추천메뉴</span>
          <i class="pull-right icon-arr-up">펼치기</i>
        </a>
      </div>
      <div id="collapseOne" class="collapse show" data-bs-parent="#accordion">
        <div class="card-body">
          메뉴들
        </div>
      </div>
    </div>
    <div class="card">
      <div class="card-header">
        <a class="collapsed btn_category" data-bs-toggle="collapse" href="#collapseTwo">
        <span class="menu_category_name pull-left">주메뉴</span>
          <i class="pull-right icon-arr-up">펼치기</i>
      </a>
      </div>
      <div id="collapseTwo" class="collapse" data-bs-parent="#accordion">
        <div class="card-body">
          메뉴들
        </div>
      </div>
    </div>
    <div class="card">
      <div class="card-header">
        <a class="collapsed btn_category" data-bs-toggle="collapse" href="#collapseThree">
          <span class="menu_category_name pull-left">사이드</span>
          <i class="pull-right icon-arr-up">펼치기</i>
        </a>
      </div>
      <div id="collapseThree" class="collapse" data-bs-parent="#accordion">
        <div class="card-body">
          메뉴들
        </div>
      </div>
    </div>
  </div>
	
</div>
</div>
</div>
</div>
</div>

	
	
	
	
	





${ menuDatas };



<br><br><br><br>
<hr>

<h1>메뉴목록</h1>

<div><span><a class="left" href="menuInsert.do">신규등록</a></span></div>

	
	<c:set var="menuSize" value="${ menuDatas.size() }"></c:set>
	
	전체건수: ${ menuSize } 
	
<table>
	<tr>
		<td>순서</td>
		<td>메뉴ID</td>
		<td>메뉴이름</td>
		<td>카테고리</td>
		<td>가격</td>
		<td>이미지</td>
		<td>소개</td>
		<td>상단표시여부</td>
		<td>상세보기</td>
		
		<td>삭제</td>
		
	</tr>
	
	
	
	<c:forEach items="${ menuDatas }" var="z_menu" varStatus="status">
	
	
	<tr>
		<td>${ menuSize-status.index }</td>
		
		<td>${ z_menu.menu_seq }</td>
		
		<td>${ z_menu.menu_name }</td>
		<td>${ z_menu.menu_category }SID${ z_menu.shop_seq }</td>
		<td>${ z_menu.menu_price }</td>
		<td>${ z_menu.menu_img }</td>
		<td>${ z_menu.menu_info }</td>
		<td>${ z_menu.menu_top }</td>
		
		<td>
		<input type="button" value="상세보기" class="menuDetailView btn btn-primary" 
		data-toggle="modal" data-target="#menuModal" data-menuid="${ z_menu.menu_seq }" >
		</td>
		
		<td>
		<input type="button" value="삭제" class="btnDel btn btn-primary" data-menuid="${ z_menu.menu_seq }" >
		</td>
	</tr>	
	
	
	</c:forEach>
</table>





<div class="container">
  
  <!-- The Modal -->
  <div class="modal" id="menuModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">메뉴 상세보기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body form-group" >
        <input type="hidden" id="menu_id" class="form-control"><br>
          <label>메뉴이름</label><input type="text" id="menu_name" class="form-control"><br>
          <label>메뉴소개</label><input type="text" id="menu_info" class="form-control"><br>
          <label>이미지</label><input type="text" id="menu_img" class="form-control"><br>
          <label>가격</label><input type="text" id="menu_price" class="form-control"><br>
        
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          
          <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>



</body>
</html>