

CREATE OR REPLACE PROCEDURE ADD_DEPT(P_DEPT_ID IN NUMBER, P_DEPT_NAME IN VARCHAR2)
IS
V_NEW_DEPT_ID NUMBER;
V_CHK_ID NUMBER :=0;
V_CK NUMBER := 0;
BEGIN
  INSERT INTO DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME)
  VALUES (P_DEPT_ID,P_DEPT_NAME);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN

  BEGIN
    LOOP
      V_NEW_DEPT_ID := P_DEPT_ID;
      V_NEW_DEPT_ID := V_NEW_DEPT_ID + 10;
      BEGIN
        SELECT DEPARTMENT_ID INTO V_CHK_ID FROM DEPARTMENTS WHERE DEPARTMENT_ID = V_NEW_DEPT_ID;
        CONTINUE WHEN V_CHK_ID = V_NEW_DEPT_ID;
      EXCEPTION 
        WHEN NO_DATA_FOUND THEN
        INSERT INTO DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME)
        VALUES (V_NEW_DEPT_ID,P_DEPT_NAME);
        V_CK := 1;
       END;     
        EXIT WHEN V_CK = 1;
        DBMS_OUTPUT.PUT_LINE(V_NEW_DEPT_ID);
    END LOOP;
  END;
END;
/

SHOW ERROR

EXECUTE ADD_DEPT(280,'ABCD');

SELECT *
FROM DEPARTMENTS
ORDER BY DEPARTMENT_ID;