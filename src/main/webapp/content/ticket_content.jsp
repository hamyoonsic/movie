<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style type="text/css">

	#ticketing{
		display		:	inline-block;
	}
	
	#theater{
		display		:	inline-block;
	}
	
	#date{
		display		:	inline-block;
	}
	
	#time{
		display		:	inline-block;
	}
	

</style>

</head>
<body>
	<div id="ticketing">
		<div id="movie">
		<div id="movie_title">영화</div>
			<table>
				<c:forEach begin="1" end="10">
					<tr>
						<td>
							<input type="button" value="영화이름">
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	
	<div id="theater">
		<div id="location">
		<div id="theater_title">극장</div>
			<table>
				<c:forEach begin="1" end="10">
					<tr>
						<td>
							<input type="button" value="상영관위치">
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	
	<div id="date">
		<div id="date_title">날짜</div>
			<table>
				<c:forEach begin="1" end="10" step="1" varStatus="i">
					<tr>
						<td>
							<input type="button" value="${i.count}">
						</td>
					</tr>
				</c:forEach>
			</table>
	</div>
	
	<div id="time">
		<div id="time_title">시간</div>
		<%@include file="../sub_content/theater_content_subcontent.jsp" %>
	</div>
</body>
</html>