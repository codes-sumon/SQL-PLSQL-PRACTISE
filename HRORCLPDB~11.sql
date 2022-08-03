INSERT INTO( SELECT LOCATION_ID, CITY, COUNTRY_ID
             FROM LOCATIONS
             WHERE COUNTRY_ID IN (SELECT COUNTRY_ID
                                   FROM COUNTRIES 
                                   NATURAL JOIN REGIONS
                                   WHERE REGION_NAME ='Europe')
             WITH CHECK OPTION)
VALUES(3600, 'Washington', 'US');


Insert Into(select book_id,book_name,writter,first_felease from BOOKS 