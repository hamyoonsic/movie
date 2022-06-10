/*
	-----------------------------------------------------------user--------
 	create user
 	(
 		u_id 		varchar2(100) 	not null,	-- 아이디*
 		u_pwd 	varchar2(100)	not null,	-- 패스워드
 		u_name 	varchar2(100) 	not null,	-- 이름
 		u_jumin 	varchar2(14) 	not null,	-- 주민번호
 		u_tel 		varchar2(20),					-- 전화번호
 		u_email 	varchar2(100)				-- 이메일
 	)
 
 	alter table user
 		add constraints pk_user_u_id primary key(u_id)
 		
 		
 	--------------------------------------------------------ticketing--------
 	create ticketing_info
 	(
 		u_id 		varchar2(100) 	not null,	-- 아이디*
 		m_idx 	int 				not null,	-- 영화
 		th_idx 	int 				not null,	-- 극장
 		ti_num 	varchar2(100) 	not null,	-- 인원
 		ti_seat 	varchar2(100) 	not null,	-- 좌석
 		ti_date 	date 				not null,	-- 예매날짜
 		ti_money int 				not null	-- 금액
 	)
 	
 	alter table user
 		add constraints fk_ticketing_info_u_id foreign key(u_id) references user(u_id)	
 		
 	alter table ticketing_info
 		add constraints pk_ticketing_info_u_id primary key(u_id)
 		
 	alter table user
 		add constraints fk_ticketing_info_m_idx foreign key(m_idx) references movie(m_idx)	
 		
 	alter table user
 		add constraints fk_ticketing_info_th_idx foreign key(th_idx) references theater(th_idx)		
 		
 		
 	-------------------------------------------------------theater-------
 	create theater
 	(
 		th_idx 		int 				not null,	-- 번호*
 		th_name 		varchar2(100) 	not null,	-- 이름
 		m_idx 		int 				not null,	-- 상영중인 영화
 		th_num 		int 				not null, 	-- 상영관
 		th_loc 		varchar2(100) 	not null	-- 위치
 	)	
 	
 	alter table theater
 		add constraints pk_theater_th_idx primary key(th_idx)
 		
 	alter table user
 		add constraints fk_theater_m_idx foreign key(m_idx) references movie(m_idx)	
 		
 		
 	-------------------------------------------------------movie--------
 	create movie
 	(
 		m_idx 		int 				not null,	-- 번호*
 		m_name 		varchar2(100) 	not null,	-- 이름
 		m_date 		date,							-- 개봉일자
 		m_percent 	int								-- 예매율
 	)		
 	
 	alter table movie
 		add constraints pk_movie_m_idx primary key(m_idx)
 													
 																									
 																																					
 																																																													
 */