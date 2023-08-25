
/* Drop Tables */

DROP TABLE chinadrama CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE chinadrama
(
	no number NOT NULL,
	title varchar2(40) NOT NULL,
	episodes number NOT NULL,
	casting varchar2(40) NOT NULL,
	broadcaster varchar2(40) NOT NULL,
	content varchar2(4000),
	PRIMARY KEY (no)
);



