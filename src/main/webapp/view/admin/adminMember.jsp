<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="${page}/view/common/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<br>
<br>

<table>
		<tr>
			<td>MEM_SEQ</td>
			<td>MEM_ID</td>
			<td>MEM_NICK</td>
			<td>MEM_EMAIL</td>
			<td>MEM_SALT</td>
			<td>MEM_TYPE</td>
			<td>MEM_STATUS</td>
			<!-- <td></td> -->
		</tr>
		
		<c:forEach items="${memberDTOs}" var="member">
		<tr>
			<td>${member.mem_seq}</td>
			<td>${member.mem_id}</td>
			<td>${member.mem_nick}</td>
			<td>${member.mem_email}</td>
			<td>${member.mem_salt}</td>
			<td>${member.mem_type}</td>
			<td>${member.mem_status}</td>			
			<!-- <td><input class="form-control"  type="text" name="phone_number"></td> -->

		</tr>
		</c:forEach>

</table>
<br>
<br>
<input type="button" id="btn1" value="뒤로가기" onclick="location.href='${path}/';">



</body>
</html>