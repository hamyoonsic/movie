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
	var cinema_idx;
	var day;
	var time;
	var theater_idx;
	function movie_select(index, m_idx){
		$('.movie').css("background-color", "#c3e6cb");
		$('.movie').eq(index).css("background-color", "#afd2b7");
		
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
		for(var i=0; i<$('.cinema').length; i++){
			if( $('.cinema').eq(i).children('a').css("pointer-events")=="auto" ){
				$('.cinema').eq(i).css("background-color", "#bee5eb");
			}else{
				$('.cinema').eq(i).css("background-color", "gray");
			}
		}
		//$('.cinema').css("background-color", "#d9edf7");
		$('.cinema').eq(index).css("background-color", "#aad1d7");
			
		cinema_idx=c_idx;
	 $.ajax({
			url: 'cinema_check.do',
			data: { 'c_idx': c_idx, 'm_idx': movie_idx},
			dataType: 'json',
			success: function(res_data){
				while (document.getElementById("seat").hasChildNodes()) {
					 document.getElementById("seat").removeChild(document.getElementById("seat").firstChild);
				    }
				 $.each(res_data, function(t_name, t_seat) {
					 //var div_p = $('<div id=""></div>');
					 var a = $('<div class="theater_idx">' + t_name + 
								'관(총 ' + t_seat[0] +')</div>');
					 
					var b = $('<div class="row"></div>');
					for(var i=1; i<t_seat.length; i++){
						var c = $(
					    '<div class="col-sm-4" style="width: 100px; background-color:lavender; margin-right: 5px; margin-bottom: 5px;">'
					    +t_seat[i]+'</div>');
						b.append(c);
					}
					
					$('#seat').append(a);
					$('#seat').append(b);
					$('#seat').append("<hr>"); 
					/* 
					$(div_p).append(a);
					$(div_p).append(b);
					$(div_p).append("<hr>");
					$('#seat').append(div_p); 
					*/
				})
				
				$('.col-sm-4').click(function(){
					theater_idx = $(this).closest('.row').prev().text().trim().substr(0, 2);
					//theater_idx = $(this).prev().text().trim().substr(0, 2);
					time = $(this).text().trim();
					console.log("영화 idx:" + movie_idx + ", "+
								"극장 idx:" + cinema_idx + ", "+
								"날짜:" + day + ", "+
								"영화 idx:" + theater_idx + ", "+
								"시간:" + time);
					$('.col-sm-4').css("background-color", "lavender");
					$(this).css("background-color", "#dcdce6");
				});
				
			},
			error: function(err){
				alert(err.responseText);
			}
		});
		
	}
	
	function date_select(i){
		$('.date1').css("background-color", "#ffeeba");
		$('.date1').eq(i-1).css("background-color", "#ebdaa6");
		day = $('.date1').eq(i-1).text().trim();
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