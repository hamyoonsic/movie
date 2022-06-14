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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	var regular_id =/^[a-zA-Z0-9]{3,16}$/;
	
	$(document).ready(function(){
		
		//���̵� �Է�â���� Ű�� �Է�
		$("#mem_id").keyup(function(evet){
			
			var mem_id =$(this).val();
			
			//console.log(m_id);
		if(regular_id.test(mem_id)==false){
			
			$("#id_msg").html("������/���������� 3~16�ڸ��� �����մϴ�")
						.css("color","red");
			
			$("#btn_register").attr("disabled",true);
			return;
			
		}
			
			
			$.ajax({
					url : 'check_id.do',
					data: {'mem_id':mem_id},
					dataType :'json',
					success:function(res_data){
						
						if(res_data.result){
							$("#id_msg").html("��밡���� ���̵��Դϴ�")
							.css("color","blue");
							
							$("#btn_register").attr("disabled",false);
							
						}else{
							
							$("#id_msg").html("�̹� ������� ���̵��Դϴ�")
							.css("color","red");
							$("#btn_register").attr("disabled",true);
							
							
							
						}
						
						
					},error :function(err){
						alert(err.responseText);
					}
				
				
			});	
			
		});
		
	});
	
	function find(){
		
		var width = 500; //�˾��� �ʺ�
		var height = 600; //�˾��� ����
		
		 new daum.Postcode({
		        oncomplete: function(data) {
		           
		        	
		        	
		        	$("#mem_zipcode").val(data.zonecode);
		        	
		        	
		        	$("#mem_addr").val(data.address);
		      
		        	
		        },
		        width: width,
		        height:height
		 
		    }).open(
		    		
				{
					left: (window.screen.width / 2) - (width / 2),
				    top: (window.screen.height / 2) - (height / 2)
				}
		    );
	}
	
	function send(f){
		
		var mem_name=f.mem_name.value.trim();
		var mem_pwd=f.mem_pwd.value.trim();
		var mem_zipcode=f.mem_zipcode.value.trim();
		var mem_addr = f.mem_addr.value.trim();
		
		
		if(mem_name==''){
			
			
			alert("�̸��� �Է��ϼ���");
			f.mem_name.value='';
			f.mem_name.focus();
			
			return;
			
			
			
		}
		
		//���üũ
		if(mem_pwd==''){
			
			alert('��й�ȣ�� �Է��ϼ���');
			f.mem_pwd.value='';
			f.mem_pwd.focus();
			
			return;
			
			
		}
		
		//�����ȣüũ
		if(mem_zipcode==''){
			
			alert("�����ȣ�� �Է��ϼ���");
			f.mem_zipcode.value='';
			f.mem_zipcode.focus();
		
			return;
		}
		//�ּ�üũ
		if(mem_addr==''){
			
			alert('�ּҸ� �Է��ϼ���');
			f.mem_addr.value='';
			f.mem_addr.focus();
		
			return;
		}
		
		
	
			
		
		
		f.action = "insert.do"; //MemberInsertAction(���,������)
		f.submit();
		
		alert("�����մϴ� ^^ ȸ�������� �Ϸ� �Ǿ����ϴ�!!");
		
	}
	




</script>



</head>
<body>
<form>
	<div id="box">
	<div>ȸ������</div>
	<table>
		<tr>
			<th>�̸�:</th>
			<th><input name = "mem_name"></th>
		</tr>
		<tr>
			<th>���̵�:</th>
			<td><input name = "mem_id" id="mem_id">
			<span  id="id_msg"></span>
			</td>
		</tr>
		<tr>
			<th>�н�����</th>
			<th><input type= "password" name="mem_pwd" ></th>
		
		</tr>
		<tr>
			<th>�����ȣ</th>
			<td>
			<input id="mem_zipcode" name="mem_zipcode">
			<input type="button" value="�ּ�ã��"  id ="btn_find" onclick="find();">
			</td>
		</tr>
		<tr>
			<th>�ּ�</th>
			<td><input id= "mem_addr" name="mem_addr" size="60"></td>
		</tr>
	
		<tr>
      		<td colspan="2" align="center">
      		<input  type="button" value="�����ϱ�" id="btn_register" disabled="disabled"
      									onclick="send(this.form);">
      		<input  type="button" value="��Ϻ���"
      								onclick="location.href='main.do'">
      				
      	    </td>
      	</tr>
      			
	</table>
  </div>
</form>

</body>
</html>