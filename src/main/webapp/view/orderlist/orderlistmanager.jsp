<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>주문관리프로그램</title>

<script>


var getData = ()=>{
	
	$.ajax({
		url: getContextPath()+"/orderlist/shoporderlist.do",
		type: "get",
		data: { "shop_seq": <%=request.getParameter("shop_seq")%> },
		dataType: "html",
		success: data => {
			$("#orderlistbox").html(data);
			}
		,
		error: () => {
			alert("요청실패");
		}
	});

}

function getContextPath() {
	    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};
 
 
$(()=>{
	  self.moveTo(0,0); //창위치
	  self.resizeTo(screen.availWidth, screen.availHeight); //창크기
	  
	  webSocketInit();
	  
		var webSocket;

		function webSocketInit()
		{
		    webSocket = new WebSocket("ws://"+location.hostname+getContextPath()+"/websocket");
			webSocket.onopen = function(event) { socketOpen(event);};
			webSocket.onclose = function(event) { socketClose(event);};
			webSocket.onmessage = function(event) { socketMessage(event);};
			webSocket.onerror = function(event) { socketError(event);};
		}  
		  //웹소켓 연결
		  function socketOpen(event){
		     	console.log("연결 완료");
		     	socketMsgSend(<%=request.getParameter("shop_seq")%>);
		  }
		  
		  //웹소켓 닫힘
		  function socketClose(event){
		  	 console.log("웹소켓이 닫혔습니다.");
		  	 
		     // 웹소켓이 닫혀있으면 재연결을 시도합니다.
		     // webSocket이 close되면 오브젝트의 속성, 메서드가 사라지기 때문에,
		     // 해당 함수를 호출하여 초기화하여 줍니다.
		     webSocketInit(); 
		  }
		  
		  //메시지를 송신할 때 사용
		  function socketMsgSend(msg){
		     webSocket.send(msg)
		  }
		  
		  //웹소켓 메시지 수신
		  function socketMessage(event){
			  console.log("새로운 요청이 들어왔습니다.");
		  	  var receiveData = event.data; // 수신 data
		      console.log(receiveData);
		  	  if(receiveData==${param.shop_seq}){
		  		getData();
		  	  }
		  }
		  
		  //웹소켓 에러
		  function socketError(event){
		  	alert("에러가 발생하였습니다.");
		  }
		  
		  //웹소켓 종료
		  function disconnect(){
		  	webSocket.close();
		  }
		  
		  getData();

	  
})
	


</script>

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

#wrapper {
	padding:25px;
	height:100%;
	width: 100%;
	margin: 0px auto;
	text-align: center;
	background-color: orange;
}

#mainframe {
	height:100%;
	width: 100%;
	
	padding: 25px;
	border-radius: 25px;
	background-color: rgba(255, 255, 255);
}

#contents {

width:100%;
height: 100%;

}

#orderlistbox{
border: 1px solid red;
width: 80%;
height: 100%


}


</style>
</head>
<body>

<div id="wrapper">
<div id="mainframe">

<!-- 입력 -->
<div id="contents">

<div id="orderlistbox"></div>


</div>
</div>
</div>

</body>
</html>