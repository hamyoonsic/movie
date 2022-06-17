<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 3.x -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	var regular_id =/^[a-zA-Z0-9]{3,16}$/;
	
	$(document).ready(function(){
		
		//아이디 입력창에서 키가 입력
		$("#mem_id").keyup(function(evet){
			
			var mem_id =$(this).val();
			
			//console.log(m_id);
		if(regular_id.test(mem_id)==false){
			
			$("#id_msg").html("영문자/숫자조합의 3~16자리만 가능합니다")
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
							$("#id_msg").html("사용가능한 아이디입니다")
							.css("color","blue");
							
							$("#btn_register").attr("disabled",false);
							
						}else{
							
							$("#id_msg").html("이미 사용중인 아이디입니다")
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
		
		var width = 500; //팝업의 너비
		var height = 600; //팝업의 높이
		
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
			
			
			alert("이름을 입력하세요");
			f.mem_name.value='';
			f.mem_name.focus();
			
			return;
			
			
			
		}
		
		//비번체크
		if(mem_pwd==''){
			
			alert('비밀번호를 입력하세요');
			f.mem_pwd.value='';
			f.mem_pwd.focus();
			
			return;
			
			
		}
		
		//우편번호체크
		if(mem_zipcode==''){
			
			alert("우편번호를 입력하세요");
			f.mem_zipcode.value='';
			f.mem_zipcode.focus();
		
			return;
		}
		//주소체크
		if(mem_addr==''){
			
			alert('주소를 입력하세요');
			f.mem_addr.value='';
			f.mem_addr.focus();
		
			return;
		}
		
		
	
			
		
		
		f.action = "insert.do"; //MemberInsertAction(등급,아이피)
		f.submit();
		
		alert("축하합니다 ^^ 회원가입이 완료 되었습니다!!");
		
	}
	




</script>



</head>
<body>
<form>
	<div id="box">
	<div>회원가입</div>
	<table>
		<tr>
			<th>이름:</th>
			<th><input name = "mem_name"></th>
		</tr>
		<tr>
			<th>아이디:</th>
			<td><input name = "mem_id" id="mem_id">
			<span  id="id_msg"></span>
			</td>
		</tr>
		<tr>
			<th>패스워드</th>
			<th><input type= "password" name="mem_pwd" ></th>
		
		</tr>
		<tr>
			<th>우편번호</th>
			<td>
			<input id="mem_zipcode" name="mem_zipcode">
			<input type="button" value="주소찾기"  id ="btn_find" onclick="find();">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input id= "mem_addr" name="mem_addr" size="60"></td>
		</tr>
	
		<tr>
      		<td colspan="2" align="center">
      		<input  type="button" value="가입하기" id="btn_register" disabled="disabled"
      									onclick="send(this.form);">
      		<input  type="button" value="목록보기"
      								onclick="location.href='main.do'">
      				
      	    </td>
      	</tr>
      			
	</table>
  </div>
</form>

</body>
</html>