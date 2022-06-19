<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="${page}/view/common/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<!-- JQUERY-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- FONTAWESOME -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

<title>기본 디자인</title>
<style>

body, html {
	height:100%;
	width:100%;
	padding: 0px auto;
	margin: 0px auto;
	background-color: #F3F3F3;
}

div {
	padding: 0px;
	margin: 0px;
}


@media (min-width: 900px){

#wrapper {
	height:100%;
	width: 900px;
	margin: 0px auto;
	text-align: center;
	background-color: rgba(255, 255, 255);
}

}

@media (max-width: 900px){

#wrapper {
	height:100%;
	width: 100%;
	margin: 0px auto;
	text-align: center;
	background-color: rgba(255, 255, 255);
}

}

#mainframe {
	width: 100%;
	display : inline-block;
	margin: 0px auto;
	background-color: rgba(255, 255, 255);
	padding-top: 100px;
}

#contents {

}

tr {
	padding: 0px;
	margin: 0px;
}

td {
	padding: 10px;
	margin: 10px;
	/* border: 2px solid graytext; */
}

table {	
	text-align: center;
	border : 1px;
	padding: 0px;
	margin: auto;	
}
</style>




</head>
<body>

<div id="wrapper" class="shadow">

<div id="mainframe">

<div id="contents">

<table id="reviewTable" class="table table-striped">	
		<thead class="table-success">
			<tr>
				<th>회원번호</th>
				<!-- <td>MEM_ID</td> -->
				<th>닉네임</th>
				<th>EMAIL</th>
				<!-- <td>MEM_SALT</td> -->
				<th>회원타입</th>
				<th>회원상태</th>
				<th></th>

			</tr>
		</thead>
			<tbody>
			<c:forEach items="${memberDTOs}" var="member">
				<tr>
					<c:if test="${member.mem_type!= '관리자'}">
						<form action="${path}/admin/adminMemStatusUpdate.do" method="post">
						<td>${member.mem_seq}<input type="hidden" name="mem_seq" value="${member.mem_seq}"></td>
						<%-- <td>${member.mem_id}</td> --%>
						<td><div class="input-group mb-3">						
						<input type="text" id="mem_nick${nickseq}" name="mem_nick" class="form-control"value="${member.mem_nick}">
						</div></td>
						<td>${member.mem_email}</td>
						<%-- <td>${member.mem_salt}</td> --%>
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
		</tbody>		
		</table>
		<br> <br> <input type="button" id="btn1" value="뒤로가기"	onclick="location.href='${path}/';"> 
		<br>
		<br>
		<br>

</div>
</div>
</div>




</body>
</html>