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

<script type="text/javascript">

	function send(f){
		var name	=	f.name.value;
		
		
		
		f.action='main.do?menu=ticket' //���� menu=ticket ����ִ� ���� ȣ��
		f.submit();
	}


</script>



</head>
<body>
	<c:forEach var="vo" items="${list}">
	<div id="movie_chart">
		<form>
			<table>
				<tr>
					<td>${vo.name }</td>
				</tr>
				<tr>
					<td>${vo.name }������</td>
				</tr>
				<tr>
					<td>${vo.name }��ȭ�̸�</td>
				</tr>
				<tr>
					<td>${vo.name }������</td>
				</tr>
				<tr>
					<td>${vo.name }��������</td>
				</tr>
				<tr>
					<td><input type="button" value="�����ϱ�" onclick="send(this.form);"></td>
				</tr>
			</table>
		</form>
	</div>
	</c:forEach>
</body>
</html>