CREATE OR REPLACE PROCEDURE YEARLY_NEW_SAL(
    P_PCT_ALL IN NUMBER)
IS
  CURSOR EMP
  IS
    SELECT * FROM EMP_HISTORY;
BEGIN
  FOR I IN EMP
  LOOP
    NEW_SAL(P_EMP_ID => I.EMPID, P_PCT => P_PCT_ALL);
  END LOOP;
END;

EXECUTE YEARLY_NEW_SAL(10);
