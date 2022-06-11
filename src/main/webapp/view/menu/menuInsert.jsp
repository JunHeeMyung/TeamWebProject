<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>menuInsert</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../css/common.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<style>

	label { display: inline-block; width:100px; }
	input { display: inline!important; }
	
</style>


<script>
$(function(){
	$("#duplicateCheckBtn").click(function(){
		//alert ("버튼누름" + $("#menu_name").val() );
		
		var menu_name = $("#menu_name").val();
		
		if(menu_name=="" || menu_name==null){
			alert("메뉴이름을 입력하세요!");
			$("#menu_name").focus();
		}
		
		$.ajax({
			url:"duplicateCheck.do", 
			data:{ "menu_name":$("#menu_name").val() },
			type:"get", 
			success: function(responseData){
				// 중복: 1,   중복아님: 0
				$("#menuMessage").html(responseData==1? "중복된 메뉴가 존재합니다":"사용가능");
				
			}, 
			fail: function(){}
			
		});
	});
});



</script>





</head>
<body>

<h1>메뉴등록</h1>

<form action="menuInsert.do" method="post">

<div class="form-group">
	<label>메뉴ID: ${ z_menu.menu_seq } </label>
	<input type="hidden" name="menu_seq" value="${ z_menu.menu_seq }"><br>
</div>


<div class="form-group">
	<label>매장ID: ${ z_menu.shop_seq } </label>
	<input type="hidden" name="shop_seq" value=3><br>
</div>


<div class="form-group">
	<label>카테고리: </label>
	<input type="text" name="menu_category" value="${ z_menu.menu_category }"><br>
</div>	


<div class="form-group">
	<label>메뉴이름: </label>
	<input type="text" name="menu_name" value="${ z_menu.menu_name }"><br>
</div>


<div class="form-group">
	<label>가격: </label>
	<input type="text" name="menu_price" value="${ z_menu.menu_price }"><br>
</div>


<div class="form-group">
	<label>이미지: </label>
	<input type="text" name="menu_img" value="${ z_menu.menu_img }"><br>
</div>


<div class="form-group">
	<label>추천메뉴여부: </label>
	<input type="radio" id="menu_top_yes" name="menu_top" value=1>예
	<input type="radio" id="menu_top_no" name="menu_top" value=0>아니오<br>
</div>


<div class="form-group">
	<label>메뉴소개: </label>
	<input type="text" name="menu_info" value="${ z_menu.menu_info }"><br>
</div>



	<input type="submit" class="btn btn-primary" value="등록하기">
	<input type="reset" class="btn btn-primary" value="취소하기"><br>
	
</form>















</body>
</html>