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
			<td>리뷰 SEQ</td>
			<td>MEM_SEQ</td>
			<td>MENU_SEQ</td>
			<td>맛평가</td>
			<td>양평가</td>
			<td>서비스평가</td>
			<td>내용</td>
			<td>사진</td>
			<td>날짜</td>					
			<td></td>					
		</tr>
		<c:forEach items="${reviewMemberList}" var="review" varStatus="status">
		<tr>
			<td>${review.review_seq}</td>
			<td>${review.mem_seq}</td>
			<td>${review.menu_seq}</td>
			<td>${review.review_taste}</td>
			<td>${review.review_amount}</td>
			<td>${review.review_service}</td>
			<td>${review.review_content}</td>
			<td><img src="${path}/images/${review.review_img}"></td>
			<td>${review.review_date}</td>
			<td><form action="${path}/review/reviewDelete.do" method="post">
					<input type="hidden" name="review_seq" value="${review.review_seq}"><input type="submit" class="btn btn-primary" value="삭제">
				</form>				
			</td>	
		</tr>
		</c:forEach>
		<input type="button" id="btn1" value="뒤로가기" onclick="location.href='${path}/';">
	</table>


</body>
</html>