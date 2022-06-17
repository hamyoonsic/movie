<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--로그인 페이지  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 3.x -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">

function send (f){
	
	var mem_id =f.mem_id.value.trim();
	var mem_pwd = f.mem_pwd.value.trim();
	
	
	if(mem_id==''){
		
		alert('아이디를 입력하세요');
		f.mem_id.value='';
		f.mem_id.focus();
		return;
		
		
	}
	
	
	if(mem_pwd==''){
		
		alert('비밀번호를 입력하세요');
		f.mem_pwd.value='';
		f.mem_pwd.focus();
		return;
		
	}
	
	f.action ="login.do";//Member Login Action
	f.submit();
	
}

	$(document).ready(function(){
		
		setTimeout(showMessage,100);
		
		
		
	});
	
	function showMessage(){
		
		if("${param.reason eq 'fail_id'}"=="true"){
			alert('아이디 틀렸습니다')
			return;
			
		}
		
		if("${param.reason eq 'fail_pwd'}"=="true"){
			
			alert('비밀번호가 틀렸습니다')
			return;			
			
		}
		
		if("${param.reason eq 'session_timout'}"=="true"){
			alert('로그아웃 되었습니다')
			return;
			
		}
		
		
		
		
		
		
		
		
		
		
	}
	












</script>

</head>
<body>

	<form>
		<div id="box">
			<div><h4>로그인</h4></div>
				<table>
					<tr>
						<td>아이디</td>
						<td><input name="mem_id" value="${param.mem_id }"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="mem_pwd"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="로그인" onclick="send(this.form);">
							<input type="button" value="목록보기" onclick="location.href='main.do';">
						
						</td>
					
					
					</tr>
			</table>
		</div>	
	</form>


</body>
</html>