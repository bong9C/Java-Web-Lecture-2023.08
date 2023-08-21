/* 연습문제 */
-- 1. 마당서점의 고객이 요구하는 다음 질문에 대해 SQL 문을 작성하시오.
--(1). 도서번호가 1인 도서의 이름 
select bookname from book where bookid='1';
--(2). 가격이 20,000원 이상인 도서의 이름
select bookname, price from book where price >= 20000;
--(3). 박지성의 총 구매액(박지성의 고객번호는 1번으로 놓고 작성)
select sum(saleprice) as sum_saleprice from orders where custid='1';
select sum(o.saleprice) from orders o
        join customer c     
        on o.custid=c.custid
        where c.name='박지성';
--(4). 박지성이 구매한 도서의 수(박지성의 고객번호는 1번으로 놓고 작성
select count(*) from orders where custid='1';


-- 2. 마당서점의 운영자와 경영자가 요구하는 다음질문에 대해 SQL문을 작성하시오.
--(1). 마당서점 도서의 총 개수
select count(*) from book;
--(2). 마당서점에 도서를 출고하는 출판사의 총 개수
select count(distinct publisher) from book;
--(3). 모든 고객의 이름, 주소
select name from customer;
--(4). 2014년 7월 4일~7월 7일 사이에 주문 받은 도서의 주문번호 
select orderid from orders where orderdate between '2014-07-04' and  '2014-07-07';
--(5). 2014년 7월 4일~7월 7일 사이에 주문 받은 도서를 제외한 도서의 주문번호
select  orderid from orders where orderdate not between '2014-07-04' and '2014-07-07'; 
--(6). 성이 '김'씨인 고객의 이름과 주소
select name,address from customer where name like '김%';
--(7). 성이 '김'씨이고 이름이 '아'로 끝나는 고객의 이름과 주소
select name,address from customer where name like '김%아';





/* 연습문제 */
--1. 마당서점에서 다음의 심화된 질문에 대해 SQL 문을 작성하시오
--(1) 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
select b.publisher from orders o
    join book b on o.bookid=b.bookid
    join customer c on o.custid=c.custid
    where c.name like '박지성';
select distinct ec.name from orders eo
    join book eb on eo.bookid=eb.bookid
    join customer ec on eo.custid=ec.custid
    where eb.publisher in (select b.publisher from orders o
        join book b on o.bookid=b.bookid
        join customer c on o.custid=c.custid
        where c.name like '박지성');
--(2) 두 개 이상의 거로 다른 출판사에서 도서를 구매한 고객의 이름 
select c.name, count(DISTINCT b.publisher) from orders o
    join book b on o.bookid=b.bookid
    join customer c on o.custid=c.custid
    group by c.name having count(DISTINCT b.publisher)>=2;
--(3)(생략) 전체 고객의 30% 이상이 구매한 도서
select b.bookname, count(o.bookid) from orders o
    join book b on o.bookid=b.bookid
    group by b.bookname having count(o.bookid) >= 2;
select * from orders;


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


/* 연습문제 */
--1. 마당서점의 고객이 요구하는 다음 질문에 대해 SQL 문을 작성하시오.
--(1) 박지성이 구매한 도서의 출판사 수
select count(b.publisher) from orders o
    join book b on o.bookid=b.bookid
    join customer c on o.custid=c.custid
    where c.name like '박지성';
--(2) 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
select b.bookname,b.price 정가 ,o.saleprice 세일가 ,(b.price-o.saleprice)차액 from orders o
    join book b on o.bookid=b.bookid
    join customer c on o.custid=c.custid
    where c.name like '박지성';
--(3) 박지성이 구매하지 않은 도서의 이름
select distinct b.bookname from orders o 
    join book b on o.bookid=b.bookid  
    join customer c on o.custid=c.custid 
    where not c.name like '박지성';


--2. 마당서점의 운영자와 경영자가 요구하는 다음 질문에 대해 SQL 문을 작성하시오.
--(1) 주문하지 않은 고객의 이름(부속질의 사용)
select * from orders;

select o.custid from orders o; -- 주문한 고객의 아이디를 먼저 뽑기 
select c.name from customer c -- customer 에 이름 출력
where custid not in (select o.custid from orders o); -- 조건 : 출력된 이름들 중에 (주문한 고객 아이디)not 없는것 출력!
--(2) 주문 금액의 총액과 주문의 평균 금액
select sum(saleprice) as sum_sales, avg(saleprice)as avg_sales from orders;
--(3) 고객의 이름과 고객별 구매액
select o.saleprice from orders o;
select c.name, sum(o.saleprice) from orders o -- 고객의 이름과 구매 내역 합계를 주문 내역에서 출력
    join customer c on c.custid=o.custid    -- order 와 customer 에서 공통된 
    group by c.name;                        -- 고객별 이름을 불러온다. 

--(4) 고객의 이름과 고객이 구매한 도서 목록
select c.name from customer c;
select book
--(5) 도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문
--(6) 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
