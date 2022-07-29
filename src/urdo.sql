create database urdo;
use urdo;

#------------------------------------------------- 회원 테이블
create table member_tbl
(
    id varchar(20) primary key,
    pw varchar(100) not null,
    email varchar(40) not null,
    nickname varchar(20) not null unique,
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
    foreign key(subject) references subject_tbl(subject) on update cascade on delete cascade
);

create procedure board()
BEGIN
    DECLARE i INT DEFAULT 1;
while(i<=100) DO
insert into board_tbl(subject, title, content, writer, date, views, recommend) values ('bestNow', concat('제목', i), concat('내용', i), concat('작성자', i), SYSDATE(), 0, 0);
insert into board_tbl(subject, title, content, writer, date, views, recommend) values ('bestMonth', concat('제목', i), concat('내용', i), concat('작성자', i), SYSDATE(), 0, 0);
insert into board_tbl(subject, title, content, writer, date, views, recommend) values ('humor', concat('제목', i), concat('내용', i), concat('작성자', i), SYSDATE(), 0, 0);
insert into board_tbl(subject, title, content, writer, date, views, recommend) values ('creArt', concat('제목', i), concat('내용', i), concat('작성자', i), SYSDATE(), 0, 0);
insert into board_tbl(subject, title, content, writer, date, views, recommend) values ('creCook', concat('제목', i), concat('내용', i), concat('작성자', i), SYSDATE(), 0, 0);
insert into board_tbl(subject, title, content, writer, date, views, recommend) values ('regionRestaurant', concat('제목', i), concat('내용', i), concat('작성자', i), SYSDATE(), 0, 0);
insert into board_tbl(subject, title, content, writer, date, views, recommend) values ('regionLandmark', concat('제목', i), concat('내용', i), concat('작성자', i), SYSDATE(), 0, 0);
insert into board_tbl(subject, title, content, writer, date, views, recommend) values ('themeGame', concat('제목', i), concat('내용', i), concat('작성자', i), SYSDATE(), 0, 0);
insert into board_tbl(subject, title, content, writer, date, views, recommend) values ('themeSports', concat('제목', i), concat('내용', i), concat('작성자', i), SYSDATE(), 0, 0);
insert into board_tbl(subject, title, content, writer, date, views, recommend) values ('themeMusic', concat('제목', i), concat('내용', i), concat('작성자', i), SYSDATE(), 0, 0);
set i = i+1;
end while;
END;

CALL board();

#------------------------------------------------- 댓글 테이블
create table reply_tbl
(
  no int primary key auto_increment,
  boardNo int not null,
  writer varchar(20) not null,
  content varchar(2000) not null,
  regdate varchar(45),
  foreign key(boardNo) references board_tbl(no) on delete cascade,
  foreign key(writer) references member_tbl(nickname) on update cascade
);

#------------------------------------------------ 추천 테이블
create table rec_tbl
(
    board_no int,
    rec_id varchar(20),
    foreign key(board_no) references board_tbl(no) on update cascade on delete cascade,
    foreign key(rec_id) references member_tbl(id) on update cascade on delete cascade
);

#------------------------------------------------- 포인트샵 테이블
create table urpo_tbl
(
    no int primary key auto_increment,
    title varchar(45) not null,
    discription varchar(500),
    price int not null,
    staticImage varchar(500),
    gifImage varchar(500),
    category varchar(45),
    producer varchar(40)
);

-- pointshop -> urpo로 테이블 이름 바꿈
insert into urpo_tbl (title, discription, price, staticImage, gifImage, category, producer)
values ('귀여운', '엄청귀엽습니다.', 20, '/resources/img/urpo/urcon/urcon6.bmp', '/resources/img/urpo/urcon/urcon6.gif', 'urcon', 'admin1234'),
 ('귀여운', '엄청귀엽습니다.', 20, '/resources/img/urpo/urcon/urcon7.bmp', '/resources/img/urpo/urcon/urcon7.gif', 'urcon', 'admin1234'),
 ('귀여운', '엄청귀엽습니다.', 20, '/resources/img/urpo/urcon/urcon9.bmp', '/resources/img/urpo/urcon/urcon9.gif', 'urcon', 'admin1234'),
 ('귀여운', '엄청귀엽습니다.', 20, '/resources/img/urpo/urcon/urcon10.bmp', '/resources/img/urpo/urcon/urcon10.gif', 'urcon', 'admin1234'),
 ('귀여운', '엄청귀엽습니다.', 20, '/resources/img/urpo/urcon/urcon11.bmp', '/resources/img/urpo/urcon/urcon11.gif', 'urcon', 'admin1234'),
 ('귀여운', '허허!.', 20, '/resources/img/urpo/urcon/urcon11.bmp', '/resources/img/urpo/urcon/urcon11.gif', 'urcon', 'admin1234');