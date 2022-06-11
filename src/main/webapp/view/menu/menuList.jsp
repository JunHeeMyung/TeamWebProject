<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>menuList</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../css/common.css">

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