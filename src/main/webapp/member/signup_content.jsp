<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- Bootstrap 3.x -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">

	var regular_id =/^[a-zA-Z0-9]{3,16}$/;
	
	$(document).ready(function(){
		
		//아이디 입력창에서 키가 입력
		$("#m_id").keyup(function(evet){
			
			var m_id =$(this).val();
			
			console.log(m_id);
			
			
			
			
			
		});
		
		
		
		
		
		
		
		
	});
	
	
	
	





</script>



</head>
<body>
<form>
	<div id="box">
	<div>회원가입</div>
	<table>
		<tr>
			<th>이름:</th>
			<th><input name = "m_name"></th>
		</tr>
		<tr>
			<th>아이디:</th>
			<td><input name = "m_id" id="m_id">
			<span  id="id_msg"></span>
			</td>
		</tr>
		<tr>
			<th>패스워드</th>
			<th><input type= "password" name="m_pwd" ></th>
		
		</tr>
		<tr>
			<th>우편번호</th>
			<td>
			<input id="m_zipcode" name="m_zipcode">
			<input type="button" value="주소찾기"  id ="btn_find" onclick="find();">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input id= "m_addr" name="m_addr" size="60"></td>
		</tr>
	
		<tr>
      		<td colspan="2" align="center">
      		<input  type="button" value="가입하기" id="btn_register" disabled="disabled"
      									onclick="send(this.form);">
      		<input  type="button" value="목록보기"
      								onclick="location.href='${pageContext.request.contextPath}">
      				
      	    </td>
      	</tr>
      			
	</table>
  </div>
</form>

</body>
</html>