CREATE OR REPLACE TRIGGER SCE_EMP AFTER
  INSERT OR
  UPDATE OR
  DELETE ON STUDENT_INFO 
BEGIN 
  IF (TO_CHAR(SYSDATE,'HH24:MI') BETWEEN '09:00' AND '13:00') OR (TO_CHAR(SYSDATE,'DY') IN ('FRI','SAT')) THEN
    IF INSERTING THEN
      RAISE_APPLICATION_ERROR( -20900,'YOU ARE ONLY ABLE TO INSERT OUT OF BUSINEES HOURS!');
    ELSIF UPDATING THEN
      RAISE_APPLICATION_ERROR( -20900,'YOU ARE ONLY ABLE TO UPDATE OUT OF BUSINEES HOURS!');
    ELSIF DELETING THEN
      RAISE_APPLICATION_ERROR( -20900,'YOU ARE ONLY ABLE TO DELETE OUT OF BUSINEES HOURS!');
    END IF;
  END IF;
END;

DROP TRIGGER SCE_EMP;

INSERT INTO STUDENT_INFO(ID,FULE_NAME)
VALUES(1000,'SUMON');

UPDATE STUDENT_INFO
SET FULE_NAME = 'HABIB';

DELETE FROM STUDENT_INFO
WHERE ID = 100;

ALTER TRIGGER SCE_EMP DISABLE;

SELECT * FROM STUDENT_INFO;

COMMIT;