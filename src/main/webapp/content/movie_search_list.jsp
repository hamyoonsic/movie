<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<th>영화이름</th>
		<th>예매율</th>
		<th>개봉일자</th>
		<th>상영시간</th>
		<th>연령제한</th>
			
	</tr>
	<c:forEach var="vo" items="${list }" >
	<tr>
		<td>${vo.m_name }</td>
		<td>${vo.m_rate }</td>
		<td>${vo.m_release }</td>
		<td>${vo.m_r_time }</td>
		<td>${vo.m_age }</td>
	
	</tr>
	</c:forEach>
</table>




</body>
</html>