<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style type="text/css">

	

</style>

</head>
<body>
	<c:forEach begin="1" end="3">
	<div id="movie">
		
		<table>
			<tr>
				<td>��ȭ�̸�</td>
				<td>������</td>
			</tr>
			
			<tr>
				<td>�󿵰�</td>
				<td>���¼�</td>
			</tr>
			
			<tr>
				<td><input type="button" value="23:30 159��" onclick="location.href='main.do?menu=seat';"></td>
			</tr>
		</table>
		<hr>
	</div>
	</c:forEach>
</body>
</html>