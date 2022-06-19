<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script type="text/javascript">

/* /review/SelectMem.do */

</script>


<title>기본 디자인</title>
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


@media (min-width: 900px){

#wrapper {
	height:100%;
	width: 900px;
	margin: 0px auto;
	text-align: center;
	background-color: rgba(255, 255, 255);
}

}

@media (max-width: 900px){

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
	padding-top: 250px;
}

#contents {

}

tr {
	padding: 0px;
	margin: 0px;
}

td {
	padding: 10px;
	margin: 10px;
	border: 2px solid graytext;
}

table {	
	text-align: center;
	border : 1px;
	padding: 0px;
	margin: auto;	
}
#pic{
	width: 200px;
	


}
</style>
</head>
<script type="text/javascript">
var menu_name;

$(()=>{
	$('div#star1').raty({
		score: function(evt) {            
            return $("#starRating1").val();
        }
		,path : "${path}/view/review/img"
		,readOnly: true
		,width : 500
	});
});
$(()=>{
	$('div#star2').raty({
		score: function(evt) {            
            return $("#starRating2").val();
        }
		,path : "${path}/view/review/img"
		,readOnly: true
	});
});
$(()=>{
	$('div#star3').raty({
		score: function(evt) {            
            return $("#starRating3").val();
        }
		,path : "${path}/view/review/img"
		,readOnly: true
	});
});

$(()=>{
	$('div#star4').raty({
		score: function(evt) {            
            return $("#starRating4").val();
        }
		,path : "${path}/view/review/img"
		,readOnly: true
	});
});
$(()=>{
	$('div#star5').raty({
		score: function(evt) {            
            return $("#starRating5").val();
        }
		,path : "${path}/view/review/img"
		,readOnly: true
	});
});

/*
$(()=>{
	$.ajax({
		type:"GET",
		url:getContextPath()+"/review/SelectMenuName.do", 
		data:{"menu_seq":${menu_seq}} ,
		dataType:"text",
		success : function(data) { 
				if ( typeof(data) == "undefined" ) {return;}				
					
				// 데이터를 확인하고 싶을 때.
					let str = JSON.stringify(data); // <> parse()
					alert(str); 
					
					
	//		for(var nameData of data){
	//			menu_name =  JSON.stringify(nameData.menu_name).replaceAll("\"", "");				
	//		}	
		
		},
		error : ()=> {
			alert("에러발생");
		}
	});	
});
*/
</script>


<body>

<div id="wrapper" class="shadow">
<div id="mainframe">

<div id="contents">
<h1>${member.mem_nick}님의 리뷰</h1>


	
	<table id="reviewTable" class="table-striped">
		<tr>
		<!-- 	<td>리뷰 SEQ</td>
			<td>MEM_SEQ</td> -->
			<td>메뉴번호</td>
			<!-- <td>맛</td>
			<td>양</td>
			<td>서비스</td> -->
			<td id="pic">사진</td>
			<td>내용</td>
			<td>평균별점</td>
			<td>날짜</td>					
			<td></td>					
		</tr>
		<c:forEach items="${reviewMemberList}" var="review" varStatus="status">
		<c:set var="starCnt" value="${starCnt+1}"/>	
		<tr>
		<%-- 	<td>${review.review_seq}</td>
			<td>${review.mem_seq}</td> --%>
			<td>${review.menu_name}</td>
			<%-- <td>${review.review_taste}</td>
			<td>${review.review_amount}</td>
			<td>${review.review_service}</td> --%>
			<td><img src="${path}/images/${review.review_img}" width="250" height="250"></td>
			<td>${review.review_content}</td>
			<td><div class="form-group" id="star${starCnt}" ><input type="hidden" id="starRating${starCnt}" value="${(review.review_taste + review.review_amount + review.review_service)/3}"/></div></td>			
			<td>${review.review_date}</td>
			<td><form action="${path}/review/reviewDelete.do" method="post">
					<input type="hidden" name="review_seq" value="${review.review_seq}"><input type="submit" class="btn btn-primary" value="삭제">
				</form>				
			</td>	
		</tr>
		</c:forEach>
	</table>
	<br>
	<input type="button" id="btn1" value="뒤로가기" onclick="location.href='${path}/';">
</div>
</div>
</div>

</body>
</html>