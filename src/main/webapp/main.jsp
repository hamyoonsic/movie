<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSTL -->    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
 <link rel="stylesheet" href="css/main.css">
  <link rel="stylesheet" href="css/bootstrap.css">
   <link rel="stylesheet" href="css/bootstrap.min.css">
   <link rel="stylesheet" href="css/scroll/bootstrap.css">
   <link rel="stylesheet" href="css/scroll/bootstrap.min.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<head>
<script type="text/javascript">

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var movie_idx;
	function movie_select(index, m_idx){
		$('.movie').css("background-color", "#c3e6cb");
		$('.movie').eq(index).css("background-color", "#d0e9c6");
		
		 while (document.getElementById("seat").hasChildNodes()) {
			 document.getElementById("seat").removeChild(document.getElementById("seat").firstChild);
		    }
		$('.cinema').css("pointer-events", "");
		$('.cinema').css("background-color", "");
		//var a = $('.movie').eq(i-1).text().trim();
		//console.log(a);
		movie_idx=m_idx;
		$.ajax({
			url: 'movie_check.do',
			data: { 'm_idx': m_idx },
			dataType: 'json',
			success: function(res_data){
				$('.cinema').children('a').css("pointer-events", "none");
				$('.cinema').css("background-color", "gray");
				
				$.each(res_data, function(m_idx, name) {
					for( var i=0; i<$('.cinema').length; i++){
						if($('.cinema').eq(i).text().trim()==name){
							$('.cinema').eq(i).children('a').css("pointer-events", "auto");
							$('.cinema').eq(i).css("background-color", "");
							break;
						}
					}
				
				});
			},
			error: function(err){
				alert(err.responseText);
			}
		}); 
		
	}
	
	function loc_select(index, c_idx){
		//$('.cinema').css("background-color", "#d9edf7");
		$('.cinema').eq(index).css("background-color", "#c4e3f3");
		
	 $.ajax({
			url: 'cinema_check.do',
			data: { 'c_idx': c_idx, 'm_idx': movie_idx},
			dataType: 'json',
			success: function(res_data){
				
				while (document.getElementById("seat").hasChildNodes()) {
					 document.getElementById("seat").removeChild(document.getElementById("seat").firstChild);
				    }
				 $.each(res_data, function(t_name, t_seat) {
					 console.log(t_name);
					 var a = $('<div>' + t_name + 
								'(총 ' + t_seat +')<br></div>');
					var b = $('<div class="row">'+
						    '<div class="col-sm-4" style="width: 100px; background-color:lavender; margin-right: 5px;">13:00</div>'+
						    '<div class="col-sm-4" style="width: 100px; background-color:lavenderblush; margin-right: 5px;">15:00</div>'+
						    '<div class="col-sm-4" style="width: 100px; background-color:lavender;">17:00</div></div><hr>');
					a.append(b);
					$('#seat').prepend(a);
				}); 
					  
				
			},
			error: function(err){
				alert(err.responseText);
			}
		});
		
	}
	
	function date_select(i){
		$('.date1').css("background-color", "#ffeeba");
		$('.date1').eq(i-1).css("background-color", "#faf2cc");
	}
	
</script>
</head>
<body>
메인페이지
<hr>
	<div id="main_box">
		<div id="header">
			<%@include file="header.jsp"%>
		</div>
		
		<div id="main_menu">
			<%@include file="main_menu.jsp"%>
		</div>
		
		<c:if test="${empty param.menu}">
			<div id="content">
				<%@include file="content/main_content.jsp"%>
			</div>
		</c:if>
		
		
		<c:if test="${param.menu eq 'movie'}">
			<div id="content">
				<%@include file="content/movie_content.jsp"%>
			</div>
		</c:if>
		
		<c:if test="${param.menu eq 'theater'}">
			<div id="content">
				<%@include file="content/theater_content.jsp"%>
			</div>
		</c:if>
		
		<c:if test="${param.menu eq 'ticket'}">
			<div id="content">
				<%@include file="content/ticket_content.jsp"%>
			</div>
		</c:if>
		
		<c:if test="${param.menu eq 'm_info'}">
			<div id="content">
				<%@include file="content/m_info_content.jsp"%>
			</div>
		</c:if>
		
		<c:if test="${param.menu eq 'payment'}">
			<div id="content">
				<%@include file="content/payment_content.jsp"%>
			</div>
		</c:if>
		
		<c:if test="${param.menu eq 'seat'}">
			<div id="content">
				<%@include file="content/seat_content.jsp"%>
			</div>
		</c:if>
		
		<c:if test="${param.menu eq 'login'}">
			<div id="content">
				<%@include file="member/login_content.jsp"%>
			</div>
		</c:if>
		
		<c:if test="${param.menu eq 'mypage'}">
			<div id="content">
				<%@include file="member/mypage_content.jsp"%>
			</div>
		</c:if>
		
		<c:if test="${param.menu eq 'signup'}">
			<div id="content">
				<%@include file="member/signup_content.jsp"%>
			</div>
		</c:if>
		
		
		
		
		<c:if test="${empty param.menu}">
			<div id="footer">
				<%@include file="footer.jsp"%>
			</div>
		</c:if>
		
	</div>
<hr style="clear: both;">
	
</body>
</html>