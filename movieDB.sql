/*
	-------------------------------------------------------user_info--------
 	create table user_info
 	(
 		u_id 		varchar2(100) 	not null,	-- ���̵�*
 		u_pwd 	varchar2(100)	not null,	-- �н�����
 		u_name 	varchar2(100) 	not null,	-- �̸�
 		u_jumin 	varchar2(14) 	not null,	-- �ֹι�ȣ
 		u_tel 		varchar2(20),					-- ��ȭ��ȣ
 		u_email 	varchar2(100)				-- �̸���
 	)
 
 	alter table user_info
 		add constraints pk_user_u_id primary key(u_id)
 		
 	select * from user
 	--------------------------------------------------------ticketing--------
 	create table ticketing_info
 	(
 		u_id 		varchar2(100) 	not null,	-- ���̵�*
 		m_idx 	int 				not null,	-- ��ȭ
 		th_idx 	int 				not null,	-- ����
 		ti_num 	varchar2(100) 	not null,	-- �ο�
 		ti_seat 	varchar2(100) 	not null,	-- �¼�
 		ti_date 	date 				not null,	-- ���ų�¥
 		ti_money int 				not null	-- �ݾ�
 	)
 	
 	alter table ticketing_info
 		add constraints fk_ticketing_info_u_id foreign key(u_id) references user_info(u_id)	
 		
 	alter table ticketing_info
 		add constraints pk_ticketing_info_u_id primary key(u_id)
 		
 	alter table ticketing_info
 		add constraints fk_ticketing_info_m_idx foreign key(m_idx) references movie(m_idx)	
 		
 	alter table ticketing_info
 		add constraints fk_ticketing_info_th_idx foreign key(th_idx) references theater(th_idx)		
 		
 		
 	-------------------------------------------------------theater-------
 	create sequence seq_theater_idx
 	
 	create table theater
 	(
 		th_idx 		int 				not null,	-- ��ȣ*
 		th_name 		varchar2(100) 	not null,	-- �̸�
 		m_idx 		int 				not null,	-- ������ ��ȭ
 		th_num 		int 				not null, 	-- �󿵰�
 		th_loc 		varchar2(100) 	not null	-- ��ġ
 	)	
 	
 	alter table theater
 		add constraints pk_theater_th_idx primary key(th_idx)
 		
 	alter table theater
 		add constraints fk_theater_m_idx foreign key(m_idx) references movie(m_idx)	
 		
 		
 	-------------------------------------------------------movie--------
 	create sequence seq_movie_idx
 	
 	create table movie
 	(
 		m_idx 		int 				not null,	-- ��ȣ*
 		m_name 		varchar2(100) 	not null,	-- �̸�
 		m_date 		date,							-- ��������
 		m_percent 	int								-- ������
 	)		
 	
 	alter table movie
 		add constraints pk_movie_m_idx primary key(m_idx)
 													
 																									
 																																					
 																																																													
 */