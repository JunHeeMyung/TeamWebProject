<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="${page}/view/common/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>${member.mem_nick}회원님의 정보</title>
</head>

<body>
<br>
<br>
<br>


<p>회원번호 :${member.mem_seq} </p>
<p><input type="text" name="mem_nick" value="${member.mem_nick}">&nbsp;<input class="btn btn-primary" type="submit" value="수정"></p>
<p>닉네임 : ${member.mem_nick} </p>
<p>회원상태 : ${member.mem_type} </p>

<br> <br> <input type="button" id="btn1" value="뒤로가기"	onclick="location.href='${path}/';">
</body>
</html>