/*
 * 2. 데이터 조작 언어(DML: Data Manipulation Language)
 */
 
 /*
  * 2.1 삽입
  
  INSERT INTO 테이블명[(필드명1, 필드명2, ..., 필드명 n)]
    VALUES (값1, 값2, ..., 값n);
  
  */
-- 북 테이블에 새로운 레코드 추가
insert into book VALUES(11, '스포츠 의학', '한솔의학서점', 90000);
select * from book; 
desc book;
-- 스포츠 심리, 24000원, 출판사 모름
insert into book(bookid, bookname, price)
    values (12,'스포츠 심리', 24000);
-- 박세리 고객이 스포츠 의학을 오늘 구매한 사실을 Orders 테이블에 기록
insert into orders
    values(11, 90000, default, 5, 11);
-- 박찬호 고객이 스포츠 심리라는 책을 오늘 구매한 사실을 Orders 테이블에 기록
insert into  orders(orderid, saleprice, custid, bookid)
    values(12, 24000, 1, 12);
    
/*
 *2.2 갱신 (update)
 
 UPDATE 테이블명
    SET 필드명1=값1, ..., 필드명n=값n
    WHERE 조건;

*/
-- 스포츠 심리 책의 출판사를 한솔의학서적으로 변경
update book set publisher='한솔의학서적' where bookid=12;
select * from book;

-- 고객 테이블에 신유빈 선수를 등록
insert into customer(custid, name) values(6, '신유빈');

select * from orders; 
-- 신유빈 선수의주소를 강원도 영월, 전화번호 010-2345-6789 으로 변경
update customer set address='강원도 영월', phone='010-2345-6789'
    where custid=6;
-- 전화번호가 null인 고객을 070-2345-6789로 변경
update customer set phone='070-2345-6789' where phone is null; -- where 조건을 안주면 6개가 다 변경됨
select * from customer;
commit;

/*
 * 2.3 삭제(DELETE)
 
 DELETE FROM 테이블명 WHERE 조건;
*/
-- 고객 테이블에 테스트 데이터 입력 후 삭제
insert into customer(custid, name) values (7, '테스트');
insert all 
    into customer(custid, name) values(8, '류현진')
    into customer(custid, name) values(9, '손흥민')
    select * from daul;
select * from customer;
-- custid가 7인 고객 삭제
delete from customer where custid=7;
-- 주소가 null인 고객 삭제
delete from customer where address is null;
select * from customer;
commit;


/* 연습문제 */
--1. 마당서점에서 다음의 심화된 질문에 대해 SQL 문을 작성하시오
--(1) 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
--(2) 두 개 이상의 거로 다른 출판사에서 도서를 구매한 고객의 이름 
select c.name, count(DISTINCT b.publisher) from orders
    join book b on o.bookid=b.bookid
    join customer c on o.custid=c.custid
    group by c.name having count(DISTINCT b.publisher)>=2;
--(3)(생략) 전체 고객의 30% 이상이 구매한 도서



--2.다음 질의에 대해 DML 문을 작성하시오. 
--(1)새로운 도서('스포츠 세계','대한미디어',10000원)이 마당서점에 입고 되었다.  
--    삽입이 안될 경우 필요한 데이터가 더 있는지 찾아보자. ( bookid 가 없으면 데이터 입력이 안됨 파라메터값(프라이머리값은 없어서는 안됨))
insert into book(bookid, bookname,publisher, price)
    values (13,'스포츠 세계','대한미디어', 10000);
    select * from book; 
    desc book;
--(2)'삼성당'에서 출판한 도서를 삭제해야 함다.
delete from book where publisher='삼성당'; -- = 대신 like 사용 가능
select * from book;
--(3)'이상미디어'에서 출판한 도서를 삭제해야 한다. 삭제가 안될 경우 원인을 생각해보자.
select * from orders
    where bookid in (select bookid from book where publisher like '이상미디어');
delete from book where lower(publisher) like '%이상미디어%'; -- 부모 테이블 order 에서 먼저 7,8번을 지워야 이상미디어를 지울 수 있다. 그래서 지금은 안지워심
select * from book;
--(4)출판사'대한미디어'가 '대한출판사'로 이름을 바꾸었다.
update book set publisher='대한출판사' where bookid=13;
select * from book;