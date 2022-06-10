<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<title>Insert title here</title>
</head>
<body>
 성공!
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
			<td>이미지경로</td>
			<td>날짜</td>
			<td>사장추천</td>			
		</tr>
		<c:forEach items="${reviewAllList}" var="review" varStatus="status">
		<tr>
		<td>${review.review_seq}</td>
		<td>${review.mem_seq}</td>
		<td>${review.menu_seq}</td>
		<td>${review.review_taste}</td>
		<td>${review.review_amount}</td>
		<td>${review.review_service}</td>
		<td>${review.review_content}</td>
		<td>${review.review_img}</td>
		<td>${review.review_date}</td>
		<td>${review.review_exposure}</td>		
		</tr>
		</c:forEach>
	</table>

</body>
</html>