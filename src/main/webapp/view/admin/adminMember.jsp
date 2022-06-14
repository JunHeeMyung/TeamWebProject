<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="${page}/view/common/header.jsp" />
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
	<%-- <form action="${path}/admin/adminMemStatusUpdate.do" method="post"> --%>
		<table>
			<tr>
				<td>MEM_SEQ</td>
				<td>MEM_ID</td>
				<td>MEM_NICK</td>
				<td>MEM_EMAIL</td>
				<td>MEM_SALT</td>
				<td>MEM_TYPE</td>
				<td>MEM_STATUS</td>
				<td></td>

				<!-- <td></td> -->
			</tr>

			<c:forEach items="${memberDTOs}" var="member">
				<tr>
					<c:if test="${member.mem_type!= '관리자'}">
						<form action="${path}/admin/adminMemStatusUpdate.do" method="post">
						<td>${member.mem_seq}<input type="hidden" name="mem_seq" value="${member.mem_seq}"></td>
						<td>${member.mem_id}</td>
						<td><input type="text" name="mem_nick" value="${member.mem_nick}"></td>
						<td>${member.mem_email}</td>
						<td>${member.mem_salt}</td>
						<td>${member.mem_type}</td>
						<td><select name="mem_status" class="form-control">
<%-- 								<option value="${member.mem_status}">${member.mem_status}</option> --%>
								<option value="none">${member.mem_status}</option>
								<option value="일반">일반</option>
								<option value="잠금">잠금</option>
								<option value="탈퇴">탈퇴</option>
						</select></td>
						<td><input class="btn btn-primary" type="submit" value="수정"></td>
						</form>
						<!-- <td><input class="form-control"  type="text" name="phone_number"></td> -->
					</c:if>
				</tr>
			</c:forEach>

		</table>
		<br> <br> <input type="button" id="btn1" value="뒤로가기"	onclick="location.href='${path}/';"> 
		<!-- <input	class="btn btn-primary" type="submit" value="입력하기"> -->


	<!-- </form> -->

</body>
</html>