<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <!--�α��� ������  -->
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

function send (f){
	
	var mem_id =f.mem_id.value.trim();
	var mem_pwd = f.mem_pwd.value.trim();
	
	
	if(mem_id==''){
		
		alert('���̵� �Է��ϼ���');
		f.mem_id.value='';
		f.mem_id.focus();
		return;
		
		
	}
	
	
	if(mem_pwd==''){
		
		alert('��й�ȣ�� �Է��ϼ���');
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
			alert('���̵� Ʋ�Ƚ��ϴ�')
			return;
			
		}
		
		if("${param.reason eq 'fail_pwd'}"=="true"){
			
			alert('��й�ȣ�� Ʋ�Ƚ��ϴ�')
			return;			
			
		}
		
		if("${param.reason eq 'session_timout'}"=="true"){
			alert('�α׾ƿ� �Ǿ����ϴ�')
			return;
			
		}
		
		
		
		
		
		
		
		
		
		
	}
	












</script>

</head>
<body>

	<form>
		<div id="box">
			<div><h4>�α���</h4></div>
				<table>
					<tr>
						<td>���̵�</td>
						<td><input name="mem_id" value="${param.mem_id }"></td>
					</tr>
					<tr>
						<td>��й�ȣ</td>
						<td><input type="password" name="mem_pwd"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="�α���" onclick="send(this.form);">
							<input type="button" value="��Ϻ���" onclick="location.href='main.do';">
						
						</td>
					
					
					</tr>
			</table>
		</div>	
	</form>


</body>
</html>