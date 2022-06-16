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
<div id="here"></div>


<!-- 구글 그래프 
<div id="chart_div" style="width: 100%; height: 500px;"></div>
 -->
 
<button onclick="openClose()" id="chart1" class="btn btn-primary btn-lg">전체</button>
<button onclick="openClose()" id="chart2" class="btn btn-primary btn-lg">회원</button>
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
</div>



</div>
</div> 
</div>



<script type="text/javascript">


var 전체회원;
var 사업자회원;
var 일반회원;
var 네이버회원;
var 카카오회원;

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
			for(var shopdata of data){
				전체회원 =  JSON.stringify(shopdata.전체회원).replaceAll("\"", "");
				사업자회원 = JSON.stringify(shopdata.사업자회원).replaceAll("\"", "");
				일반회원 =  JSON.stringify(shopdata.일반회원).replaceAll("\"", "");
				네이버회원 = JSON.stringify(shopdata.네이버회원).replaceAll("\"", "");
				카카오회원 = JSON.stringify(shopdata.카카오회원).replaceAll("\"", "");
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
		url:getContextPath()+"/data/member.do", 
		dataType:"json",
		success : function(data) { 
				if ( typeof(data) == "undefined" ) {return;}				
					
				// 데이터를 확인하고 싶을 때.
				//	let str = JSON.stringify(data); // <> parse()
				//	alert(str); 
			for(var shopdata of data){
				전체회원 =  JSON.stringify(shopdata.전체회원).replaceAll("\"", "");
				사업자회원 = JSON.stringify(shopdata.사업자회원).replaceAll("\"", "");
				일반회원 =  JSON.stringify(shopdata.일반회원).replaceAll("\"", "");
				네이버회원 = JSON.stringify(shopdata.네이버회원).replaceAll("\"", "");
				카카오회원 = JSON.stringify(shopdata.카카오회원).replaceAll("\"", "");
			}			
		},
		error : ()=> {
			alert("에러발생");
		}
	});
});




$("#chart1").click(()=>{
	if ($('#post-box1').css('display') == 'block') {
		$('#post-box1').hide();  
		} else {
		$('#post-box1').show();
		}

	var context = document.getElementById('myChart').getContext('2d');
	var myChart = new Chart(context, {
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
						전체회원, 30, 50 ],
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
});

$("#chart2").click(()=>{
	if ($('#post-box2').css('display') == 'block') {
		$('#post-box2').hide();  
		} else {
		$('#post-box2').show();
		}

	var context = document.getElementById('myChart2').getContext('2d');
	var myChart = new Chart(context, {
		type : 'bar', // 차트의 형태 bar , line, pie, doughnut, polarArea
		data : { // 차트에 들어갈 데이터
			labels : [
			//x 축
			//'1','2','3','4','5','6','7'
				'전체회원' ,'사업자회원', '일반회원', '네이버회원', '카카오회원' ],
			datasets : [
					{ //데이터
						label : '회원현황', //차트 제목            
						data : [
						//21,19,25,20,23,26,25 //x축 label에 대응되는 데이터 값
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
});





</script>

</body>
</html>