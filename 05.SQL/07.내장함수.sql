/*
 * 4. 내장(Built-in) 함수
 */
 
 /*
  * 4.1 Built-in Function
  */
-- 절대값
select adb(-78) from dual;
-- 반올림 
select round(3.14159, 2), round(3.14159, 4) from dual; -- 3.12 // 3.1415
-- 문자열 연결
select concat('마당', '서점') from dual; -- 마당서점
-- 문자열 대체
select replace('JACK and JUE', 'J', 'BL') from dual; -- BLACK and BLUE
-- 도서제목에 야구가 포함된 도서를 농구로 변경한 후 보여주기
select replace(bookname, '야구', '농구') from book
    where bookname like '%야구%'; -- 농구의 추억 , 농구를 부탁해
-- 굿스포츠에서 출판한 도서의 제목과 제목의 글자 수 (문자열의 길이)
select bookname, length(bookname) from book
    where publisher like '굿스포츠';  -- 축구의 역사 6글자, 피겨 교본 5글자, 역도 단계별 기술 8글자
-- 마당서점의 고객 중에서 같은 성(姓)을 가진 사람이 몇 명이나 되는지 성별 인원수 
select substr(name, 1, 1) 성, count(name) from customer
    group by substr(name, 1,1); -- 김 1 , 장 1, 추 1, 신 1, 박 2.
--마당서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자는?
select orderid, orderdate 주문일자, orderdate+10 확정일자 from orders; -- 한글을 쓸 때 에러가 난다면 "" 를 써주거라. 
/*
1	2014-07-01	2014-07-11
2	2014-07-03	2014-07-13
3	2014-07-03	2014-07-13
4	2014-07-04	2014-07-14
5	2014-07-05	2014-07-15
6	2014-07-07	2014-07-17
7	2014-07-07	2014-07-17
8	2014-07-08	2014-07-18
9	2014-07-09	2014-07-19
10	2014-07-10	2014-07-20
11	2023-08-21	2023-08-31
12	2023-08-21	2023-08-31
*/
-- 마당서점이 2014년 7월 7일에 주문받은 도서의 주문번호, 주문일, 고객번호, 도서번호
select * from orders where orderdate='2014-07-07';
/*
6	12000	2014-07-07	1	2
7	13000	2014-07-07	4	8
*/

select * from orders where orderdate=to_date('20140707', 'YYYYmmdd');
/*
6	12000	2014-07-07	1	2
7	13000	2014-07-07	4	8
*/

select * from orders where orderdate=to_date('140707', 'YYmmdd');
/*
6	12000	2014-07-07	1	2
7	13000	2014-07-07	4	8
*/
-- 마당서점이 7월7일에서 7월9일까지 판매한 책 이름과 판가는?    
select b.bookname, o.saleprice, o.orderdate from orders o
    join book b on o.bookid=b.bookid
    where o.orderdate between '2014-07-07' and '2014-07-09'
    order by o.orderdate;
-- 오늘 현재 
select sysdate, systimestamp from dual; -- 2023-08-22	2023-08-22 10:50:27.253000000

/*
 * 4.2 테이블 만들기 
 */
 
-- MyBook 테이블 만들기
create table MyBook(
    bookid number primary key,
    price number
);
insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook(bookid) values(3);
insert into mybook values(4, null);
delete from mybook where bookid=4;
commit;
select * from mybook;

-- Null 값에 대한 연산 
select price+100 from mybook;
select sum(price), avg(price), count(*), count(price) from mybook;
select * from mybook where price is not null; -- 비교할 땐 = 이 아닌 is 라는 걸 쓰거라. 
select bookid, nvl(price, 0)from mybook;        -- null value

/*
 * 4.3 ROWNUM
 */
-- 도서의 가격이 비싼 책 3권
select * from book order by price desc; -- limit 3, offset 3
select rownum, bookname, price from book order by price desc;

select rownum, a.* from
     (select * from book order by price desc) a;
     
select rownum, a.* from
     (select * from book order by price desc) a
     where rownum <= 3;  -- 작은 것은 찾을 수 있음 다만, 큰 조건은 찾을 수 없음. rownum 비교는 LT,LE 만 가능

-- 도서의 가격이 비싼 책 4~6위     
select * from (
    select rownum as rnum, a.* from
        (select * from book order by price desc) a
        where rownum <= 6)
    where rnum >=4;
-- select * from book order by price desc limit 3 offset 3;  #MySQL