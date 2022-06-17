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

<!-- Chart 그래프  -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.8.0/dist/chart.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script> -->


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
	padding-top: 250px;
}

#contents {

/* 알아서 */

}
/* 
#myChart {
	margin: 0px auto;
}
 */

</style>
</head>





<body>

<div id="wrapper" class="shadow">
<div id="mainframe">

<!-- 입력 -->
<div id="contents">



<!-- 구글 그래프 
<div id="chart_div" style="width: 100%; height: 500px;"></div>
 -->
 
<button id="chart1" class="btn btn-primary btn-lg">전체</button>
<button id="chart2" class="btn btn-primary btn-lg">회원</button>
<button id="chart3" class="btn btn-primary btn-lg">매장</button>
<button id="chart4" class="btn btn-primary btn-lg">리뷰</button>

<div id="post-box" class="form-post" style="width: 800px; height: 800px;">
	<!--차트가 그려질 부분-->
	<div id="post-box1" class="form-post">
	<canvas id="myChart"></canvas>
	</div>
	
	<div id="post-box2" class="form-post">
	<canvas id="myChart2"></canvas>
	</div>
	
	<div id="post-box3" class="form-post">
	<canvas id="myChart3"></canvas>
	</div>
	
	<div id="post-box4" class="form-post">
	<canvas id="myChart4"></canvas>
	</div>
</div>



</div>
</div> 
</div>



<script type="text/javascript">

var myChart;
var myChart2;
var myChart3;
var myChart4;

var 전체회원;
var 사업자회원;
var 일반회원;
var 네이버회원;
var 카카오회원;
var reviewDate = [];
var reviewCnt = [];
var reviewSumCnt = 0;

var shopA;
var shopO=[];
var shopC=[];

function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};


$(()=> {	
	$.ajax({
		type:"GET",
		url:getContextPath()+"/data/member.do", 
		dataType:"json",
		success : function(data) { 
				if ( typeof(data) == "undefined" ) {return;}				
					
				// 데이터를 확인하고 싶을 때.
				//	let str = JSON.stringify(data); // <> parse()
				//	alert(str); 
			for(var userdata of data){
				전체회원 =  JSON.stringify(userdata.전체회원).replaceAll("\"", "");
				사업자회원 = JSON.stringify(userdata.사업자회원).replaceAll("\"", "");
				일반회원 =  JSON.stringify(userdata.일반회원).replaceAll("\"", "");
				네이버회원 = JSON.stringify(userdata.네이버회원).replaceAll("\"", "");
				카카오회원 = JSON.stringify(userdata.카카오회원).replaceAll("\"", "");
			}			
		},
		error : ()=> {
			alert("에러발생");
		}
	});
});

$(()=> {	
	$.ajax({
		type:"GET",
		url:getContextPath()+"/review/SelectDay.do", 
		dataType:"json",
		success : function(data) { 
				if ( typeof(data) == "undefined" ) {return;}								
				
				for(var reviewdata of data){
					reviewDate.push(JSON.stringify(reviewdata.REVIEW_DATE).replaceAll("\"", ""));
					reviewCnt.push(Number(JSON.stringify(reviewdata.CNT).replaceAll("\"", "")));
					
					reviewSumCnt += Number(JSON.stringify(reviewdata.CNT).replaceAll("\"", "")); 
								
				}				 
				//console.log(reviewDate);
				//console.log(reviewCnt);				
				//console.log(reviewSumCnt);
				
		},
		error : ()=> {
			alert("에러발생");
		}
	});
});


///*
$(()=> {	
	$.ajax({
		type:"GET",
		url:getContextPath()+"/admin/adminShopCount.do", 
		dataType:"json",
		success : function(data) { 
				if ( typeof(data) == "undefined" ) {return;}								
				
				for(var shopdata of data){					
					shopO.push(Number(JSON.stringify(shopdata.활성).replaceAll("\"", "")));
					shopC.push(Number(JSON.stringify(shopdata.비활성).replaceAll("\"", "")));					
					
				}				 			
				//console.log(data);
				//console.log(shopO[0]);
				//console.log(shopC[0]);
				shopA = shopO[0]+ shopC[0];
		},
		error : ()=> {
			alert("에러발생");
		}
	});
});
//*/

$("#chart1").click(()=>{	
	if ($('#post-box1').css('display') == 'block') {
		$('#post-box1').hide();
		myChart.destroy();		
		} else {
		$('#post-box1').show();		
		allChar();
		}
});	
$("#chart2").click(()=>{
	if ($('#post-box2').css('display') == 'block') {
		$('#post-box2').hide();
		myChart2.destroy();
		} else {
		$('#post-box2').show();
		userChar();
		}
});	
$("#chart3").click(()=>{
	if ($('#post-box3').css('display') == 'block') {
		$('#post-box3').hide();
		myChart3.destroy();
		} else {
		$('#post-box3').show();
		shopChar();
		}
});	
$("#chart4").click(()=>{
	if ($('#post-box4').css('display') == 'block') {
		$('#post-box4').hide(); 
		myChart4.destroy();
		} else {
		$('#post-box4').show();
		reviewChar();
		}
});
	



function allChar() {
	var context = document.getElementById('myChart').getContext('2d');
	myChart = new Chart(context, {
		type : 'bar', // 차트의 형태 bar , line, pie, doughnut, polarArea
		data : { // 차트에 들어갈 데이터
			labels : [
			//x 축
			//'1','2','3','4','5','6','7'
			'회원', '매장', '리뷰' ],
			datasets : [
					{ //데이터
						label : 'ZUMUNIYO', //차트 제목            
						data : [
						//21,19,25,20,23,26,25 //x축 label에 대응되는 데이터 값
						전체회원, shopA, reviewSumCnt ],
						backgroundColor : [
						//색상
						//'rgba(255, 99, 132, 0.2)',
						//'rgba(54, 162, 235, 0.2)',
						//'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)' ],
						borderColor : [
						//경계선 색상
						//'rgba(255, 99, 132, 1)',
						//'rgba(54, 162, 235, 1)',
						//'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)', 
						'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)' ],
						borderWidth : 1, //경계선 굵기
					}, ],
		},
	});
}	


//*/

function userChar() {

	var context = document.getElementById('myChart2').getContext('2d');
	myChart2 = new Chart(context, {
		type : 'bar', // 차트의 형태 bar , line, pie, doughnut, polarArea
		data : { 
			labels : [
			
				'전체회원' ,'사업자회원', '일반회원', '네이버회원', '카카오회원' ],
			datasets : [
					{
						label : '회원현황',           
						data : [
						
							전체회원 ,사업자회원, 일반회원, 네이버회원, 카카오회원 ],
						backgroundColor : [
						//색상
						//'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)' ],
						borderColor : [
						//경계선 색상
						//'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)', 
						'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)' ],
						borderWidth : 1, //경계선 굵기
					}, ],
		},
	});
}

function shopChar() {	
	var context = document.getElementById('myChart3').getContext('2d');
	myChart3 = new Chart(context, {
		type : 'bar', // 차트의 형태 bar , line, pie, doughnut, polarArea
		data : { // 차트에 들어갈 데이터
			labels : [					
			'전체매장', '영업중', '폐업' ],
				
			datasets : [
					{ //데이터
						label : '매장현황', //차트 제목            
						data : [						
							shopA, shopO[0], shopC[0] ],
						backgroundColor : [
						//색상
						//'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)' ],
						borderColor : [
						//경계선 색상
						//'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)', 
						'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)' ],
						borderWidth : 1, //경계선 굵기
					}, ],
		},
	});
}
function reviewChar() {	

	var context = document.getElementById('myChart4').getContext('2d');
	myChart4 = new Chart(context, {
		type : 'bar', // 차트의 형태 bar , line, pie, doughnut, polarArea
		data : { // 차트에 들어갈 데이터
			labels : [					
				reviewDate[0] ,reviewDate[1], reviewDate[2], reviewDate[3], reviewDate[4] ],
				
			datasets : [
					{ //데이터
						label : '리뷰현황', //차트 제목            
						data : [						
							reviewCnt[0] ,reviewCnt[1], reviewCnt[2], reviewCnt[3], reviewCnt[4] ],
						backgroundColor : [
						//색상
						//'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)' ],
						borderColor : [
						//경계선 색상
						//'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)', 
						'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)' ],
						borderWidth : 1, //경계선 굵기
					}, ],
		},
	});
}




</script>

</body>
</html>