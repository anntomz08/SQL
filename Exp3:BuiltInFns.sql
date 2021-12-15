--Find the abs value of 8.29
SELECT ABS(8.29) FROM dual;

--Use Select To_Char( ) to display date and time in different formats
SELECT TO_CHAR(SYSDATE,'DD/MM/YY') FROM DUAL;


--Display the systemtime
SELECT SYSDATE FROM DUAL;

--Demonstrate the use of least & greatest functions in a string
SELECT LEAST(3, 5, 7, 8, 1) FROM DUAL; 
SELECT GREATEST(3, 5, 7, 8, 1) FROM DUAL; 

--Find the square root of 100
SELECT SQRT(100) FROM DUAL;

--Find the floor value of 9.76
SELECT FLOOR(9.76) FROM DUAL;

--Find the ceil value of 8.29
SELECT CEIL(8.29) FROM DUAL;
