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
<title>Insert title here</title>
<style>

html,body,div,btn,btn-menu,goodmenu{
margin: 0px;
padding: 0px;
}


.btn-menu,.btn-menu:hover {
text-align: left;
margin: 0px;
padding: 0px;
border: 1px solid #DCDCDC;
background-color: #E6E6E6;
color:black;
width: 500px; 
height: 50px;
}


.toptuple {

margin: 0px;
padding: 0px;
border: 1px solid #DCDCDC;
background-color: white;
color:black;
width: 500px;

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
width: 500px;
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

.btn-detail {
width: 90px;
height: 90px;
border: 1px solid #DCDCDC;
background-color: white;
color:black;


}



</style>


<script>


function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};




$(function(){
	$(".btn-detail").click(function(){
		alert("버튼 눌러짐");
		var menuseq = $(this).attr("data-menuseq");
		
		$("#menu_seq").val(menuseq);
		alert("메뉴시퀀스 받아옴");
		$.ajax({
			url: getContextPath()+"/menu/menuDetail.do", 
			data: { "menu_seq":menuseq }, 
			dataType:"text", 
			type: "get", 
			success: function(responseData){
				alert("ajax 성공");
				var test = JSON.stringify(responseData);
				
				here.innerHTML = test;
				
				// JSON 받기 
				var obj = JSON.parse(responseData);
				$("#menu_seq").val(obj["menu_seq"]);
				$("#menu_name").val(obj["menu_name"]);
				$("#menu_info").val(obj["menu_info"]);
				$("#menu_img").val(obj["menu_img"]);
				$("#menu_price").val(obj["menu_price"]);
			
				alert("값넣어짐");
			}
			
		});
		
	});
	
});





</script>


</head>
<body>


<div id="here">

</div>



<c:set var="top" value=""/>
<button type="button" class="btn btn-menu" data-bs-toggle="collapse" data-bs-target="#menu${top}">추천메뉴</button>
<div id="menu${top}" class="collapse show">

<div class="toptuple">
<c:forEach var="menu" items="${menuDTOs}" varStatus="status">
<c:if test = "${menu.menu_top eq 1}">
<div>
<span>
<button type="button" class="btn btn-detail" data-toggle="modal" data-target="#menuModal" data-menuseq="${ menu.menu_seq }" >${menu.menu_name}</button>
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
<br><button type="button" class="btn btn-menu" data-bs-toggle="collapse" data-bs-target="#menu${last}">${menu.menu_category}</button>
<div id="menu${last}" class="collapse">
</c:if>
<span class="menutuple">${menu.menu_name}</span>
</c:forEach>
</div>





<div class="container">
  
  <!-- The Modal -->
  <div class="modal" id="menuModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">메뉴 상세보기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
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
          
          <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>







</body>
</html>