<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>회원가입</title>
<style>

body, html {
    height:  100%;
    margin:  0px auto;
    padding: 0px auto;
}

#wrapper {
height:100%;
margin: 0px auto;
background-color: #F3F3F3;
text-align: center;
}

#mainframe {
height:100%;
width:750px;
display:inline-block;
margin: 0px auto;
background-color: #F3F3F3;
}

#step{
margin-top:5%;
width:100%;
text-align: center;
}

/* .step {display:none;} */

.step + span {
border-collapse: collapse;
color:#727272;
display: inline-block;
width:100%;
height:100%;
background-color: #e5e5e5;
}

.step:checked + span{
border-collapse: collapse;
color: #1E82FF;
font-weight: bold;
display: inline-block;
width:100%;
height:100%;
background-color: white;
}

table,td {
padding: 0px;
margin: 0px;
border-spacing:0px;
}

.step ~ span {
	padding-top: 5px;
	padding-bottom: 5px;
	border-top-left-radius:20px;
	border-top-right-radius:20px;
}

.stepbox {
margin:0px;
padding:0px;		
background-color:white;
box-sizing:content-box;
height:90%;
box-shadow: 10px -10px 10px -10px #888,
            -10px -10px 10px -10px #888;
}

h2{
color:#727272;
padding-top:2%;
padding-bottom:2%;
margin: 0px;
}

.typetd {
width: 30%;
height: 100%;
border-radius: 30px;
box-shadow: 10px -10px 10px -10px #888,
			-10px 10px 10px -10px #888,
			10px 10px 10px -10px #888,
            -10px -10px 10px -10px #888;
justify-content: center;
align-items: center;
background-size : 800px;
background-position: center; 
text-shadow: 5px 5px 5px #000;
color: white;
font-weight: bold;
text-align: center;
font-size: 28px;
filter: grayscale(50%);
}

#typetable{
border-collapse:separate;
border-spacing: 50px;
width: 90%;
height: 500px;
max-height: 80%;
margin-left : 5%;
margin-right : 5%;
}

.typetd:hover {
cursor: pointer;
transition: 1.0s;
background-position: 100% center;
filter: grayscale(0%);
box-shadow: 10px -10px 10px -10px #1E82FF,
			-10px 10px 10px -10px #1E82FF,
			10px 10px 10px -10px #1E82FF,
            -10px -10px 10px -10px #1E82FF;
}

#type1td {
background-image: url("/view/member/img/register01.jpg");
}

#type2td {
background-image: url("/view/member/img/register02.jpg");
}

.red {
color: red; 
}

input[type=checkbox]:checked + label {
font-weight: bold;
}

#terms {
margin: 0px auto;
text-align:left;
width: 80%;
height: 500px;
max-height: 50%;
background-color: #F3F3F3;
overflow-y:scroll;
}

#terms::-webkit-scrollbar {
width: 10px;
}
#terms::-webkit-scrollbar-thumb{
background: #727272;
border-radius: 10px;
}
#terms::-webkit-scrollbar-track {
background: F3F3F3;
}

#checkboxs {
margin-top:20px;
margin-bottom:10px;
margin-left:20%;
text-align: left;
}

input[type=checkbox]{
margin-right: 15px;
}

.centerbox {
margin: 0px auto;
margin-top: 5px;
margin-bottom: 5px;
padding: 0px auto;
width: 80%;
}

.result_box {
height: 25px;
width: 100%;
margin-top: -5px;
margin-bottom: 13px;
}


#send_btn,#confirm_btn,#id_check,#nick_check {
margin-left: 10px;
}

#timer {
color:red;
}




</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(()=>{
	$(".stepbox").hide();
	$("#step1box").show();
	
	$("#type1td").click(()=>{
		$("#mem_type").val("일반회원");
		$("#radio2").prop('checked', true).trigger('change');
	});
	
	$("#type2td").click(()=>{
		$("#mem_type").val("사업자회원");
		$("#radio2").prop('checked', true).trigger('change');
	});
	
	$("input[name='step']").change(()=>{
		$(".stepbox").hide();
		$("#step"+($("input[name='step']:checked").val())+"box").show();
	})
	
	$("#checkbox1").click(()=>{
		var checker = $("#checkbox1").is(":checked");
		$("#checkbox2").prop("checked", checker);
		$("#checkbox3").prop("checked", checker);
		$("#checkbox4").prop("checked", checker);
	});
	
	$("#step2nextbtn").click(()=>{
		var checker2 = $("#checkbox1").is(":checked");
		var checker3 = $("#checkbox1").is(":checked");
		var checker4 = $("#checkbox1").is(":checked");
		
		if(checker2&&checker3&&checker4){
			$("#radio3").prop('checked', true).trigger('change');
		}else{
			$('#myModalTitle').html("약관 동의 여부 확인");
			$('#myModalContent').html("약관을 동의 여부를 다시 확인하세요");
			$('#myModal').modal('show');
		}
	});
	
	$("#send_btn").click(()=>{
		
		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		var email_addr = $("#email_addr").val();
		if(regEmail.test(email_addr)===true){
			$("#send_btn").html("<div class='spinner-border text-primary'></div>");
			$.ajax({
				    url : "/emailcert/create.do",
				    type : "get",
				    data : {"email_addr":email_addr},
				    dataType : "text",
				    success : data=>{
						if(data=="메일발송성공"){
							$("#send_btn").html("<div id='timer'>3:00</div>");
							countDown(180);
							$('#send_btn').attr('disabled', true);
							$('#email_addr').attr('disabled', true);
						}else{
							alert(data);
						}
				    },
				    error:()=>{
				        alert("요청실패");
				    }
				})

		}else{
			
			$('#myModalTitle').html("이메일 형식 확인");
			$('#myModalContent').html("올바른 이메일 형식을 입력해주세요");
			$('#myModal').modal('show');
		}
	});
	
	$("#confirm_btn").click(()=>{
		
		$('#confirm_btn').attr('disabled', true);
		
		var email_addr = $("#email_addr").val();
		var email_certnum = $("#email_certnum").val();
		
		$.ajax({
			    url : "/emailcert/confirm.do",
			    type : "get",
			    data : {"email_addr":email_addr,"email_certnum":email_certnum},
			    dataType : "text",
			    success : data=>{
					if(data=="인증성공"){
						
						$("#mem_email").val(email_addr);
						$("#radio4").prop('checked', true).trigger('change');

					}else{
						
						$('#myModalTitle').html("인증 번호 확인");
						$('#myModalContent').html(data);
						$('#myModal').modal('show');
						
					}
					$('#confirm_btn').attr('disabled', false);
			    },
			    error:()=>{
			        alert("요청실패");
					$('#confirm_btn').attr('disabled', false);
			    }
			})
	});

	
})

const countDown = t =>{
	
		var time = t;

		function setTime() {
			var num = time;
			var min = Math.floor(num / 60);
			var sec = num % 60;
			
			if (time < 0) {
				clearInterval(timer);
				$("#send_btn").html("재전송");
				$('#send_btn').attr('disabled', false);
				$('#email_addr').attr('disabled', false);
				return;
			}
			
			$("#timer").html(min+":"+sec.toString().padStart(2,'0'));
			time=time-1;
		}

		timer = setInterval(setTime, 1000);
	}

</script>
</head>
<body>
<div id="wrapper">
<div id="mainframe">
<table id="step">
<tr>
<td><input type="radio" id="radio1" value="1" class="step" name="step" checked="checked"><span>회원가입</span></td>
<td><input type="radio" id="radio2" value="2" class="step" name="step"><span>약관동의</span></td>
<td><input type="radio" id="radio3" value="3" class="step" name="step"><span>메일인증</span></td>
<td><input type="radio" id="radio4" value="4" class="step" name="step"><span>정보입력</span></td>
<td><input type="radio" id="radio5" value="5" class="step" name="step"><span>가입완료</span></td>
</tr>
</table>

<div id="step1box" class="stepbox" style="display:none">

<h2> ZUMUNIYO에 오신 것을 환영합니다</h2>

<table id = "typetable">
<tr><td class = "typetd" id="type1td">일반회원</td><td class = "typetd" id="type2td">사업자회원</td></tr>
</table>

</div>
<div id="step2box" class="stepbox">
<h2> 서비스 이용 약관</h2>
<div id="terms">
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
</div>

<div id="checkboxs">
<p><input type="checkbox" id="checkbox1"><label for="checkbox1"> 모두 동의하기</label></p>
<p><input type="checkbox" id="checkbox2"><label for="checkbox2"> 만 14세 이상입니다 <span class="red">(필수)</span></label></p>
<p><input type="checkbox" id="checkbox3"><label for="checkbox3"> 서비스 이용약관 <span class="red">(필수)</span></label></p>
<p><input type="checkbox" id="checkbox4"><label for="checkbox4"> 개인정보 수집 및 이용 <span class="red">(필수)</span></label></p>
</div>

<button id="step2nextbtn" type="button" class="btn btn-secondary">다음</button>

</div>
<div id="step3box" class="stepbox">
<h2> 이메일 인증</h2>

<div class="centerbox">
<div class="input-group mb-3">
  <span class="input-group-text">이메일</span>
  <input type="text" id="email_addr" name="email_addr" class="form-control" placeholder="예시: member@zumuniyo.com">
  <button type="button" id="send_btn" class="btn btn-light">발송</button>
</div>
<div class="input-group mb-3">
  <span class="input-group-text">인증번호</span>
  <input type="text" id="email_certnum" name="email_certnum" class="form-control" placeholder="예시: 123456">
  <button type="button" id="confirm_btn" class="btn btn-light">인증</button>
</div>
</div>

</div>
<div id="step4box" class="stepbox">
<h2>상세 정보 입력</h2>

<div class="centerbox">
<form action="/member/register.do" method="post">

<input type="hidden" value="" id="mem_type" name="mem_type" disabled="disabled">
<input type="hidden" value="" id="mem_email" name="mem_email" disabled="disabled">

<div class="input-group mb-3">
  <span class="input-group-text">아이디</span>
  <input type="text" id="mem_id" name="mem_id" class="form-control" placeholder="영문시작, 영문+숫자 6~20자">
<button type="button" id="id_check" class="btn btn-light">중복확인</button>
</div>
<div class="result_box" id="mem_id_result"></div>
<div class="input-group mb-3">
  <span class="input-group-text">닉네임</span>
  <input type="text" id="mem_nick" name="mem_nick" class="form-control" placeholder="한글 2~8자">
<button type="button" id="nick_check" class="btn btn-light">중복확인</button>
</div>
<div class="result_box" id="nick_check_result"></div>
<div class="input-group mb-3">
  <span class="input-group-text">비밀번호</span>
  <input type="text" id="mem_pw" name="mem_pw" class="form-control" placeholder="영문, 숫자, 특수문자 조합 8~16자">
</div>
<div class="result_box" id="mem_pw_result"></div>
<div class="input-group mb-3">
  <span class="input-group-text">비밀번호확인</span>
  <input type="text" id="mem_pwconfirm" name="mem_pwconfirm" class="form-control" placeholder="영문, 숫자, 특수문자 조합 8~16자">
</div>
<div class="result_box" id="mem_pwconfirm_result"></div>

</form>
</div>

</div>
<div id="step5box" class="stepbox">
<h2>가입을 환영합니다</h2>

</div>
</div>
</div>

<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h4 id = "myModalTitle" class="modal-title"></h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body" id = "myModalContent">
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>







</body>
</html>