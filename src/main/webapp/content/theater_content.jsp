<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="theater">
		<div id="location">
			<table>
				<tr>
					<td>강남</td>
					<td>여의도</td>
					<td>압구정</td>
				</tr>
			</table>
		</div>
		<hr>
		<%@include file="../sub_content/theater_content_subcontent.jsp" %>
	</div>
</body>
</html>