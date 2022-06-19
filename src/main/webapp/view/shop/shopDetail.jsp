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


h1,body,header {
  margin: 0 auto;
}
table {
	margin: 0 auto;
	width: 60%;
}

table, tr, td {
	border: 1px solid lightgray;
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
    border: 1px solid lightgray;
}

.allmenu:hover{
	color: orange;
	cusor: pointer;
}

.topmenu:hover{
	color: orange;
	cusor: pointer;
}

.allreview:hover{
	color: orange;
	cusor: pointer;
}

.allinfo:hover{
	color: orange;
	cusor: pointer;
}

.hd {
	background-color: skyblue;
}
.menutable{

}

table {
    width: 800px;
    text-align: center;
    border: 1px solid #fff;
    border-spacing: 1px;
    font-family: 'Cairo', sans-serif;
  margin: auto;
}

h2 {
    font-weight: bold;
}

table td {
    padding: 10px;
    background-color: white;
}

tr:nth-child(even) td {
  background: #FFE1BE;
}

table th {
    background-color: rgba(255, 138, 0);
    color: #fff;
    padding: 10px;
}

img {
    width: 90px;
    height: 90px;
}

thead{
	cursor: pointer;
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
		url:getContextPath()+"/menu/menuListJSON.do", 
		data: {"shop_seq":<%=request.getParameter("shop_seq")%>} ,
		dataType:"json",
		success : data=>{
	        if ( typeof(data) == "undefined" ) {return;}
	        
	        var str = "";
	        
	        str+="<table class='menutable'>"; 
	        str+="<tr><td>메뉴이름</td><td>가격</td><td>사진</td><td>설명</td></tr>"
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
		url:getContextPath()+"/menu/menuListJSON.do", 
		data: {"shop_seq":<%=request.getParameter("shop_seq")%>} ,
		dataType:"json",
		success : data=>{
	        if ( typeof(data) == "undefined" ) {return;}
	        
	        var str = "";
	        
	        str+="<table class='menutable'>"; 
	        str+="<tr><td>메뉴이름</td><td>가격</td><td>사진</td><td>설명</td></tr>"
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
	
	//drawtopmenu();
	
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


/* 별점 스크립트 */
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





$(()=>{
var menuclick = "${param.menuclick}";
console.log(menuclick);
if(menuclick==3){
	
	$("#menu_all_review").trigger("click");
}else if(menuclick==4){
	 
	$("#menu_all_info").trigger("click");
}else{
	$("#menu_all_topmenu").trigger("click");
}

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
	<table>
	<thead>
	<tr>
		<th id="menu_all_topmenu" class="topmenu">
			추천메뉴
		</th>
		<th id="menu_all_btn" class="allmenu">
			전체메뉴
		</th>
		<th id="menu_all_review" class="allreview">
			리뷰
		</th>
		<th id="menu_all_info" class="allinfo"> 
			매장정보
		</th>
	</tr>
	</thead>
	</table>
	</div>
	
	<div id="hall">
		
	</div>
	
</div>
	
</div>
</div>


</body>
</html>