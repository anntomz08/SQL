--Find the reverse of the string ‘nmutuAotedOehT’
SELECT REVERSE('nmutuAotedOeh')FROM DUAL;

--Use LTRIM function on ‘123231xyzTech’ so as to obtain the output ‘Tech’
SELECT LTRIM('123231xyzTech','123231xyz')FROM DUAL;

--Use RTRIM function on ‘Computer ' to remove the trailing spaces
SELECT RTRIM('Computer ',' ')FROM DUAL;

--Perform RPAD on ‘computer’ to obtain the output as ‘computer XXXX’
SELECT RPAD('computer',12,'xxxx')FROM DUAL;

--Find the length of the string ‘Database Management Systems’
SELECT LENGTH('Database Management Systems')FROM DUAL;

--Concatenate the strings ‘Julius’ and ‘Caesar’
SELECT CONCAT('Julius','Caeser')FROM DUAL;

--Use SUBSTR function to retrieve the substring ‘is’ from the string ‘India is my country’
SELECT SUBSTR('India is my country',7,2)FROM DUAL;
