create table movie(
    movienum number(20) primary key -- 영화 번호 (pk)
    ,moviename varchar2(38) UNIQUE -- 영화 제목 (uq)
);

insert into movie values(1,'공조2');
insert into movie values(2,'블랙 아담');
insert into movie values(3,'스마일');

select * from movie where movienum=1;

select * from movie;


create table movietotal( -- 영화 정보
    movienum number(20) --영화 번호 (fk)
    ,theaternum number(20) -- 지점 번호 (fk)
    ,regionnum number(20) --지역 번호 (uq)
    ,remainseat number(20) --남은 좌석(nn)
    ,strdate varchar2(38) --시작 날짜(nn)
    ,strhour varchar2(38) --시작 시간(nn)
    ,strmin varchar2(38) -- 시작 분(nn)
    ,endhour varchar2(38) --종료 시간(nn)
    ,endmin varchar2(38) --종료 분(nn)
    ,CONSTRAINT movietotal_movienum_fk FOREIGN key(movienum) REFERENCES movie(movienum)
    ,CONSTRAINT movietotal_regiondetail_fk FOREIGN key(theaternum) REFERENCES regiondetail(theaternum)
);


        
alter table movietotal add movietotalnum number(20) primary key; -- 영화 정보 번호
alter table movietotal add moviename varchar2(38); --영화 이름
alter table movietotal add branchname varchar2(38); --지점 이름
alter table movietotal add thname varchar2(38); --상영관 이름
alter table movietotal add totalseat number(20); --전체 좌석
alter table movietotal add thnum number(20); --상영관 번호




select * from movietotal;

insert into movietotal values(1,1,1,108,'2022.11.11','09','00','11','00',1,'공조2','강남','1관',108,1); 
insert into movietotal values(1,1,1,108,'2022.11.11','12','00','14','00',2,'공조2','강남','2관',108,2); 
insert into movietotal values(1,2,1,108,'2022.11.11','08','50','10','50',3,'공조2','잠실','1관',108,3);
insert into movietotal values(1,2,1,108,'2022.11.11','11','40','13','40',4,'공조2','잠실','2관',108,4);
insert into movietotal values(2,1,1,108,'2022.11.11','13','10','14','40',5,'블랙아담','강남','1관',108,5);
insert into movietotal values(2,1,1,108,'2022.11.11','16','00','17','30',6,'블랙아담','강남','2관',108,6);

delete movietotal;

select * from movietotal where movienum=1 and theaternum=1 and strdate='2022.11.7';
commit;

create table regiondetail(
    theaternum number(20) primary key--지점 번호 (pk)
    ,branchname varchar2(38) -- 지점이름 (nn)
    ,regionnum number(20)--지역번호(nn)
    ,regionname varchar2(38) --지역이름(nn)
);

select * from regiondetail;

alter table regiondetail add regionname varchar2(38);
update regiondetail set regionname='����' where regionnum=1;
update regiondetail set regionname='���' where regionnum=2;

insert into regiondetail values('1','강남','1','서울'); 
insert into regiondetail values('2','잠실','1','서울');
insert into regiondetail values('11','판교','2','경기');
insert into regiondetail values('12','구리','2','경기');



create table theater(
    thname varchar2(38) -- 상영관 이름
    ,theaternum number(20) --상영관 번호(fk)
    , totalseat number(20) --전체 좌석 (nn)
    , constraint theater_theaternum_fk foreign key (theaternum) references
    regiondetail (theaternum)
);

select * from theater;

 create table seat_theater(
    movietotalnum number(20) --(fk)
    ,seat_name varchar2(38)
     ,CONSTRAINT seat_theater_movietotalnum_fk FOREIGN key(movietotalnum) REFERENCES movietotal(movietotalnum)
);

alter table seat_theater drop column thnum;

insert into seat_theater VALUES (1,'A1');
insert into seat_theater VALUES (1,'A5');

delete seat_theater;
COMMIT;

select * from seat_theater;

insert into theater values('1관',1,108);
insert into theater values('2관',1,108);
insert into theater values('1관',2,108);
insert into theater values('2관',2,108);
insert into theater values('1관',11,108);
insert into theater values('2관',11,108);
insert into theater values('1관',12,108);
insert into theater values('2관',12,108);




create table reservation(
    reservenum number(20) primary key --예매 번호
    ,movietotalnum number(20) --fk 영화 정보 번호
    --,user_id varchar2(38) -- fk ���� ���̵�
    ,adult number(20) -- 성인
    ,teen number(20) -- 청소년
    ,seat varchar2(38) -- 좌석
    ,payment number(20) -- 가격
     ,CONSTRAINT reservation_movietotalnum_fk FOREIGN key(movietotalnum) REFERENCES movietotal(movietotalnum)
);

select * from reservation;

create SEQUENCE reservenum_seq
start with 100000
INCREMENT by 1
NOCACHE;


/*
create table seatnumber(
    movietotalnum number(20) --��ȭ������ȣ(fk)
    ,seatnum varchar2(38) --�¼� ��ȣ
    ,CONSTRAINT seatnumber_movietotalnum_fk FOREIGN key(movietotalnum) REFERENCES movietotal(movietotalnum)
);

select * from seatnumber;

insert into seatnumber values(1,'a1');
insert into seatnumber values(1,'a5');

select seatnum from seatnumber where movietotalnum=1;


drop table seatnumber;
*/


create table com(
    com_num number(20) primary key
    ,movienum number(20) --��ȭ��ȣ(fk  pk)
    ,moviename varchar2(38) --��ȭ����(fk  uq)
    --,user_id varchar2(38) 
    ,cont_com varchar2(500) -- ���� (nn)
    ,upload_com date --��¥ (nn)
     ,CONSTRAINT com_movienum_fk FOREIGN key(movienum) REFERENCES movie(movienum)
     ,CONSTRAINT com_moviename_fk FOREIGN key(moviename) REFERENCES movie(moviename)
);

--������ com_num 
create SEQUENCE com_num_seq
start with 1
INCREMENT by 1
NOCACHE;










