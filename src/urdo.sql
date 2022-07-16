create database urdo;
use urdo;

create table member_tbl
(
    id varchar(20) primary key,
    pw varchar(100) not null,
    email varchar(40) not null,
    nickname varchar(20) not null,
    point int,
    grade int
);

desc member_tbl;

create table boardHumor_tbl
(
    no int primary key auto_increment,
    subject varchar(20) not null,
    title varchar(45) not null,
    content varchar(5000) not null,
    writer varchar(20) not null,
    date varchar(45) not null,
    views int,
    recommend int,
    comment varchar(5000),
    available int
);

create procedure humorboard()
BEGIN
    DECLARE i INT DEFAULT 1;
while(i<=500) DO
insert into boardHumor_tbl(subject, title, content, writer, date, views, recommend, available) values ('Board_humor', concat('제목', i), concat('내용', i), concat('작성자', i), '2022-07-16', 0, 0, 1);
set i = i+1;
end while;
END;

CALL humorboard();

desc boardHumor_tbl;

select * from boardHumor_tbl;
# ----------------------------------------------------------------------------------------------------------------
create table boardCreArt_tbl
(
    no int primary key auto_increment,
    subject varchar(20) not null,
    title varchar(45) not null,
    content varchar(5000) not null,
    writer varchar(20) not null,
    date varchar(45) not null,
    views int,
    recommend int,
    comment varchar(5000),
    available int
);

create procedure creArtboard()
BEGIN
    DECLARE i INT DEFAULT 1;
    while(i<=500) DO
            insert into boardCreArt_tbl(subject, title, content, writer, date, views, recommend, available) values ('Board_CreArt', concat('제목', i), concat('내용', i), concat('작성자', i), '2022-07-17', 0, 0, 1);
            set i = i+1;
        end while;
END;

CALL creArtboard();

desc boardCreArt_tbl;

select* from boardCreArt_tbl;