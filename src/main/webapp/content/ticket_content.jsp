<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
<meta charset="EUC-KR">
<title>Insert title here</title>

<style type="text/css">
	#ticketing_box{
		overflow: hidden; 
	}
	
	#ticketing{
		/* display		:	inline-block; */
		float: left;
		margin-right: 10px;
	}
	
	#theater{
		/* display		:	inline-block; */
		float: left;
		margin-right: 10px;
	}
	
	#date{
		/* display		:	inline-block; */
		float: left;
		margin-right: 10px;
	}
	
	#time{
		/* display		:	inline-block;  */
		float: left;
		overflow: scroll;
	}
	
	a:link{
		text-decoration: none;
	}
	
	a:visitied{
		text-decoration: none;
	}
	
	
	a:hover{
		text-decoration: none;
	}
	
	a:active{
		text-decoration: none;
	}
	

</style>
<script type="text/javascript">
	var date = new Date();
	var month = date.getMonth() + 1;
	var day = date.getDate();
	$(function(){
		for(var i=0; i<10; i++)
			$('.day').eq(i).html(day+i);
	})
	
	
</script>
</head>
<body>
	<div id="ticketing_box">
	<div id="ticketing">
		<div id="movie" align="center">
		<div id="movie_title">영화</div>
			<table class="table table-hover" border="1">
				<c:forEach items="${ movie_list }" var="vo" varStatus="i">
					<tr class="success">
						<td class="movie" >
							<a href="#" onclick="movie_select(${ i.index }, ${ vo.m_idx }); return false;">${ vo.m_name }</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	
	<div id="theater">
		<div id="location">
		<div id="theater_title">극장</div>
			<table class="table table-hover" border="1">
				<c:forEach items="${ cinema_list }" var="vo" varStatus="i">
					<tr class="info">
						<td class="cinema" >
							<a href="#" onclick="loc_select(${ i.index }, ${ vo.c_idx }); return false;">${ vo.c_name }</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	
	<div id="date">
		<div id="date_title">날짜</div>
			<table class="table table-hover" border="1">
				<c:forEach begin="1" end="10" var="i">
					<tr class="warning">
						<td class="date1">
							<a href="#" class="day" onclick="date_select(${i}); return false;">a</a>
						</td>
					</tr>
				</c:forEach>
			</table>
	</div>
	
	<div id="time">
		<div id="time_title">시간</div>
		<div id="theater">

		</div>
	</div>
	
	</div>
</body>
</html>