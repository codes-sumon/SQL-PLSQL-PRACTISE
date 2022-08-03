CREATE OR REPLACE FUNCTION GET_AVG_SAL(
    DEPT_ID NUMBER)
  RETURN NUMBER
IS
  V_AVG_SAL NUMBER := 0;
BEGIN
  SELECT SALARY INTO V_AVG_SAL FROM EMPLOYEES WHERE DEPARTMENT_ID = DEPT_ID;
  RETURN V_AVG_SAL;
--  IF V_AVG_SAL > 0 THEN
--    RETURN V_AVG_SAL;
--  ELSE
--    RETURN 0;
--  END IF;
  
  
EXCEPTION
WHEN NO_DATA_FOUND THEN
  RETURN 0;
END;

DECLARE
  V_AVG_SAL NUMBER := GET_AVG_SAL(660);
BEGIN
  IF V_AVG_SAL > 0 THEN
    DBMS_OUTPUT.PUT_LINE(V_AVG_SAL);
  ELSIF V_AVG_SAL = 0 THEN
   DBMS_OUTPUT.PUT_LINE('OOB ' || V_AVG_SAL);
  ELSE
    DBMS_OUTPUT.PUT_LINE('NOT DEPARTMENT WITH THIS DEPARTMENT ID');
  END IF;
END;
