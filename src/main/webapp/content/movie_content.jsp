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
				<td>��ȭ��ȣ</td>
			</tr>
			<tr>
				<td>������</td>
			</tr>
			<tr>
				<td>��ȭ�̸�</td>
			</tr>
			<tr>
				<td>������</td>
			</tr>
			<tr>
				<td>��������</td>
			</tr>
			<tr>
				<td><input type="button" value="�����ϱ�" onclick="location.href='main.do?menu=ticket';"></td>
			</tr>
		</table>
	</div>
	</c:forEach>
</body>
</html>