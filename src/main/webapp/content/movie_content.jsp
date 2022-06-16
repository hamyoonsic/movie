<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

	#movie_chart{
		display		:	inline-block;
	}

</style>

<script type="text/javascript">

	function send(f){
		var name	=	f.name.value;
		
		
		
		f.action='main.do?menu=ticket' //변경 menu=ticket 띄워주는 서블릿 호출
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
					<td>${vo.name }포스터</td>
				</tr>
				<tr>
					<td>${vo.name }영화이름</td>
				</tr>
				<tr>
					<td>${vo.name }예매율</td>
				</tr>
				<tr>
					<td>${vo.name }개봉일자</td>
				</tr>
				<tr>
					<td><input type="button" value="예매하기" onclick="send(this.form);"></td>
				</tr>
			</table>
		</form>
	</div>
	</c:forEach>
</body>
</html>