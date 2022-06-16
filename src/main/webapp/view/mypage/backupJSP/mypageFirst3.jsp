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
	padding-top: 250px;
}


#send_btn,#confirm_btn,#id_check,#nick_check {
margin-left: 10px;
}


#contents {

/* 알아서 */

}


.red {
color: red; 
}

.green {
color: green; 
}

#status{ 
	

	text-align: center;
	/* border: 3px solid graytext; */
	width: 400px;
	height: 250px;	
	margin: auto;
	padding: 20px;
	border-radius: 10px;
}

#id_check_result{
display:inline-block;
width: 500px;
height: 500px;
background-color: red;
}

.xicon{
	font-size: 20px;
	margin-top: 8px;
	margin-left: 10px;
}


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
					$("#nick_check_result").html("<span class='red'>중복된 닉네임입니다</span>");
				} else if (data == "비중복") {
					$("#nick_check_result").html("<span class='green'>중복된 닉네임이 없습니다</span>");
				} else {
					$("#nick_check_result").html("<span>" + data + "</span>");
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
	
	
	
	
	$("#nick_update").click(() => {

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
					$("#nick_check_result").html("<span class='red'>중복된 닉네임입니다</span>");
				} else if (data == "비중복") {
					$("#nick_check_result").html("<span class='green'>중복된 닉네임이 없습니다</span>");
				} else {
					$("#nick_check_result").html("<span>" + data + "</span>");
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
	
	
})



</script>

<title>${member.mem_nick}회원님의 정보</title>

</head>
<body>

<div id="wrapper" class="shadow">
<div id="mainframe">

<!-- 입력 -->
<div id="contents">
<div id= "status" class="shadow">


<div class="input-group mb-3">
						<span class="input-group-text">회원번호</span> <input type="text"
							class="form-control" value="${member.mem_seq}" readonly="readonly">
</div>

<div class="input-group mb-3">
						<span class="input-group-text">회원상태</span> <input type="text"
							class="form-control" value="${member.mem_type}" readonly="readonly">
</div>



<div class="input-group mb-3">
						<span class="input-group-text">닉네임</span> <input type="text"
							id="mem_nick" name="mem_nick" class="form-control"
							placeholder="한글 2~8자" pattern="\0|^[가-힣]{2,8}$"
							data-bs-toggle="tooltip" data-bs-placement="top" title="한글 2~8자"
							value="${member.mem_nick}">
						<label class="red" id="nicklabel"></label>
						<button type="button" id="nick_check" class="btn btn-light">중복확인</button>
					</div>
<div class="result_box" id="nick_check_result"></div>

<input class="btn btn-outline-secondary" id="nick_update" type="button" value="수정">

</div>

<br> <br> <input type="button" id="btn1" value="뒤로가기"	onclick="location.href='${path}/';">


</div>
</div>
</div>

</body>
</html>