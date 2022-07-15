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

create table boardhumor_tbl
(
    no int primary key,
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

desc boardhumor_tbl;