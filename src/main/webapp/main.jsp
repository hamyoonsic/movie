<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!-- JSTL -->    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
메인페이지
<hr>
	<div id="main_box">
		<div id="header">
			<%@include file="header.jsp"%>
		</div>
		
		<div id="main_menu">
			<%@include file="main_menu.jsp"%>
		</div>
		
		<c:if test="${empty param.menu}">
			<div id="content">
				<%@include file="content/main_content.jsp"%>
			</div>
		</c:if>
		
		
		<c:if test="${param.menu eq 'movie'}">
			<div id="content">
				<%@include file="content/movie_content.jsp"%>
			</div>
		</c:if>
		
		<c:if test="${param.menu eq 'theater'}">
			<div id="content">
				<%@include file="content/theater_content.jsp"%>
			</div>
		</c:if>
		
		<c:if test="${param.menu eq 'ticket'}">
			<div id="content">
				<%@include file="content/ticket_content.jsp"%>
			</div>
		</c:if>
		
		<c:if test="${param.menu eq 'm_info'}">
			<div id="content">
				<%@include file="content/m_info_content.jsp"%>
			</div>
		</c:if>
		
		<c:if test="${param.menu eq 'payment'}">
			<div id="content">
				<%@include file="content/payment_content.jsp"%>
			</div>
		</c:if>
		
		<c:if test="${param.menu eq 'seat'}">
			<div id="content">
				<%@include file="content/seat_content.jsp"%>
			</div>
		</c:if>
		
		<c:if test="${param.menu eq 'login'}">
			<div id="content">
				<%@include file="member/login_content.jsp"%>
			</div>
		</c:if>
		
		<c:if test="${param.menu eq 'mypage'}">
			<div id="content">
				<%@include file="member/mypage_content.jsp"%>
			</div>
		</c:if>
		
		<c:if test="${param.menu eq 'signup'}">
			<div id="content">
				<%@include file="member/signup_content.jsp"%>
			</div>
		</c:if>
		
		
		
		
		<c:if test="${empty param.menu}">
			<div id="footer">
				<%@include file="footer.jsp"%>
			</div>
		</c:if>
		
	</div>
<hr>
	
</body>
</html>