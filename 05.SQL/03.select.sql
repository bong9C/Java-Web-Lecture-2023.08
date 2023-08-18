/*
 * 1.질의어(query)
 */
 /*
SELECT 필드명
     FROM 테이블명
     JOIN 테이블명
     ON 조인 조건
     WHERE 조건
     GROUP BY 필드명
     HAVING 그룹조건
     ORDER BY 필드명 순서(ASC, DESC);
     
갯수 조절을 위한 필드가 추가됨    
 */ 


/* 기본 구문 */
select * from book;
select * from customer;
select name, address from customer;

/* 1.1 조회 조건 */
-- 가격이 10000원 이상인 책
select * from book where price >= 10000;
-- 대한 미디어에서 출간한 책
select * from book where publisher='대한미디어';
--축구와 관련된 책
select * from book where bookname like '%축구%';
-- 가격이 10000원 이상 20000원 이하인 책
select * from book where price >= 10000 and price <= 20000;
select * from book where price between 10000 and 20000;
-- 가격이 10000원 미만 또는 20000원 초과인 책
select * from book where price < 10000 or price > 20000;
--가격이 7의 배수인 책
select * from book where mod(price, 7) = 0;
-- 나무수, 굿스포츠, 삼성당에서 출간한 책
select * from book where publisher='나무수'
        or publisher='굿스포츠' or publisher='삼성당';
select * from book where publisher in ('나무수','굿스포츠','삼성당');      