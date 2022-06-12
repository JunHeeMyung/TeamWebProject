<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>소셜 로그인 연동</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<%-- 
<link rel="stylesheet" href="${path}/view/sublogin/subregister.css">
<script src="${path}/view/sublogin/subregister.js"></script>
 --%>
 <style>
  
 body, html {
    height:  100%;
    margin:  0px auto;
    padding: 0px auto;
}

div {
	padding: 0px;
	margin: 0px;
}

#wrapper {
min-height:100%;
margin: 0px auto;
background-color: #F3F3F3;
text-align: center;
}

#mainframe {
width:600px;
display:inline-block;
margin: 0px auto;
padding-top:150px;
background-color: #F3F3F3;
box-sizing: content-box;
} 

#registerframe {
min-height:500px;
width:100%;
display:inline-block;
margin: 0px auto;
background-color: white;
} 

h2{
color:rgba(23, 12, 41);
padding-top:5px;
padding-bottom:15px;
margin: 0px;
}

.result_box {
height: 25px;
width: 100%;
margin-top: -5px;
margin-bottom: 13px;
}

#nick_check {
margin-left: 10px;
}

.blank {
height: 20px;
}

input:invalid {
  border-color: red;
}

.xicon{
	font-size: 20px;
	margin-top: 8px;
	margin-left: 10px;
}

.result_box {
height: 25px;
width: 100%;
margin-top: -5px;
margin-bottom: 13px;
}

.green {
color: green; 
}
 
.red {
color: red; 
}
  
</style>
<script>

function getContextPath() {
	  var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	  return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1));
};

$(() => {
	
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
	
$("#submitbtn").click(() => {

	$("#submitbtn").html("<div class='spinner-border text-primary'></div>");
	$('#submitbtn').attr('disabled', true);
	

	var mem_type = $("#mem_type").val();
	var mem_email = $("#mem_email").val();
	var mem_id = $("#mem_id").val();
	var mem_nick = $("#mem_nick").val();
	var mem_pw = $("#mem_pw").val();

	if(mem_type==""){ 
		$('#submitbtn').attr('disabled', false);
		$("#submitbtn").html('가입신청');
		alert("회원분류확인"); 
		return;
	}
	if(mem_email==""){
		$('#submitbtn').attr('disabled', false);
		$("#submitbtn").html('가입신청'); 
		alert("이메일확인"); 
		return;
	}
	if(mem_id==""){ 
		$('#submitbtn').attr('disabled', false);
		$("#submitbtn").html('가입신청');
		alert("아이디확인"); 
		$("#mem_id").focus()
		return;
	}
	if(mem_nick==""){ 
		$('#submitbtn').attr('disabled', false);
		$("#submitbtn").html('가입신청');
		alert("닉네임확인"); 
		$("#mem_nick").focus()
		return;
	}
	if(mem_pw==""||mem_pw!=$("#mem_pwconfirm").val()){ 
		$('#submitbtn').attr('disabled', false);
		$("#submitbtn").html('가입신청');
		alert("비밀번호확인");
		$("#mem_pw").focus()
		return;
	}

	$.ajax({
		url: getContextPath()+"/member/register.do",
		type: "post",
		data: { "mem_type": mem_type ,
				"mem_email": mem_email ,
				"mem_nick": mem_nick ,
				"mem_id": mem_id ,
				"mem_pw": mem_pw
				},
		dataType: "text",
		success: data => {
			if(data=="성공"){
				location.href = getContextPath()+"/member/login.do";
			}else{

				$('#myModalTitle').html("가입 정보 확인");
				$('#myModalContent').html(data);
				$('#myModal').modal('show');

			}
			$('#submitbtn').attr('disabled', false);
			$("#submitbtn").html('가입신청');
		},
		error: () => {
			alert("요청실패");
			$('#submitbtn').attr('disabled', false);
			$("#submitbtn").html('가입신청');
		}
	})
});
$("#mem_nick").keyup(() => {
	$("#nicklabel").html(document.getElementById("mem_nick").checkValidity() ? "" : "<i class='xicon fas fa-times-circle red'></i>");
})
$("#mem_pw").keyup(() => {
	$("#pwlabel").html(document.getElementById("mem_pw").checkValidity() ? "" : "<i class='xicon fas fa-times-circle red'></i>");
})
$("#mem_pwconfirm").keyup(() => {
	$("#pwconfirmlabel").html(document.getElementById("mem_pwconfirm").checkValidity() ? "" : "<i class='xicon fas fa-times-circle red'></i>");
	if($("#mem_pw").val()!=$("#mem_pwconfirm").val()){
		$("#mem_pwconfirm_result").html("<span class='red'>비밀번호가 일치하지 않습니다</span>");
	}else{
		$("#mem_pwconfirm_result").html("");
	}
})

var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
	var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
		return new bootstrap.Tooltip(tooltipTriggerEl)
	})
 
});
 
 
</script>
</head>

<body>
	<div id="wrapper">
		<div id="mainframe">
			<div id="registerframe" class="stepbox shadow p-4">	
				<div class="p-4">
					<h2>소셜 로그인 연동</h2>
					<div class="blank"></div>
					<form action="${path}/member/register.do" method="post"
						onSubmit="return false;">

						<input type="hidden" value="일반회원" id="mem_type" name="mem_type"
							disabled="disabled">

						<input type="hidden" value="${param.mem_email}"
							id="mem_email" name="mem_email" disabled="disabled">
							
						<input type="hidden" value="${param.mem_id}"
							id="mem_id" name="mem_id" disabled="disabled">

						<div class="input-group mb-3">
							<span class="input-group-text">닉네임</span> <input type="text"
								id="mem_nick" name="mem_nick" class="form-control"
								placeholder="한글 2~8자" pattern="\0|^[가-힣]{2,8}$"
								data-bs-toggle="tooltip" data-bs-placement="top" title="한글 2~8자">
							<label class="red" id="nicklabel"></label>
							<button type="button" id="nick_check" class="btn btn-light">중복확인</button>
						</div>
						<div class="result_box" id="nick_check_result"></div>
						<div class="input-group mb-3">
							<span class="input-group-text">비밀번호</span> <input type="password"
								id="mem_pw" name="mem_pw" class="form-control"
								placeholder="영문, 숫자, 특수문자 조합 8~16자"
								pattern="\0|^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$"
								data-bs-toggle="tooltip" data-bs-placement="top"
								title="영문, 숫자, 특수문자 조합 8~16자"> <label class="red"
								id="pwlabel"></label>
						</div>
						<div class="result_box" id="mem_pw_result"></div>
						<div class="input-group mb-3">
							<span class="input-group-text">비밀번호확인</span> <input
								type="password" id="mem_pwconfirm" name="mem_pwconfirm"
								class="form-control" placeholder="영문, 숫자, 특수문자 조합 8~16자"
								pattern="\0|^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$"
								data-bs-toggle="tooltip" data-bs-placement="top"
								title="영문, 숫자, 특수문자 조합 8~16자"> <label class="red"
								id="pwconfirmlabel"></label>
						</div>
						<div class="result_box" id="mem_pwconfirm_result"></div>
						<input type="submit" id="submitbtn"
							class="btn btn-outline-secondary" value="가입신청">

					</form>
				</div>

			</div>
		</div>
	</div>

	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h4 id="myModalTitle" class="modal-title"></h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<div class="modal-body" id="myModalContent"></div>
				<div class="blank"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">닫기</button>
				</div>

			</div>
		</div>
	</div>

</body>
</html>