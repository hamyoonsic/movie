<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style type="text/css">

	#movie_chart{
		display		:	inline-block;
	}

</style>



<script type="text/javascript">


function send(f){
	var name	=	f.name.value;
	
	
	
	f.action='main.do?menu=ticket' //변경 menu=ticket 띄워주는 서블릿 호출
	f.submit();
}

//검색
function search(){
	
	
	var search_text=$("#search_text").val();
	
	if(search_text==''){
		
		alert('검색어를 입력하세요');
		$("#search_text").val('');
		$("#search_text").focus();
		
		return;
	}
	
	$.ajax({
		
		url:'movie_search.do',
		data :{'search_text':search_text},
		
		success :function(res_data){
			
			$('#disp').html(res_data);//movie_list와 합쳐진다 
			
			
		},error :function(err){
			alert(err.responsText);
		}
		
	});
	
	
}



</script>
</head>
<body>

	<hr>
	<div style="text-align: center; margin: 10px;" >
		
		<input id ="search_text" value="${param.search_text }">
		<input type="button" value="조회" onclick="search();">
		</div>
<hr>
	
	<div id="disp"></div>
	


</body>
</html>