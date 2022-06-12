<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>회원가입</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="${path}/view/member/register.css">
<script src="${path}/view/member/register.js"></script>
</head>
<body>
	<div id="wrapper">
		<div id="mainframe">
			<table id="step">
				<tr>
					<td><input type="radio" id="radio1" value="1" class="step"
						name="step" checked="checked"><span>회원가입</span></td>
					<td><input type="radio" id="radio2" value="2" class="step"
						name="step"><span>약관동의</span></td>
					<td><input type="radio" id="radio3" value="3" class="step"
						name="step"><span>메일인증</span></td>
					<td><input type="radio" id="radio4" value="4" class="step"
						name="step"><span>정보입력</span></td>
					<td><input type="radio" id="radio5" value="5" class="step"
						name="step"><span>가입완료</span></td>
				</tr>
			</table>

			<div id="steptop"></div>
			<div id="step1box" class="stepbox shadow "
				style="display: none">

				<table id="typetable">
					<tr>
						<td class="typetd" id="type1td"><span class="typetext">일반회원</span></td>
						<td class="typetd" id="type2td"><span class="typetext">사업자회원</span></td>
					</tr>
				</table>

			</div>
			<div id="step2box" class="stepbox shadow p-4 mb-4" style="display: none">
				<h2>서비스 이용 약관</h2>
				<div id="terms">Lorem ipsum dolor sit amet, consectetur
					adipiscing elit, sed do eiusmod tempor incididunt ut labore et
					dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
					exercitation ullamco laboris nisi ut aliquip ex ea commodo
					consequat. Duis aute irure dolor in reprehenderit in voluptate
					velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
					occaecat cupidatat non proident, sunt in culpa qui officia deserunt
					mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur
					adipiscing elit, sed do eiusmod tempor incididunt ut labore et
					dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
					exercitation ullamco laboris nisi ut aliquip ex ea commodo
					consequat. Duis aute irure dolor in reprehenderit in voluptate
					velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
					occaecat cupidatat non proident, sunt in culpa qui officia deserunt
					mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur
					adipiscing elit, sed do eiusmod tempor incididunt ut labore et
					dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
					exercitation ullamco laboris nisi ut aliquip ex ea commodo
					consequat. Duis aute irure dolor in reprehenderit in voluptate
					velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
					occaecat cupidatat non proident, sunt in culpa qui officia deserunt
					mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur
					adipiscing elit, sed do eiusmod tempor incididunt ut labore et
					dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
					exercitation ullamco laboris nisi ut aliquip ex ea commodo
					consequat. Duis aute irure dolor in reprehenderit in voluptate
					velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
					occaecat cupidatat non proident, sunt in culpa qui officia deserunt
					mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur
					adipiscing elit, sed do eiusmod tempor incididunt ut labore et
					dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
					exercitation ullamco laboris nisi ut aliquip ex ea commodo
					consequat. Duis aute irure dolor in reprehenderit in voluptate
					velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
					occaecat cupidatat non proident, sunt in culpa qui officia deserunt
					mollit anim id est laborum.</div>
				<div class="blank"></div>
				<div id="checkboxs">
					<p>
						<input type="checkbox" id="checkbox1"><label
							for="checkbox1"> 모두 동의하기</label>
					</p>
					<p>
						<input type="checkbox" id="checkbox2"><label
							for="checkbox2"> 만 14세 이상입니다 <span class="red">(필수)</span></label>
					</p>
					<p>
						<input type="checkbox" id="checkbox3"><label
							for="checkbox3"> 서비스 이용약관 <span class="red">(필수)</span></label>
					</p>
					<p>
						<input type="checkbox" id="checkbox4"><label
							for="checkbox4"> 개인정보 수집 및 이용 <span class="red">(필수)</span></label>
					</p>
				</div>

				<button id="step2nextbtn" type="button"
					class="btn btn-outline-secondary">다음</button>

			</div>
			<div id="step3box" class="stepbox shadow p-4 mb-4" style="display: none">
				<h2>이메일 인증</h2>

				<div class="centerbox">
					<div class="input-group mb-3">
						<span class="input-group-text">이메일</span> <input type="text"
							id="email_addr" name="email_addr" class="form-control"
							placeholder="예시: member@zumuniyo.com">
						<button type="button" id="send_btn" class="btn btn-light">발송</button>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text">인증번호</span> <input type="text"
							id="email_certnum" name="email_certnum" class="form-control"
							placeholder="예시: 123456">
						<button type="button" id="confirm_btn" class="btn btn-light">인증</button>
					</div>
				</div>

			</div>
			<div id="step4box" class="stepbox shadow p-4 mb-4" style="display: none">
				<h2>상세 정보 입력</h2>
				<div class="centerbox">
					<form action="${path}/member/register.do" method="post"
						onSubmit="return false;">

						<input type="hidden" value="" id="mem_type" name="mem_type"
							disabled="disabled"> <input type="hidden" value=""
							id="mem_email" name="mem_email" disabled="disabled">

						<div class="input-group mb-3 ">
							<span class="input-group-text">아이디</span> <input type="text"
								id="mem_id" name="mem_id" class="form-control"
								placeholder="영문시작, 영문+숫자 6~20자"
								pattern="\0|^[a-z]+[a-z0-9]{5,19}$" data-bs-toggle="tooltip"
								data-bs-placement="top" title="영문시작, 영문+숫자 6~20자"><label
								class="red" id="idlabel"></label>
							<button type="button" id="id_check" class="btn btn-light">중복확인</button>
						</div>
						<div class="result_box" id="id_check_result"></div>
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
			<div id="step5box" class="stepbox shadow p-4 mb-4" style="display: none">
				<h2>가입을 환영합니다</h2>
				<div class="blank"></div>
				<div class="blank"></div>
				<div class="blank"></div>
				<i class="fas fa-utensils" id="succicon"></i>
				<div class="blank"></div>
				<div class="blank"></div>
				<div class="blank"></div>
				<button type="button" onclick="location.href='${path}/member/login.do';"
					class="btn btn-outline-secondary">로그인</button>
				<button type="button" onclick="location.href='${path}/';"
					class="btn btn-outline-secondary">홈으로</button>
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