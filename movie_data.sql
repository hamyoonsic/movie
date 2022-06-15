/*
---------------------------------[  movie  ]-----------------------------------------------------------
insert into movie values(seq_movie_idx.nextVal,'�������','30','2022-06-14','150��','15��');
insert into movie values(seq_movie_idx.nextVal,'���ͽ�Ʈ������','20','2022-06-10','123��','19��');
insert into movie values(seq_movie_idx.nextVal,'�����̴���','10','2022-06-05','110��','15��');
insert into movie values(seq_movie_idx.nextVal,'�丣','5','2022-06-01','100��','19��');
insert into movie values(seq_movie_idx.nextVal,'�ظ�����','3','2022-05-31','90��','19��');
insert into movie values(seq_movie_idx.nextVal,'�ź��ѵ�������','2','2022-05-25','80��','��ü�̿밡');


---------------------------------[  cinema  ]-----------------------------------------------------------

insert into cinema values(seq_cinema_idx.nextVal,'����Cgv', '����');
insert into cinema values(seq_cinema_idx.nextVal,'ȫ��Cgv', 'ȫ��');
insert into cinema values(seq_cinema_idx.nextVal,'����Cgv', '����');
insert into cinema values(seq_cinema_idx.nextVal,'����Cgv', '����');

---------------------------------[  theater ]------------------------------------------------------------

insert into theater values(seq_theater_idx.nextVal, '1��', '180��');
insert into theater values(seq_theater_idx.nextVal, '2��', '170��');
insert into theater values(seq_theater_idx.nextVal, '3��', '160��');
insert into theater values(seq_theater_idx.nextVal, '4��', '155��');
insert into theater values(seq_theater_idx.nextVal, '5��', '150��');
insert into theater values(seq_theater_idx.nextVal, '6��', '145��');
insert into theater values(seq_theater_idx.nextVal, '7��', '143��');
insert into theater values(seq_theater_idx.nextVal, '8��', '141��');


------------------------------[member]-------------------------------

select * from show


insert into member values(seq_member_mem_idx.nextVal,
					'�ϱ浿',
					'one',
					'1234',
					'12345',
					'����� ������ ���굿',
					'�Ϲ�',
					'192.168.0.9',
					sysdate);

insert into member values(seq_member_mem_idx.nextVal,
					'ȫ����',
					'admin',
					'1234',
					'12345',
					'����� ������ ���굿',
					'������',
					'192.168.0.9',
					sysdate);

--����
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
	theater.t_idx, theater.t_name,theater.t_seat
from show left outer join theater
on show.t_idx=theater.t_idx
order by theater.t_idx

select distinct t_idx,t_name,t_seat from show_theater_view where m_idx=3 and c_idx=1 order by t_idx

*/