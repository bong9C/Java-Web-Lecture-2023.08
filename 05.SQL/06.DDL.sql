/*
 * 3. DDL(Data Definition Language)
 */
 
 /*
  * 3.1 CREATE TABLE
  */
/* 다음과 같은 속성을 가진  NewBook 테이블을 생성하시오
    정수형은 NUMBER를, 문자형은 가변형 문자타립인 VARCHAR2를 사용
        bookid(도서번호) - NUMBER
        bookname(도서이름) - VARCHAR2(20)
        publisher(출판사) - VARCHAR2(20)
        pricr(가격) - NUMBER
*/
create table NewBook (
    bookid number primary key,
    bookname VARCHAR2(40),
    publisher VARCHAR2(20),
    price NUMBER
);
drop table NewBook;
/* 기본키 - 복합키 (도서 이름, 출판사)
    도서이름 - 같은 값을 가지면 안됨
    출판사 - NULL 이 아니어야 함
    가격 - 기본이 10000원, 1000원 이상이어야 함 
*/
create table NewBook (
    bookname VARCHAR2(40) unique,
    publisher VARCHAR2(20) not null,
    price number default 10000 check(price >=1000),
    primary key(bookname, publisher)
);

/*
 *다음과 같은 속성을 가진 NewCustomer 테이블을 생성하시오
 *custid(고객번호) - NUMBER, 기본키
 *name(이름) – VARCHAR2(40)
 *address(주소) – VARCHAR2(40)
 *phone(전화번호) – VARCHAR2(30)
 */
create table NewCustomer (
    custid number primary key,
    uname VARCHAR2(40),  -- name 말고 uname 이나 cname 처럼 앞에 글자를 붙여서 쓰는게 좋음.
    address VARCHAR2(40),
    phone VARCHAR2(30)
);
-- VARCHAR2(10)는 글자 수 사용하고 나머지 남은 자리수를 사용하지 않음 ( 문자형 가변길이 사용 ) 
-- CHAR(10)는 글자 수를 사용하고도 나머지 자리수를 공백으로 채움 ( 문자형 고정길이 사용 ) 
/*
 * 3.2 ALTER TABLE
 */
 -- NewCustomer 테이블에 email varchar2(40)추가
 alter table newcustomer add email varchar2(40);
 desc newcustomer;
 -- phone 필드를 제거
alter table newcustomer drop column phone;
-- name 필드를 cneme 으로 이름을 변경하고, not null 추가
alter table newcustomer modify name varchar2(40) not null;
alter table newcustomer rename column name to cname;

/*
 * 3.3 DROP TABLE
 */
 drop table  newcustomer;
 drop table newbook;
 commit;