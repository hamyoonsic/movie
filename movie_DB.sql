
/*
---------------------------------[  movie  ]------------------------------
create sequence seq_movie_idx

create table movie
(
	m_idx			int,						--��ȭ��ȣ
	m_name			varchar2(100) not null,		--��ȭ�̸�
	m_rate			int,						--��ȭ������
	m_release		date,						--��ȭ��������
	m_r_time		varchar2(100),				--��ȭ�󿵽ð�
	m_age			varchar2(100) default 'all'	--��ȭ��������
)

alter table movie
	add constraint pk_movie_m_idx primary key(m_idx);
	
alter table movie
	add constraint check_m_rate	check(m_rate between 0 and 100);

alter table movie
	add constraint check_m_age	check(m_age in ('all', '15��', '19��'));
	



---------------------------------[  cinema  ]------------------------------

create sequence seq_cinema_idx

create table cinema
(
	c_idx			int,						--�����ȣ
	c_name			varchar2(100) not null,		--�����̸�
	c_location		varchar2(100) not null		--������ġ
)

alter table cinema
	add constraint pk_cinema_c_idx primary key(c_idx);

---------------------------------[  theater ]------------------------------

create sequence seq_theater_idx 
				minvalue 1
				maxvalue 9
				cycle
				nocache;
				
				drop sequence seq_theater_idx 

create table theater
(
	t_idx			int,						--�󿵰���ȣ
	t_name			varchar2(100) not null,		--�󿵰��̸�
	t_seat			varchar2(100),				--�󿵱����¼�����
	t_time			varchar2(100)				--�󿵽ð�
)

alter table theater
	add constraint pk_theater_t_idx primary key(t_idx);






---------------------------------[  seat  ������ ]--------------------------------


create sequence seq_seat_idx

create table seat
(
	s_idx			int,						--�¼���ȣ
	s_name			varchar2(100) not null,		--�¼��̸�
	s_check			varchar2(100),				--�¼���������
	s_price		varchar2(100),					--�¼�����
	
)

alter table seat
	add constraint pk_seat_s_idx primary key(s_idx);

alter table seat
	add constraint fk_seat_t_idx foreign key(t_idx)
										references theater(t_idx);


										
---------------------------------[  member ]--------------------------------
drop sequence seq_member_mem_idx

drop table member

create sequence seq_member_mem_idx

create table member
(
	mem_idx		int,							--�Ϸù�ȣ
	mem_name		varchar2(100) not null,			--�̸�
	mem_id		varchar2(100) not null,			--���̵�
	mem_pwd		varchar2(100) not null, 		--��й�ȣ
	mem_zipcode	varchar2(100) 		  ,			--�����ȣ
	mem_addr		varchar2(500) 		  , 		--�ּ�
	mem_grade		varchar2(100) default	'�Ϲ�' ,	--ȸ�����(�Ϲ�/������)
	mem_ip		varchar2(100),					--IP
	mem_regdate	date			
)


--�⺻Ű 
alter table member
	add constraint pk_member_mem_idx primary key(mem_idx);

--���̵� unique
alter table member
	add constraint unique_memeber_mem_id unique(mem_id);
	
--ȸ�� ����� üũ ����
alter table member
	add constraint ck_member_mem_grade check(mem_grade in('�Ϲ�','������') );

select * from member 

---------------------------------[  ticket ]--------------------------------

create sequence seq_ticket_idx

create table ticket
(
	mt_idx			int,						--���Ź�ȣ
	mt_date			date,						--���ų�¥
	mt_time			varchar2(100),				--���Žð�(��ÿ�ȭ����)
	mt_price		varchar2(100),				--���űݾ�
	mt_number		int,						--�����ο�
	m_idx			int,						--(��ȭ��ȣ)
	c_idx			int,						--(�����ȣ)
	t_idx			int,						--(�󿵰���ȣ)
	mem_idx			int							--(ȸ����ȣ)
	
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
	add constraint fk_ticket_mem_idx foreign key(mem_idx)
										references member(mem_idx);
										
---------------------------------[ show ]--------------------------------


create table show
(
	m_idx		int,
	c_idx		int,
	t_idx		int

)
alter table show
	add constraint fk_show_m_idx foreign key(m_idx)
									references movie(m_idx);

alter table show
	add constraint fk_show_c_idx foreign key(c_idx)
									references cinema(c_idx);
									
alter table show
	add constraint fk_show_t_idx foreign key(t_idx)
									references theater(t_idx);
									
									
									
									
---------------------------------

select * 


from 


movie  	where and where 						
									
									
									
									
													
*/