
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
 