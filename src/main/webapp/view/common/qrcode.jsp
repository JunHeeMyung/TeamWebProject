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

#qrcodetable{
margin-top: 20px;
}

#contents {








}

</style>
<script>

function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

$(()=> {
	
	var shop_seq=<%=request.getParameter("shop_seq")%>
	
	$("#qrcodecreate").click(()=>{
		
		var count = $("#qrcodenumber").val();
		
		if(count==0){
			alert("qr생성 갯수를 확인해주세요");
			return;
		}
		if(shop_seq==null){
			alert("shop_seq번호가 없습니다");
			return;
		}
		
		var str = "";
		
		for(var i=1;i<=count;i++){
			
			str+="<table class='qrtable' style='display: inline-block;'><tr><td>"+i+"번 테이블</td></tr><tr><td><img src='"+getContextPath()+"/qrcode/create.do?url="+
					location.protocol+"//"+
					location.host+getContextPath()+
					"/menu/menuListAll.do?"+
					"shop_seq="+shop_seq+
					"%26order_tablenum="+i+"'></td><tr></table>";		
		}
		
		$("#qrcodetable").html(str);
	})

	
	$("#printbtn").click(()=>{
		
		var initBody;
		 window.onbeforeprint = function(){
		  initBody = document.body.innerHTML;
		  document.body.innerHTML =  document.getElementById('qrcodetable').innerHTML;
		 };
		
		 window.onafterprint = function(){
		  document.body.innerHTML = initBody;
		 };
		
		 window.print();
		
		location.reload();
		
		 return false;
		
	})
	
	
});


</script>

</head>
<body>

<div id="wrapper" class="shadow">
<div id="mainframe">
<div id="contents">

<h2> QR코드 인쇄 </h2>
<br>

<div class="input-group input-group-lg mb-5">
  <span class="input-group-text">테이블 갯수</span>
  <input type="number" value="1" min="1" id="qrcodenumber" class="form-control">
</div>








<button id="qrcodecreate" class="btn btn-outline-secondary">QR코드 생성</button>
<button id="printbtn" class="btn btn-outline-secondary">QR코드 인쇄</button>
<br>
<div id="qrcodetable"></div>

</div>
</div>
</div>

</body>
</html>