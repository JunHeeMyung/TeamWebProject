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
	padding-top: 100px;
}



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

.hd {
	background-color: skyblue;
}
.menutable{

}


</style>


<script>


function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};




/* 추천메뉴 */

function drawtopmenu(){
	
	$.ajax({
		type:"POST",
		url:getContextPath()+"/menu/menuListAll.zmny", 
		data: {"shop_seq":<%=request.getParameter("shop_seq")%>} ,
		dataType:"json",
		success : data=>{
	        if ( typeof(data) == "undefined" ) {return;}
	        
	        var str = "";
	        
	        str+="<table class='menutable'>"; 
	        for(var menudata of data){
	        	if(JSON.stringify(menudata.menu_top).replaceAll("\"", "")*1==1){
	        		
	        	
	        	 str+="<tr><td>";
	        	 str+= JSON.stringify(menudata.menu_name).replaceAll("\"", "");
	        	 str+="</td><td>";
	        	 str+= JSON.stringify(menudata.menu_price);
	        	 str+="</td><td>";
	        	 str+="<img src="+getContextPath()+"/images/"+JSON.stringify(menudata.menu_img)+">";
	        	 str+="</td><td>";
	        	 str+= JSON.stringify(menudata.menu_info).replaceAll("\"", "");
	        	 str+="</td></tr>";
	        	 
	        	}
	        }
	        
			str+="</table>";
	        hall.innerHTML=str;
		    
		},
		error : ()=> {
			alert("에러발생");
		}
	});
	
}








/* 메뉴정보 */
function drawMenu(){
	
	$.ajax({
		type:"POST",
		url:getContextPath()+"/menu/menuListAll.zmny", 
		data: {"shop_seq":<%=request.getParameter("shop_seq")%>} ,
		dataType:"json",
		success : data=>{
	        if ( typeof(data) == "undefined" ) {return;}
	        
	        var str = "";
	        
	        str+="<table class='menutable'>"; 
	        for(var menudata of data){
	        	
	        	 str+="<tr><td>";
	        	 str+= JSON.stringify(menudata.menu_name).replaceAll("\"", "");
	        	 str+="</td><td>";
	        	 str+= JSON.stringify(menudata.menu_price);
	        	 str+="</td><td>";
	        	 str+="<img src="+getContextPath()+"/images/"+JSON.stringify(menudata.menu_img)+">";
	        	 str+="</td><td>";
	        	 str+= JSON.stringify(menudata.menu_info).replaceAll("\"", "");
	        	 str+="</td></tr>";
		      	  
	        }
	        
			str+="</table>";
	        hall.innerHTML=str;
		    
		},
		error : ()=> {
			alert("에러발생");
		}
	});
	
}

/* 리뷰정보 */
function drawReview(){
	$.ajax({
		type:"GET",
		url:getContextPath()+"/review/reviewShopList.do", 
		data: {"shop_seq":<%=request.getParameter("shop_seq")%>} ,
		dataType:"html",
		success : data=>{
			
			
	        if ( typeof(data) == "undefined" ) {return;}
	        
	        var str = "";
	        
	      /*   str+="<table class='menutable'>"; 
	        for(var menudata of data){
	        	  
	        	 str+="<tr><td>";
	        	 str+= JSON.stringify(review.review_taste);
	        	 str+="</td><td>";
	        	 str+= JSON.stringify(review.review_amount);
	        	 str+="</td><td>";
	        	 str+= JSON.stringify(review.review_service);
	        	 str+="</td><td>";
	        	 review.review_content(menudata.menu_name).replaceAll("\"", "");
	        	 str+="</td><td>";
	        	 str+= JSON.stringify(review.review_service).replaceAll("\"", "");
	        	 str+="</td></tr>";
	        	 
	        	 
	        }
	        
			str+="</table>"; */
	        hall.innerHTML=data;
		    
		},
		error : ()=> {
			alert("에러발생");
		}
	});
	
}



/* 매장정보 */
function drawInfo(){
	
	$.ajax({
		type:"POST",
		url:getContextPath()+"/shop/shopInfo.do", 
		data: {"shop_seq":<%=request.getParameter("shop_seq")%>} ,
		dataType:"text",
		success : data=>{
	        if ( typeof(data) == "undefined" ) {return;}
	        
	        var str = "";
	        
	        str+="<table class='menutable'>"; 
	        	
	        	 str+="<tr><td>";
	        	 str+= data;
	        	 str+="</td></tr>";	      	  
	       
	        
			str+="</table>";
	        hall.innerHTML=str;
		    
		},
		error : ()=> {
			alert("에러발생");
		}
	});
	
}








$(()=> {
	
	$("#menu_all_topmenu").click(()=>{		
		drawtopmenu();
	});
	
	$("#menu_all_btn").click(()=>{		
		drawMenu();
	});
	
	$("#menu_all_review").click(()=>{		
		drawReview();
	});
	
	$("#menu_all_info").click(()=>{		
		drawInfo();
	});

	
	
	
	
	
	
	
	
	
	
});













</script>
</head>

<body>

<div id="wrapper" class="shadow">
<div id="mainframe">

<!-- 입력 -->

<div id="contents">

	<h2>매장상세</h2>
	
	<div class="shopcat">
		<div id="menu_all_topmenu">
			추천메뉴
		</div>
		<div id="menu_all_btn" class="allmenu">
			전체메뉴
		</div>
		<div id="menu_all_review" class="allreview">
			리뷰
		</div>
		<div id="menu_all_info">
			매장정보
		</div>
	</div>
	
		
	
	<div id="hall">
		
	</div>
	
	
	
</div>

	
</div>
</div>

<%-- 
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
						<td><img src="${path}/images/${menu.menu_img}"></td>
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
		 --%>





</body>
</html>