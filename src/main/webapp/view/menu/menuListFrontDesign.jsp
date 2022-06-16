<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">


<meta charset="UTF-8">
<title>QR찍었을때 보이는 메뉴</title>
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

.container{

z-index: 99;
}




.btn-menu,.btn-menu:hover {
text-align: left;	
margin: 0px;
padding: 0px;
border: 1px solid #DCDCDC;
background-color: #E6E6E6;
color:black;
width: 100%; 
height: 50px;
}


.toptuple {

margin: 0px;
padding: 0px;
border: 1px solid #DCDCDC;
background-color: white;
color:black;
width: 100%; 

text-align: left;
display: flex;
flex-direction: row;
flex-wrap: wrap;
}


.menutuple {

margin: 0px;
padding: 0px;
border: 1px solid #DCDCDC;
background-color: white;
color:black;
width: 100%; 
height: 110px;
text-align: left;
display: flex;
flex-direction: column;
}


.menunamebox {
display: flex;
flex-direction: column;
text-align: center;
}

.btntop {
width: 90px;
height: 90px;
border: 1px solid #DCDCDC;
background-color: white;
color:black;


}
.btn-detail {
height: 100%;

}

.modal-header {
text-align: center;

}

.modal-body {
display: ;
}



.collapse {

display : inline-block;
text-align: center;

}

.what{
background-color: black;
display: inline-block;
width: 100%;
}

.linebtn{
display: inline-block;
width: 100%;
}

body::-webkit-scrollbar {
width: 10px;
}
body::-webkit-scrollbar-thumb{
background: rgba(255, 138, 0);
border-radius: 10px;
}
body::-webkit-scrollbar-track {
background: transparent;
}

#headerbox{
position: fixed;
left: 0px;
top: 0px;
margin : 0px;
padding : 0px;
height: 40px;
width:100%;
background: rgba(255, 138, 0);
z-index:999;
}

#headerlogo{
float:left;
padding-left:20px;
font-size: 28px;
font-weight:bold;
color: white;
cursor: pointer;
}

#headermenu{
float:right;
padding-right:20px;
font-size: 28px;
font-weight:bold;
color: white;
}

a, a:link, a:visited,a:hover {
	text-decoration: none;
}

#loginoutfont a,#loginoutfont a:link,#loginoutfont a:visited,#loginoutfont a:hover
{
color: white;
font-size: 20px;
}

#rightmenubtn{
cursor: pointer;
}

#slidemenu{

width: 100%;
height: 100%;
margin: 0px;
padding: 0px;

}

#slideheader{
display: inline-block;
text-align: right;
}

.modalbox,.modalbox:focus {
border: none;
background-color: white;
border: none;
}

#menu_photo{
display:inline-block;
width: 100%;
height: 250px;
}

#menutable{
width: 100%;
table-layout: fixed;
border:1px solid black;

margin-bottom: 10px;
margin-top: 10px;
}

#menutable td {
display:table-cell;
padding-top: 10px; 
padding-bottom: 10px;

border:1px solid black;

}

#menu_name{
font-size: 24px;
}

#menu_price{
font-size: 24px;
}

.updownbtn{
width: 30px;
height: 30px;
font-size: 20px;
margin: 0px;
padding: 0px;
}

#countofmenu{
width: 50px;
height: 30px;
font-size: 20px;
}

#btnset{
vertical-align: middle;
}


#detail_gae_won {
align-items: center;
text-align:center;

}

#centerlow {
align-items: center;
text-align:center;


}

#gae{
margin-left: 5px;
}

#won{
margin-left: 5px;
}

#cartbtn{

align-items: center;
text-align:center;
vertical-align:middle;
color: white;
font-size:30px;
font-weight:bold;
display: flex;
width: 150px;
height: 100px;
position: fixed;
right: 50px;
bottom: 50px;
background-color: rgba(255, 138, 0);
border-radius: 30px;
}

#cartbtn:hover {
	cursor:pointer;
}


.table_numberbox {

margin-top:100px;


width:300px;
height:300px;
font-size: 20px;

}


.modal-title {

margin: auto;

}






.linebox {

width:95%;
height: 80px;
display: table; margin-left: auto; margin-right: auto;

border: 1px solid #DCDCDC;

}


.linecontent {


display: flex;
flex-direction:row;

background-color: red;


}


.line_name {

float:left;

margin-left: 5px;
padding-left: 10px;
padding-top: 10px;

font-size: 22px;

}
.line_name:after{
content: "";
display:block;
clear:both;
}





.line_photo {

float:right;
margin-right: 5px;

padding-top:5px;
padding-bottom:5px;

width: 80px;
height: 80px;

}
.line_photo:after{
content: "";
display:block;
clear:both;
}


.line_count {

float:right;

margin-right: 5px;
font-size: 20px;

}
.line_count:after{
content: "";
display:block;
clear:both;
}


.gae{

float:right;
margin-right: 5px;

}
.gae:after{
content: "";
display:block;
clear:both;
}



.gagyuk {

float:left;

margin-left: 10px;

}
.gagyuk:after{
content: "";
display:block;
clear:both;
}



.line_price {

float:right;

margin-right: 10px;
font-size: 20px;

}
.line_price:after{
content: "";
display:block;
clear:both;
}




.won{

float:right;

margin-right: 15px;

}
.won:after{
content: "";
display:block;
clear:both;
}









</style>


<script>


function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};



$(()=>{
	
	// 최종주문 버튼 누를시(수정)
	
	$("#finalorder").click(()=>{
      //세션에서 카트꺼냄
      var cart = sessionStorage.getItem('cart');
      cart = JSON.parse(cart);
      //존재여부 확인
      if(JSON.stringify(cart) == null || JSON.stringify(cart) == ''){
         alert("주문목록이 비어있습니다.");
         return;
      }
      //주문 전송
      $.ajax({
         url:getContextPath()+"/orderlist/order.do",
         type: "post",
         dataType: "text",
         data: {"cart":JSON.stringify(cart)}, 
         success: data => {
            //주문 성공시 성공한 주문상세페이지로 이동
            if(data.indexOf("주문성공:")!=-1){
               sessionStorage.clear();
               location.href=data.substring(5);
            //실패할경우 원인출력
            }else{
               alert(data);
            }
         },
         error: () => {
            alert("요청실패");
         }
      });
      return;
   })
	
	
	
	
	
	
	/* 
	// 최종주문 버튼 누를시(처음에 짠거)
	$("#finalorder").click(()=>{
		
		var cart = sessionStorage.getItem('cart');
		cart = JSON.parse(cart);
		
		if(JSON.stringify(cart) == null || JSON.stringify(cart) == ''){
			
			alert("주문목록이 비어있습니다.");
			
			return null;
		}
		
		alert(JSON.stringify(cart));
		
		sessionStorage.setItem('cart', JSON.stringify(cart));
		
		$("#carthidden").val(JSON.stringify(cart));
		
		$("#finalorder").submit();
		
		
		//$('#orderlistmodal').modal('hide');
		
		return;
		
		
	});
	 */
	
	
	
	// 화면하단 '주문목록' 버튼 누를시
	$("#cartbtn").click(()=>{
		$('#orderlistmodal').modal('show');
		orderlistmodalContent.innerHTML = "";
		
		
		var cart = sessionStorage.getItem('cart');
		cart = JSON.parse(cart);
		
		var line = ""; 
		
		
		for(var menu of cart){
			
			//alert(JSON.stringify(menu['menu_name'])+","+JSON.stringify(menu['order_count'])+","+JSON.stringify(menu['menu_price']));
			
			
			line += "<div class='linebox'> ";
			line += "<div class='linecontent'> ";			
			
			line += "<div class='line_name'> "+JSON.stringify(menu['menu_name']).replaceAll("\"", "")+" </div> ";
			
			line += "<img src="+JSON.stringify(menu['menu_photo'])+" class='line_photo' >";
			
			line += "<div class='line_count'> "+JSON.stringify(menu['order_count'])+" </div> ";
			line += "<div class='gae'> "+"개"+" </div> " ;
			
			line += "<div class='gagyuk'> "+"가격"+" </div> " ;
			line += "<div class='line_price'> "+JSON.stringify(menu['menu_price'])+" </div> ";
			
			line += "<div class='won'> "+"원"+" </div> " ;
			
			
			line += "</div>";
			line += "</div>";
			
			
			//("<br>"+JSON.stringify(menu['menu_seq'])+":"+JSON.stringify(menu['order_count']));
			
		}
		//alert(JSON.stringify(cart));
		
		orderlistmodalContent.innerHTML = line ;
	})
	
	
	// 메뉴상세보기 안의 '주문목록에 담기' 버튼 누를시
	$("#cartinbtn").click(()=>{
		
		var menu_name = $("#menu_name").html();
		var menu_price = ($("#menu_price").html())*1;
		var menu_photo = $("#menu_photo").attr("src");
		
		var order_count = ($("#countofmenu").val())*1;
		if(order_count == 0||order_count == null||order_count == ''){
			order_count = 1;		
		} 
		var menu_seq = $("#menu_seq").val();
		
		var menu = {
			"menu_seq":menu_seq,
			"order_count":order_count,
			"menu_name":menu_name, 
			"shop_seq":<%=request.getParameter("shop_seq") %> ,
			"menu_price":menu_price, 
			"menu_photo":menu_photo, 
			"order_tablenum":<%=request.getParameter("order_tablenum") %>
		}
		
		var cart = sessionStorage.getItem('cart');
		console.log(cart);
		if(cart==null){
			cart = [];
			
			cart.push(menu);
			sessionStorage.setItem('cart', JSON.stringify(cart));
		}else{
			 
			cart = JSON.parse(cart);
			for(var menuitemidx in cart){
				console.log(cart[menuitemidx]);
				if(cart[menuitemidx]['menu_seq']==menu_seq){
					cart[menuitemidx]['order_count']=((cart[menuitemidx]['order_count'])*1) + order_count;
					
					//alert(JSON.stringify(cart));
					
					sessionStorage.setItem('cart', JSON.stringify(cart));
					
					
					$('#menuModal').modal('hide');
					
					alert("선택하신 메뉴를 주문목록에 담았습니다.");
					
					return;
				} 
				
			}
			console.dir(typeof(cart));
			cart.push(menu);
			sessionStorage.setItem('cart', JSON.stringify(cart));  
			
		}
		
		$('#menuModal').modal('hide');
		
		alert("선택하신 메뉴를 주문목록에 담았습니다.");
	});
	
});










$.ajax({
	url: getContextPath()+"/mypage/mypage",
	type: "get",
	dataType: "html",
	success: data => {
		$("#slidemenu").html(data);
	},
	error: () => {
		alert("개인메뉴로드실패");
	}
});




// 각각의 메뉴 클릭했을때 메뉴상세보기
$(function(){
	$(".btn-detail").click(function(){
		//alert("버튼 눌러짐");
		
		$("#countofmenu").val(1);
		
		var menuseq = $(this).attr("data-menuseq");
		
		$("#menu_seq").val(menuseq);
		//alert("메뉴시퀀스 받아옴");
		$.ajax({
			url: getContextPath()+"/menu/menuDetail.do", 
			data: { "menu_seq":menuseq }, 
			dataType:"json", 
			type: "post", 
			success: function(responseData){
				//alert("ajax 성공");
				//var test = JSON.stringify(responseData);
				
				//here.innerHTML = responseData.menu_seq;
				
				// JSON 받기 
				//var obj = JSON.parse(responseData);
				/* 
				$("#menu_seq").val(responseData.menu_seq);
				$("#menu_name").val(responseData.menu_name);
				$("#menu_info").val(responseData.menu_info);
				$("#menu_img").val(responseData.menu_img);
				$("#menu_price").val(responseData.menu_price);
				 */
				
				$("#menu_name").html(responseData["menu_name"]);
				$("#menu_info").html(responseData["menu_info"]);
				$("#menu_img").html(responseData["menu_img"]);
				$("#menu_price").html(responseData["menu_price"]);
				var path = "<%=request.getSession().getAttribute("path")%>";
				var imgpath = path+"/images/"+responseData["menu_img"];
				$("#menu_photo").attr("src",imgpath);
		

			}
			
		});
		
	});
	
});





</script>


</head>
<body>


<div class="table_numberbox">${ param.order_tablenum }</div>


<div id="wrapper" class="shadow">
<div id="mainframe">


<c:set var="top" value=""/>
<button type="button" class="btn btn-menu" data-bs-toggle="collapse" data-bs-target="#menu${top}">추천메뉴</button>
<div id="menu${top}" class="collapse show what">

<div class="toptuple">
<c:forEach var="menu" items="${menuDTOs}" varStatus="status">
<c:if test = "${menu.menu_top eq 1}">
<div>
<span>
<button type="button" class="btn btn-detail btntop" data-bs-toggle="modal" data-bs-target="#menuModal" data-menuseq="${ menu.menu_seq }" >${menu.menu_name}</button>
</span> 
</div>
</c:if>

</c:forEach>
</div>
</div>

<div>
<c:set var="last" value=""/>
<c:forEach var="menu" items="${menuDTOs}" varStatus="status">  
<c:if test ="${menu.menu_category ne last}">
</div>
<c:set var="last" value="${menu.menu_category}"/>
<button type="button" class="btn btn-menu" data-bs-toggle="collapse" data-bs-target="#menu${last}">${menu.menu_category}</button>
<div id="menu${last}" class="collapse what">
</c:if>
<span class="menutuple"><button type="button" class="btn btn-detail " data-bs-toggle="modal" data-bs-target="#menuModal" data-menuseq="${ menu.menu_seq }" >${menu.menu_name}</button></span>
</c:forEach>
</div>


</div>
</div>


<div id="cartbtn">주문목록</div>












<!-- 상세보기모달 -->
<div class="container" >
  
  <!-- The Modal -->
  <div class="modal" id="menuModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">메뉴 상세보기</h4>
          <button type="button" class="close" data-bs-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body form-group" >
        <input type="hidden" id="menu_seq" class="form-control"><br>
        
          <img src="" id="menu_photo">
          
          <table id = "menutable">
          <tr>
          <td colspan='2'><div id="menu_name"></div></td><td></td>
          <td colspan='2' id="detail_gae_won">
          <input id = "countofmenu" type="number" min="1" max="99" value=1> <span id="gae">개</span>
          </td>
          </tr>
          <tr>
          <td colspan='5'><div id="menu_info"></div></td>
          </tr>
          <tr id="centerlow">
          <td>가격</td> <td></td> <td></td> <td><div id="menu_price"></div></td> <td><span id="won"> 원</span></td>
          </tr>
          </table>
          
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" id="cartinbtn" class="btn btn-danger linebtn">담기</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>





<!-- 주문목록모달 -->
<div class="container" >

<!-- The Modal -->
<div class="modal" id="orderlistmodal">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h4 id="orderlistmodalTitle" class="modal-title">
					주문목록
					</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				
				<%-- <form action="${ path }/orderlist/order.do" method="post"  > --%>
				
				<div class="modal-body">
				
				<div id="orderlistmodalContent">
				
				<!-- <input type="hidden" id="carthidden" name="cart" class="form-control"  ><br> -->
				<br>
				</div>
				</div>
				<div class="blank"></div>
				<div class="modal-footer">
				<button type="button" id="finalorder" class="btn btn-danger linebtn" >주문확정</button>
				
			</div>
			
			</div>
		</div>
	</div>
</div>









<!-- 헤더박스 쌩으로 만들어놓은거 -->

<div id="headerbox">

<div id = "headerlogo" onclick="location.href='${path}/';">ZUMUNIYO</div>
<div id = "headermenu">

<span id="loginoutfont">
<c:if test="${member!=null}">
${member.mem_nick} 님, <a href="${path}/member/logout.do">LOGOUT</a>
</c:if>
<c:if test="${member==null}">
<a href="${path}/member/login.do">LOGIN</a>
</c:if>
</span>
<i class="fas fa-bars" id="rightmenubtn" data-bs-toggle="offcanvas" data-bs-target="#rightmenu"></i>

</div>


</div>









</body>
</html>