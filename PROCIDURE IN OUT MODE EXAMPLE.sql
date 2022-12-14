SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE EMP_INFO
  (P_EMP_ID IN NUMBER,
   P_EMP_NAME OUT EMPLOYEES.LAST_NAME%TYPE,
   P_EMP_SAL OUT EMPLOYEES.SALARY%TYPE)
IS
BEGIN
 SELECT LAST_NAME, SALARY INTO P_EMP_NAME,P_EMP_SAL
 FROM EMPLOYEES
 WHERE EMPLOYEE_ID = P_EMP_ID;
END;

DECLARE
  V_NAME EMPLOYEES.LAST_NAME%TYPE;
  V_SAL EMPLOYEES.SALARY%TYPE;
BEGIN
  EMP_INFO(107,V_NAME,V_SAL);
  
  DBMS_OUTPUT.PUT_LINE(V_NAME ||' '||V_SAL);
END;


CREATE OR REPLACE PROCEDURE EMP_INFO2
  (P_EMP_NAME IN OUT EMPLOYEES.LAST_NAME%TYPE)
IS
BEGIN
 SELECT LAST_NAME INTO P_EMP_NAME
 FROM EMPLOYEES
 WHERE FIRST_NAME = P_EMP_NAME;
END;


DECLARE
  V_NAME VARCHAR2(50) := 'Lex';
BEGIN
  EMP_INFO2(V_NAME);
  
  DBMS_OUTPUT.PUT_LINE(V_NAME);
END;


SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES WHERE FIRST_NAME = 'Lex';