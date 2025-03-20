/*
 여러 줄 주석
*/

-- 한줄 주석

-- sql문은 탭을 인식하지 않습니다.

-- mysql monitor 접속 방법
-- 프롬프트>mysql -u 계정 -p
-- 비번 입력

-- 데이터베이스 목록 확인
-- mysql>show databases;

-- 데이터베이스 생성
create database ezen;

-- 사용할 데이터베이스 선택
-- use 데이터베이스 이름;
use ezen;

-- 데이터베이스 삭제
-- drop database 데이터베이스 이름;

drop database ezen;
create database ezen;
use ezen;

-- 테이블 생성
-- create table 테이블이름 ( 컬럼 내용 );
-- 컬럼 내용 작성 예
-- 컬럼이름 타입 [unsigned] [not null] [comment '내용'],

create table memo
(
    mNo int comment '메모번호',
    mTitle text comment '제목',
    mNote text comment '내용'
);

-- 테이블 목록 출력
show tables;
-- 테이블 정보 출력
-- desc 테이블이름;
-- describe
desc memo;

-- 테이블의 모든 정보 출력
show full columns from memo;
-- 테이블 삭제
-- drop table 테이블이름;
drop table memo;

-- 데이터 삽입
insert into memo 
	 ( mNo, mTitle, mNote ) 
 values 
 	 ( 'A', '1번 메모', '메모 내용');

-- 데이터 조회
select * from memo;

-- 테이블 초기화 : 테이블 구조는 놔두고, 데이터만 삭제
-- truncate table memo;
truncate table memo;

/*	create table 테이블 이름
	(
		컬럼이름 컬럼타입 [unsigned] [not null]
				 [primary key] [auto_increment] [comment '내용'],
		컬럼2 타입, 컬럼3 타입,
		....
		[외래키 ]
	); */
create table memo
(
	-- mNo를 기본키로 설정, 자동증가, 널 허용하지 않음
    mNo int not null primary key auto_increment comment '메모번호',
    mTitle text comment '제목',
    mNote text comment '내용', 
    mWDate datetime default now() comment '작성일' 
);
insert into memo ( mTitle, mNote ) values ( '1번 메모', '메모 내용');
insert into memo ( mTitle, mNote ) values ( '2번 메모', '메모 내용');
insert into memo ( mNo, mTitle, mNote )
 values ( 10, '1번 메모', '메모 내용');
insert into memo ( mTitle, mNote ) values ( '??번 메모', '메모 내용');
-- 문자열로 datetime을 입력
insert into memo ( mTitle, mNote, mWDate )
 values ( '2번 메모', '메모 내용', '2021-11-02 17:45:00');
-- 현재 시간을 입력 
insert into memo ( mTitle, mNote, mWDate )
 values ( '3번 메모', '메모 내용', now());
 -- 작성일에 기본값을 이용
insert into memo ( mTitle, mNote )
 values ( '3번 메모', '메모 내용' );
 	 
/*	create table 테이블 이름
	(
		컬럼이름 컬럼타입 [unsigned] [not null]
				 [primary key] [auto_increment] [comment '내용'],
		컬럼2 타입, 컬럼3 타입,
		....
		[기본키 설정]
		[외래키 설정]
	); 
*/

create table test
(
    tNo int,
    tTitle text,
    tNote text,
    primary key (tNo)
);

-- 테이블 이름 members
-- idx : 기본키 int 자동증가, '관리번호'
-- mName : 성명, varchar(255), not null
-- mId : 사용자 아이디, varchar(20), not null
-- mPw : 비밀번호, char(32), not null
-- mGender : 성별, varchar(2), null
-- mAddr : 주소, varchar(255), null
 
create table members
(
    idx int unsigned not null primary key auto_increment comment '관리번호',
    mName varchar(255) not null comment '성명',
    mId varchar(20) not null comment '사용자 아이디', 
    mPw char(32) not null comment '비밀번호',
    mGender varchar(2) null comment '성별',
    mAddr varchar(255) comment '주소'
);

-- 테이블 구조 수정
-- 수정
-- alter 대상타입 대상이름 변경종류 상세대상 내역;
-- alter table 테이블이름 modify 컬럼이름 타입 상세내역;
alter table members modify mGender varchar(1) null;
alter table members modify mAddr varchar(255) null;

-- 추가
-- mEmail text null
alter table members add mEmail text null;
-- mBirth date null
alter table members add mBirth date null;

-- 삭제
alter table members drop mEmail;
-- alter table members drop idx;
-- alter table members add idx int not null;

-- 기본키를 추가하기
-- 이미 있는 컬럼을 기본키로 지정
-- alter table 테이블이름 add primary key (컬럼이름);
alter table members add primary key (idx);

-- 기본키 지정은 수정되지 않습니다.
-- 기본키 지정을 해제, 기본키 지정 추가
alter table members drop primary key;
alter table members add primary key (idx);

alter table members drop primary key, add primary key (mId);

-- 테이블에 데이터 삭제, 갱신, 조회

-- 데이터 넣기
-- insert into 테이블이름 ( 컬럼 [,컬럼2[,컬럼3, ...]])
-- value (값 [, 값 [,값, ... ]])
-- 값이 문자열인 경우 ''로 감싸줘야 합니다.

insert into members ( mName, mId, mPW, mGender, mAddr )
 value ('홍길동', 'hong', '1234', '남성', '전주시');
insert into members ( mName, mId, mPW, mGender, mAddr )
 value ('전우치', 'jeon', '1234', '남성', '강원도');
insert into members ( mName, mId, mPW, mGender, mAddr )
 value ('성춘향', 'sung', '1234', '여성', '남원시');
insert into members ( mName, mId, mPW, mGender, mAddr )
 value ('콩쥐', 'kong', '1234', '여성', '완주군');\
 
insert into members ( mName, mId, mPW, mGender, mAddr )
 values ('홍길동', 'hong', '1234', '남성', '전주시'),
 ('전우치', 'jeon', '1234', '남성', '강원도'),
 ('성춘향', 'sung', '1234', '여성', '남원시'),
 ('콩쥐', 'kong', '1234', '여성', '완주군');
 
 -- 데이터 삭제
 -- delete from 테이블 where 조건식(값지정);
delete from members where idx = 10;
delete from members where idx < 15;

delete from members where mName = '콩쥐';

-- 데이터 수정
-- update 테이블이름 set 컬럼이름 = '값' [, 컬럼이름='값'] 
-- where 조건식; 
update members set mAddr = '전주시';
update members set mAddr = '남원시' where mName = '성춘향';

update members 
 set 
  mName = '유다현',
  mId = 'you',
  mGender = '여성' 
 where mName = '홍길동'; 

update members set mAddr = '캐나다' where idx = 15; 

-- 조회
-- select 컬럼 [,컬럼2[,컬럼3, ...]] from 테이블이름
-- where 조건문;

insert into members ( mName, mId, mPW, mGender, mAddr )
 values 
 ('홍길동', 'hong', '1234', '남성', '경기도'),
 ('김길동', 'kim', '1234', '남성', '경기'),
 ('박길동', 'park', '1234', '남성', '경'),
 ('길동', 'gil', '1234', '남성', '기도');
 
select * from members where --...
 -- 이름이 홍길동인 데이터를 보여주세요
select * from members where mName = '홍길동';
 -- 이름이 홍길동이고 주소가 전주시인 데이터를 보여주세요
select * from members where mName = '홍길동' and mAddr = '전주시';
-- 이름이 홍길동이거나 전우치인 데이터를 보여주세요
select * from members where mName = '홍길동' or mName = '전우치';

-- 문자열 검색 like
select * from members where mName like '홍길동';
-- 글자수 지정
select * from members where mName like '_길동';
select * from members where mName like '_길_';
-- _ 1글자가 어느것이든 
-- % : 0~n 글자가 없을수도, 1글자, 여러글자
select * from members where mName like '%길동';

-- 주소가 '경기'로 시작하는 사람은?
select * from members where mAddr like '경기%';
select * from members where mAddr like '경__';
select * from members where mName like '%길%';

-- 데이터베이스 백업
-- mysqldump -u root -p 데이터베이스이름 > 파일명

-- 데이터베이스 복원
-- mysql -u root -p 데이터베이스이름 < 파일명
-- 없는 데이터베이스 이름은 지정할 수 없습니다.
-- 비어있는 데이터베이스를 생성하세요. 