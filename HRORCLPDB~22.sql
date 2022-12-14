SET SERVEROUTPUT ON
DECLARE
  V_NAME VARCHAR2(20);
  V_DEPT VARCHAR2(20);
  V_JOB_TITLE VARCHAR2(20);
  V_SAL NUMBER;
  V_ANN_SAL NUMBER;
BEGIN
  SELECT E.FIRST_NAME||' '||E.LAST_NAME,D.DEPARTMENT_NAME,J.JOB_TITLE,E.SALARY,(E.SALARY*NVL(COMMISSION_PCT,0)+ SALARY)*12 ANN_SAL
  INTO V_NAME,V_DEPT,V_JOB_TITLE,V_SAL,V_ANN_SAL
  FROM EMPLOYEES E JOIN DEPARTMENTS D
  ON(E.DEPARTMENT_ID = D.DEPARTMENT_ID)
  JOIN JOBS J
  ON(J.JOB_ID = E.JOB_ID)
  WHERE UPPER(E.FIRST_NAME||' '||LAST_NAME) = UPPER('STEVEN KING');
  
  DBMS_OUTPUT.PUT_LINE('NAME: '||V_NAME);
  DBMS_OUTPUT.PUT_LINE('DEPARTMENT: '|| V_DEPT);
  DBMS_OUTPUT.PUT_LINE('JOB TITLE: ' ||V_JOB_TITLE);
  DBMS_OUTPUT.PUT_LINE('SALARY: '||V_SAL);
  DBMS_OUTPUT.PUT_LINE('ANNUAL SALARY: '||V_ANN_SAL);
END;