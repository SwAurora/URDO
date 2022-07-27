create database urdo;
use urdo;

#------------------------------------------------- 회원 테이블
create table member_tbl
(
    id varchar(20) primary key,
    pw varchar(100) not null,
    email varchar(40) not null,
    nickname varchar(20) not null,
    point int,
    grade int
);

#------------------------------------------------- 게시판 테이블
create table subject_tbl
(
    subject varchar(20) primary key
);

insert into subject_tbl values('bestNow');
insert into subject_tbl values('bestMonth');
insert into subject_tbl values('humor');
insert into subject_tbl values('creArt');
insert into subject_tbl values('creCook');
insert into subject_tbl values('regionRestaurant');
insert into subject_tbl values('regionLandmark');
insert into subject_tbl values('themeGame');
insert into subject_tbl values('themeSports');
insert into subject_tbl values('themeMusic');

#------------------------------------------------ 게시글 테이블
create table board_tbl
(
    no int primary key auto_increment,
    subject varchar(20) not null,
    title varchar(45) not null,
    content varchar(5000) not null,
    writer varchar(20) not null,
    date varchar(45) not null,
    views int,
    recommend int,
    filename varchar(500),
    available int,
    foreign key(subject) references subject_tbl(subject) on update cascade on delete cascade
);

create procedure board()
BEGIN
    DECLARE i INT DEFAULT 1;
while(i<=100) DO
insert into board_tbl(subject, title, content, writer, date, views, recommend, available) values ('bestNow', concat('제목', i), concat('내용', i), concat('작성자', i), SYSDATE(), 0, 0, 1);
insert into board_tbl(subject, title, content, writer, date, views, recommend, available) values ('bestMonth', concat('제목', i), concat('내용', i), concat('작성자', i), SYSDATE(), 0, 0, 1);
insert into board_tbl(subject, title, content, writer, date, views, recommend, available) values ('humor', concat('제목', i), concat('내용', i), concat('작성자', i), SYSDATE(), 0, 0, 1);
insert into board_tbl(subject, title, content, writer, date, views, recommend, available) values ('creArt', concat('제목', i), concat('내용', i), concat('작성자', i), SYSDATE(), 0, 0, 1);
insert into board_tbl(subject, title, content, writer, date, views, recommend, available) values ('creCook', concat('제목', i), concat('내용', i), concat('작성자', i), SYSDATE(), 0, 0, 1);
insert into board_tbl(subject, title, content, writer, date, views, recommend, available) values ('regionRestaurant', concat('제목', i), concat('내용', i), concat('작성자', i), SYSDATE(), 0, 0, 1);
insert into board_tbl(subject, title, content, writer, date, views, recommend, available) values ('regionLandmark', concat('제목', i), concat('내용', i), concat('작성자', i), SYSDATE(), 0, 0, 1);
insert into board_tbl(subject, title, content, writer, date, views, recommend, available) values ('themeGame', concat('제목', i), concat('내용', i), concat('작성자', i), SYSDATE(), 0, 0, 1);
insert into board_tbl(subject, title, content, writer, date, views, recommend, available) values ('themeSports', concat('제목', i), concat('내용', i), concat('작성자', i), SYSDATE(), 0, 0, 1);
insert into board_tbl(subject, title, content, writer, date, views, recommend, available) values ('themeMusic', concat('제목', i), concat('내용', i), concat('작성자', i), SYSDATE(), 0, 0, 1);
set i = i+1;
end while;
END;

CALL board();

select * from board_tbl where writer = 'aurora' and available = 0;

select * from subject_tbl;

select * from member_tbl where id = 'wb0802';


#------------------------------------------------- 댓글 테이블
create table reply_tbl (
  no int primary key,
  boardNo int not null,
  writer varchar(100) not null,
  content varchar(2000) not null,
  regdate date
);
 
#------------------------------------------------- 포인트샵 테이블
create table pointshop_tbl (
	no int not null primary key, 
	title varchar(45) not null,
	discription varchar(500),
	price int not null,
	staticImage varchar(500),
	gifImage varchar(500),
	category varchar(45),
	producer varchar(40)
);