-- 1-1. 회원가입한 정보를 저장할 수 있는 'web_member'테이블을 만드시오.
-- 컬럼명 : email(pk) / pw / tel / address
-- 데이터타입 : varchar2(100)
create table web_member(
	email varchar2(100) primary key,
	pw varchar2(100),
	tel varchar2(100),
	address varchar2(100)
);


-- 1-2. test값 넣기
insert into web_member values('test', 'test', 'test', 'test');

-- 1-3. test값 조회하기
select * from web_member;

select * from web_member where email='test';

-- 2-1. 메시지 정보를 저장할 수 있는 'web_message'테이블을 만드시오.
-- 컬럼명 : num(pk)/ sender / recipient / message/ m_date
-- 데이터타입 : number / varchar2(100) / date
create table web_message(
	num number primary key,
	sender varchar2(100),
	recipient varchar2(100),
	message varchar2(100),
	m_date date
);

select * from web_message;

-- 2-2. num에 입력할 시퀀스 생성 : num_message
create sequence num_message
start with 1
increment by 1;

-- 2-3. test값 넣기(num : 시퀀스값 자동 생성, m_date : 현재시간 넣기 sysdate)
insert into web_message values(num_message.nextval, 'test1', 'test1', 'test1', sysdate);
insert into web_message values(num_message.nextval, 'test2', 'test2', 'test2', sysdate);
insert into web_message values(num_message.nextval, 'test3', 'test3', 'test3', sysdate);

-- 2-4. test값 조회하기

select * from web_message;

-- 3-1. 게시글 정보를 저장할 수 있는 'web_board' 테이블을 만드시오.
-- 컬럼명 : num(pk)/ title / writer/ filename / content / b_date
-- 데이터타입 : number / varchar2(100) / date

create table web_board(

	num number primary key,
	title varchar2(100),
	writer varchar2(100),
	filename varchar2(100),
	content varchar2(100),
	b_date date

);
alter table wen_board rename to web_borad;
alter table web_borad rename to web_board;

-- 3-2. num에 입력할 시퀀스 생성 : num_board

create sequence num_board
start with 1
increment by 1;

-- 3-3. test값 넣기

insert into web_board values(num_board.nextval, 'test1', 'test1', 'test1', 'test1', sysdate);
insert into web_board values(num_board.nextval, 'test2', 'test2', 'test2', 'test2', sysdate);
insert into web_board values(num_board.nextval, 'test3', 'test3', 'test3', 'test3', sysdate);

-- 3-4. test값 조회하기

select * from web_board;