SET SERVEROUTPUT ON;
DECLARE
  V_ANNUAL_SAL NUMBER := 0;
BEGIN
  SELECT (SALARY*12)+(NVL(COMMISSION_PCT,0)*12)
  INTO V_ANNUAL_SAL
  FROM EMPLOYEES
  WHERE EMPLOYEE_ID = 106;
  DBMS_OUTPUT.PUT_LINE('ANNUAL SALARY IS: '||V_ANNUAL_SAL);
END;

SELECT 'Alex''s Tea Factory' FROM DUAL