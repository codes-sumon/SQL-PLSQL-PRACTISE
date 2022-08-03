SET SERVEROUTPUT ON;
DECLARE
V_EMP_ID NUMBER;
V_FNAME VARCHAR2(100);
V_SALARY NUMBER;
V_Y_SALARY NUMBER;
V_M_COM_PCT NUMBER;
V_Y_COM_PCT NUMBER;
V_SAL_WITH_COM_PCT NUMBER;
BEGIN
  FOR emp_rec IN (SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY,COMMISSION_PCT FROM EMPLOYEES)
  LOOP
  
  V_EMP_ID := emp_rec.EMPLOYEE_ID;
  V_FNAME := emp_rec.FIRST_NAME ||' '||emp_rec.LAST_NAME;
  V_SALARY := emp_rec.SALARY;
  V_Y_SALARY := 12 * V_SALARY;
  V_M_COM_PCT := NVL(emp_rec.COMMISSION_PCT, 0);
  V_Y_COM_PCT := 12 * V_M_COM_PCT;
  V_SAL_WITH_COM_PCT := V_Y_SALARY + V_Y_COM_PCT;
  
  DBMS_OUTPUT.PUT_LINE('EMP ID: '||V_EMP_ID||' FULL NAME: '|| V_FNAME||' MONTHLY SALARY: '||V_SALARY||' YEARLY SALARY: '||V_Y_SALARY||' MONTHLY COMMISSION: '||V_M_COM_PCT||' YEARLY C);
  END LOOP;
END;