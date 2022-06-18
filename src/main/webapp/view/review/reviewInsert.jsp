<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <% request.setCharacterEncoding("utf-8"); %> --%>
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
	background-color: rgba(255, 255, 255);
}

}

@media (max-width: 800px){

#wrapper {
	height:100%;
	width: 100%;
	margin: 0px auto;
	text-align: center;
	background-color: rgba(255, 255, 255);
}

}

#mainframe {
	width: 100%;
	display : inline-block;
	margin: 0px auto;
	background-color: rgba(255, 255, 255);
	padding-top: 200px;
}

#contents {

/* 알아서 */

}

html,
body {
	magin:0;
	padding: 0;
	width: 100%;
	height: 100%;
	text-align: center;
	
}

label { display: inline-block; width:100px;}
.form-control{display: inline-block; width:auto;}

 
#conten{
 	text-align: left;
}


</style>
<script type="text/javascript">

$(function() {	
    $('div#star1').raty({    	
        score: function(evt) {        	
            $("#starRating1").val(3);
            return 3;
        }
        ,path : "${path}/view/review/img"
        ,width : 200        
        ,hints : ['나쁨', '그저그런', '보통', '좋음', '매우좋음']
        ,click: function(score, evt) {
            $("#starRating1").val(score);            
        }
    });
});

$(function() {
    $('div#star2').raty({
        score: function(evt) {        	
            $("#starRating2").val(3);
            return 3;
        }
     // ,path : "${path}/images"
        ,path : "${path}/view/review/img"
        ,width : 200
        ,hints : ['나쁨', '그저그런', '보통', '좋음', '매우좋음']
        ,click: function(score, evt) {
            $("#starRating2").val(score);
        }
    });
});


$(function() {
    $('div#star3').raty({
        score: function(evt) {        	
            $("#starRating3").val(3);
            return 3;
        }     
      	,path : "${path}/view/review/img"
        ,width : 200
        ,hints : ['나쁨', '그저그런', '보통', '좋음', '매우좋음']
        ,click: function(score, evt) {        
            $("#starRating3").val(score);  
           
        }
    });
});





/* 


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
 */


</script>
 
</head>
<body>
<div id="wrapper" class="shadow">
<div id="mainframe">
<div id="contents">
<h1>리뷰 등록</h1>
<br>


<form action="${path}/review/reviewInsert.do"   method="post" enctype="multipart/form-data"> 
 <div class="form-group" id="star1" >
 	<label for="starRating">맛  </label><input type="hidden" id="starRating1" name="review_taste"/>
 </div> 
 
 <!-- 
        <div style="padding-top:20px;">
            <label for="starRating">맛 : </label><input type="text" id="starRating" value="3"/>
        </div> 
        <div style="padding-top:20px;">
            <label for="displayStarRating">Value : </label><span id="displayStarRating" style="padding-left:20px;">3</span>
        </div>
  -->

 <div class="form-group" id="star2">
 	<label for="starRating">양  </label><input type="hidden" id="starRating2" name="review_amount"/>
 </div> 

 <div class="form-group" id="star3">
 	<label for="starRating">서비스  </label><input type="hidden" id="starRating3" name="review_service"/>
 </div> 


<!-- 
<div class="form-group">
<label>내용</label>
<input class="form-control"  type="text" name="content" id="content">
</div>
 -->


<div class="form-group" >
 <br>
 <label>-내용-</label>
 <br>
<textarea class="form-control" id="content" name="review_content" cols="50" rows="8"><c:out value="${content}" /></textarea>
</div>

<input type="hidden" name="menu_seq" value="${menu_seq}" />

<!-- 
<div class="form-group">
<label>사진</label>
 <input type="submit" id="submit" value="업로드"/>
</div>
 -->
 
 	파일: <input type="file" name="photos"> <br> 
<br>
<br>
<input class="btn btn-primary" type="submit" value="입력하기">&nbsp;&nbsp;&nbsp;
<input class="btn btn-secondary" type="reset" value="취소하기">&nbsp;&nbsp;&nbsp;
<input class="btn btn-secondary" type="button" value="뒤로가기" id="myOrderList"> <!-- 구매내역으로 돌릴 id설정 --> 
</form>
<%-- 
<br>
<br>
<br>
<button class="btn btn-secondary" onClick="location.href='${path}/orderlist/myorderlist.do'">뒤로가기</button> --%>
<%-- 
<form action="${path}/uploadtest.do" 
	method="post" enctype="multipart/form-data">
		파일: <input type="file" name="photos"> <br> 
		<input type="submit"value="업로드">
</form>
 --%>
 
 
 </div>
</div>
</div>
<script>


 //구매내역으로 다시 반환시켜야됨
$(function(){
	$("#myOrderList").click(function(){
		//alert("눌림");
		location.href="${path}/orderlist/myorderlist.do";
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



