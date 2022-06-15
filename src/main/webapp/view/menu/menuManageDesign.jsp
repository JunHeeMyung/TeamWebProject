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
<meta charset="UTF-8">
<title>메뉴관리페이지</title>


<style>


table , td {
		border: 1px solid black; 
		border-collapse: collapse; 
		padding: 10px; 
	}
	h1 { text-align: center; padding: 20px; margin: 10px; }
	

.modal-header {
text-align: center;

}

.menuphoto{

width: 100px;
height: 100px;

}


</style>

<script>

function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};


$(function(){
	$(".btn-detail").click(function(){
		//alert("버튼 눌러짐");
		var menuseq = $(this).attr("data-menuseq");
		
		$("#menu_seq").val(menuseq);
		//alert("메뉴시퀀스 받아옴");
		$.ajax({
			url: getContextPath()+"/menu/menuDetail.do", 
			data: { "menu_seq":menuseq }, 
			dataType:"json", 
			type: "POST", 
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
				
				$("#menu_id").val(responseData["menu_id"]);
				$("#menu_name").val(responseData["menu_name"]);
				$("#menu_info").val(responseData["menu_info"]);
				$("#menu_img").val(responseData["menu_img"]);
				$("#menu_price").val(responseData["menu_price"]);
				
				//alert("값넣어짐");
			}
			
		});
		
	});
	
});

<%-- 
$(function(){
	$(".btn-insert").click(function(){
	
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
 --%>
 
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


<h1>해당 매장이 보유한 메뉴목록</h1>


<div id="here"></div>





<div><span>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#insertModal" >신규등록</button>
</span></div>

	
	<c:set var="menuSize" value="${ menuDTOs.size() }"></c:set>
	
	전체건수: ${ menuSize } 
	
<table>
	<tr>
		<td>순서</td>
		<td>메뉴ID</td>
		<td>메뉴이름</td>
		<td>카테고리</td>
		<td>가격</td>
		<td>이미지</td>
		<td>소개</td>
		<td>상단표시여부</td>
		<td>상세보기</td>
		
		<td>삭제</td>
		
	</tr>
	
	
	
	<c:forEach items="${ menuDTOs }" var="menu" varStatus="status">
	
	
	<tr>
		<td>${ menuSize-status.index }</td>
		
		<td>${ menu.menu_seq }</td>
		
		<td>${ menu.menu_name }</td>
		<td>${ menu.menu_category }SID${ menu.shop_seq }</td>
		<td>${ menu.menu_price }</td>
		<td><img src="${path}/images/${ menu.menu_img }" class="menuphoto"> </td>
		<td>${ menu.menu_info }</td>
		<td>${ menu.menu_top }</td>
		
		<td>
		<input type="button" value="상세보기" class="btn btn-detail btn-primary" 
		data-bs-toggle="modal" data-bs-target="#menuModal" data-menuseq="${ menu.menu_seq }" >
		</td>
		
		<td>
		<input type="button" value="삭제" class="btnDel btn btn-primary" data-menuseq="${ menu.menu_seq }" data-menuname="${ menu.menu_name }"   >
		</td>
	</tr>	
	
	
	</c:forEach>
</table>








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




















<div id="detailContainer" class="container">
  
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