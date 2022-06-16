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

<div style="width: 800px; height: 800px;">
	<!--차트가 그려질 부분-->
	<canvas id="myChart"></canvas>
</div>



</div>
</div>
</div>



<script type="text/javascript">
var context = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(context, {
type: 'bar', // 차트의 형태 bar , line, pie, doughnut, polarArea
data: { // 차트에 들어갈 데이터
    labels: [
        //x 축
        //'1','2','3','4','5','6','7'
        '회원','매장','리뷰'
    ],
    datasets: [
        { //데이터
            label: 'ZUMUNIYO', //차트 제목
            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
            data: [
                //21,19,25,20,23,26,25 //x축 label에 대응되는 데이터 값
                50 , 30 ,300
            ],
            backgroundColor: [
                //색상
                //'rgba(255, 99, 132, 0.2)',
                //'rgba(54, 162, 235, 0.2)',
                //'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                //경계선 색상
                //'rgba(255, 99, 132, 1)',
                //'rgba(54, 162, 235, 1)',
                //'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1, //경계선 굵기
        },
      
    ],   
    
},
{ // 차트에 들어갈 데이터
    labels: [
        //x 축
        //'1','2','3','4','5','6','7'
        '회원','사업자회원'
    ],
    datasets: [
        { //데이터
            label: '회원', //차트 제목
            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
            data: [
                //21,19,25,20,23,26,25 //x축 label에 대응되는 데이터 값
                50 , 30 ,300
            ],
            backgroundColor: [
                //색상
                //'rgba(255, 99, 132, 0.2)',
                //'rgba(54, 162, 235, 0.2)',
                //'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                //경계선 색상
                //'rgba(255, 99, 132, 1)',
                //'rgba(54, 162, 235, 1)',
                //'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1, //경계선 굵기
        },
      
    ],   
    
},
{ // 차트에 들어갈 데이터
    labels: [
        //x 축
        //'1','2','3','4','5','6','7'
        '서비스','양','맛'
    ],
    datasets: [
        { //데이터
            label: '리뷰', //차트 제목
            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
            data: [
                //21,19,25,20,23,26,25 //x축 label에 대응되는 데이터 값
                50 , 30 ,300
            ],
            backgroundColor: [
                //색상
                //'rgba(255, 99, 132, 0.2)',
                //'rgba(54, 162, 235, 0.2)',
                //'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                //경계선 색상
                //'rgba(255, 99, 132, 1)',
                //'rgba(54, 162, 235, 1)',
                //'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1, //경계선 굵기
        },
      
    ],   
    
},

options: {
    scales: {
        yAxes: [
            {
                ticks: {
                    beginAtZero: true
                }
            }
        ]
    }
}
});
</script>














<!-- 
<script type="text/javascript">
var context = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(context, {
type: 'bar', // 차트의 형태 bar , line, pie, doughnut, polarArea
data: { // 차트에 들어갈 데이터
    labels: [
        //x 축
        //'1','2','3','4','5','6','7'
        '회원','매장','리뷰'
    ],
    datasets: [
        { //데이터
            label: 'ZUMUNIYO', //차트 제목
            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
            data: [
                //21,19,25,20,23,26,25 //x축 label에 대응되는 데이터 값
                50 , 30 ,300
            ],
            backgroundColor: [
                //색상
                //'rgba(255, 99, 132, 0.2)',
                //'rgba(54, 162, 235, 0.2)',
                //'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                //경계선 색상
                //'rgba(255, 99, 132, 1)',
                //'rgba(54, 162, 235, 1)',
                //'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1, //경계선 굵기
        },
      
    ],   
    
},
options: {
    scales: {
        yAxes: [
            {
                ticks: {
                    beginAtZero: true
                }
            }
        ]
    }
}
});
</script> -->

</body>
</html>