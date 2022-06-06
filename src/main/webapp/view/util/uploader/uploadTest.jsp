<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
<meta charset="UTF-8">
<head>
<title>파일 업로드</title>
</head>
<body>
	<form action="${contextPath}/uploadtest.do" 
	method="post" enctype="multipart/form-data">
		파일: <input type="file" name="photos"> <br> 
		<input type="submit"value="업로드">
	</form>
</body>
</html>