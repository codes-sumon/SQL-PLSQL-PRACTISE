CREATE OR REPLACE PROCEDURE ADD_DEPT(
P_DEPT_ID NUMBER,
P_DEPTNAME VARCHAR2,
P_MANAGERID NUMBER,
P_LOCID NUMBER,
P_ROW_EFFECTED OUT NUMBER)
IS
BEGIN
INSERT INTO DEPT
VALUES(P_DEPT_ID,P_DEPTNAME,P_MANAGERID,P_LOCID);
P_ROW_EFFECTED := SQL%ROWCOUNT;
END;

------------------POSITIONAL------------------
SET SERVEROUTPUT ON;
DECLARE
V_INSERT_ROW_NUM NUMBER;
BEGIN 
ADD_DEPT(10,'Sales',105,1900,V_INSERT_ROW_NUM);
DBMS_OUTPUT.PUT_LINE(V_INSERT_ROW_NUM||' ROW INSERTED');

END;


---------------NAMED------------------
SET SERVEROUTPUT ON;
DECLARE
  V_INSERT_ROW_NUM NUMBER;
BEGIN
  ADD_DEPT(P_DEPT_ID => 10,P_DEPTNAME => 'Sales', P_MANAGERID => 105, P_LOCID => 1900, P_ROW_EFFECTED => V_INSERT_ROW_NUM);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
  DBMS_OUTPUT.PUT_LINE(V_INSERT_ROW_NUM||' ROW INSERTED');
END;


-----------------MIXED--------------

SET SERVEROUTPUT ON;
DECLARE
  V_INSERT_ROW_NUM NUMBER;
BEGIN
  ADD_DEPT(10, 'Sales', P_MANAGERID => 105, P_LOCID => 1900, P_ROW_EFFECTED => V_INSERT_ROW_NUM);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
  DBMS_OUTPUT.PUT_LINE(V_INSERT_ROW_NUM||' ROW INSERTED');
END;


SELECT * FROM DEPT;
DELETE FROM DEPT;

ROLLBACK;
