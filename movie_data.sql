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

<history>

insert into show values(

select * from all_tables

select * from movie
select * from theater
select * from cinema

delete from cinema where c_idx>=5;

select * from theater

delete from theater where t_idx>=1

ALTER SEQUENCE seq_theater_idx INCREMENT BY 1;



drop table movie
drop table theater
drop table cinema

select distinct cinema.c_idx,c_name,c_location from show left outer join cinema on show.c_idx=cinema.c_idx

select distinct c_idx from show where m_idx=1;

select distinct cinema.c_idx from show left outer join cinema on show.c_idx=cinema.c_idx


select distinct c_idx from show where m_idx=1




*/