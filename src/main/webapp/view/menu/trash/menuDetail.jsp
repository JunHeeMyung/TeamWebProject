<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>menuDetail</title>



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


</head>
<body>

<h1>메뉴수정</h1>

<form action="menuUpdate.do" method="post">

<div class="form-group">
	<label>메뉴ID: ${ z_menu.menu_seq } </label>
	<input type="text" name="menu_seq" value="${ menu.menu_seq }"><br>
</div>




<div class="form-group">
	<label>카테고리: </label>
	<input type="text" name="menu_category" value="${ menu.menu_category }"><br>
</div>	


<div class="form-group">
	<label>메뉴이름: </label>
	<input type="text" name="menu_name" value="${ menu.menu_name }"><br>
</div>


<div class="form-group">
	<label>가격: </label>
	<input type="text" name="menu_price" value="${ menu.menu_price }"><br>
</div>


<div class="form-group">
	<label>이미지: </label>
	<input type="text" name="menu_img" value="${ menu.menu_img }"><br>
</div>


<div class="form-group">
	<label>추천메뉴여부: </label>
	<input type="text" name="menu_top" value="${ menu.menu_top }"><br>
</div>


<div class="form-group">
	<label>메뉴소개: </label>
	<input type="text" name="menu_info" value="${ menu.menu_info }"><br>
</div>



	<input type="submit" class="btn btn-primary" value="수정하기">
	<input type="reset" class="btn btn-primary" value="취소하기"><br>
	
</form>



</body>

</html>