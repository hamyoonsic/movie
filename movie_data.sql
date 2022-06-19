/*
---------------------------------[  movie  ]-----------------------------------------------------------
insert into movie values(seq_movie_idx.nextVal,'쥬라기공원','30','2022-06-14','150분','15세');
insert into movie values(seq_movie_idx.nextVal,'닥터스트레인지','20','2022-06-10','123분','19세');
insert into movie values(seq_movie_idx.nextVal,'스파이더맨','10','2022-06-05','110분','15세');
insert into movie values(seq_movie_idx.nextVal,'토르','5','2022-06-01','100분','19세');
insert into movie values(seq_movie_idx.nextVal,'해리포터','3','2022-05-31','90분','19세');
insert into movie values(seq_movie_idx.nextVal,'신비한동물사전','2','2022-05-25','80분','전체이용가');


---------------------------------[  cinema  ]-----------------------------------------------------------

insert into cinema values(seq_cinema_idx.nextVal,'강남Cgv', '강남');
insert into cinema values(seq_cinema_idx.nextVal,'홍대Cgv', '홍대');
insert into cinema values(seq_cinema_idx.nextVal,'연남Cgv', '연남');
insert into cinema values(seq_cinema_idx.nextVal,'신촌Cgv', '신촌');

---------------------------------[  theater ]------------------------------------------------------------

insert into theater values(seq_theater_idx.nextVal, '1관', '180석');
insert into theater values(seq_theater_idx.nextVal, '2관', '170석');
insert into theater values(seq_theater_idx.nextVal, '3관', '160석');
insert into theater values(seq_theater_idx.nextVal, '4관', '155석');
insert into theater values(seq_theater_idx.nextVal, '5관', '150석');
insert into theater values(seq_theater_idx.nextVal, '6관', '145석');
insert into theater values(seq_theater_idx.nextVal, '7관', '143석');
insert into theater values(seq_theater_idx.nextVal, '8관', '141석');



------------------------------[member]-------------------------------

select * from show


insert into member values(seq_member_mem_idx.nextVal,
					'일길동',
					'one',
					'1234',
					'12345',
					'서울시 마포구 노고산동',
					'일반',
					'192.168.0.9',
					sysdate);

insert into member values(seq_member_mem_idx.nextVal,
					'홍관리',
					'admin',
					'1234',
					'12345',
					'서울시 마포구 노고산동',
					'관리자',
					'192.168.0.9',
					sysdate);

--삭제
select * from member
delete from member where mem_idx=5


---------------------------------[ show ]--------------------------------


insert into show values('1','1','1');
insert into show values('1','1','2');
insert into show values('1','1','3');
insert into show values('1','1','4');
insert into show values('1','1','5');
insert into show values('1','1','6');
insert into show values('1','1','7');
insert into show values('1','1','8');

insert into show values('1','2','1');
insert into show values('1','2','2');
insert into show values('1','2','3');
insert into show values('1','2','4');
insert into show values('1','2','5');
insert into show values('1','2','6');
insert into show values('1','2','7');
insert into show values('1','2','8');

insert into show values('1','3','1');
insert into show values('1','3','2');
insert into show values('1','3','3');
insert into show values('1','3','4');
insert into show values('1','3','5');
insert into show values('1','3','6');
insert into show values('1','3','7');
insert into show values('1','3','8');

insert into show values('1','4','1');
insert into show values('1','4','2');
insert into show values('1','4','3');
insert into show values('1','4','4');
insert into show values('1','4','5');
insert into show values('1','4','6');
insert into show values('1','4','7');
insert into show values('1','4','8');

insert into show values('2','1','1');
insert into show values('2','1','2');
insert into show values('2','1','3');
insert into show values('2','1','4');
insert into show values('2','2','1');
insert into show values('2','2','2');
insert into show values('2','2','3');
insert into show values('2','2','4');

insert into show values('3','1','2');
insert into show values('3','1','4');
insert into show values('3','2','5');
insert into show values('3','2','2');
insert into show values('3','3','1');
insert into show values('3','3','3');
insert into show values('3','3','5');
insert into show values('3','4','8');

insert into show values('4','2','6');
insert into show values('4','2','3');
insert into show values('4','2','2');
insert into show values('4','2','1');
insert into show values('4','3','5');
insert into show values('4','3','4');
insert into show values('4','3','2');
insert into show values('4','3','7');

insert into show values('5','1','6');
insert into show values('5','4','3');
insert into show values('5','4','2');
insert into show values('5','4','1');
insert into show values('5','4','5');
insert into show values('5','4','4');
insert into show values('5','4','8');
insert into show values('5','4','7');

insert into show values('6','1','1');
insert into show values('6','2','2');
insert into show values('6','3','3');
insert into show values('6','3','4');
insert into show values('6','3','5');
insert into show values('6','3','6');
insert into show values('6','3','7');
insert into show values('6','3','8');

create or replace view show_cinema_view
as
	select * from movie where on show.m_idx=cinema.c_idx



update theater set t_time = '11:00,13:00,15:00,17:00,19:00,21:00' where t_idx=1;
update theater set t_time = '9:30,11:30,16:30,18:30,20:30' where t_idx=2;
update theater set t_time = '10:00,12:00,14:00,16:00,18:00,20:00' where t_idx=3;
update theater set t_time = '10:25,13:25,15:25,17:25,19:25,21:25' where t_idx=4;
update theater set t_time = '11:40,13:40,15:40,18:00,19:30,21:45' where t_idx=5;
update theater set t_time = '9:15,13:15,15:00,18:15,21:15' where t_idx=6;
update theater set t_time = '11:35,13:35,15:00,17:35,19:45,21:35' where t_idx=7;
update theater set t_time = '8:45,9:00,11:00,15:00,23:00' where t_idx=8;


<history>

insert into show values(

select * from all_tables

select distinct * from show order by c_idx
select * from show

select * from movie

select * from cinema

delete from cinema where c_idx>=5;

select * from theater

delete from theater where t_idx>=1

ALTER SEQUENCE seq_theater_idx INCREMENT BY 1;

drop table movie CASCADE CONSTRAINTS
drop table theater CASCADE CONSTRAINTS

alter table theater drop column c_idx;


	

create or replace view show_cinema_view
as
select distinct 
	show.m_idx,
	cinema.c_idx,cinema.c_name,cinema.c_location
from show left outer join cinema 
on show.c_idx=cinema.c_idx 
order by c_idx

drop view show_cinema_view


select distinct c_idx,c_name from show_cinema_view where m_idx=1



create or replace view show_theater_view
as
select distinct
	show.m_idx, show.c_idx,
	theater.t_idx, theater.t_name,theater.t_seat, theater.t_time
from show left outer join theater
on show.t_idx=theater.t_idx
order by theater.t_idx

select distinct t_idx,t_name,t_seat,t_time from show_theater_view where m_idx=3 and c_idx=1 order by t_idx

*/