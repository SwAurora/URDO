create database urdo;
use urdo;

create table member_tbl
(
    id varchar(20) primary key,
    pw varchar(100) not null,
    email varchar(40) not null,
    nickname varchar(20) not null,
    memberpoint int,
    grade int
);

desc member_tbl;