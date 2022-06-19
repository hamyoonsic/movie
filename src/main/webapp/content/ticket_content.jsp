<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	#ticketing_box{
		width: 600px;
		height: 400px;
		overflow: hidden; 
	}
	
	#ticketing{
		/* display		:	inline-block; */
		float: left;
		margin-right: 10px;
		overflow: scroll;
	}
	
	#theater{
		/* display		:	inline-block; */
		float: left;
		margin-right: 10px;
		overflow: scroll;
	}
	
	#date{
		/* display		:	inline-block; */
		float: left;
		margin-right: 10px;
	}
	
	#time{
		/* display		:	inline-block;  */
		width: 300px;
		height: 100%;
		float: left;
		overflow-y: scroll;
		overflow-x: hidden; 
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
	
	#sub_btn{
		margin-top: 370px;
	}

</style>
<script type="text/javascript">
	var date = new Date();
	var month = date.getMonth() + 1;
	var day = date.getDate();
	$(function(){
		for(var i=0; i<10; i++)
			$('.day').eq(i).html(day+i);
		$('#sub_btn').click(function(){
			if(confirm("예매하시겠습니까?")==false) return;
			location.href='reserve.do?movie_idx=' + movie_idx
							+"&cinema_idx=" + cinema_idx
							+"&day=" + day_
							+"&time=" + time
							+"&theater_idx=" + theater_idx;
		});
	})
	
	
	
</script>
</head>
<body>
	<div id="ticketing_box">
	
	<div id="ticketing">
		<div id="movie" align="center">
		<div id="movie_title">영화</div>
			<table border="1">
				<c:forEach items="${ movie_list }" var="vo" varStatus="i">
					<tr class="table-success">
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
			<table border="1">
				<c:forEach items="${ cinema_list }" var="vo" varStatus="i">
					<tr class="table-info">
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
			<table border="1">
				<c:forEach begin="1" end="10" var="i">
					<tr class="table-warning">
						<td class="date1">
							<a href="#" class="day" onclick="date_select(${i}); return false;">a</a>
						</td>
					</tr>
				</c:forEach>
			</table>
	</div>
	
	<div id="time">
		<div id="time_title">시간</div>
		<div id="seat">

		</div>
	</div>
	
	<button id="sub_btn" type="button">예매</button>
	
	</div>
</body>
</html>