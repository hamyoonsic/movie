<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<input type="button" value="home" onclick="location.href='main.do';">
<input type="button" value="�α���" onclick="location.href='login_form.do?menu=login';">
<input type="button" value="ȸ������" onclick="location.href='member_insert.do?menu=signup';">
<input type="button" value="����������" onclick="location.href='main.do?menu=mypage';">
</body>
</html>