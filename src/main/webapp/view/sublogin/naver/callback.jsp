<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>callback</title>
<script src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script>
  
  function getContextPath() {
	  var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	  return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};

	var naver_id_login = new naver_id_login("f6x1Hhd4EgEtk7ExFsBe", getContextPath()+"/member/login/sublogin.do");
	  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  
  function naverSignInCallback() {
	  
	var form = document.createElement('form');
	var url = getContextPath()+"/member/login/sublogin.do";
	
	window.opener.name= 'target';
	
	form.setAttribute('method', 'POST');
	form.setAttribute('action', url);
	form.setAttribute('target', 'target');
	
	document.charset = "utf-8";
	
	h1 = document.createElement('input');
	h1.setAttribute('type', 'hidden');
	h1.setAttribute('name', 'mem_id');
	h1.setAttribute('value', "naver:"+naver_id_login.oauthParams.access_token);
	form.appendChild(h1);
	
	h2 = document.createElement('input');
	h2.setAttribute('type', 'hidden');
	h2.setAttribute('name', 'mem_email');
	h2.setAttribute('value', naver_id_login.getProfileData('email'));
	form.appendChild(h2);
	
	document.body.appendChild(form);
	form.submit();
	self.close();

  }
</script>
</body>
</html>