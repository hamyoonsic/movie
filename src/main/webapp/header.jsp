<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

function logout(){
	
	if(confirm("정말 로그아웃 하시겠습니까?") ==false)
		return;
	
	location.href ="logout.do";
	
}


</script>
</head>
<body>
	<input type="button" value="home" onclick="location.href='main.do';">
		<c:if test="${empty user }">
			<input type="button" value="로그인" onclick="location.href='login_form.do?menu=login';">
			<input type="button" value="회원가입" onclick="location.href='member_insert.do?menu=signup';">
		</c:if>
		<c:if test="${not empty user }">
			<b>${user.mem_name }님</b>환영합니다.
			<input type="button" value="마이페이지" onclick="location.href='main.do?menu=mypage';">
			<input type="button" value="로그아웃"  onclick="logout();">
		</c:if>
</body>
</html>