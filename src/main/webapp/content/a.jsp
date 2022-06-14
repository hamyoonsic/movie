<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script>
	$(function(){
		var a = $('<div>' + '관(총 ?석)<br></div>');
		var b = $('<div class="row">'+
			    '<div class="col-sm-4" style="width: 100px; background-color:lavender; margin-right: 5px;">13:00</div>'+
			    '<div class="col-sm-4" style="width: 100px; background-color:lavenderblush; margin-right: 5px;">15:00</div>'+
			    '<div class="col-sm-4" style="width: 100px; background-color:lavender;">17:00</div></div>');
		a.append(b);
		$('body').append(a);
	})
</script>
</head>
<body>
	
	<!-- <div class="row">
	    <div class="col-sm-4" style="width: 100px; background-color:lavender; margin-right: 5px;">a</div>
	    <div class="col-sm-4" style="width: 100px; background-color:lavenderblush; margin-right: 5px;">b</div>
	    <div class="col-sm-4" style="width: 100px; background-color:lavender;">c</div>
  	</div>  -->
 
</body>
</html>