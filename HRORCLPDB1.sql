  CREATE TABLE BOOKS(
BOOk_ID NUMBER,
BOOK_NAME VARCHAR2(100),
WRITTER   VARCHAR2(100),
FIRST_FELEASE DATE
);


CREATE TABLE ADDITIONS(
BOOK_ID NUMBER,
ADDITION_DATE DATE,
PUBLISHER VARCHAR2(100)
);

CREATE TABLE ADDITIONS_ON_DLT(
BOOK_ID NUMBER,
ADDITION_DATE DATE,
PUBLISHER VARCHAR2(100)
);

CREATE TABLE ADDITIONS_ON_NL(
BOOK_ID NUMBER,
ADDITION_DATE DATE,
PUBLISHER VARCHAR2(100)
);

ALTER TABLE BOOKS
MODIFY BOOK_ID CONSTRAINT BOOK_IS_PK PRIMARY KEY;

ALTER TABLE ADDITIONS
ADD CONSTRAINT ADDI_BK_ID_fk
FOREIGN KEY (BOOK_ID)
REFERENCES BOOKS(BOOK_ID);

ALTER TABLE ADDITIONS
DROP CONSTRAINT ADDI_BK_ID_fk;

ALTER TABLE ADDITIONS_ON_DLT
ADD CONSTRAINT ADDI_BK_ID_D_fk
FOREIGN KEY (BOOK_ID)
REFERENCES BOOKS(BOOK_ID) ON DELETE CASCADE;

ALTER TABLE ADDITIONS_ON_NL
ADD CONSTRAINT ADDI_BK_ID_N_fk
FOREIGN KEY (BOOK_ID)
REFERENCES BOOKS(BOOK_ID) ON DELETE SET NULL;

SELECT * FROM USER_CONS_COLUMNS WHERE TABLE_NAME IN('BOOKS','ADDITIONS');

ALTER TABLE BOOKS
DROP CONSTRAINT SYS_C008965 CASCADE;

DELETE FROM BOOKS
WHERE BOOK_ID = 100;

SELECT * FROM BOOKS;
SELECT * FROM ADDITIONS;
SELECT * FROM ADDITIONS_ON_DLT;
SELECT * FROM ADDITIONS_ON_NL;

COMMIT;


ALTER TABLE BOOKS
DISABLE CONSTRAINT BOOK_IS_PK;

ALTER TABLE BOOKS
DISABLE CONSTRAINT BOOK_IS_PK CASCADE;