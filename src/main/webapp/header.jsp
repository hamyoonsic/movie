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
	
	if(confirm("���� �α׾ƿ� �Ͻðڽ��ϱ�?") ==false)
		return;
	
	location.href ="logout.do";
	
}


</script>
</head>
<body>
	<input type="button" value="home" onclick="location.href='main.do';">
		<c:if test="${empty user }">
			<input type="button" value="�α���" onclick="location.href='login_form.do?menu=login';">
			<input type="button" value="ȸ������" onclick="location.href='member_insert.do?menu=signup';">
		</c:if>
		<c:if test="${not empty user }">
			<b>${user.mem_name }��</b>ȯ���մϴ�.
			<input type="button" value="����������" onclick="location.href='main.do?menu=mypage';">
			<input type="button" value="�α׾ƿ�"  onclick="logout();">
		</c:if>
</body>
</html>