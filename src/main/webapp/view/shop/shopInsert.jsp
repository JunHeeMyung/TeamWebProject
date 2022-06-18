<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=878435cb63e52c1306f3d3ab856fc153&libraries=services"></script>



<style>
html,
body {
	magin:0;
	padding: 0;
	width: 100%;
	height: 100%;
	text-align: center;
	
}

/* span{
	text-align: center;
} */

  label { display: inline-block; width:100px;}
.form-control{display: inline-block; width:auto;}



/* #content {
 	width: 335px;
    height: 300px;
} */

/* 
#content {
 	width: 40%;
    height: 400px;
}
 */
 
#conten{
 	text-align: left;
}


</style>


<!-- 


$(function(){
	$("#duplicateCheckBtn").click(function(){
		//alrert("버튼누름");
 		
		var empid = $("#employee_id").val();
		if(empid=="" || empid==null){
			alert("직원번호는 필수입력입니다.");
			$("#employee_id").focus();
			return;
		}
		
		$.ajax({
			url:"duplicateCheckBtn.do",
			data:{"empid":empid },
			type:"get",
			success: function(responseData){
				//중복: 1, 중복안됨: 0
				$("#message").html(responseData==1?"사용불가":"사용가능");
			},
			fail:function(){}
		});
				 
	});

				 
				 
	$("#emailduplicateCheckBtn").click(function(){
						
		var empEmail = $("#email").val();
		if(empEmail=="" || empEmail==null){
			alert("이메일은 필수입력입니다.");
			$("#email").focus();
			return;
		}		
		
		$.ajax({
			url:"emailduplicateCheckBtn.do",
			data:{"email":empEmail},
			type:"get",
			success: function(responseData){
				//중복: 1, 중복안됨: 0
				$("#message2").html(responseData==1?"사용불가":"사용가능");
			},
			fail:function(){}
		});
				
	});
});


-->






<script>
$(()=>{
	$("#findaddr").click(()=>{
		new daum.Postcode({
	        oncomplete: data=>{
	        	var geocoder = new daum.maps.services.Geocoder();
	        	var address = data.roadAddress||data.autoRoadAddress; 
	        	geocoder.addressSearch(address, (result, status)=> {
	   		     if (status === kakao.maps.services.Status.OK) {
	   		    	$("#addr").val(address);
	   		        $("#latitude").val(result[0].y);
	   		        $("#longitude").val(result[0].x);
	   		     };
	        });
	    }}).open();
	});
});

</script>

</head>
<body>
<h1>매장 등록</h1>
<br>


<form action="${path}/shop/shopInsert.do"   method="post" enctype="multipart/form-data">

<div class="form-group">
<label>매장이름</label>
<input class="form-control"  type="text" name="shop_name"> 
</div>

<label>주소</label><input id="addr" name="loc_addr" type="text" readonly="readonly"><input id="findaddr" type="button" value="주소검색">
<br>상세주소<input id="detailaddr" name="shop_addr_detail" type="text">
<!-- 위도(hidden): -->	<br> <input id="latitude" name="loc_lat" type="hidden" readonly="readonly">
<!-- 경도(hidden): --> 	<br><input id="longitude" name="loc_lon" type="hidden" readonly="readonly">

<select name="category_code">
<c:forEach var="categoryDTO" items="${categoryDTOs}" varStatus="status">
<option value="${categoryDTO.category_code}">${categoryDTO.category_name}</option>
</c:forEach>
</select>





<%-- 
<div class="form-group">
<label>메니져</label>
<select name="manager_id" class="form-control">
	<c:forEach items="${mlist}" var = "manager">
		<option value="${manager.key}">${manager.value}</option>	
	</c:forEach>
</select>
</div>
 --%>
<!-- String shop_name = request.getParameter("shop_name");
		String loc_addr = request.getParameter("loc_addr");
		String shop_addr_detail = request.getParameter("shop_addr_detail");
		String shop_img = request.getParameter("shop_img");
		String shop_notice = request.getParameter("shop_notice"); -->






<div class="form-group" >
 <br>
 <label>매장정보</label>
 <br>
 
<textarea class="form-control" id="content" name="shop_notice" cols="50" rows="8"><c:out value="${content}" /></textarea>
</div>


<!-- 이미지선택  -->
파일: <input type="file" name="photos"> <br> 

<!-- 버튼 선택 -->
<input class="btn btn-primary" type="submit" value="입력하기">
<input class="btn btn-secondary" type="reset" value="취소하기">
<!-- <input class="btn btn-secondary" type="button" value="목록보기" id="reviewAllList">구매내역으로 돌릴 id설정  -->
</form>

<script>


 //마이페이지으로 다시 반환시켜야됨
$(function(){
	$("#reviewAllList").click(function(){
		location.href="reviewAllList";
	});
});



/* 
$(function(){
	$("#empList").click(function(){
		location.href="emplist.do";
	});
});
 */
</script>
</body>
</html>



