Create table member(
    id VARCHAR(20),
    pw VARCHAR(20),
    name VARCHAR(20)
);

Create table matchschedule(
    matchNo VARCHAR(20)Primary key,
    away VARCHAR(20) NOT NULL,
    awayP VARCHAR(20)NOT NULL,
    matchTime VARCHAR(20)NOT NULL,
    home VARCHAR(20)NOT NULL,
    homeP VARCHAR(20)NOT NULL,
    matchDate VARCHAR(20)NOT NULL
);
delete from member where id != 'admin';

insert into member VALUES('admin','1234','°ü¸®ÀÚ');

commit;

select * from MEMBER;
select * from matchschedule;