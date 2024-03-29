<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="${page}/view/common/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>	
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="${path}/view/member/login.js"></script>
<link rel="stylesheet" href="${path}/view/member/login.css">

</head>
<body>

	<div id="wrapper">
		<div id="mainframe">
			<div id="mainbox" class="stepbox shadow mb-4">
				<div id="leftbox"></div>
				<div id="loginbox">
					<form action="${path}/member/login.do" method="post" onSubmit="return false;">
						<div class="form-floating mb-3 mt-3">
							<input type="text" class="form-control mt-4" id="mem_id"
								placeholder="Enter email" name="mem_id"> <label
								for="mem_id">아이디</label>
						</div>

						<div class="form-floating mt-3 mb-3">
							<input type="password" class="form-control" id="mem_pw"
								placeholder="Enter password" name="mem_pw"> <label
								for="mem_id">비밀번호</label>
						</div>
						<input type="submit" id="loginbtn" class="btn btn-secondary mt-2" value="로그인">

						<div id="loginmenu" class="mt-4">
							아이디 찾기
							<div class="updown"></div>
							비밀번호 찾기
							<div class="updown"></div>
							<a href="${path}/member/register.do">회원가입</a>
						</div>

						<div id="subloginbox">
							<div id="naver_id_login"></div>
							<img src="${path}/view/member/img/naverlogin.png" id="naverbtn" class="loginicon mt-4">
							<img src="${path}/view/member/img/kakaologin.png" id="kakaobtn" onclick="kakaoLogin();" class="loginicon mt-4">
						</div>
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

<script>

var naver_id_login = new naver_id_login("f6x1Hhd4EgEtk7ExFsBe", "<%=request.getRequestURL().substring(0,request.getRequestURL().lastIndexOf(request.getServletPath()))+"/member/login/sublogin.do"%>");
var state = naver_id_login.getUniqState();
naver_id_login.setDomain("<%=request.getRequestURL().substring(0,request.getRequestURL().lastIndexOf(request.getServletPath()))%>");
naver_id_login.setState(state);
naver_id_login.setPopup();
naver_id_login.init_naver_id_login();


function sendPost(url, params) {
    var form = document.createElement('form');
    form.setAttribute('method', 'post');
    form.setAttribute('target', '_blank');
    form.setAttribute('action', url);
    document.charset = "UTF-8";

    for (var key in params) {
      var hiddenField = document.createElement('input');
      hiddenField.setAttribute('type', 'hidden');
      hiddenField.setAttribute('name', key);
      hiddenField.setAttribute('value', params[key]);
      form.appendChild(hiddenField);
    }

    document.body.appendChild(form);
    form.submit();
}

Kakao.init('878435cb63e52c1306f3d3ab856fc153');
function kakaoLogin() {
	
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  if(response.kakao_account.email==undefined){
        		  alert("카카오이메일 동의를 해주세요 (카카토톡>설정>개인/보안>카카오계정>연결된서비스관리>외부서비스 제거후 재시도)");
        	  }else{
        	  	var mem_email = response.kakao_account.email;
        	  	var mem_id = response.id;
        	  	window.close();
        	  	sendPost(getContextPath()+"/member/login/sublogin.do",{"mem_email":mem_email,"mem_id":mem_id,"type":"kakao"});
        	  }
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
}










</script>

</body>
</html>