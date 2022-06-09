<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style type="text/css">

	#movie_chart{
		display		:	inline-block;
	}

</style>

</head>
<body>
	<c:forEach begin="1" end="5">
	<div id="movie_chart">
		<table>
			<tr>
				<td>영화번호</td>
			</tr>
			<tr>
				<td>포스터</td>
			</tr>
			<tr>
				<td>영화이름</td>
			</tr>
			<tr>
				<td>예매율</td>
			</tr>
			<tr>
				<td>개봉일자</td>
			</tr>
			<tr>
				<td><input type="button" value="예매하기" onclick="location.href='main.do?menu=ticket';"></td>
			</tr>
		</table>
	</div>
	</c:forEach>
</body>
</html>