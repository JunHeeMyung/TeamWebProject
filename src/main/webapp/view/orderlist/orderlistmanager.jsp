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


function getContextPath() {
	    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};
 
 
$(()=>{	
	
	

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


	var orderConfirm = ()=>{
		
		$.ajax({
			url: getContextPath()+"/orderlist/updatestatus.do",
			type: "post",
			data: { "order_group":($("#ordergroupbox").val()),
					"order_status":"주문확인"
			},
			dataType: "text",
			success: data => {
				if(data=="성공"){
					alert("주문확인 처리가 성공했습니다");
					getData();
					$("#tablebox").val("");
					$("#ordergroupbox").val("");
					$("#totalbox").val("");
				}else{
					alert(data);
				}
				
			}
			,
			error: () => {
				alert("요청실패");
			}
		});

	}


	var completePayment = ()=>{

		$.ajax({
			url: getContextPath()+"/orderlist/updatestatus.do",
			type: "post",
			data: { "order_group":($("#ordergroupbox").val()),
					"order_status":"결제완료"
			},
			dataType: "text",
			success: data => {
				if(data=="성공"){
					alert("결제완료 처리가 성공했습니다");
					getData();
					$("#tablebox").val("");
					$("#ordergroupbox").val("");
					$("#totalbox").val("");
				}else{
					alert(data);
				}
				
			}
			,
			error: () => {
				alert("요청실패");
			}
		});

	}

	
	
	  
	  self.moveTo(0,0); //창위치
	  self.resizeTo(screen.availWidth, screen.availHeight); //창크기
	  
	  
	 	  webSocketInit();
		  var webSocket;

		  function webSocketInit(){
			  
		    webSocket = new WebSocket("ws://"+location.hostname+getContextPath()+"/websocket");
			webSocket.onopen = function(event) { socketOpen(event);};
			webSocket.onclose = function(event) { socketClose(event);};
			webSocket.onmessage = function(event) { socketMessage(event);};
			webSocket.onerror = function(event) { socketError(event);};
		  }  

		  function socketOpen(event){
		     	console.log("연결 완료");
		     	socketMsgSend(<%=request.getParameter("shop_seq")%>);
		  }
		  
		  function socketClose(event){
		  	 
		     webSocketInit(); 
		  }
		  
		  function socketMsgSend(msg){
		     webSocket.send(msg)
		  }
	
		  function socketMessage(event){
			  var promise = document.getElementById('dingdong').play();
			  console.log("새로운 요청이 들어왔습니다.");
		  	  var receiveData = event.data; // 수신 data
		      console.log(receiveData);
		  	  if(receiveData==${param.shop_seq}){
		  		getData();
		  	  }
		  }
	
		  function socketError(event){
		  	alert("에러가 발생하였습니다.");
		  }
	
		  function disconnect(){
		  	webSocket.close();
		  }

		  
		  
		  getData();
		  
		  
		  $("#orderConfirmbtn").click(()=>{
			  orderConfirm();
		  });
		  
		  $("#completePaymentbtn").click(()=>{
			  completePayment();
		  })
	  
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

#headerbox{
background-color: rgba(220,220,220);
width:100%;
height:5%;
}

#orderlistbox{
border: 1px solid rgba(240,240,240);
width: 100%;
height:95%;
overflow-y: scroll;
display: inline-block;
lef
}


#orderlistbox::-webkit-scrollbar {
width: 3px;
}
#orderlistbox::-webkit-scrollbar-thumb{
background: rgba(220,220,220);
border-radius: 5px;
}
#orderlistbox::-webkit-scrollbar-track {
background: transparent;
}

#dingdongbox{
display: hidden;
}

#contents{

}


#leftbox{
display:inline-block;
float:left;
margin:0px;
padding:0px;
width: 80%;
height: 100%;
border: 1px solid rgba(220,220,220);
}

#rightbox{
display:inline-block;
float:left;
margin:0px;
padding:0px;
width: 17%;
height: 100%;
background-color:rgba(240,240,240);
border-radius: 20px;
margin-left:3%;
}


input[type="text"]{
text-align: center;
width: 80%;
margin-left:10%;
margin-right:10%;
margin-bottom: 40px;
font-size:30px;
border: none;
border-radius: 10px;
}

.confirmbtn{
width: 80%;
margin-left:10%;
margin-right:10%;
margin-bottom: 10px;
height: 80px;
font-size: 30px;
border-radius: 20px;
}

</style>
</head>
<body>
<div id="dingdongbox">
<audio id='dingdong' src='${path}/sound/dingdong.mp3'></audio> 
</div>

	<div id="wrapper">
		<div id="mainframe">
			<div id="contents">
				<div id="leftbox">
					<table id="headerbox">
						<tr>
							<td class="order_group">#</td>
							<td class="table_num">테이블</td>
							<td class="menu_name">[카테고리] 메뉴명</td>
							<td class="menu_price">단가</td>
							<td class="menu_count">수량</td>
							<td class="total">합계</td>
							<td class="order_status">주문시간/상태</td>
						</tr>
					</table>
					<div id="orderlistbox"></div>
				</div>
				<div id="rightbox">
				<br>
				<br>
				테이블번호<br><input type="text" id="tablebox" value=""><br>
				주문번호<br><input type="text" id="ordergroupbox" value=""><br>
				총액<br><input type="text" id="totalbox" value=""><br>
				
				<br>
				<button type="button" id = "orderConfirmbtn" class="btn btn-outline-secondary confirmbtn">주문확인</button><br><br>
				<button type="button" id = "completePaymentbtn" class="btn btn-secondary confirmbtn">결제완료</button>
				
				
				
				
				
				
				</div>
			</div>
		</div>
	</div>


</body>
</html>