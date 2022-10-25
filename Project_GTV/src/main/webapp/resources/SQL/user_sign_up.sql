create table movie_user(
    user_no number(38) primary key -- 유저번호
    ,user_id varchar2(50) not null -- 아이디
    ,user_pw varchar2(200) not null -- 비밀번호(암호화)
    ,user_name varchar2(50) not null -- 이름
    ,user_gender int not null -- 성별 (1.남 2.여)
    ,user_phone1 varchar2(10) not null -- 연락처1
    ,user_phone2 varchar2(10) not null -- 연락처2
    ,user_phone3 varchar2(10) not null -- 연락처3
    ,user_birth1 varchar2(5) not null -- 년
    ,user_birth2 varchar2(5) not null -- 월
    ,user_birth3 varchar2(5) not null -- 일
    ,user_date date -- 가입날짜
    ,user_state int default 1 -- 가입상태 1이면 가입, 0이면 탈퇴
    ,del_cont varchar2(200) -- 탈퇴 사유
    ,del_date date -- 탈퇴 날짜
);

-- user_no_seq 생성
create sequence user_no_seq
start with 1 -- 1부터 시작
increment by 1 -- 1씩 증가
nocache; -- 임시메모리 사용안함

-- 회원 아이디와 권한 부여 테이블
create table gtv_authorities(
    user_id number(38) not null -- 유저번호
    ,authority varchar2(50) not null -- 아이디 권한
    ,constraint authorities_user_id_fk foreign key(user_id) references movie_user(user_id) -- 외래키(주종관계에서 종속테이블)
);