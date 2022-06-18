<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<script>
function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};





/*
$(()=> {	
	$(".btn-detail").click(function(){
		return "/shop/shopList.do";
		
		/*
		$.ajax({
			type:"GET",
			url:getContextPath()+"/shop/shopList.do", 
			//data: {shop_seq:4} ,
			dataType:"json",
			success : data=>{
		        if ( typeof(data) == "undefined" ) {return;}
		        
		        jsonhere.innerHTML=JSON.stringify(data);
		        
		         var boxvalue = "";
		        
		        boxvalue+="<table>";
		        for(var shopdata of data){
		        	
		        	boxvalue+="<tr><td>";
		        	boxvalue+= JSON.stringify(shopdata.menu_category).replaceAll("\"", "");
					boxvalue+="</td><td>";
					boxvalue+= JSON.stringify(shopdata.menu_img).replaceAll("\"", "");
					boxvalue+="</td></tr>";			      	  
		        }
		        boxvalue+="</table>";
		        here.innerHTML=boxvalue;
			    
			},
			error:()=> {
				alert("에러발생");
			}
		});	
		*/
		/*
	});	
});
*/

</script>



<meta charset="UTF-8">
<title>사업자회원 마이페이지</title>
</head>
<body>
<h1> 사업자회원 마이페이지</h1>
<p> 사업자회원 접속 성공 </p>



<p>회원넘버 :${member.mem_seq} </p>
<p>회원닉네임 :${member.mem_nick} </p>
<p>회원분류 :${member.mem_type} </p>


<ul>
<li>${member} </li>
</ul>


<br>

<form action="${path}/view/mypage/mypageFirst.jsp" method="post">
<button type="submit">회원정보</button>
</form> 

<br>
<form action="${path}/review/reviewShopList.do" method="post" name="mem_seq">
<button type="submit">매장 리뷰 조회</button>
</form>
<br>

<br>
<form action="${path}/shop/shopInsert.do" method="get" name="mem_seq2">
<button type="submit">매장 등록</button>
</form>
<br>

<br>
<form action="${path}/shop/shopUpdate.do" method="get" name="mem_seq3">
<button type="submit">매장 수정</button>
</form>
<br>

<br>
<form action="${path}/shop/shopselectByMem.do" method="post" name="mem_seq4">
<button type="submit">매장관리</button>
</form>
<br>

<br>
<form action="${path}/menu/menuManage.do" method="get" name="mem_seq5">
<button type="submit">매뉴관리</button>
</form>
<br>

<br>
<form action="${path}/orderlist/manageropener.do" method="get" name="mem_seq6">
<button type="submit">주문관리 및 QR생성</button>
</form>
<br>
<%-- 
<br>
<form action="${path}/review/reviewShopList.do" method="post" name="mem_seq" val="${member.mem_seq}">
<button type="submit">매장 리뷰 조회</button>
</form>
<br>
 --%>
<%-- 
<button class="btn-detail" onClick="location.href='${path}/shop/shopList.do'">등록된 매장 정보</button>

 --%>


</body>
</html>