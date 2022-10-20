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