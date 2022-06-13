
/*
---------------------------------[  movie  ]------------------------------
create sequence seq_movie_idx

create table movie
(
	m_idx			int,						--영화번호
	m_name			varchar2(100) not null,		--영화이름
	m_rate			int,						--영화예매율
	m_release		date,						--영화개봉일자
	m_r_time		varchar2(100),				--영화상영시간
	m_age			varchar2(100) default 'all',--영화나이제한
)

alter table movie
	add constraint pk_movie_m_idx primary key(m_idx);
	
alter table movie
	add constraint check_m_rate	check(m_rate between 0 and 100);

alter table movie
	add constraint check_m_age	check(m_age in ('all', '15세', '19세'));
	
alter table movie
	add constraint fk_movie_c_idx foreign key(c_idx)
									references cinema(c_idx);
	
alter table movie
	add constraint fk_movie_t_idx foreign key(t_idx)
									references theater(t_idx);



---------------------------------[  cinema  ]------------------------------

create sequence seq_cinema_idx

create table cinema
(
	c_idx			int,						--극장번호
	c_name			varchar2(100) not null,		--극장이름
	c_location		varchar2(100) not null		--극장위치
)

alter table cinema
	add constraint pk_cinema_c_idx primary key(c_idx);

---------------------------------[  theater ]------------------------------

create sequence seq_theater_idx

create table theater
(
	t_idx			int,						--상영관번호
	t_name			varchar2(100) not null,		--상영관이름
	t_seat			int,						--상영괸총좌석갯수
)

alter table theater
	add constraint pk_theater_t_idx primary key(t_idx);

alter table theater
	add constraint fk_theater_c_idx foreign key(c_idx)
										references cinema(c_idx);


---------------------------------[  seat ]--------------------------------


create sequence seq_seat_idx

create table seat
(
	s_idx			int,						--좌석번호
	s_name			varchar2(100) not null,		--좌석이름
	s_check			varchar2(100),				--좌석예매유무
	s_price		varchar2(100),					--좌석가격
	
)

alter table seat
	add constraint pk_seat_s_idx primary key(s_idx);

alter table seat
	add constraint fk_seat_t_idx foreign key(t_idx)
										references theater(t_idx);


										
---------------------------------[  member ]--------------------------------


create sequence seq_member_idx

create table member
(
	mem_idx			int,						--회원번호
	mem_name		varchar2(100),				--회원이름
	mem_tel			varchar2(100),				--회원전화번호
	mem_age			int							--회원나이
	
)

alter table member
	add constraint pk_member_mem_idx primary key(mem_idx);



---------------------------------[  ticket ]--------------------------------

create sequence seq_ticket_idx

create table ticket
(
	mt_idx			int,						--예매번호
	mt_date			date,						--예매날짜
	mt_time			varchar2(100),				--예매시간(몇시영화인지)
	mt_price		varchar2(100),				--예매금액
	mt_number		int,						--예매인원
	m_idx			int,						--(영화번호)
	c_idx			int,						--(극장번호)
	t_idx			int,						--(상영관번호)
	s_idx			int,						--(좌석번호)
	mem_idx			int							--(회원번호)
	
)

alter table ticket
	add constraint pk_ticket_mt_idx primary key(mt_idx);

alter table ticket
	add constraint fk_ticket_m_idx foreign key(m_idx)
										references movie(m_idx);

alter table ticket
	add constraint fk_ticket_c_idx foreign key(c_idx)
										references cinema(c_idx);

alter table ticket
	add constraint fk_ticket_t_idx foreign key(t_idx)
										references theater(t_idx);
										
alter table ticket
	add constraint fk_ticket_s_idx foreign key(s_idx)
										references seat(s_idx);	
																																											
alter table ticket
	add constraint fk_ticket_mem_idx foreign key(mem_idx)
										references member(mem_idx);
										
---------------------------------[ show ]--------------------------------


create table show
(
	m_idx		int,
	c_idx		int,
	t_idx		int,
	s_idx		int

)
alter table show
	add constraint fk_show_m_idx foreign key(m_idx)
									references movie(m_idx);

alter table show
	add constraint fk_show_c_idx foreign key(c_idx)
									references movie(c_idx);
									
alter table show
	add constraint fk_show_t_idx foreign key(t_idx)
									references movie(t_idx);
									
alter table show
	add constraint fk_show_s_idx foreign key(s_idx)
									references movie(s_idx);													
*/