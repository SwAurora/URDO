#------------------------------------------------ DB 시작
create database urdo;
use urdo;

#------------------------------------------------- 회원 테이블
create table member_tbl
(
    id varchar(20) primary key,
    pw varchar(100) not null,
    email varchar(40) not null,
    nickname varchar(10) not null unique,
    point int,
    grade int,
    icon int default 1,
    items varchar(5000) default '1;'
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
    content varchar(10000) not null,
    writer varchar(10) not null,
    date varchar(45) not null,
    views int,
    recommend int,
    day_rec int,
    month_rec int,
    filename varchar(500),
    foreign key(subject) references subject_tbl(subject) on update cascade on delete cascade,
    foreign key(writer) references member_tbl(nickname) on update cascade on delete cascade
);

create table bestnow_tbl
(
    bestNow_no int primary key auto_increment,
    board_no int,
    foreign key (board_no) references board_tbl(no) on delete cascade
);

create table bestmonth_tbl
(
    bestMonth_no int primary key auto_increment,
    board_no int,
    foreign key (board_no) references board_tbl(no) on delete cascade
);

#------------------------------------------------ 관리자 계정 추가
insert into member_tbl values('admin', '$2a$10$n9VIAGQPzHImY6P5rTAlXenyO30P4ieU3OpOb88EZ2BG/LfVA1uK2', 'eee1717test@daum.net', '관리자', 9999, 1, 1, '1;');

#------------------------------------------------ 게시판 채우기 프로시저
DELIMITER $$
create procedure board()
BEGIN
    DECLARE i INT DEFAULT 1;
    while(i<=100) DO
            insert into board_tbl(subject, title, content, writer, date, views, recommend, day_rec, month_rec) values ('humor', concat('제목', i), concat('내용', i), '관리자', SYSDATE(), 0, 0, 0, 0);
            insert into board_tbl(subject, title, content, writer, date, views, recommend, day_rec, month_rec) values ('creArt', concat('제목', i), concat('내용', i), '관리자', SYSDATE(), 0, 0, 0, 0);
            insert into board_tbl(subject, title, content, writer, date, views, recommend, day_rec, month_rec) values ('creCook', concat('제목', i), concat('내용', i), '관리자', SYSDATE(), 0, 0, 0, 0);
            insert into board_tbl(subject, title, content, writer, date, views, recommend, day_rec, month_rec) values ('regionRestaurant', concat('제목', i), concat('내용', i), '관리자', SYSDATE(), 0, 0, 0, 0);
            insert into board_tbl(subject, title, content, writer, date, views, recommend, day_rec, month_rec) values ('regionLandmark', concat('제목', i), concat('내용', i), '관리자', SYSDATE(), 0, 0, 0, 0);
            insert into board_tbl(subject, title, content, writer, date, views, recommend, day_rec, month_rec) values ('themeGame', concat('제목', i), concat('내용', i), '관리자', SYSDATE(), 0, 0, 0, 0);
            insert into board_tbl(subject, title, content, writer, date, views, recommend, day_rec, month_rec) values ('themeSports', concat('제목', i), concat('내용', i), '관리자', SYSDATE(), 0, 0, 0, 0);
            insert into board_tbl(subject, title, content, writer, date, views, recommend, day_rec, month_rec) values ('themeMusic', concat('제목', i), concat('내용', i), '관리자', SYSDATE(), 0, 0, 0, 0);
            set i = i+1;
        end while;
END $$
DELIMITER ;

CALL board();
#------------------------------------------------- 댓글 테이블
create table reply_tbl
(
  no int primary key auto_increment,
  boardNo int not null,
  memberId varchar(20) not null,
  writer varchar(10) not null,
  content varchar(2000) not null,
  regdate varchar(45),
  foreign key(boardNo) references board_tbl(no) on delete cascade,
  foreign key(writer) references member_tbl(nickname) on update cascade,
  foreign key(memberId) references member_tbl(id) on delete cascade
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

#------------------------------------------------- 포인트샵 채우기 프로시저
DELIMITER $$
CREATE PROCEDURE urpoprocedure()
BEGIN

    DECLARE i INT;
    insert into urpo_tbl (title, discription, price, staticImage, gifImage, category, producer)
    values
        ('디폴트', '디폴트', 1, '/resources/img/urpo/urcon/default.jpg', '/resources/img/urpo/urcon/default.gif', 'default', 'admin1234');
    SET i=1;
    while(i<=33) DO
            insert into urpo_tbl (title, discription, price, staticImage, gifImage, category, producer)
            values
                (concat('타이틀',i), concat(i,'번째 아이콘 설명입니다...'), 20,  concat('/resources/img/urpo/urcon/urcon',i,'.jpg' ), concat('/resources/img/urpo/urcon/urcon',i,'.gif' ), 'urcon', 'admin1234');
            set i = i+1;
        end while;
END $$
DELIMITER ;

call urpoprocedure();


#------------------------------------------------- 일간, 월간 추천 수 초기화 이벤트
DELIMITER $$
CREATE PROCEDURE dayRecReset()
BEGIN
    update board_tbl set day_rec = 0 where day_rec < 20;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE monthRecReset()
BEGIN
    update board_tbl set month_rec = 0 where month_rec < 50;
END $$
DELIMITER ;

CREATE EVENT dayRecReset
    ON SCHEDULE every 1 day
        STARTS '2022-08-18 00:00:00'
    COMMENT '매일 00시에 dayRec 초기화'
    DO
    call dayRecReset();

CREATE EVENT monthRecReset
    ON SCHEDULE every 1 month
        STARTS '2022-09-01 00:00:00'
    COMMENT '매달 1일 00시에 monthRec 초기화'
    DO
    call monthRecReset();
    
#----------------------------------------------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------------------------------------