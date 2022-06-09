<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style type="text/css">

	.menu{
		display		:	inline-block;
	}

</style>

</head>
<body>
	<br>
	<div class="menu">
		<input type="button" value="영화" onclick="location.href='main.do?menu=movie';">
		<input type="button" value="극장" onclick="location.href='main.do?menu=theater';">
		<input type="button" value="예매" onclick="location.href='main.do?menu=ticket';">
	</div>
	<br>
</body>
</html>