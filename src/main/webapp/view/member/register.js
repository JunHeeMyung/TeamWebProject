$(() => {
	$(".stepbox").hide();
	$("#step1box").show();

	$("#type1td").click(() => {
		$("#mem_type").val("일반회원");
		$("#radio2").prop('checked', true).trigger('change');
	});

	$("#type2td").click(() => {
		$("#mem_type").val("사업자회원");
		$("#radio2").prop('checked', true).trigger('change');
	});

	$("input[name='step']").change(() => {
		$(".stepbox").hide();
		$("#step" + ($("input[name='step']:checked").val()) + "box").show();
	})

	$("#checkbox1").click(() => {
		var checker = $("#checkbox1").is(":checked");
		$("#checkbox2").prop("checked", checker);
		$("#checkbox3").prop("checked", checker);
		$("#checkbox4").prop("checked", checker);
	});

	$("#step2nextbtn").click(() => {
		var checker2 = $("#checkbox1").is(":checked");
		var checker3 = $("#checkbox1").is(":checked");
		var checker4 = $("#checkbox1").is(":checked");

		if (checker2 && checker3 && checker4) {
			$("#radio3").prop('checked', true).trigger('change');
		} else {
			$('#myModalTitle').html("약관 동의 여부 확인");
			$('#myModalContent').html("약관을 동의 여부를 다시 확인하세요");
			$('#myModal').modal('show');
		}
	});

	$("#send_btn").click(() => {

		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		var email_addr = $("#email_addr").val();
		if (regEmail.test(email_addr) === true) {
			$("#send_btn").html("<div class='spinner-border text-primary'></div>");
			$.ajax({
				url: "/emailcert/create.do",
				type: "get",
				data: { "email_addr": email_addr },
				dataType: "text",
				success: data => {
					if (data == "메일발송성공") {
						$("#send_btn").html("<div id='timer'>3:00</div>");
						countDown(180);
						$('#send_btn').attr('disabled', true);
						$('#email_addr').attr('disabled', true);
					} else {

						$("#send_btn").html("발송");
						$('#myModalTitle').html("이메일 입력 확인");
						$('#myModalContent').html(data);
						$('#myModal').modal('show');

					}
				},
				error: () => {
					alert("요청실패");
				}
			})

		} else {

			$('#myModalTitle').html("이메일 형식 확인");
			$('#myModalContent').html("올바른 이메일 형식을 입력해주세요");
			$('#myModal').modal('show');
		}
	});

	$("#confirm_btn").click(() => {

		$('#confirm_btn').attr('disabled', true);
		var email_addr = $("#email_addr").val();
		var email_certnum = $("#email_certnum").val();

		$.ajax({
			url: "/emailcert/confirm.do",
			type: "get",
			data: { "email_addr": email_addr, "email_certnum": email_certnum },
			dataType: "text",
			success: data => {
				if (data == "인증성공") {

					$("#mem_email").val(email_addr);
					$("#radio4").prop('checked', true).trigger('change');

				} else {

					$('#myModalTitle').html("인증 번호 확인");
					$('#myModalContent').html(data);
					$('#myModal').modal('show');

				}
				$('#confirm_btn').attr('disabled', false);
			},
			error: () => {
				alert("요청실패");
				$('#confirm_btn').attr('disabled', false);
			}
		})
	});


	$("#id_check").click(() => {

		$('#id_check').attr('disabled', true);
		$("#id_check").html("<div class='spinner-border text-primary'></div>");

		var mem_id = $("#mem_id").val();
		$.ajax({
			url: "/member/idcheck.do",
			type: "get",
			data: { "mem_id": mem_id },
			dataType: "text",
			success: data => {
				if (data == "중복") {
					$("#id_check_result").html("<span class='red'>중복된 아이디입니다</span>");
				} else if (data == "비중복") {
					$("#id_check_result").html("<span class='green'>중복된 아이디가 없습니다</span>");
				} else {
					$("#id_check_result").html("<span>" + data + "</span>");
				}

				$('#id_check').attr('disabled', false);
				$("#id_check").html('중복확인');
			},
			error: () => {
				alert("요청실패");
				$('#id_check').attr('disabled', false);
				$("#id_check").html('중복확인');
			}
		})
	});

	$("#nick_check").click(() => {

		$('#nick_check').attr('disabled', true);
		$("#nick_check").html("<div class='spinner-border text-primary'></div>");

		var mem_nick = $("#mem_nick").val();
		$.ajax({
			url: "/member/nickcheck.do",
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

		$('#submitbtn').attr('disabled', true);
		$("#submitbtn").html("<div class='spinner-border text-primary'></div>");

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
			url: "/member/register.do",
			type: "post",
			data: { "mem_type": mem_type ,
					"mem_email": mem_email ,
					"mem_nick": mem_nick ,
					"mem_id": mem_id ,
					"mem_nick": mem_nick ,
					"mem_pw": mem_pw ,
					},
			dataType: "text",
			success: data => {
				if(data=="성공"){
					$("#radio5").prop('checked', true).trigger('change');
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
	$("#mem_id").keyup(() => {
		$("#idlabel").html(document.getElementById("mem_id").checkValidity() ? "" : "<i class='xicon fas fa-times-circle red'></i>");
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

})

const countDown = t => {

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

		$("#timer").html(min + ":" + sec.toString().padStart(2, '0'));
		time = time - 1;
	}

	timer = setInterval(setTime, 1000);
}