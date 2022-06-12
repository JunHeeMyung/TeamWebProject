function getContextPath() {
	  var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	  return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

$(() => {
	
	$("#naverbtn").click(() => {
		$("#naver_id_login").children().trigger("click");
	})
	
	
	$("#loginbtn").click(() => {
		
		var mem_id = $("#mem_id").val();
		var mem_pw = $("#mem_pw").val();
		
		if(mem_id==""){
			$("#mem_id").focus();
			$('#myModalTitle').html("로그인 정보 확인");
			$('#myModalContent').html("아이디를 입력하세요");
			$('#myModal').modal('show');
			return;
		}
		
		if(mem_pw==""){
			$("#mem_id").focus();
			$('#myModalTitle').html("로그인 정보 확인");
			$('#myModalContent').html("비밀번호를 입력하세요");
			$('#myModal').modal('show');
			return;
		}
		
		$('#loginbtn').attr('disabled', true);
	
		$.ajax({
			url: getContextPath()+"/member/login.do",
			type: "post",
			data: { 
					"mem_id": mem_id ,
					"mem_pw": mem_pw
					},
			dataType: "text",
			success: data => {
				if(data=="로그인성공"){
					location.reload();
				}else{
	
					$('#myModalTitle').html("로그인 정보 확인");
					$('#myModalContent').html(data);
					$('#myModal').modal('show');
	
				}
				$('#loginbtn').attr('disabled', false);
			},
			error: () => {
				alert("요청실패");
				$('#loginbtn').attr('disabled', false);
			}
		})
	
	})
	
})