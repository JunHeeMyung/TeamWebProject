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

<title>메뉴관리페이지</title>


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



table , td {
		border: 1px solid rgba(225, 225, 225); 
		border-collapse: collapse; 
		padding: 5px; 
	}
h1 { text-align: center; padding: 20px; margin: 10px; }
	

.modal-header {
text-align: center;

}

.menuphoto{

width: 100px;
height: 80px;

}



#menuinsert {
margin-right: 10px;
display: inline-block;
float:right;


align-items: center;
text-align:center;
vertical-align:middle;
color: white;
font-size:18px;
font-weight:bold;
display: flex;
width: 120px;
height: 40px;
background-color: rgba(255, 138, 0);
border-radius: 10px;

}

#insertbtn_space {
padding-left: 22px;

}


#btninsert {


}

#menucounter {
display: inline-block;
float:left;

padding-left: 30px;
margin-top: 15px; 

}

#space_1 {
clear:both;
width:800px;
height:10px;

}


#tableview_out {
font-size: 14px;
background-color: rgba(255, 178, 60);
width: 800px;

padding-top: 10px;
}

#tableview_in {
font-size: 14px;
background-color: rgba(255, 255, 255);
width: 780px;
margin:10px;
padding: 10px;

}

#menutable {


}


.menuinfospace {

text-align: left;
padding: 10px;
 

}


/*-----상세보기 모달------*/


#menu_photo{
display:inline-block;
width: 100%;
height: 250px;
}

#modaltable{
width: 100%;
table-layout: fixed;
border: 1px solid white;
margin-top: 10px;
}

#modaltable td {
display:table-cell;
padding-top: 10px; 
padding-bottom: 10px;
border: 1px solid white;

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




/*---------------------*/



</style>

<script>

function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};


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

$(function(){
	$("#btninsert").click(function(){
	
		var shop_seq = <%=request.getParameter("shop_seq")%>

			$.ajax({	
				url:getContextPath()+"/menu/menuInsert.do", 
				data: { "shop_seq":shop_seq }, 
				dataType:"text",
				type:"POST",
				
				success : data=>{
			        alert(data);
			        location.reload();
				},
				error : ()=> {
					alert("에러발생");
				}
			});
		
	});
});

 
$(function(){
	$(".btnDel").click(function(){
	
		var menuseq = $(this).attr("data-menuseq");
		var menuname = $(this).attr("data-menuname");
		
		if(confirm(menuname + " 메뉴를 삭제하시겠습니까?")){

			$.ajax({
				type:"POST",
				url:getContextPath()+"/menu/menuDelete.do", 
				data: { "menu_seq":menuseq }, 
				dataType:"text",
				success : data=>{
			        alert(data);
			        location.reload();
				},
				error : ()=> {
					alert("에러발생");
				}
			});
			
		}
	});
});

	


</script>




</head>
<body>





<div id="here"></div>


<div id="wrapper" >

<div id="mainframe" class="shadow">





<h1>해당 매장이 보유한 메뉴목록</h1>



<div id= "menucounter">
<c:set var="menuSize" value="${ menuDTOs.size() }"></c:set>
전체건수: ${ menuSize } 
</div>
	



<div id="menuinsert" align="center" data-bs-toggle="modal" data-bs-target="#insertmodal" >
<div id="btninsert"><span id="insertbtn_space">신규등록</span></div>
</div>



<div id= "space_1"></div>



<div id= "tableview_out" >	
<div id= "tableview_in" >	
<table id= "menutable">
	<tr>
		<td>순서</td>
		<td>이미지</td>
		<!-- <td>메뉴ID</td> -->
		<td>메뉴이름</td>
		<td>카테고리</td>
		<td>가격</td>
		
		<td>소개</td>
		<!-- <td>상단표시여부</td> -->
		<td>상세보기</td>
		
		<td>삭제</td>
		
	</tr>
	
	
	
	<c:forEach items="${ menuDTOs }" var="menu" varStatus="status">
	
	
	<tr>
		<td>${ menuSize-status.index }</td>
		<td><img src="${path}/images/${ menu.menu_img }" class="menuphoto"> </td>
		<%-- <td>${ menu.menu_seq }</td> --%>
		
		<td>${ menu.menu_name }</td>
		<td>${ menu.menu_category }</td>
		<td>${ menu.menu_price }</td>
		
		<td class="menuinfospace" >${ menu.menu_info }</td>
		<%-- <td>${ menu.menu_top }</td> --%>
		
		<td>
		<input type="button" value="확인" class="btn btn-detail btn-outline-secondary" 
		data-bs-toggle="modal" data-bs-target="#menuModal" data-menuseq="${ menu.menu_seq }" >
		</td>
		
		<td>
		<input type="button" value="삭제" class="btnDel btn btn-danger" data-menuseq="${ menu.menu_seq }" data-menuname="${ menu.menu_name }"   >
		</td>
	</tr>	
	
	
	</c:forEach>
</table>

</div>
</div>







</div>
</div>






<div id="insertContainer" class="container">
  
  <!-- The Modal -->
  <div class="modal" id="insertModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">메뉴 추가</h4>
          <button type="button" class="close" data-bs-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body form-group" >
        
        <form action="${ path }/menu/menuInsert.do" method="post" enctype="multipart/form-data" >
        
        
        <input type="hidden" name="shop_seq" class="form-control" value="<%=request.getParameter("shop_seq")%>"><br>
        
          <label>메뉴이름</label><input type="text" name="menu_name" class="form-control"><br>
          <label>카테고리</label><input type="text" name="menu_category" class="form-control"><br>
          <label>가격</label><input type="text" name="menu_price" class="form-control"><br>
          <label>메뉴소개</label><input type="text" name="menu_info" class="form-control"><br>
          
          <label>추천메뉴여부</label>
          <input type="radio" name="menu_top" value=1 >예
          <input type="radio" name="menu_top" value=0 checked="checked">아니오<br>
          <br><br><br>
          <label>이미지</label>
          
          <input type="file" name="photos" ><br><br><br>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          
          <input type="submit" class="btn btn-insert btn-primary" data-bs-dismiss="modal" value="등록하기" >
          <button type="reset" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
        </div>
          
          </form>
          
        </div>
        
        
      </div>
    </div>
  </div>
  
</div>













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
          
          <table id = "modaltable">
          <tr>
          <td colspan='2'><div id="menu_name"></div></td><td></td>
          <td colspan='2' id="detail_gae_won">
          
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
          
      </div>
    </div>
  </div>
  
</div>








<div id="detailContainer" class="container">
  
  <!-- The Modal -->
  <div class="modal" id="menuModal2">
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
         <label>메뉴이름</label><input type="text" id="menu_name" class="form-control"><br>
          <label>메뉴소개</label><input type="text" id="menu_info" class="form-control"><br>
          <label>이미지</label><input type="text" id="menu_img" class="form-control"><br>
          <label>가격</label><input type="text" id="menu_price" class="form-control"><br>
        
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>





</body>
</html>