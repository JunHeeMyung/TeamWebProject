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

<link rel="stylesheet" href="${path}/view/sublogin/subregister.css">
<script src="${path}/view/sublogin/subregister.js"></script>
<jsp:include page="${page}/view/common/header.jsp"/>

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