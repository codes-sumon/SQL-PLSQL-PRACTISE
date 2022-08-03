--  create a text file into C:\EXTERNAL
--  PUR SOME DATA LIKE 
--  1,Dhaka
--  2,Sylhet
--  3,Rajshahi

--from sys@orclpdb
CREATE DIRECTORY MY_EXT_TABLE AS 'C:\EXTERNAL';
GRANT READ,WRITE ON DIRECTORY MY_EXT_TABLE TO HR;

--- from HR
CREATE TABLE my_regions (
  region_id  number(2),
  region_name varchar2(50)
)
ORGANIZATION EXTERNAL (
  TYPE ORACLE_LOADER
  DEFAULT DIRECTORY MY_EXT_TABLE
  ACCESS PARAMETERS (
    RECORDS DELIMITED BY NEWLINE
    FIELDS TERMINATED BY ','
    MISSING FIELD VALUES ARE NULL
    (
      region_id  CHAR(2),
      region_name CHAR(50)
    )
  )
  LOCATION ('data.txt')
)
PARALLEL 5
REJECT LIMIT UNLIMITED;

SELECT *
FROM my_regions;