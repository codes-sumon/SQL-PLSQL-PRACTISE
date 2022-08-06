create table senior_emp
as select * from employees where 1 = 2;
select * from senior_emp;
DESC senior_emp;
SELECT TO_CHAR(HIRE_DATE,'FMDD-MON-YYYY') FROM EMPLOYEES;

CREATE OR REPLACE PROCEDURE COPY_SENIOR_EMP(P_FROM_DATE IN DATE, P_TO_DATE IN DATE,P_COUNT OUT NUMBER)
IS
CURSOR CUR_S_EMP IS (SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID,EMAIL 
                    FROM EMPLOYEES 
                    WHERE TO_CHAR(HIRE_DATE,'FMDD-MON-YYYY') BETWEEN TO_CHAR(P_FROM_DATE,'FMDD-MON-YYYY') AND TO_CHAR(P_TO_DATE,'FMDD-MON-YYYY'));
V_COUNT NUMBER := 0;
BEGIN
  FOR I IN CUR_S_EMP LOOP
    INSERT INTO senior_emp(EMPLOYEE_ID,FIRST_NAME,LAST_NAME,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID,EMAIL)
    VALUES(I.EMPLOYEE_ID,I.FIRST_NAME,I.LAST_NAME,I.HIRE_DATE,I.JOB_ID,I.SALARY,I.COMMISSION_PCT,I.MANAGER_ID,I.DEPARTMENT_ID,I.EMAIL);
    V_COUNT := V_COUNT + 1;
  END LOOP;
  P_COUNT:= V_COUNT;
END;
/

SHOW ERROR 

SET SERVEROUTPUT ON;
DECLARE
V_COUNT NUMBER;
BEGIN
COPY_SENIOR_EMP('17-JAN-2003','21-MAY-2007',V_COUNT);
DBMS_OUTPUT.PUT_LINE(V_COUNT||' ROW COPY');
END;


SELECT * FROM senior_emp;
ROLLBACK;
