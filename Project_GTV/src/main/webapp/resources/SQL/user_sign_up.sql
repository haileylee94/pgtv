create table movie_user(
    user_no number(38) primary key -- ������ȣ
    ,user_id varchar2(50) not null -- ���̵�
    ,user_pw varchar2(200) not null -- ��й�ȣ(��ȣȭ)
    ,user_name varchar2(50) not null -- �̸�
    ,user_gender int not null -- ���� (1.�� 2.��)
    ,user_phone1 varchar2(10) not null -- ����ó1
    ,user_phone2 varchar2(10) not null -- ����ó2
    ,user_phone3 varchar2(10) not null -- ����ó3
    ,user_birth1 varchar2(5) not null -- ��
    ,user_birth2 varchar2(5) not null -- ��
    ,user_birth3 varchar2(5) not null -- ��
    ,user_date date -- ���Գ�¥
    ,user_state int default 1 -- ���Ի��� 1�̸� ����, 0�̸� Ż��
    ,del_cont varchar2(200) -- Ż�� ����
    ,del_date date -- Ż�� ��¥
);

-- user_no_seq ����
create sequence user_no_seq
start with 1 -- 1���� ����
increment by 1 -- 1�� ����
nocache; -- �ӽø޸� ������

insert into movie_user ( user_no, user_id, user_pw, user_name, user_gender, user_phone1, user_phone2, user_phone3, user_birth1, user_birth2, user_birth3, user_date)
    values(user_no_seq.nextval, 'admin', 'admin00', 'ȫ�浿', 1, '010', '1234', '5678', '1996', '07', '19', sysdate);
    
select * from movie_user;

insert into gtv_authorities values(1, 'ADMIN');

select * from gtv_authorities;

delete from gtv_authorities where user_no = 1;

-- ȸ�� ���̵�� ���� �ο� ���̺�
create table gtv_authorities(
    user_no number(38) primary key -- ������ȣ
    ,authority varchar2(50) not null -- ���̵� ����
    ,constraint authorities_user_id_fk foreign key(user_no) references movie_user(user_no) -- �ܷ�Ű(�������迡�� �������̺�)
);

commit;

select mem.user_no, user_id, user_pw, user_name, user_state, user_date, authority
			from movie_user mem LEFT OUTER JOIN gtv_authorities auth on mem.user_no = auth.user_no
			where mem.user_id = 'admin';
            
alter table movie_user drop column email;
select * from movie_user;
alter table movie_user add email varchar2(30) not null;
alter table movie_user add email_domain varchar2(30) not null;