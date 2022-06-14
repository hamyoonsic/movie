<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!-- JSTL -->    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
 <link rel="stylesheet" href="css/main.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function movie_select(index, m_idx){
		$('.movie').css("background-color", "#dff0d8");
		$('.movie').eq(index).css("background-color", "#d0e9c6");
		//var a = $('.movie').eq(i-1).text().trim();
		//console.log(a);
		/* $.ajax({
			url: 'movie_check.do',
			data: { 'm_idx': m_idx },
			dataType: 'json',
			success: function(res_data){
				$('.cinema').attr("disabled", true);
				$('.cinema').css("color", "gray");
				
				for(Object o : $('.cinema')){
					for(var i=0; i<res_data.size; i++){
						if(o.text()==res_data[i])
							$('.cinema').attr("disabled", false);
							$('.cinema').css("color", "");
					}
				}
			},
			error: function(err){
				alert(err.responseText);
			}
		}); */
		
	}
	
	function loc_select(index, c_idx){
		$('.cinema').css("background-color", "#d9edf7");
		$('.cinema').eq(index).css("background-color", "#c4e3f3");
		
		/* $.ajax({
			url: 'cinema_check.do',
			data: { 't_idx': t_idx },
			dataType: 'json',
			success: function(res_data){
				for(var i=0; i<res_data.size; i++){
					var a = $('<div>' + res_data[i].t_name + 
								'관(총 ' + res_data[i].t_name +'석)<br><hr></div>');
					var b = $('<div class="row">'+
						    '<div class="col-sm-4" style="width: 100px; background-color:lavender; margin-right: 5px;">13:00</div>'+
						    '<div class="col-sm-4" style="width: 100px; background-color:lavenderblush; margin-right: 5px;">15:00</div>'+
						    '<div class="col-sm-4" style="width: 100px; background-color:lavender;">17:00</div></div>');
					a.append(b);
					$('#theater').append(a);
				}
			},
			error: function(err){
				alert(err.responseText);
			}
		}); */
		
	}
	
	function date_select(i){
		$('.date1').css("background-color", "#fcf8e3");
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