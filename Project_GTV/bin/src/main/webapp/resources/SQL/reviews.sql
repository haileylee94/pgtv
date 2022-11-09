create table movie_com(
    mov_no number(38) primary key,
    mov_name varchar2(100) not null,
    user_id varchar2(50), --나중에 외래키로 가져와야함
    cont_com varchar2(500),
    upload_com date,
    edit_com date
);

select * from movie_com order by user_id desc;

alter table movie_com add recom number(10);
drop table movie_com;

--mov_no_seq 시퀀스 만들기
create sequence mov_no_seq
start with 1
increment by 1
nocache;

select mov_no_seq.nextval from dual;