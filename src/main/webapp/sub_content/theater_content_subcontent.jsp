<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

	

</style>

</head>
<body>
	<c:forEach begin="1" end="3">
	<div id="movie">
		
		<table>
			<tr>
				<td>영화이름</td>
				<td>개봉일</td>
			</tr>
			
			<tr>
				<td>상영관</td>
				<td>총좌석</td>
			</tr>
			
			<tr>
				<td><input type="button" value="23:30 159석" onclick="location.href='main.do?menu=seat';"></td>
			</tr>
		</table>
		<hr>
	</div>
	</c:forEach>
</body>
</html>