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


@media (min-width: 900px){

#wrapper {
	height:100%;
	width: 900px;
	margin: 0px auto;
	text-align: center;
	background-color: rgba(255, 255, 255);
}

}

@media (max-width: 900px){

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

#status{
	text-align: center;
	padding: 0px;

}

table {
    margin:auto; 
}

table, td, th {
    border-collapse : collapse;
   /*  border : 1px solid black; */
};

</style>
<script type="text/javascript">


$(()=>{
	
	$("#nick_check").click(() => {

		$('#nick_check').attr('disabled', true);
		$("#nick_check").html("<div class='spinner-border text-primary'></div>");

		var mem_nick = $("#mem_nick").val();
		$.ajax({
			url: getContextPath()+"/member/nickcheck.do",
			type: "get",
			data: { "mem_nick": mem_nick },
			dataType: "text",
			success: data => {
				if (data == "중복") {
					$("#mem_nick").css("color","red");
					//$("#nick_check_result").html("<span class='red'>중복된 닉네임입니다</span>");
				} else if (data == "비중복") {
					$("#mem_nick").css("color","green");
					//$("#nick_check_result").html("<span class='green'>중복된 닉네임이 없습니다</span>");
				} else {
					//$("#nick_check_result").html("<span>" + data + "</span>");
				}

				$('#nick_check').attr('disabled', false);
				$("#nick_check").html('중복확인');				

			},
			error: () => {
				alert("요청실패");
				$('#nick_check').attr('disabled', false);
				$("#nick_check").html('중복확인');
			}
		})
	});

	$("#mem_nick").keyup(() => {
		$("#nicklabel").html(document.getElementById("mem_nick").checkValidity() ? "" : "<i class='xicon fas fa-times-circle red'></i>");
	})
})



</script>



</head>
<body>

<div id="wrapper" class="shadow">
<div id="mainframe">

<!-- 입력 -->
<div id="contents">
<div id= "status" class="shadow">

	<%-- <form action="${path}/admin/adminMemStatusUpdate.do" method="post"> --%>
		<table>
			<tr>
				<td>회원번호</td>
				<!-- <td>MEM_ID</td> -->
				<td>닉네임</td>
				<td>EMAIL</td>
				<!-- <td>MEM_SALT</td> -->
				<td>회원타입</td>
				<td>회원상태</td>
				<td></td>

				<!-- <td></td> -->
			</tr>

			<c:forEach items="${memberDTOs}" var="member">
				<tr>
					<c:if test="${member.mem_type!= '관리자'}">
						<form action="${path}/admin/adminMemStatusUpdate.do" method="post">
						<td>${member.mem_seq}<input type="hidden" name="mem_seq" value="${member.mem_seq}"></td>
						<%-- <td>${member.mem_id}</td> --%>
						<td><div class="input-group mb-3">
						<input type="text"
							id="mem_nick" name="mem_nick" class="form-control"
							placeholder="한글 2~8자" pattern="\0|^[가-힣]{2,8}$"
							data-bs-toggle="tooltip" data-bs-placement="top" title="한글 2~8자"
							value="${member.mem_nick}">
						<label class="red" id="nicklabel"></label>
						<button type="button" id="nick_check" class="btn btn-light">중복확인</button>
					</div></td>
						<td>${member.mem_email}</td>
						<%-- <td>${member.mem_salt}</td> --%>
						<td>${member.mem_type}</td>
						<td><select name="mem_status" class="form-control">
<%-- 								<option value="${member.mem_status}">${member.mem_status}</option> --%>
								<option value="none">${member.mem_status}</option>
								<option value="일반">일반</option>
								<option value="잠금">잠금</option>
								<option value="탈퇴">탈퇴</option>
						</select></td>
						<td><input class="btn btn-primary" type="submit" value="수정"></td>
						</form>
						<!-- <td><input class="form-control"  type="text" name="phone_number"></td> -->
					</c:if>
				</tr>
			</c:forEach>

		</table>
		<br> <br> <input type="button" id="btn1" value="뒤로가기"	onclick="location.href='${path}/';"> 
		<!-- <input	class="btn btn-primary" type="submit" value="입력하기"> -->


	<!-- </form> -->


</div>
</div>
</div>
</div>
</body>
</html>